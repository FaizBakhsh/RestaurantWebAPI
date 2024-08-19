using NLog;
using Restaurant.Core.Entities.Enums;
using Restaurant.Core.Entities;
using Restaurant.Core.Entities.Reports;
using Restaurant.Core.Enums;
using Restaurant.DAL;
using Restaurant.Services;
using Group = Restaurant.Core.Entities.Reports.Group;
using Source = Restaurant.Core.Entities.Reports.Source;
using Bank = Restaurant.Core.Entities.Reports.Bank;
using Receivable = Restaurant.Core.Entities.Reports.Receivable;
using Restaurant.Core.SearchCriteria;
using Restaurant.Core.ViewModel.Reports;
using System.Collections.Specialized;
using Restaurant.Core.ViewModel;
using AutoMapper;
using Restaurant.Core.Extenstions;

namespace Restaurant.Service
{
    public class ReportService : BaseService
    {
        #region Class Members/Class Variables

        internal IMapper _mapper;
        private SaleDetailRefundService _saleRefundSvc;
        private ShiftService _shiftSvc;
        private ItemService _itemSvc;
        private SaleDayService _saleDaySvc;
        private ExpensesService _expSvc;
        private SaleOrderService _sOrderSvc;
        private LogEventService _logEvntSvc;
        private ShiftDAL _shiftDAL;
        private CoreDAL _corDAL;
        private Logger _logger;
        private ClientsService _cltSvc;
        private SaleDetailRefundService _refundSvc;

        #endregion
        #region Constructors
        public ReportService ( )
        {
            _mapper = GetMapper ();
            _shiftDAL = new ShiftDAL ();
            _corDAL = new CoreDAL ();
            _expSvc = new ExpensesService ();
            _itemSvc = new ItemService ();
            _sOrderSvc = new SaleOrderService ();
            _saleDaySvc = new SaleDayService ();
            _saleRefundSvc = new SaleDetailRefundService ();
            _shiftSvc = new ShiftService ();
            _logEvntSvc = new LogEventService ();
            _logger = LogManager.GetLogger ("fileLogger");
            _refundSvc = new SaleDetailRefundService ();
            _cltSvc = new ClientsService ();
        }
        #endregion
        #region Summary Report

        public SummaryReportDE GetShiftEndReportData ( ShiftDE mod )
        {
            try
            {
                SummaryReportDE report = new SummaryReportDE ();
                mod = _shiftSvc.SearchShifts (new ShiftDE { Id = mod.Id, ClientId=mod.ClientId }).FirstOrDefault ();
                if (mod != null)
                    if (mod.ShiftStatusId == (int)ShiftStatuses.Close)
                    {
                        var sales = _sOrderSvc.SearchSaleOrders (new SaleOrderDE { ShiftId = mod.Id, ClientId = mod.ClientId });
                        var expenses = _expSvc.SearchExpenses (new ExpensesDE { ShiftId = mod.Id, ClientId = mod.ClientId });
                        var saleLines = new List<SaleOrderLineDE> ();
                        foreach (var sale in sales)
                        {
                            saleLines.AddRange (sale.SaleOrderLines);
                        }
                        var saleRefunds = _saleRefundSvc.SearchSaleDetailRefunds (new SaleDetailRefundDE { Date=mod.SaleDate, ClientId = mod.ClientId });
                        report.PrintingDate = mod.ModifiedOn.ToShortDateString ();
                        report.PrintingTime = mod.EndTime;
                        report.Shift = mod.ShiftType;
                        report.Terminal = mod.Terminal;
                        report.User = mod.ShiftEndUser;
                        report.Day = DateTime.Now.ToShortDateString ();

                        report.CashNet = sales.Where (x => x.PaymentMethodId == (int)PaymentMethods.Cash).Sum (x => x.Total).ToString ();
                        report.CardNet = sales.Where (x => x.PaymentMethodId == (int)PaymentMethods.Card).Sum (x => x.Total).ToString ();
                        report.TotalNetSale = sales.Sum (x => x.Total).ToString ();

                        report.CashGST = sales.Where (x => x.PaymentMethodId == (int)PaymentMethods.Cash).Sum (x => x.GSTValue).ToString ();
                        report.CardGST = sales.Where (x => x.PaymentMethodId == (int)PaymentMethods.Card).Sum (x => x.GSTValue).ToString ();
                        report.TotalGSTSales = sales.Sum (x => x.GSTValue).ToString ();

                        report.CashDiscount = sales.Where (x => x.PaymentMethodId == (int)PaymentMethods.Cash).Sum (x => x.DiscountValue).ToString ();
                        report.CardDiscount = sales.Where (x => x.PaymentMethodId == (int)PaymentMethods.Card).Sum (x => x.DiscountValue).ToString ();
                        report.TotalDiscSales = sales.Sum (x => x.DiscountValue).ToString ();

                        report.TotalGross = (float.Parse (report.TotalGSTSales) + float.Parse (report.TotalDiscSales) + float.Parse (report.TotalNetSale)).ToString ();

                        report.Comp = saleLines.Where (x => x.IsComp == true).Sum (x => x.DiscountValue).ToString ();
                        report.SrvcChrgs = sales.Sum (x => x.Service).ToString ();
                        report.Void = saleRefunds.Where (x => x.TypeId == (int)RefundTypes.Void).Sum (x => x.Gross).ToString ();
                        report.Refund = saleRefunds.Where (x => x.TypeId == (int)RefundTypes.Refund).Sum (x => x.Gross).ToString ();

                        report.TotalCashIn = sales.Where (x => x.PaymentMethodId == (int)PaymentMethods.Cash).Sum (x => x.NetTotal).ToString ();
                        report.BankSales = sales.Where (x => x.PaymentMethodId == (int)PaymentMethods.Card).Sum (x => x.NetTotal).ToString ();
                        report.Receivable = sales.Where (x => x.IsPaid == false).Sum (x => x.NetTotal).ToString ();
                        report.CashIn = report.TotalCashIn;
                        report.Float = mod.FloatingCash.ToString ();
                        report.CalCash = (float.Parse (report.CashIn) + float.Parse (report.Float)).ToString ();
                        report.DecCash = mod.ShiftEndCash.ToString ();
                        report.Expenses = expenses.Sum (x => x.Amount).ToString ();
                        report.OverShort = (-(float.Parse (report.CalCash) - float.Parse (report.DecCash) - float.Parse (report.Expenses))).ToString ();
                        report.DineInOrdersAmount = sales.Where (x => x.OrderTypeId == (int)OrderTypes.DineIn).Sum (x => x.NetTotal).ToString ();
                        report.DineInOrders = sales.Where (x => x.OrderTypeId == (int)OrderTypes.DineIn).Count ().ToString ();
                        report.Guest = sales.Where (x => x.OrderTypeId == (int)OrderTypes.DineIn).Sum (x => int.TryParse (x.Guest, out int guestValue) ? guestValue : 0).ToString ();
                        if (int.Parse (report.Guest) > 0)
                            report.AvgPerGuest = (float.Parse (report.DineInOrdersAmount) / float.Parse (report.Guest)).ToString ();
                        else report.AvgPerGuest = "0";
                        if (int.Parse (report.DineInOrders) > 0)
                            report.AvgPerOrder = (float.Parse (report.DineInOrdersAmount) / float.Parse (report.DineInOrders)).ToString ();
                        else report.AvgPerOrder = "0";
                        report.TakeAwayOrdersAmount = sales.Where (x => x.OrderTypeId == (int)OrderTypes.TakeAway).Sum (x => x.NetTotal).ToString ();
                        report.DeliveryOrdersAmount = sales.Where (x => x.OrderTypeId == (int)OrderTypes.Delivery).Sum (x => x.NetTotal).ToString ();
                        var _banks = sales.Where (x => x.PaymentMethodId == (int)PaymentMethods.Card)
                            .GroupBy (order => order.Bank)
                            .Select (group => new Core.Entities.Reports.Bank
                            {
                                name = group.Key,
                                amount = group.Sum (order => order.NetTotal).ToString ()
                            });
                        report.Banks.AddRange (_banks);
                        var _sources = sales.Where (x => x.OrderTypeId == (int)OrderTypes.Delivery)
                           .GroupBy (order => order.Source)
                           .Select (group => new Core.Entities.Reports.Source
                           {
                               name = group.Key,
                               amount = group.Sum (order => order.NetTotal).ToString ()
                           });
                        report.Sources.AddRange (_sources);
                        var _receivables = sales.Where (x => x.IsPaid == false)
                           .GroupBy (order => order.Customer)
                           .Select (group => new Core.Entities.Reports.Receivable
                           {
                               name = group.Key,
                               amount = group.Sum (order => order.NetTotal).ToString ()
                           });
                        report.Receivables.AddRange (_receivables);
                        var _groups = saleLines
                           .GroupBy (line => line.ItemGroup)
                           .Select (group => new Group
                           {
                               name = group.Key,
                               amount = group.Sum (line => line.LineTotal).ToString ()
                           });
                        report.Groups.AddRange (_groups);
                    }
                return report;
            }
            catch (Exception)
            {
                throw;
            }
        }
        public SummaryReportDE GetDayEndReportData ( SaleDayDE mod )
        {
            try
            {
                SummaryReportDE report = new SummaryReportDE ();
                mod = _saleDaySvc.SearchSaleDays (new SaleDayDE { Id = mod.Id, ClientId = mod.ClientId }).FirstOrDefault ();
                if (mod != null)
                    if (mod.DayStatusId == (int)SaleDayStatues.Close)
                    {
                        var sales = _sOrderSvc.SearchSaleOrders (new SaleOrderDE { DayId = mod.Id, ClientId = mod.ClientId });
                        var shifts = _shiftSvc.SearchShifts (new ShiftDE { DayId = mod.Id, ClientId = mod.ClientId });
                        var expenses = _expSvc.SearchExpenses (new ExpensesDE { DayId = mod.Id, ClientId = mod.ClientId });
                        var saleLines = new List<SaleOrderLineDE> ();
                        foreach (var sale in sales)
                        {
                            saleLines.AddRange (sale.SaleOrderLines);
                        }
                        var saleRefunds = _saleRefundSvc.SearchSaleDetailRefunds (new SaleDetailRefundDE { DayId = mod.Id, ClientId = mod.ClientId });
                        report.PrintingDate = mod.ModifiedOn.ToShortDateString ();
                        report.PrintingTime = mod.ModifiedOn.ToShortTimeString ();
                        //report.Shift = mod.Shift;
                        report.Terminal = mod.Terminal;
                        report.User = mod.EndUser;
                        report.Day = DateTime.Now.ToShortDateString ();

                        report.CashNet = sales.Where (x => x.PaymentMethodId == (int)PaymentMethods.Cash).Sum (x => x.Total).ToString ();
                        report.CardNet = sales.Where (x => x.PaymentMethodId == (int)PaymentMethods.Card).Sum (x => x.Total).ToString ();
                        report.TotalNetSale = sales.Sum (x => x.Total).ToString ();

                        report.CashGST = sales.Where (x => x.PaymentMethodId == (int)PaymentMethods.Cash).Sum (x => x.GSTValue).ToString ();
                        report.CardGST = sales.Where (x => x.PaymentMethodId == (int)PaymentMethods.Card).Sum (x => x.GSTValue).ToString ();
                        report.TotalGSTSales = sales.Sum (x => x.GSTValue).ToString ();

                        report.CashDiscount = sales.Where (x => x.PaymentMethodId == (int)PaymentMethods.Cash).Sum (x => x.DiscountValue).ToString ();
                        report.CardDiscount = sales.Where (x => x.PaymentMethodId == (int)PaymentMethods.Card).Sum (x => x.DiscountValue).ToString ();
                        report.TotalDiscSales = sales.Sum (x => x.DiscountValue).ToString ();

                        report.TotalGross = (float.Parse (report.TotalGSTSales) + float.Parse (report.TotalDiscSales) + float.Parse (report.TotalNetSale)).ToString ();

                        report.Comp = saleLines.Where (x => x.IsComp == true).Sum (x => x.DiscountValue).ToString ();
                        report.SrvcChrgs = sales.Sum (x => x.Service).ToString ();
                        report.Void = saleRefunds.Where (x => x.TypeId == (int)RefundTypes.Void).Sum (x => x.Gross).ToString ();
                        report.Refund = saleRefunds.Where (x => x.TypeId == (int)RefundTypes.Refund).Sum (x => x.Gross).ToString ();

                        report.TotalCashIn = sales.Where (x => x.PaymentMethodId == (int)PaymentMethods.Cash).Sum (x => x.NetTotal).ToString ();
                        report.BankSales = sales.Where (x => x.PaymentMethodId == (int)PaymentMethods.Card).Sum (x => x.NetTotal).ToString ();
                        report.Receivable = sales.Where (x => x.IsPaid == false).Sum (x => x.NetTotal).ToString ();
                        report.CashIn = report.TotalCashIn;
                        report.Float = shifts.Sum (x => int.Parse (x.FloatingCash)).ToString ();
                        report.CalCash = (float.Parse (report.CashIn) + float.Parse (report.Float)).ToString ();
                        report.DecCash = shifts.Sum (x => int.Parse (x.ShiftEndCash)).ToString ();
                        report.Expenses = expenses.Sum (x => x.Amount).ToString ();
                        report.OverShort = (-(float.Parse (report.CalCash) - float.Parse (report.DecCash) - float.Parse (report.Expenses))).ToString ();
                        report.DineInOrdersAmount = sales.Where (x => x.OrderTypeId == (int)OrderTypes.DineIn).Sum (x => x.NetTotal).ToString ();
                        report.DineInOrders = sales.Where (x => x.OrderTypeId == (int)OrderTypes.DineIn).Count ().ToString ();
                        report.Guest = sales.Where (x => x.OrderTypeId == (int)OrderTypes.DineIn).Sum (x => int.TryParse (x.Guest, out int guestValue) ? guestValue : 0).ToString ();
                        if (int.Parse (report.Guest) > 0)
                            report.AvgPerGuest = (float.Parse (report.DineInOrdersAmount) / float.Parse (report.Guest)).ToString ();
                        else report.AvgPerGuest = "0";
                        if (int.Parse (report.DineInOrders) > 0)
                            report.AvgPerOrder = (float.Parse (report.DineInOrdersAmount) / float.Parse (report.DineInOrders)).ToString ();
                        else report.AvgPerOrder = "0";
                        report.TakeAwayOrdersAmount = sales.Where (x => x.OrderTypeId == (int)OrderTypes.TakeAway).Sum (x => x.NetTotal).ToString ();
                        report.DeliveryOrdersAmount = sales.Where (x => x.OrderTypeId == (int)OrderTypes.Delivery).Sum (x => x.NetTotal).ToString ();
                        var _banks = sales.Where (x => x.PaymentMethodId == (int)PaymentMethods.Card)
                            .GroupBy (order => order.Bank)
                            .Select (group => new Bank
                            {
                                name = group.Key,
                                amount = group.Sum (order => order.NetTotal).ToString ()
                            });
                        report.Banks.AddRange (_banks);
                        var _sources = sales.Where (x => x.OrderTypeId == (int)OrderTypes.Delivery)
                           .GroupBy (order => order.Source)
                           .Select (group => new Source
                           {
                               name = group.Key,
                               amount = group.Sum (order => order.NetTotal).ToString ()
                           });
                        report.Sources.AddRange (_sources);
                        var _receivables = sales.Where (x => x.IsPaid == false)
                           .GroupBy (order => order.Customer)
                           .Select (group => new Receivable
                           {
                               name = group.Key,
                               amount = group.Sum (order => order.NetTotal).ToString ()
                           });
                        report.Receivables.AddRange (_receivables);
                        var _groups = saleLines
                           .GroupBy (line => line.ItemGroup)
                           .Select (group => new Group
                           {
                               name = group.Key,
                               amount = group.Sum (line => line.LineTotal).ToString ()
                           });
                        //report.Groups.AddRange (_groups);
                    }
                return report;
            }
            catch (Exception)
            {
                throw;
            }
        }

        #endregion
        #region Customer
        public List<SaleOrderDE> GetCustomerSaleReport ( SaleOrderDE sale )
        {
            var sales = new List<CustomerSaleReportDE> ();
            var saleOrders = _sOrderSvc.SearchSaleOrders (new SaleOrderDE
            {
                CustomerId = sale.CustomerId,
                From = sale.From,
                To = sale.To
            });
            return saleOrders;
        }

        #endregion
        #region LogEvent
        public List<LogEventDE> GetLogEvents ( ReportSearchCriteria criteria )
        {
            var logEvents = new List<LogEventDE> ();
            try
            {
                logEvents = _logEvntSvc.SearchLogEvents (new LogEventDE
                {
                    UserId = criteria.UserId,
                    From = criteria.StartDate,
                    To = criteria.EndDate,
                    ClientId = criteria.ClientId
                });
            }
            catch (Exception)
            {
                throw;
            }
            return logEvents;
        }
        #endregion
        #region HourlySaleReport
        public HourlySaleReportVM GetHourlySaleReport ( ReportSearchCriteria criteria )
        {
            HourlySaleReportVM mod = new HourlySaleReportVM ();

            var saleTransactions = _sOrderSvc.SearchSaleOrders (new SaleOrderDE
            {
                From = criteria.Date.HasValue ? criteria.Date : null,
                To = criteria.Date.HasValue ? criteria.Date.Value.AddDays (1).AddSeconds (-1) : null,
                ClientId = criteria.ClientId
            }).OrderBy (m => m.CreatedOn).ToList ();

            mod.ReportLines = new List<HourlySaleReportLineVM> ();
            int srNo = 0;
            TimeSpan startTime = new TimeSpan (0, 0, 0);
            TimeSpan endTime = new TimeSpan (23, 59, 59);
            TimeSpan stepSize = new TimeSpan (1, 0, 0);
            mod.ReportLines.Add (new HourlySaleReportLineVM ()
            {
                SrNo = 1,
                time = new TimeSpan (0, 0, 0),
                timeStr = "00:00 to 01:00",
            }); ;

            for (int hour = 2; hour <= 23; hour++)
            {
                mod.ReportLines.Add (new HourlySaleReportLineVM ()
                {
                    SrNo = hour,
                    time = new TimeSpan (hour - 1, 0, 0),
                    timeStr = string.Format ("{0}:00 to {1}:00", (hour - 1).ToString ("D2"), (hour).ToString ("D2"))
                });
            }

            foreach (var saleTrans in saleTransactions)
            {
                if (saleTrans.CreatedOn != DateTime.MinValue)
                {
                    var saleTime = saleTrans.CreatedOn.TimeOfDay;
                    for (TimeSpan time = startTime; time <= endTime; time = time + stepSize)
                    {
                        var line = mod.ReportLines.Where (m => m.time.Hours == saleTime.Hours).FirstOrDefault ();
                        if (line != null)
                            line.amount += saleTrans.NetTotal.HasValue ? saleTrans.NetTotal.Value : 0;
                    }
                }
            }
            return mod;
        }
        #endregion
        #region MenuGroupWiseSaleReport


        #endregion
        #region MenuItemWiseSaleReport

        public List<MenuItemWiseReportVM> GetItemWiseSales ( ReportSearchCriteria criteria )
        {
            var orders = _sOrderSvc.SearchSaleOrders (new SaleOrderDE
            {
                ClientId = criteria.ClientId,
                From = criteria.StartDate.HasValue ? criteria.StartDate : null,
                To = criteria.EndDate.HasValue ? criteria.EndDate : null,
            });
            Dictionary<(int, int), MenuItemWiseReportVM> aggregatedOrders = new Dictionary<(int, int), MenuItemWiseReportVM> ();

            foreach (var order in orders)
            {
                foreach (var line in order.SaleOrderLines)
                {
                    var key = (line.ItemId, line.SizeId);
                    if (aggregatedOrders.ContainsKey (key))
                    {
                        var existingOrder = aggregatedOrders[key];

                        existingOrder.qty = (int.Parse (existingOrder.qty) + line.QTY).ToString ();
                        existingOrder.price = (float.Parse (existingOrder.price)).ToString ();
                        existingOrder.itemName = line.ItemName;
                        existingOrder.grossSale = (float.Parse (existingOrder.grossSale) + line.LineTotal).ToString ();
                        existingOrder.discount = (float.Parse (existingOrder.discount) + line.DiscountValue).ToString ();
                        existingOrder.size = line.Size;
                        existingOrder.netSale = (float.Parse (existingOrder.netSale) + (line.LineTotal - line.DiscountValue)).ToString ();
                    }
                    else
                    {
                        aggregatedOrders[key] = new MenuItemWiseReportVM
                        {
                            itemName = line.ItemName,
                            qty = line.QTY.ToString (),
                            price = line.Price.ToString (),
                            grossSale = line.LineTotal.ToString (),
                            discount = line.DiscountValue.ToString (),
                            size = line.Size,
                            netSale = (line.LineTotal - line.DiscountValue).ToString ()
                        };
                    }
                }
            }
            return new List<MenuItemWiseReportVM> (aggregatedOrders.Values);
        }

        #endregion
        #region RawItemsList
        public List<RawItemVM> GetRawItemReport ( ReportSearchCriteria criteria )
        {
            var items = _itemSvc.SearchItems (new ItemDE
            {
                ClientId = criteria.ClientId,
                ItemTypeId = (int)ItemTypes.RawItem
            });
            return _mapper.Map<List<RawItemVM>> (items);
        }

        #endregion
        #region SaleInvoice
        public List<SaleOrderVM> GetInvoiceReport ( ReportSearchCriteria criteria )
        {
            var orders = _sOrderSvc.SearchSaleOrders (new SaleOrderDE
            {
                ClientId = criteria.ClientId,
                From = criteria.StartDate.HasValue ? criteria.StartDate : null,
                To = criteria.EndDate.HasValue ? criteria.EndDate : null,
            });
            return _mapper.Map<List<SaleOrderVM>> (orders);
        }
        #endregion
        #region ComplimentaryReport

        public List<ComplimentaryReportVM> GetComplimentaryReport ( ReportSearchCriteria criteria )
        {
            var orders = _sOrderSvc.SearchSaleOrderLine (new SaleOrderLineDE
            {
                ClientId = criteria.ClientId,
                From = criteria.StartDate.HasValue ? criteria.StartDate : null,
                To = criteria.EndDate.HasValue ? criteria.EndDate : null,
                IsComp = true

            });
            return _mapper.Map<List<ComplimentaryReportVM>> (orders);
        }

        #endregion
        #region Refund/Void Report

        public List<SaleRefundReportVM> GetRefundVoidReport ( ReportSearchCriteria criteria )
        {
            var orders = _saleRefundSvc.SearchSaleDetailRefunds (new SaleDetailRefundDE
            {
                ClientId = criteria.ClientId,
                From = criteria.StartDate.HasValue ? criteria.StartDate : null,
                To = criteria.EndDate.HasValue ? criteria.EndDate : null,
                TypeId = criteria.RefundTypeId
            });
            return _mapper.Map<List<SaleRefundReportVM>> (orders);
        }

        #endregion
        #region Payment wise Sales Report
        public List<PaymentWiseSaleReportVM> GetPaymentWiseReport ( ReportSearchCriteria criteria )
        {
            var orders = _sOrderSvc.SearchSaleOrders (new SaleOrderDE
            {
                ClientId = criteria.ClientId,
                From = criteria.StartDate.HasValue ? criteria.StartDate : null,
                To = criteria.EndDate.HasValue ? criteria.EndDate : null,
            });
            return
                  orders.GroupBy (o => new
                  {
                      type = o.CustomerId > 0 ? "Receivable" :
                         o.PaymentMethod == "Card" ? $"Visa {o.Bank}" :
                         o.PaymentMethod == "Cash" ? "Cash" :
                         "Other"
                  })
              .Select (g => new PaymentWiseSaleReportVM
              {
                  type = g.Key.type,
                  qty = g.Count ().ToString (),
                  amount = g.Sum (o => o.NetTotal)
              })
              .ToList ();
        }

        #endregion
        #region Discount Sale Report
        public List<DiscountSaleReportVM> GetDiscountSaleReport ( ReportSearchCriteria criteria )
        {
            var orders = _sOrderSvc.SearchSaleOrderLine (new SaleOrderLineDE
            {
                ClientId = criteria.ClientId,
                From = criteria.StartDate.HasValue ? criteria.StartDate : null,
                To = criteria.EndDate.HasValue ? criteria.EndDate : null,
               // DiscountKeyId= criteria.DiscountKeyId,
                //IsComp= criteria.IncludeComplimentary
            });
           orders= orders.Where (x =>   x.DiscountKeyId== criteria.DiscountKeyId).ToList ();
            return _mapper.Map<List<DiscountSaleReportVM>> (orders);
        }

        #endregion
        #region Daily Sale Report
        public DailySaleReportVM GetDailySaleReport ( ReportSearchCriteria criteria )
        {
            try
            {
                DailySaleReportVM report = new DailySaleReportVM ();
                if (!(criteria.StartDate.HasValue && criteria.EndDate.HasValue) && !(criteria.ShiftId > 0))
                    return report;

                var sales = _sOrderSvc.SearchSaleOrders (new SaleOrderDE
                {
                    ShiftTypeId = criteria.ShiftId,
                    ClientId = criteria.ClientId,
                    From = criteria.StartDate.HasValue ? criteria.StartDate : null,
                    To = criteria.EndDate.HasValue ? criteria.EndDate : null,
                    Date = criteria.Date.HasValue? criteria.Date: null
                }) ;
                var saleRefunds = _saleRefundSvc.SearchSaleDetailRefunds (new SaleDetailRefundDE
                { From = criteria.StartDate, 
                  To = criteria.EndDate,
                  ClientId = criteria.ClientId,
                  Date=criteria.Date!=null? (DateTime)criteria.Date: DateTime.MinValue
                });

                var shifts = _shiftSvc.SearchShifts (new ShiftDE 
                { 
                    ClientId = criteria.ClientId,
                    ShiftTypeId = criteria.ShiftId, 
                    From=criteria.StartDate, 
                    To=criteria.EndDate, 
                    Date= criteria.Date
                });

                var saleLines = new List<SaleOrderLineDE> ();
                foreach (var sale in sales)
                {
                    saleLines.AddRange (sale.SaleOrderLines);
                }


                report.Sales = saleLines.GroupBy (x => x.ItmName).Select (g => new Sales
                  {
                  name = g.Key,
                  cashSales = g.Where (x => x.PaymentMethodId == (int)PaymentMethods.Cash).Sum (x => x.LineTotal),
                  cardSales = g.Where (x => x.PaymentMethodId == (int)PaymentMethods.Card).Sum (x => x.LineTotal)
                  }).ToList ();

                // Sale Summary
                report.NetSale = report.Sales.Sum (x => x.total).ToString ();
                report.GST = sales.Sum (x => x.GSTValue).ToString ();
                report.CashGST = sales.Where (x => x.PaymentMethodId == (int)PaymentMethods.Cash).Sum (x => x.GSTValue).ToString ();
                report.CardGST = sales.Where (x => x.PaymentMethodId == (int)PaymentMethods.Card).Sum (x => x.GSTValue).ToString ();
                report.POSFee= sales.Sum(x=>x.POSFee).ToString ();
                report.TotalSale = (new[] { report.NetSale, report.GST, report.POSFee }.Select (s => float.TryParse (s ?? "0", out float v) ? v : 0).Sum ()).ToString ();
                report.Discount = sales.Sum (x => x.DiscountValue).ToString ();
                report.CashDiscount = sales.Where (x => x.PaymentMethodId == (int)PaymentMethods.Cash).Sum (x => x.DiscountValue).ToString ();
                report.CardDiscount = sales.Where (x => x.PaymentMethodId == (int)PaymentMethods.Card).Sum (x => x.DiscountValue).ToString ();
                report.SvcCharges = sales.Sum (x => x.Service).ToString ();
                report.Refund = saleRefunds.Where (x => x.TypeId == (int)RefundTypes.Refund).Sum (x => x.Gross).ToString ();
                report.GrossSale = (new[] { report.TotalSale, report.Refund, report.Discount, report.SvcCharges }.Select (s => float.TryParse (s ?? "0", out float v) ? v : 0).Sum ()).ToString ();

                // Payments
                report.CashSale = sales.Where (x => x.PaymentMethodId == (int)PaymentMethods.Cash).Sum (x => x.NetTotal).ToString ();
                report.VisaSale = sales.Where (x => x.PaymentMethodId == (int)PaymentMethods.Card).Sum (x => x.NetTotal).ToString ();
                report.Receivables = sales.Where (x => x.IsPaid == false).Sum (x => x.NetTotal).ToString ();
                report.CardReceivable = sales.Where (x => x.IsPaid == false && x.PaymentMethodId == (int)PaymentMethods.Card).Sum (x => x.NetTotal).ToString ();
                report.CashReceivable = sales.Where (x => x.IsPaid == false && x.PaymentMethodId == (int)PaymentMethods.Cash).Sum (x => x.NetTotal).ToString ();
                report.TotalPayments = (new[] { report.CashSale, report.VisaSale, report.Receivables }
                       .Select (s => float.TryParse (s ?? "0", out float v) ? v : 0)
                       .Sum ()).ToString ();

                //Check Out
                report.FloatCash = shifts.Sum (x => int.TryParse (x.FloatingCash ?? "0", out int v) ? v : 0).ToString ();
                report.CalculatedCash = (new[] { report.CashSale, report.FloatCash }.Select (s => float.TryParse (s ?? "0", out float v) ? v : 0).Sum ()).ToString ();
                report.TotalCheckOut= report.CashSale;
                report.DeclaredCash = shifts.Sum (x => int.TryParse (x.ShiftEndCash ?? "0", out int v) ? v : 0).ToString ();
                report.OverandShort = (float.Parse (report.DeclaredCash) - float.Parse (report.CalculatedCash)).ToString ();
                report.BankingTotal = sales.Where (x => x.PaymentMethodId == (int)PaymentMethods.Card).Sum (x => x.NetTotal).ToString ();

                //Audit
                report.TakeAway = sales.Where (x => x.OrderTypeId == (int)OrderTypes.TakeAway).Sum(x=>x.NetTotal).ToString ();
                report.DineIn = sales.Where (x => x.OrderTypeId == (int)OrderTypes.DineIn).Sum (x => x.NetTotal).ToString ();
                report.Delivery = sales.Where (x => x.OrderTypeId == (int)OrderTypes.Delivery).Sum (x => x.NetTotal).ToString ();
                report.TotalTakeAwayOrders = sales.Where (x => x.OrderTypeId == (int)OrderTypes.TakeAway).Count ().ToString ();
                report.TotalDineInOrders = sales.Where (x => x.OrderTypeId == (int)OrderTypes.DineIn).Count ().ToString ();
                report.TotalDeliveryOrders = sales.Where (x => x.OrderTypeId == (int)OrderTypes.Delivery).Count ().ToString ();
                var guest = sales.Where (x => x.OrderTypeId == (int)OrderTypes.DineIn).Sum (x => int.TryParse (x.Guest, out int guestValue) ? guestValue : 0);
                report.AvgPerGuest = guest > 0? (float.TryParse (report.DineIn ?? "0", out float dineInValue) ? (dineInValue / guest).ToString () : "0"): "0";
                report.AvgPerTable = float.TryParse (report.DineIn ?? "0", out float dineValue) &&
                       float.TryParse (report.TotalDineInOrders ?? "1", out float totalOrdersValue) &&
                       totalOrdersValue != 0? (dineValue / totalOrdersValue).ToString ():"0";
                report.TotalOrders = sales.Count ().ToString();
                report.AvgOrders= (sales.Sum(x=>x.NetTotal)/ int.Parse(report.TotalOrders)).ToString ();

               var _banks = sales.Where (x => x.PaymentMethodId == (int)PaymentMethods.Card)
                    .GroupBy (order => order.Bank)
                    .Select (group => new Bank
                    {
                        name = group.Key,
                        amount = group.Sum (order => order.NetTotal).ToString ()
                    });
                report.Banks.AddRange (_banks);
                var _sources = sales.Where (x => x.OrderTypeId == (int)OrderTypes.Delivery)
                   .GroupBy (order => order.Source)
                   .Select (group => new Source
                   {
                       name = group.Key,
                       amount = group.Sum (order => order.NetTotal).ToString ()
                   });
                report.Sources.AddRange (_sources);
               
                return report;
            }
            catch (Exception)
            {
                throw;
            }
        }
        #endregion
    }
}

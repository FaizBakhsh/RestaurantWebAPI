using Restaurant.Core.Entities;
using Restaurant.Core.Enums;
using Restaurant.Core.SearchCriteria;
using Restaurant.Core.ViewModel;
using Restaurant.DAL;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NLog;
using Restaurant.Service;
using Restaurant.Core.Constants;

namespace Restaurant.Services
{
    public class SaleOrderService
    {
        #region Data Members

        private SaleOrderDAL _soDAL;
        private CoreDAL _corDAL;
        private Logger _logger;
        private SaleDetailRefundService _refundService;
        private LogEventService _logService;

        #endregion
        #region Constructors
        public SaleOrderService ( )
        {
            _soDAL = new SaleOrderDAL ();
            _corDAL = new CoreDAL ();
            _logger = LogManager.GetLogger ("fileLogger");
            _refundService = new SaleDetailRefundService ();
            _logService = new LogEventService ();
        }
        #endregion
        #region SaleOrder
        public SaleOrderDE ManagementSaleOrder ( SaleOrderDE mod, int? Id = null )
        {
            MySqlCommand? cmd=null;
            try
            {
                bool retVal = false;
                cmd = RestaurantDataContext.OpenMySqlConnection ();
                RestaurantDataContext.StartTransaction (cmd);
                if (mod.DBoperation == DBoperations.Insert)
                    mod.Id = _corDAL.GetNextIdByClient (TableNames.saleorder.ToString (), mod.ClientId, "ClientId");
                retVal = _soDAL.ManageSaleOrder (mod, cmd);
                if (mod.DBoperation == DBoperations.Insert || mod.DBoperation == DBoperations.Update)
                {
                    var _Id= _corDAL.GetMaxIdByClient (TableNames.saleorderline.ToString (), mod.ClientId, "ClientId");
                    var addOnNo = _corDAL.GetnextAddOnNo (mod.Id,"SaleOrderId", mod.ClientId);
                    foreach (var sol in mod.SaleOrderLines)
                    {
                        if (sol.DBoperation == DBoperations.Insert)
                        {
                            _Id += 1;
                            sol.SaleOrderId = mod.Id;
                            sol.Id = _Id;
                            sol.AddOnNo=addOnNo;
                            sol.ClientId = mod.ClientId;
                            sol.StatusId =(int) Statuses.InProgress;
                        }
                        retVal = _soDAL.ManageSaleOrderLine (sol, cmd);
                    }
                }
                if (mod.SaleDetailRefund.DBoperation != (int)DBoperations.NA)
                {
                    mod.SaleDetailRefund.ClientId = mod.ClientId;
                    mod.SaleDetailRefund.SaleOrderId = mod.Id;
                    mod.SaleDetailRefund.DBoperation = DBoperations.Insert;
                    _refundService.ManagementSaleDetailRefund (mod.SaleDetailRefund, cmd);
                    mod.SaleDetailRefund.DBoperation = (int)DBoperations.NA;
                }
                if (mod.LogEvent.DBoperation != (int)DBoperations.NA)
                {
                    mod.LogEvent.ClientId = mod.ClientId;
                    _logService.ManagementLogEvent (mod.LogEvent, cmd);
                    mod.LogEvent.DBoperation = (int)DBoperations.NA;
                }
                if (retVal == true)
                    mod.DBoperation = DBoperations.NA;
                    RestaurantDataContext.EndTransaction (cmd);
            }
            catch (Exception exp)
            {
                _logger.Error (exp);
                RestaurantDataContext.CancelTransaction (cmd);
                throw;
            }
            finally
            {
                if (cmd != null)
                    RestaurantDataContext.CloseMySqlConnection (cmd);
                string whereClause = "where 1=1";
                mod = SearchSaleOrders (new SaleOrderDE { Id = mod.Id, ClientId=mod.ClientId }).FirstOrDefault();
                if(mod!=null)
                mod.SaleOrderLines = _soDAL.SearchSaleOrderLine (whereClause += $" AND SaleOrderId={mod.Id} AND ClientId={mod.ClientId} AND IsActive ={true} " +
                    $" AND IsDeleted ={false}");
            }
            return mod;
        }
        public List<SaleOrderDE> SearchSaleOrders ( SaleOrderDE mod )
        {
            List<SaleOrderDE> so = new List<SaleOrderDE> ();
            bool closeConnectionFlag = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = RestaurantDataContext.OpenMySqlConnection ();
                closeConnectionFlag = true;
                #region Search

                string whereClause = " Where 1=1";
                if (mod.Id != default)
                    whereClause += $" AND Id={mod.Id}";
                if (mod.CustomerId != default)
                    whereClause += $" AND CustomerId ={mod.CustomerId}";
                if (mod.ClientId != default)
                    whereClause += $" AND ClientId={mod.ClientId}";
                if (mod.DayId != default)
                    whereClause += $" AND DayId={mod.DayId}";
                if (mod.StatusId != default && mod.StatusId != 0)
                    whereClause += $" AND StatusId={mod.StatusId}";
                if (mod.BillStatusId != default && mod.BillStatusId != 0)
                    whereClause += $" AND BillStatusId={mod.BillStatusId}";
                if (mod.Date!=default && mod.Date > AppConstants.DEFAULT_DATE)
                    whereClause += $" AND Date(Date) = ''{mod.Date:yyyy-MM-dd} 00:00:00''";
                if (mod.From.HasValue && mod.From.Value > AppConstants.DEFAULT_DATE)
                    whereClause += $" AND Date >= ''{mod.From.Value:yyyy-MM-dd} 00:00:00''";
                if (mod.To.HasValue && mod.To.Value > AppConstants.DEFAULT_DATE)
                    whereClause += $" AND Date <= ''{mod.To.Value:yyyy-MM-dd} 23:59:59''";
                //if (mod.IsSent.HasValue )
                //    whereClause += $" AND IsSent={mod.IsSent}";
                if (mod.Status != default)
                    whereClause += $" AND Status like ''" + mod.Status + "''";
                if (mod.ShiftId >0)
                    whereClause += $" AND ShiftId={mod.ShiftId}";
                if (mod.ShiftTypeId != default)
                    whereClause += $" AND ShiftTypeId={mod.ShiftTypeId}";
                if (mod.BillTitle != default)
                    whereClause += $" AND BillTitle like ''" + mod.BillTitle + "''";

                so = _soDAL.SearchSaleOrders (whereClause);
                foreach (var line in so)
                {
                    whereClause = "where 1=1";
                    line.SaleOrderLines = _soDAL.SearchSaleOrderLine (whereClause += $" AND SaleOrderId={line.Id} and  ClientId={line.ClientId} AND IsActive ={true} " +
                        $" AND IsDeleted ={false}");
                }
                #endregion
            }
            catch (Exception exp)
            {
                _logger.Error (exp);
                throw;
            }
            finally
            {
                if (closeConnectionFlag)
                    RestaurantDataContext.CloseMySqlConnection (cmd);
            }
            return so;
        }
        public List<SaleOrderLineDE> SearchSaleOrderLine ( SaleOrderLineDE mod )
        {
            List<SaleOrderLineDE> so = new List<SaleOrderLineDE> ();
            bool closeConnectionFlag = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = RestaurantDataContext.OpenMySqlConnection ();
                closeConnectionFlag = true;
                #region Search

                string whereClause = " Where 1=1";
                if (mod.Id != default)
                    whereClause += $" AND Id={mod.Id}";
                if (mod.DiscountKeyId != default)
                    whereClause += $" AND DiscountKeyId={mod.DiscountKeyId}";
                if (mod.ClientId != default)
                    whereClause += $" AND ClientId={mod.ClientId}";
                if (mod.Date != default && mod.Date > AppConstants.DEFAULT_DATE)
                    whereClause += $" AND CreatedOn = ''{mod.Date:yyyy-MM-dd} 00:00:00''";
                if (mod.From.HasValue && mod.From.Value > AppConstants.DEFAULT_DATE)
                    whereClause += $" AND CreatedOn >= ''{mod.From.Value:yyyy-MM-dd} 00:00:00''";
                if (mod.To.HasValue && mod.To.Value > AppConstants.DEFAULT_DATE)
                    whereClause += $" AND CreatedOn <= ''{mod.To.Value:yyyy-MM-dd} 23:59:59''";
                if (mod.IsComp != default)
                    whereClause += $" AND IsComp={mod.IsComp}";
                so = _soDAL.SearchSaleOrderLine (whereClause);

                #endregion
            }
            catch (Exception exp)
            {
                _logger.Error (exp);
                throw;
            }
            finally
            {
                if (closeConnectionFlag)
                    RestaurantDataContext.CloseMySqlConnection (cmd);
            }
            return so;
        }
        public List<SaleOrderDE> SearchOrderswithDeletedLines ( SaleOrderDE mod )
        {
            List<SaleOrderDE> so = new List<SaleOrderDE> ();
            bool closeConnectionFlag = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = RestaurantDataContext.OpenMySqlConnection ();
                closeConnectionFlag = true;
                #region Search

                string whereClause = " Where 1=1";
                if (mod.Id != default)
                    whereClause += $" AND Id={mod.Id}";
                if (mod.ClientId != default)
                    whereClause += $" AND ClientId={mod.ClientId}";
                if (mod.StatusId != default && mod.StatusId != 0)
                    whereClause += $" AND StatusId={mod.StatusId}";
                if (mod.BillStatusId != default && mod.BillStatusId != 0)
                    whereClause += $" AND BillStatusId={mod.BillStatusId}";
                if (mod.Status != default)
                    whereClause += $" AND Status like ''" + mod.Status + "''";
                if (mod.ShiftId != default)
                    whereClause += $" AND ShiftId={mod.ShiftId}";
                if (mod.ShiftTypeId != default)
                    whereClause += $" AND ShiftTypeId={mod.ShiftTypeId}";
                if (mod.BillTitle != default)
                    whereClause += $" AND BillTitle like ''" + mod.BillTitle + "''";

                so = _soDAL.SearchSaleOrders (whereClause);
                foreach (var line in so)
                {
                    whereClause = "where 1=1";
                    line.SaleOrderLines = _soDAL.SearchSaleOrderLine (whereClause += $" AND SaleOrderId={line.Id} and  ClientId={line.ClientId} AND StatusId={(int)Statuses.InProgress} AND IsActive ={true} AND IsDeleted ={false}");
                }
                #endregion

            }
            catch (Exception exp)
            {
                _logger.Error (exp);
                throw;
            }
            finally
            {
                if (closeConnectionFlag)
                    RestaurantDataContext.CloseMySqlConnection (cmd);
            }
            return so;
        }
        #endregion
        #region PushSale
        public bool PushSale ( )
        {
            bool retVal = false;
            MySqlCommand? cmd = null;
            try
            {
                cmd = RestaurantDataContext.OpenMySqlConnection ();
                List<SaleOrderDE> orders = new List<SaleOrderDE> ();
                orders = _soDAL.SearchSaleOrders ("where IsSent=false", cmd);
                foreach (SaleOrderDE order in orders)
                {
                    RestaurantDataContext.StartTransaction (cmd);

                    RestaurantDataContext.EndTransaction (cmd);
                }
            }
            catch (Exception exp)
            {
                _logger.Error (exp);
                RestaurantDataContext.CancelTransaction (cmd);
                throw;
            }
            finally
            {
                if (cmd != null)
                    RestaurantDataContext.CloseMySqlConnection (cmd);
            }
            return retVal;
        }
        #endregion
    }
}

using Restaurant.Core.Entities.Reports;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Core.ViewModel.Reports
{
    public class DailySaleReportVM:BaseReportVM
    {
        public DailySaleReportVM()
        {
            Banks= new List<Bank>();
            Sources= new List<Source>();
            Sales = new List<Sales> ();
        }
        public string? ReportTitle { get; set; }
        public List<Source> Sources{ get; set; }
        public List<Bank> Banks{ get; set; }
        public List<Sales> Sales{ get; set; }

        public string? Period{ get; set; }
        public string? NetSale{ get; set; }
        public string? GST{ get; set; }
        public string? CashGST{ get; set; }
        public string? CardGST{ get; set; }
        public string? Discount{ get; set; }
        public string? CardDiscount{ get; set; }
        public string? CashDiscount{ get; set; }
        public string? POSFee{ get; set; }
        public string? TotalSale{ get; set; }
        public string? SvcCharges{ get; set; }
        public string? Refund{ get; set; }
        public string? GrossSale{ get; set; }
        public string? CashSale{ get; set; }
        public string? VisaSale{ get; set; }
        public string? Receivables{ get; set; }
        public string? CashReceivable{ get; set; }
        public string? CardReceivable{ get; set; }
        public string? TotalPayments{ get; set; }
        public string? CalculatedCash{ get; set; }
        public string? FloatCash{ get; set; }
        public string? TotalCheckOut{ get; set; }
        public string? DeclaredCash{ get; set; }
        public string? OverandShort{ get; set; }
        public string? BankingTotal{ get; set; }
        public string? TakeAway{ get; set; }
        public string? TotalTakeAwayOrders{ get; set; }
        public string? DineIn{ get; set; }
        public string? TotalDineInOrders{ get; set; }
        public string? AvgPerGuest{ get; set; }
        public string? AvgPerTable{ get; set; }
        public string? Delivery{ get; set; }
        public string? TotalDeliveryOrders{ get; set; }
        public string? TotalOrders{ get; set; }
        public string? AvgOrders{ get; set; }

    }
    public class Sales 
    {
        public string? name { get; set; }
        public float? cashSales { get; set; }
        public float? cardSales { get; set; }
        public float? total  => cardSales + cashSales;
    }

}

using Restaurant.Core.ViewModel.Reports;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Core.Entities.Reports
{
    public class SummaryReportDE :BaseDomain
    {
        public SummaryReportDE() {
            Sources = new List<Source> ();
            Banks = new List<Bank> ();
            Receivables = new List<Receivable> ();
            Groups = new List<Group> ();
        }
        public List<Source> Sources { get; set; }
        public List<Bank> Banks { get; set; }
        public List<Receivable> Receivables { get; set; }
        public List<Group> Groups { get; set; }
        public string? PrintingDate { get; set; }
        public string? PrintingTime { get; set; }
        public string? Shift { get; set; }
        public string? Day { get; set; }
        public string? Terminal { get; set; }
        public string? User { get; set; }
        public string? TotalNetSale { get; set; }
        public string? CashNet { get; set; }
        public string? CardNet { get; set; }
        public string? TotalGSTSales { get; set; }
        public string? TotalDiscSales { get; set; }
        public string? CashGST { get; set; }
        public string? CardGST { get; set; }
        public string? CashDiscount { get; set; }
        public string? CardDiscount { get; set; }
        public string? TotalGross { get; set; }
        public string? Comp { get; set; }
        public string? SrvcChrgs { get; set; }
        public string? Void { get; set; }
        public string? Refund { get; set; }
        public string? TotalCashIn { get; set; }
        public string? BankSales { get; set; }
        public string? Receivable { get; set; }
        public string? CalCash { get; set; }
        public string? CashIn { get; set; }
        public string? Float { get; set; }
        public string? DecCash { get; set; }
        public string? Expenses { get; set; }
        public string? OverShort { get; set; }
        public string? DineInOrdersAmount { get; set; }
        public string? DineInOrders { get; set; }
        public string? AvgPerOrder { get; set; }
        public string? Guest { get; set; }
        public string? AvgPerGuest { get; set; }
        public string? TakeAwayOrdersAmount { get; set; }
        public string? DeliveryOrdersAmount { get; set; }
        public string? ReportName { get; set; }
    }
    public class Group
    {
        public string? name { get; set; }
        public string? amount { get; set; }
    }
    public class Receivable
    {
        public string? name { get; set; }
        public string? amount { get; set; }
    }
    public class Bank
    {
        public string? name { get; set; }
        public string? amount { get; set; }
    }
    public class Source
    {
        public string? name { get; set; }
        public string? amount { get; set; }
    }
}

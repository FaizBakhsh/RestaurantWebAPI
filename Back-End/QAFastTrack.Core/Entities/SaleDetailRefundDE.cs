using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Core.Entities
{
    public class SaleDetailRefundDE:BaseDomain
    {
        #region Properties
        public string? Reason { get; set; }
        public string? ItemName { get; set; }
        public int QTY { get; set; }
        public float Price { get; set; }
        public float POSFee { get; set; }
        public float DC { get; set; }
        public float SvcChrgs { get; set; }
        public float Gross { get; set; }
        public int SaleOrderId { get; set; }
        public float GST { get; set; }
        public float Discount { get; set; }
        public int TypeId { get; set; }
        public int MakeStatusId { get; set; }
        public int TerminalId { get; set; }
        public int ShiftId { get; set; }
        public DateTime Date { get; set; }
        public string? Time { get; set; }
        public string? Terminal { get; set; }
        public string? Type { get; set; }
        public string? MakeStatus { get; set; }
        public DateTime? From { get; set; }
        public DateTime? To { get; set; }
        public DateTime BillTime { get; set; }
        public int DayId { get; set; }
        public DateTime SaleDate { get; set; }

        #endregion
    }
}

using Restaurant.Core.Entities;
using Restaurant.WPF.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Core.Entities
{
   public class SaleOrderDE:BaseDomain
    {
        #region Constructors
        public SaleOrderDE ( )
        {
            this.SaleOrderLines = new List<SaleOrderLineDE> ();
            LogEvent = new LogEventDE ();
            IsPaid = true;
            SaleDetailRefund = new SaleDetailRefundDE ();
        }
        #endregion
        #region Properties
        public List<SaleOrderLineDE> SaleOrderLines { get; set; }
        public float Service { get; set; }
        public string? Customer { get; set; }
        public string? VoucherNarration { get; set; }
        public string? DiscountNarration { get; set; }
        public float GSTValue { get; set; }
        public float DiscountValue { get; set; }
        public string? Source { get; set; }
        public float GST { get; set; }
        public float Total { get; set; }
        public float Discount { get; set; }
        public float NetTotal { get; set; }
        public string? PaymentMethod { get; set; }
        public int? PaymentMethodId { get; set; }
        public int? ShiftId { get; set; }
        public int? BillStatusId { get; set; }
        public int? RiderId { get; set; }
        public string? BillTitle { get; set; }
        public int? StatusId { get; set; }
        public int? OrderTypeId { get; set; }
        public int CustomerId { get; set; }
        public string? TableNo { get; set; }
        public int? RestaurantId { get; set; }
        public int WaiterId { get; set; }
        public string? Guest { get; set; }
        public string? PhoneNo { get; set; }
        public string? Name { get; set; }
        public string? Address { get; set; }
        public int? SourceId { get; set; }
        public int? DiscountTypeId { get; set; }
        public string? Note { get; set; }
        public DateTime? DispatchedTime { get; set; }
        public DateTime? DeliveryTime { get; set; }
        public float? POSFee { get; set; }
        public float? DeliveryCharges { get; set; }
        public string? Comments { get; set; }
        public DateTime Date { get; set; }
        public string? Time { get; set; }
        public int TerminalId { get; set; }
        public string? Terminal { get; set; }
        public bool IsPaid { get; set; }
        public int BankId { get; set; }
        public string? Bank { get; set; }
        public string? UserId { get; set; }
        public string? User { get; set; }
        public int CustTypeId { get; set; }
        public int DayId { get; set; }
        public string? CustType { get; set; }
        public float? CashReceived { get; set; }
        public float? RemainingCash { get; set; }
        public SaleDetailRefundDE SaleDetailRefund { get; set; }
        public LogEventDE LogEvent { get; set; }
        #region View Properties
        public string? Shift { get; set; }
        public string? Status { get; set; }
        public string? OrderType { get; set; }
        public string? BillStatus { get; set; }
        public Boolean DisplayCash { get; set; }
        public string? Waiter { get; set; }
        #endregion

        #endregion

    }
}

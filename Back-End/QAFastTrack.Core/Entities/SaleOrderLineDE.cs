using Restaurant.Core.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Core.Entities
{
    public class SaleOrderLineDE : BaseDomain
    {
        #region Constructor
        public SaleOrderLineDE ( )
        {
            ItemCode = null;
            ItemName = null;
        }
        #endregion
        #region Properties
        public int StatusId { get; set; }
        public string? ItemCode { get; set; }
        public string? ItemName { get; set; }
        public string? ItmName { get; set; }
        public int ItemId { get; set; }
        public string? Comments { get; set; }
        public string? ComplimentaryNarration { get; set; }
        public int? RModId { get; set; }
        public string? ModifierName { get; set; }
        public bool IsRMod { get; set; }
        public int SizeId { get; set; }
        public string? Size { get; set; }
        public int DealId { get; set; }
        public int QTY { get; set; }
       // public int qty { get { return qty; } set { QTY = value; } }
        public float Price { get; set; }
        //public float price { get { return price; } set { Price = value; } }
        public float LineTotal { get; set; }
       // public float lineTotal { get { return lineTotal; } set { LineTotal = value; } }
        public int SaleOrderId { get; set; }
        public bool OptionalModifier { get; set; }
        public bool IsDealItem { get; set; }
        public int AddOnNo { get; set; }
        public int KDSId { get; set; }
        public bool IsDeleted { get; set; }
        public string? KDS { get; set; }
        public string? LineStatus { get; set; }
        public int TerminalId { get; set; }
        public int ShiftId { get; set; }
        public bool IsComp { get; set; }
        public float DiscountValue { get; set; }
        public int GroupId { get; set; }
        public string? ItemGroup { get; set; }
        public DateTime?  Date { get; set; }
        public DateTime? From { get; set; }
        public DateTime? To { get; set; }
        public int DiscountKeyId { get; set; }
        public string? DiscountKey { get; set; }
        public string? DiscountKeyValue { get; set; }
        public string? BillTitle { get; set; }
        public int PaymentMethodId { get; set; }
        public string? PaymentMethod { get; set; }
        #endregion
    }
}

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
        #region Properties
        public SaleOrderLineDE ( )
        {
            this.IsChecked = false;
        }
        public string? ComplimentaryNarration { get; set; }
        public string? ItemCode { get; set; }
        public int ItemId { get; set; }
        public string? Comments { get; set; }
        public int? RModId { get; set; }
        public string? ModifierName { get; set; }
        public bool IsRMod { get; set; }
        public string? Color { get; set; }
        public string? ForeGround { get; set; }
        public string? Status { get; set; }
        public string? ItemName { get; set; }
        public  string? itemName { get { return ItemName; } set { ItemName = value; } }
        public string? ItmName { get; set; }
        public string? itmName { get { return ItmName; } set { ItmName = value; } }
        public int QTY { get; set; }
        //public int qty { get { return QTY; } set { QTY = value; } }
        public float Price { get; set; }
       // public float price { get { return Price; } set { Price = value; } }
        public float LineTotal { get; set; }
        //public float lineTotal { get { return LineTotal; } set { LineTotal = value; } }
        public int SaleOrderId { get; set; }
        public bool IsChecked { get; set; }
        public bool IsDealItem { get; set; }
        public int SizeId { get; set; }
        public string? Size { get; set; }
        public int DealId { get; set; }
        public int ItemParentId { get; set; }
        public bool OptionalModifier { get; set; }
        public int AddOnNo { get; set; }
        public int KDSId { get; set; }
        public bool IsDeleted { get; set; }
        public string? KDS { get; set; }
        public string? LineStatus { get; set; }
        public int StatusId { get; set; }
        public int TerminalId { get; set; }
        public int ShiftId { get; set; }
        public bool IsComp { get; set; }
        public float DiscountValue { get; set; }
        public int GroupId { get; set; }
        public string? ItemGroup { get; set; }
        public int DiscountKeyId { get; set; }

        #endregion
    }
}

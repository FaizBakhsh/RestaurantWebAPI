using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Core.ViewModel
{
    public class SaleOrderLineVM:BaseViewModel
    {
        #region Constructor
        public SaleOrderLineVM ( )
        {
        }
        #endregion
        #region Properties
        public int statusId { get; set; }
        public string? itemCode { get; set; }
        public string? itemName { get; set; }
        public string? itmName { get; set; }
        public int itemId { get; set; }
        public string? comments { get; set; }
        public string? complimentaryNarration { get; set; }
        public int? rModId { get; set; }
        public string? modifierName { get; set; }
        public bool isRMod { get; set; }
        public int sizeId { get; set; }
        public string? size { get; set; }
        public int dealId { get; set; }
        public int qty { get; set; }
        public float price { get; set; }
        public float lineTotal { get; set; }
        public int saleOrderId { get; set; }
        public bool optionalModifier { get; set; }
        public bool isDealItem { get; set; }
        public int addOnNo { get; set; }
        public int kDSId { get; set; }
        public bool isDeleted { get; set; }
        public string? kds { get; set; }
        public string? lineStatus { get; set; }
        public int terminalId { get; set; }
        public int shiftId { get; set; }
        public bool isComp { get; set; }
        public float discountValue { get; set; }
        public int groupId { get; set; }
        public string? itemGroup { get; set; }
        #endregion
    }
}

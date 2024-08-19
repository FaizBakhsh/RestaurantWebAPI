using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Core.Entities
{
    public class PurchaseReturnLineDE:BaseDomain
    {
        #region Properties
        public int PRId { get; set; }
        public int ItemId { get; set; }
        public int UOMId { get; set; }
        public DateTime Date { get; set; }
        public int TotalItems { get; set; }
        public decimal PricePerItem { get; set; }
        public decimal TotalAmt { get; set; }
        public int ReturnQty { get; set; }
        public string? Item { get; set; }
        public string? UOM { get; set; }
        #endregion
    }
}

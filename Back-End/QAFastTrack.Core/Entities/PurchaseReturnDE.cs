using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Core.Entities
{
    public class PurchaseReturnDE:BaseDomain
    {
        #region Properties
        public int BranchId { get; set; }
        public int SupplierId { get; set; }
        public int? InvoiceNo { get; set; }
        public DateTime ReturnDate { get; set; }
        public string? Supplier { get; set; }
        public string? Branch { get; set; }
        public List<PurchaseReturnLineDE> PRLines { get; set; }
        #endregion
        #region Constructor
        public PurchaseReturnDE()
        {
            PRLines = new List<PurchaseReturnLineDE>();
        }
        #endregion
    }
}

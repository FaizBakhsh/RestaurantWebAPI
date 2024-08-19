using Restaurant.Core.Enums;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Core.Entities
{
    public class PurchaseOrderDE:BaseDomain
    {
        #region Class Properties
        
        public DateTime PODate { get; set; }
        public int? PONo { get; set; }
        public int DemandNo { get; set; }
        public int SupplierId { get; set; }
        public int BranchId { get; set; }
        public int ItemId { get; set; }
        public int ItemsPerPkg { get; set; }
        public int NoOfPkg { get; set; }
        public int TotalQty { get; set; }
        public float PricePerPkg { get; set; }
        public double TotalAmount { get; set; }
        public List<PurchaseOrderLineDE> POLines { get; set; }

        #region View Properties
        public string? Branch { get; set; }
        public string? Item { get; set; }
        public string? Supplier { get; set; }
        #endregion
        #endregion
        #region Constructors
        public PurchaseOrderDE()
        {
            POLines = new List<PurchaseOrderLineDE>(); 
        }
        #endregion
    }
}

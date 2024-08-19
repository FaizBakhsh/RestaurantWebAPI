using Restaurant.Core.Enums;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Core.Entities
{
    public class PurchaseItemsDE:BaseDomain
    {
        #region Properties
        public DateTime Date { get; set; }
        public int GRN { get; set; }
        public int BranchId { get; set; }
        public int StoreId { get; set; }
        public int SupplierId { get; set; }
        public int GroupId { get; set; }
        public int ItemId { get; set; }
        public int ItemsPerPkg { get; set; }
        public int NoOfPkg { get; set; }
        public int TotalQty { get; set; }
        public float PricePerPkg { get; set; }
        public float TotalAmount { get; set; }
        public string? Description { get; set; }
        public float PricePerItem { get; set; }
        public int PurchaseTypeId { get; set; }
        public int InvoiceNo { get; set; }
        public int PoNo { get; set; }
        public DateTime ExpiryDate { get; set; }
        public double TtlAmount { get; set; }
        public List<PurchaseItemsLineDE> PILines { get; set; }

        #endregion

        #region View Properties
        public string? Branch { get; set; }
        public string? Store { get; set; }
        public string? Supplier { get; set; }
        public string? Group { get; set; }
        public string? Item { get; set; }
        public string? PurchaseTypes { get; set; }
        public int PurchItemId { get; set; }


        #endregion
        #region Constructors
        public PurchaseItemsDE() 
        {
           PILines = new List<PurchaseItemsLineDE>();
        }
        #endregion
    }
}

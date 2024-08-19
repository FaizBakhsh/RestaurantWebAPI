using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Core.Entities
{
    public class PurchaseItemsLineDE:BaseDomain
    {
        public int PIId { get; set; }
        public int RawItemId { get; set; }
        public string? Package { get; set; }
        public float PackageItems { get; set; }
        public float TotalItems { get; set; }
        public float Price { get; set; }
        public float PricePerItem { get; set; }
        public float TotalAmount { get; set; }
        public int BranchId { get; set; }
        public string? Description { get; set; }
        public string? Expiry { get; set; }

        public string? Item { get; set; }
        public string? Branch { get; set; }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Core.Entities
{
    public class PurchaseOrderLineDE:BaseDomain
    {
        public int POId { get; set; }
        public int RawItemId { get; set; }
        public string? Package { get; set; }
        public float PackageItems { get; set;}
        public float TotalItems { get; set; }
        public float Price { get; set; }
        public float PricePerItem { get; set;}
        public float TotalAmount { get; set; }
        public string? Description { get; set; }

        public string? Item { get; set; }
    }
}

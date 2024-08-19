using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Core.ViewModel.Reports
{
    public class DiscountSaleReportVM:BaseReportVM
    {
        public string? narration { get; set; }
        public string? billTitle { get; set; }
        public string? customer { get; set; }
        public string? itemName { get; set; }
        public string? discountType { get; set; }
        public string? discount { get; set; }
        public string? discountPer { get; set; }
        public int qty { get; set; }
        public float? amount { get; set; }
    }
}

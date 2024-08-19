using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Core.ViewModel.Reports
{
    public class SaleRefundReportVM:BaseReportVM
    {
        public string? itemName { get; set; }
        public string? invNo { get; set; }
        public string? type { get; set; }
        public string? reason { get; set; }
        public float? gst { get; set; }
        public int qty { get; set; }
        public float? amount { get; set; }
        public string? billTime { get; set; }
    }
}

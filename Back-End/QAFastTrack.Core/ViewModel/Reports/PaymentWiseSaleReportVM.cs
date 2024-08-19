using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Core.ViewModel.Reports
{
    public class PaymentWiseSaleReportVM:BaseReportVM
    {
        public string? type { get; set; }
        public string? qty { get; set; }
        public float? amount { get; set; }
    }
}

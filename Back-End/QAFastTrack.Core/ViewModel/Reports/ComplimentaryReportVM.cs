using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Core.ViewModel.Reports
{
    public class ComplimentaryReportVM
    {
        public string? itemName { get; set; }
        public string? qty { get; set; }
        public string? invoiceNo { get; set; }
        public string? date { get; set; }
        public string? amount { get; set; }
    }
}

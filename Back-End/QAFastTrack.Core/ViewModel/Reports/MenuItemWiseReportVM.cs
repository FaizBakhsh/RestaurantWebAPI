using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Core.ViewModel.Reports
{
    public class MenuItemWiseReportVM:BaseViewModel
    {
        public string? itemName { get; set; }
        public string? qty { get; set; }
        public string? price { get; set; }
        public string? grossSale { get; set; }
        public string? discount { get; set; }
        public string? gst { get; set; }
        public string? netSale { get; set; }
        public string? size { get; set; }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Core.ViewModel.Reports
{
    public class RawItemVM:BaseViewModel
    {
        public string? name { get; set; }
        public string? uom { get; set; }
        public string? price { get; set; }
        public string? min { get; set; }
        public string? max { get; set; }
        public string? difference { get; set; }
    }
}

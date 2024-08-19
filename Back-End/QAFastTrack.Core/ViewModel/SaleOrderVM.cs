using Restaurant.Core.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Core.ViewModel
{
    public class SaleOrderVM:BaseViewModel
    {
        public string? date  { get; set; }
        public string? billType { get; set; }
        public string? customer { get; set; }
        public string? cashOutTime { get; set; }
        public string? terminal { get; set; }
        public string? amount { get; set; }
        public string? gst { get; set; }
        public string? discount { get; set; }
        public string? netAmount { get; set; }
        public string? billNo { get; set; }
    }
}

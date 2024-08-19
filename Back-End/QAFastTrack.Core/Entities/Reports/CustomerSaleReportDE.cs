using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Core.Entities.Reports
{
    public class CustomerSaleReportDE:BaseDomain
    {
        public CustomerSaleReportDE()
        {
            Sales = new List<SaleOrderDE> ();
        }
        public string? Name { get; set; }
        public List<SaleOrderDE> Sales { get; set; }
    }
}

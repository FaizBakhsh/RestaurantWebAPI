using Restaurant.Core.Enums;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Core.Entities.Acc
{
    public class FiscalYearDE : BaseDomain
    {  
        public string? YearCode { get; set; }
        public string? YearDesc { get; set; }
        public DateTime YearDateFrom { get; set; }
        public DateTime YearDateTo { get; set; }
        public Boolean IsActiveYear { get; set; }
    }
}

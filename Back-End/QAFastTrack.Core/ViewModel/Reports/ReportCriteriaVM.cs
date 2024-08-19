using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Core.ViewModel.Reports
{
    public class ReportCriteriaVM
    {
        public string? ReportCriteria { get; set; }
        public DateTime From { get; set; }
        public DateTime To { get; set; }
        public DateTime Date { get; set; }
    }
}

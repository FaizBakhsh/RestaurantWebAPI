using Microsoft.EntityFrameworkCore.Metadata.Internal;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Core.ViewModel.Reports
{
    public class HourlySaleReportVM 
    {
        public HourlySaleReportVM()
        {
            ReportCriteria = new ReportCriteriaVM();
            ReportLines = new List<HourlySaleReportLineVM>();
        }
        public ReportCriteriaVM ReportCriteria { get; set; }
        public List<HourlySaleReportLineVM> ReportLines { get; set; }
    }

    public class HourlySaleReportLineVM
    {
        public int SrNo { get; set; }

        public TimeSpan time { get; set; }
        public string? timeStr { get; set; }

        public float amount { get; set; }
        public string? amountStr { get { return amount.ToString(); } set { } }
    }
}

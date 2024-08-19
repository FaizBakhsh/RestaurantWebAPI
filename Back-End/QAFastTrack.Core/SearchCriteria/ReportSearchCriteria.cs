using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Core.SearchCriteria
{
    public class ReportSearchCriteria: BaseSearchCriteria
    {
        public string? UserId { get; set; }
        public int RefundTypeId { get; set; }
        public int ShiftId { get; set; }
        public int DiscountKeyId { get; set; }
        public bool IncludeComplimentary { get; set; }
    }
}

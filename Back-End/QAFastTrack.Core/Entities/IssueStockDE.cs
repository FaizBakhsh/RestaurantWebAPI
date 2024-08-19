using Restaurant.Core.Enums;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Core.Entities
{
    public class IssueStockDE : BaseDomain
    {
        #region Class Properties
        public int IssuingBranchId { get; set; }
        public int ReceivingBranchId { get; set; }
        public DateTime IssueDate { get; set; }
        public int CategoryId { get; set; }
        public string? Keyword { get; set; }

        #region views properties
        public string? IssuingBranch { get; set; }
        public string? ReceivingBranch { get; set; }
        public string? Category { get; set; }
        #endregion

        #endregion
    }
}

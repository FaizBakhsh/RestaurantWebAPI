using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Core.Entities
{
    public class BranchDE:BaseDomain
    {
        #region properties
        public string? Name { get; set; }
        public int? ChartAccountId { get; set; }
        public int? BranchId { get; set; }
        public string? BranchCode { get; set; }
        public bool? UploadStatus { get; set; }
        public string? Location { get; set; }
        public string? Type { get; set; }
        public int BranchEnumTypeId { get; set; }
        #endregion
        #region constructor
        public BranchDE()
        {
            Name = null;
        }
        #endregion
    }
}

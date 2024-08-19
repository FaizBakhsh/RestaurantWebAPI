using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Core.Entities
{
    public class DemandDE:BaseDomain
    {
        #region Properties
        public int BranchId { get; set; }
        public int? ItemId { get; set; }
        public string? Item { get; set; }
        public DateTime Date { get; set; }
        public string? Branch { get; set; }
        #endregion
    }
}

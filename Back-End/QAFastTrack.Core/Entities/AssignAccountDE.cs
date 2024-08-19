using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Core.Entities
{
    public class AssignAccountDE:BaseDomain
    {
        #region Properties
        public int AccountTypeId { get; set; }
        public int AccountId { get; set; }
        public int BranchId { get; set; }
        public string? AccountType { get; set; }
        public string? Account { get; set; }
        public string? Branch { get; set; }
        #endregion
    }
}

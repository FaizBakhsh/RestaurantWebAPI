using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Core.Entities
{
    public class AccountCodeDE:BaseDomain
    {
        #region Properties
        public int AccountTypeId { get; set; }
        public string? Code { get; set; }
        public string? AccountType { get; set; }
        #endregion
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Core.Entities
{
    public class RiderDE:BaseDomain
    {
        #region Properties
        public string? Name { get; set; }
        public string? PhoneNo { get; set; }
        public string? Email { get; set; }
        #endregion
        #region Constructor
        public RiderDE()
        {
            Name= null;
            PhoneNo= null;
            Email= null;
        }
        #endregion
    }
}
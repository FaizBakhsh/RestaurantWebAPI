using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Core.Entities
{
    public class SubItemDE:BaseDomain
    {
        #region Properties
        public string? Name { get; set; }
        #endregion
        #region Constructor
        public SubItemDE()
        {
            Name = null;
        }
        #endregion
    }
}

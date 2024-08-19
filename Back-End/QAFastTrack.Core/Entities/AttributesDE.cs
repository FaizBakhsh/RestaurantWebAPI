using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Core.Entities
{
    public class AttributesDE:BaseDomain
    {
        #region Properties
        public string? Name { get; set; }
        public string? Description { get; set; }
        #endregion
    }
}

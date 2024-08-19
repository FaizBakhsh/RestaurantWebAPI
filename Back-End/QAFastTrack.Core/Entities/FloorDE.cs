using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Core.Entities
{
    public class FloorDE:BaseDomain
    {
        #region properties
        public String? Name { get; set; }
        public List<TableDE> Tables { get; set; }
        #endregion
        #region constructor
        public FloorDE()
        {
            Tables = new List<TableDE>();
            Name = null;
        }
        #endregion
    }
}

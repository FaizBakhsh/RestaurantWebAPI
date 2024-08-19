using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Core.Entities
{
    public class DiscountKeyDE:BaseDomain
    {
        #region properties
        public String? DiscountKey { get; set; }
        public int Value { get; set; }
        public int DiscLimit { get; set; }
        #endregion
        #region constructor      
        public DiscountKeyDE()
        {
            DiscountKey = null;
        }
        #endregion
    }
}

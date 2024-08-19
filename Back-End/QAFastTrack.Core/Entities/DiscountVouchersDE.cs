using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Core.Entities
{
    public class DiscountVouchersDE : BaseDomain
    {
        #region properties  
        public String? KeyValue { get; set; }
        public int Value { get; set; }
        #endregion
        #region constructor
        public DiscountVouchersDE() 
        {
            KeyValue = null;
        }
        #endregion
    }
}

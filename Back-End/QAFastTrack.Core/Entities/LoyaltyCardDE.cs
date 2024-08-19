using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Core.Entities
{
    public class LoyaltyCardDE:BaseDomain
    {
        #region Properties
        public string? CardNo { get; set; }
        public string? DiscountPercentage { get; set; }
        public string? Name { get; set; }
        public string? PhoneNo { get; set; }
        #endregion
        #region Constructor
        public LoyaltyCardDE()
        {
            CardNo = null;
            DiscountPercentage = null;
            Name = null;
            PhoneNo = null;
        }
        #endregion
    }
}

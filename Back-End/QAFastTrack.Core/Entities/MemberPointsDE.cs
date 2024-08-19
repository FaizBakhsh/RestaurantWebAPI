using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Core.Entities
{
    public class MemberPointsDE:BaseDomain
    {
        #region Properties
        public int? MinSale { get; set; }
        public int? MaxSale { get; set; }
        public float? Points { get; set; }
        #endregion
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Core.Entities
{
    public class KOTSettingDE:BaseDomain
    {
        #region Properties
        public int? PrinterId { get; set; }
        public Boolean? KitchenBell { get; set; }
        public string? KDSName { get; set; }
        public string? Printer { get; set; }
        #endregion
        #region Contructor
        public KOTSettingDE()
        {
            KDSName = null;
        }
        #endregion
    }
}

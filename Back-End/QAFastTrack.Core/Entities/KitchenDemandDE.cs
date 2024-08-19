using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Core.Entities
{
    public class KitchenDemandDE:BaseDomain
    {
        #region Properties
        public int CategoryId { get; set; }
        public int KitchenId { get; set; }
        public string? Item { get; set; }
        public int DemandNo { get; set; }
        public DateTime Date { get; set; }
        #endregion
        #region Constructor
        public KitchenDemandDE()
        {
            this.Item = null;
        }
        #endregion
    }
}

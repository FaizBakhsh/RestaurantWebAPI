using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Core.Entities
{
    public class StockEstimationDE:BaseDomain
    {
        #region Properties
        public int GroupId { get; set; }
        public string? Item { get; set; }
        public int OrderNo { get; set; }
        public DateTime Date { get; set; }
        #endregion
        #region Constructor
        public StockEstimationDE()
        {
            this.Item = null;
        }
        #endregion
    }
}

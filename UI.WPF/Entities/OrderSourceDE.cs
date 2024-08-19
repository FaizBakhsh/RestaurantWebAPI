using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Core.Entities
{
    public class OrderSourceDE:BaseDomain
    {
        #region Properties
        public string? Name { get; set; }
        public float? PriceIncreament { get; set; }
        public bool? PrintInvoice { get; set; }
        #endregion
        #region Constructor
        public OrderSourceDE()
        {
            Name = null;
            PrintInvoice = false;
        }
        #endregion
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Core.Entities
{
    public class DeliveryPriceDE:BaseDomain
    {
        #region Properties
        public int ItemId { get; set; }
        public int SizeId { get; set; }
        public float Price { get; set; }
        public string? Item { get; set; }
        public string? Size { get; set; }
        #endregion
    }
}

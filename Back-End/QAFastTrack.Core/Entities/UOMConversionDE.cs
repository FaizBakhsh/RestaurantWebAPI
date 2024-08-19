using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Core.Entities
{
    public class UOMConversionDE:BaseDomain
    {
        #region Properties
        public int UOMId { get; set; }
        public int? ConvertedUOMId { get; set; }
        public int? QTY { get; set; }
        public string? ConversionRate { get; set; }
        public string? UOM { get; set; }
        public string? ConvertedUOM { get; set; }

        #endregion
        #region Constructor
        public UOMConversionDE()
        {
            ConversionRate = null;
        }
        #endregion
    }
}

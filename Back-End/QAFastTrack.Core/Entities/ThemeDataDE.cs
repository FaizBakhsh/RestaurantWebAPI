using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Core.Entities
{
    public class ThemeDataDE : BaseDomain
    {
        #region Properties
        public string? Source { get; set; }
        #endregion
        #region Constructor
        public ThemeDataDE()
        {
            Source = null;
        }
        #endregion
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Core.Entities
{
    public class SubCategoryDE : BaseDomain
    {
        #region Properties
        public int CategoryId { get; set; }
        public string? SubCategoryName { get; set; }
        public List<ItemDE> Items { get; set; }
        #endregion
        #region Constructor
        public SubCategoryDE()
        {
            this.Items = new List<ItemDE>();
            SubCategoryName = null;
        }
        #endregion
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Core.Entities
{
    public class CategoryDE:BaseDomain
    {
        #region properties
        public string? CategoryName { get; set; }
        public List<SubCategoryDE> SubCategories { get; set; }
        #endregion
        #region constructor
        public CategoryDE()
        {
            CategoryName = null;
            SubCategories = new List<SubCategoryDE>();
        }
        #endregion
    }
}

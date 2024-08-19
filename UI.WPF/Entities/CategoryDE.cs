using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Core.Entities
{
    public class CategoryDE:BaseDomain
    {
        public string? CategoryName { get; set; }
        public List<SubCategoryDE> SubCategories { get; set; }
        public CategoryDE()
        {
           SubCategories = new List<SubCategoryDE>();  
        }
    }
}

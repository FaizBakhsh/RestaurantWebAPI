using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Core.Entities
{
    public class SubCategoryDE : BaseDomain
    {
        public int CategoryId { get; set; }
        public string? SubCategoryName { get; set; }
        public List<ItemDE> Items { get; set; }
        public SubCategoryDE()
        {
            this.Items = new List<ItemDE>();
        }
    }
}

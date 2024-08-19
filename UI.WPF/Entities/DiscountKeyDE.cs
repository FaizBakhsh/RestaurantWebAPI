using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Core.Entities
{
    public class DiscountKeyDE:BaseDomain
    {
        public String? DiscountKey { get; set; }
        public int Value { get; set; }
    }
}

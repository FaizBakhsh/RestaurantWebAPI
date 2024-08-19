using Restaurant.Core.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.WPF.Entities
{
    public class DiscountVouchersDE : BaseDomain
    {
        public String? KeyValue { get; set; }
        public int Value { get; set; }
    }
}

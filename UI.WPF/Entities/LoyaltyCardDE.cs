using Restaurant.Core.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.WPF.Entities
{
    public class LoyaltyCardDE:BaseDomain
    {
        public string? CardNo { get; set; }
        public string? Name { get; set; }
        public string? PhoneNo { get; set; }
        public string? DiscountPercentage { get; set; }
    }
}

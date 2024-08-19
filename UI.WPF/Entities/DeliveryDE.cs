using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Core.Entities
{
    public class DeliveryDE:BaseDomain
    {
        public int SourceId { get; set; }
        public String? Source { get; set; }
        public String? PhoneNo { get; set; }
        public String? Address { get; set; }
        public String? Note { get; set; }
        public String? Name { get; set; }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Core.Entities
{
    public class DineInDE:BaseDomain
    {
        public int ResId { get; set; }
        public int WaiterId { get; set; }
        public String? Waiter { get; set; }
        public int TableNo { get; set; }
        public String? Guest { get; set; }
      
    }
}

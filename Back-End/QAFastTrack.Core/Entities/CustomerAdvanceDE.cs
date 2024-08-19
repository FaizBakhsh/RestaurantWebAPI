using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Core.Entities
{
    public class CustomerAdvanceDE:BaseDomain
    {
        public int CustId { get; set; }
        public float AdvAmount { get; set; }
        public DateTime AdvDate { get; set; }
    }
}

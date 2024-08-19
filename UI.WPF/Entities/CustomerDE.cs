using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Core.Entities
{
    public class CustomerDE:BaseDomain
    {
        public int BranchId { get; set; }
        public string? BranchName { get; set; }
        public string? Name { get; set; }
        public string? Email { get; set; }
        public String? Phone { get; set; }
        public string? CNIC { get; set; }
        public string? City { get; set; }
        public String? Address { get; set; }
    }
}

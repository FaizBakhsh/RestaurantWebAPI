using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Core.Entities
{
    public class EmployeeDE:BaseDomain
    {
        public int BranchId { get; set; }
        public String? BranchName { get; set; }
        public String? Name { get; set; }
        public String? Phone { get; set; }
        public String? Designation { get; set; }
        public DateTime? JoiningDate { get; set; }
    }
}

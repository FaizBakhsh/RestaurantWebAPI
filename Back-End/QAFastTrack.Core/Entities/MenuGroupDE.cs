using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Core.Entities
{
    public class MenuGroupDE:BaseDomain
    {
        public string? Name { get; set; }
        public string? Description { get; set; }
        public bool IsPrintKitchen { get; set; }
        public int  BranchId { get; set; }
        public string? Branch { get; set; }
        public string? SubGroup { get; set; }
    }
}

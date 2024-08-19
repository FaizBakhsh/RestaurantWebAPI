using Restaurant.Core.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.WPF.Entities
{
    public class StaffDE:BaseDomain
    {
        public string? Name { get; set; }
        public string? FatherName { get; set; }
        public int TypeId { get; set; }
    }
}

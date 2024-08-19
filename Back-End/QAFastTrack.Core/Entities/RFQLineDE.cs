using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Core.Entities
{
    public class RFQLineDE: BaseDomain
    {
        public int RFQId { get; set; }
        public int ItemId { get; set; } 
        public string? Item{ get; set; }
        public string? Type { get; set; }
        public string? Group { get; set; }
        public string? Category { get; set; }
    }
} 

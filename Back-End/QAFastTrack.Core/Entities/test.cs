using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Core.Entities
{
    public class test:BaseDomain
    {
        public DateTime Date { get; set; }

        public int UserId { get; set; }

        public string? User { get; set; }

        public string? AttendanceDetails { get; set; }

        public string? TotalWorkedHours { get; set; }
    }
}

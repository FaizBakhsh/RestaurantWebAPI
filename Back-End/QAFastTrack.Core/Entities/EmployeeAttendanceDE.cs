using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Core.Entities
{
    public class EmployeeAttendanceDE:BaseDomain
    {
        #region Properties
        public int EmployeeId { get; set; }
        public int Days { get; set; }
        public DateTime Month { get; set; }
        public string? Employee { get; set; }
        #endregion
    }
}

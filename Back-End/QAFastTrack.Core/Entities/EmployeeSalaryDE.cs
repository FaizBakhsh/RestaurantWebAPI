using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Core.Entities
{
    public class EmployeeSalaryDE:BaseDomain
    {
        #region Properties
        public int? EmployeeId { get; set; }
        public int Amount { get; set; }
        public DateTime? Date { get; set; }
        public string? Employee { get; set; }
        #endregion
    }
}

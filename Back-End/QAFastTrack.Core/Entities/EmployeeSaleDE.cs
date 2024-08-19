using Restaurant.Core.Enums;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Core.Entities
{
    public class EmployeeSaleDE:BaseDomain
    {
        #region properties
        public int EmployeeId { get; set; }
        public Double Amount { get; set; }
        public DateTime Date { get; set; }
        #endregion
        #region view properties
        public string? Employee { get; set; }
        #endregion
    }
}

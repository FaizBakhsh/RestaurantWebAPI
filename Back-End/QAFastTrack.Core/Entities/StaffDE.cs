using Restaurant.Core.Enums;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Core.Entities
{
    public class StaffDE : BaseDomain
    {
        #region Properties
        public string? Name { get; set; }
        public string? FatherName { get; set; }
        public int TypeId { get; set; }
        #endregion
        #region view properties
        public string? Type { get; set; }
        #endregion
    }
}

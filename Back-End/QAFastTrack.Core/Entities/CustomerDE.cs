using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Core.Entities
{
    public class CustomerDE:BaseDomain
    {
        #region Properties
        public int? BranchId { get; set; }
        public int? AccId { get; set; }
        public string? BranchName { get; set; }
        public string? Name { get; set; }
        public string? Email { get; set; }
        public string? Phone { get; set; }
        public string? CNIC { get; set; }
        public string? City { get; set; }
        public string? Address { get; set; }
        public string? Account { get; set; }
        #endregion
        #region Constructor
        public CustomerDE()
        {
            BranchName = null;
            Name = null;
            Email = null;
            Phone = null;
            City = null;
            CNIC = null;
            City = null;
            Address = null;
        }
        #endregion
    }
}

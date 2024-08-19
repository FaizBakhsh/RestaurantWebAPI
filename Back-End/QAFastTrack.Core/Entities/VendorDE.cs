using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Core.Entities
{
    public class VendorDE : BaseDomain
    {
        #region Properties
        public string? Name { get; set; }
        public string? City { get; set; }
        public string? Area { get; set; }
        public int? AccountId { get; set; }
        public string? Email { get; set; }
        public string? Phone { get; set; }
        public string? CNIC { get; set; }
        public string? Code { get; set; }
        public string? Address { get; set; }
        #endregion
        #region Constructors
        public VendorDE()
        {
            Name = null;
            Email = null;
            Phone = null;
            CNIC = null;
            City = null;
            Address = null;
            Area = null;
            Code = null;
        }
        #endregion
    }
}

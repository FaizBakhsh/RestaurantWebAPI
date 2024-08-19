using Restaurant.Core.Extenstions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Core.Entities
{
    public class CompanyInfoDE:BaseDomain
    {
        #region Properties
        public string? Name { get; set; }
        public string? PhoneNo { get; set; }
        public string? Address { get; set; }
        public string? BillNote { get; set; }
        public string? LogoBase64Path { get; set; }
        public string? Logo => LogoBase64Path?.ToBase64ImageString ();
        #endregion
        #region Constructor
        public CompanyInfoDE()
        {
            Name =null;
            PhoneNo =null;
            Address =null;
            BillNote =null;
            LogoBase64Path =null;
        }
        #endregion
    }
}

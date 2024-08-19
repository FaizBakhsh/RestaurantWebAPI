using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Core.Entities.Security
{
    public class OnlineDBSettingDE:BaseDomain
    {
        #region Properties
        public string? DataBaseName { get; set; }
        public string? ServerName { get; set; }
        public string? UserName { get; set; }
        public string? Password { get; set; }
        #endregion
        #region Constructor
        public OnlineDBSettingDE()
        {
            DataBaseName = null;
            ServerName = null;
            UserName = null;
            Password = null;
        }
        #endregion
    }
}

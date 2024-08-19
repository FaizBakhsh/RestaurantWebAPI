using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Core.Entities
{
    public class DeviceSettingDE:BaseDomain
    {
        #region Properties
        public int? DeviceId { get; set; }
        public int? ScreenNo { get; set; }
        public string? Terminal { get; set; }
        public string? Device { get; set; }
        public bool IsEnable { get; set; }
        #endregion
        #region Contructor
        public DeviceSettingDE()
        {
            Terminal = null;
        }
        #endregion
    }
}

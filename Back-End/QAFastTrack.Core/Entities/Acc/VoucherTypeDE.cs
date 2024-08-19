using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Core.Entities.Acc
{
    public class VoucherTypeDE : BaseDomain
    {
        #region Properties

        public string? VchTypeCode { get; set; }
        public string? VchTypeDesc { get; set; }
        public int VchTypeId { get; set; }
        public string? VchTypeRemarks { get; set; }
        public bool VchChq { get; set; }
        public string? VchPostStage { get; set; }
        public bool IsAutoPosted { get; set; }

        #endregion
        #region View Properties

        public string? VchType { get; set; }

        #endregion
    }
}

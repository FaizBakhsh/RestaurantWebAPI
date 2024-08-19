using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Core.Entities.Acc
{
    public class VoucherDetailDE : BaseDomain
    {
        #region Properties

        public int VchId { get; set; }
        public int CoaId { get; set; }
        public string? VchChqNo { get; set; }
        public DateTime VchChqDate { get; set; }
        public decimal VchDebitAmt { get; set; }
        public decimal VchCreditAmt { get; set; }
        public string? VchNarration { get; set; }

        #endregion
        #region Views Properties
        public string? CoaCode { get; set; }
        public string? CoaDesc { get; set; }

        #endregion
    }
}

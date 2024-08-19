using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Core.Entities.Acc
{
    public class VoucherDE : BaseDomain
    {
        #region Contructor
        public VoucherDE ( )
        {
            VoucherDetails = new List<VoucherDetailDE> ();
        }
        #endregion
        #region Properties
        public int StatusId { get; set; }
        public int ApprovalStatusId { get; set; }
        public int VchTypeId { get; set; }
        public string? VchKey { get; set; }
        public string? VchNo { get; set; }
        public string? VchMonth { get; set; }
        public DateTime? VchDate { get; set; }
        public string? VchPaidTo { get; set; }
        public string? VchNarration { get; set; }
        public bool IsPosted { get; set; }
        public List<VoucherDetailDE> VoucherDetails { get; set; }
        #endregion
        #region Views Properties

        public string? VchType { get; set; }
        public string? ApprovalStatus { get; set; }
        public string? Status { get; set; }
        public int VchYearId { get; set; }
        public string? VchYear { get; set; }

        #endregion
    }
}

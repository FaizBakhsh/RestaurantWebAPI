using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Core.Entities
{
    public class RFQDE : BaseDomain
    {
        #region Constructor 
        public RFQDE()
        {
            RFQLines = new List<RFQLineDE>();
        }
        #endregion
        public bool IsReference { get; set; }
        public string? Title { get; set; }
        public DateTime RFQValidity { get; set; } 
        public int RequestNoteNo { get; set; }
        public DateTime DeliveryDate { get; set; }
        public int? StatusId { get; set; }
        public string? Description { get; set; }
        public List<RFQLineDE> RFQLines { get; set; }

        public string? Status { get; set; }
    }
}

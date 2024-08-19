using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Collections.Generic;

namespace Restaurant.Core.Entities
{
    public class RNDE : BaseDomain
    {
        #region Constructor
        public RNDE()
        {
            RNLines = new List<RNLineDE>();
        }
        #endregion
        public string? Title { get; set; }
        public DateTime RequiredBefore { get; set; }
        public int TypeId { get; set; }
        public int CategoryId { get; set; }
        public string? Reason { get; set; }
        public int? RequesterTypeId { get; set; }
        public string? Requester { get; set; }
        public int? StatusId { get; set; }

        public string? Description { get; set; }

        public List<RNLineDE> RNLines { get; set; }

        #region View Properties

        public string? Status { get; set; }
        public string? RequesterType { get; set; }
  
        public string? Category { get; set; }
        public string? Type { get; set; }

        #endregion
    }
}

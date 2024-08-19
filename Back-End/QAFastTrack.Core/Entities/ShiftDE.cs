using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Core.Entities
{
    public class ShiftDE : BaseDomain
    {
        #region Constructor
        public ShiftDE ( )
        {
            Role = null;
            ModifiedOn = new DateTime ();
        }
        #endregion
        #region Properties
        public int ShiftTypeId { get; set; }
        public int ShiftStatusId { get; set; }
        public int TerminalId { get; set; }
        public int DayId { get; set; }
        public string? FloatingCash { get; set; }
        public string? ShiftStartUserId { get; set; }
        public string? ShiftEndUserId { get; set; }
        public string? ShiftEndCash { get; set; }
        public string? StartTime { get; set; }
        public string? EndTime { get; set; }
        #endregion
        #region View Properties
        public string? ShiftStartUser { get; set; }
        public string? ShiftStatus { get; set; }
        public string? Terminal { get; set; }
        public string? ShiftEndUser { get; set; }
        public DateTime SaleDate { get; set; }
        public string? Role { get; set; }
        public string? ShiftType { get; set; }
        public DateTime? From { get; set; }
        public DateTime? To { get; set; }
        public DateTime? Date { get; set; }
        #endregion
    }
}

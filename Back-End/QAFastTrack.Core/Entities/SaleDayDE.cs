using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Core.Entities
{
    public class SaleDayDE:BaseDomain
    {
        #region Properties
        public DateTime Date { get; set; }
        public string? StartUserId { get; set; }
        public string? EndUserId { get; set; }
        public int DayStatusId { get; set; }
        public string? DayStatus { get; set; }
        public int TerminalId { get; set; }
        public string? Terminal { get; set; }
        public int BranchId { get; set; }
        public string? EndUser { get; set; }
        public string? StartUser { get; set; }
        public string? Barnch { get; set; }
        #endregion
    }
}

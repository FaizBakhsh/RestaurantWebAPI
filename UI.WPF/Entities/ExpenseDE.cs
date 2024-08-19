using Restaurant.Core.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.WPF.Entities
{
    public class ExpenseDE : BaseDomain
    {
        public string? UserId { get; set; }
        public string? Name { get; set; }
        public string? UserName { get; set; }
        public int SupplierId { get; set; }
        public string? SupplierName { get; set; }
        public int TerminalId { get; set; }
        public int ShiftId { get; set; }
        public int DayId { get; set; }
        public string? Terminal { get; set; }
        public int? Amount { get; set; }
        public DateTime Date { get; set; }
        public string? Comments { get; set; }
        public int SourceId { get; set; }
        public string? Source { get; set; }
    }
}

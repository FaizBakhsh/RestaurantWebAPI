using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Core.Entities
{
    public class LogEventDE:BaseDomain
    {
        #region Properties
        public string? UserId { get; set; }
        public int ActionId { get; set; }
        public string? Message { get; set; }
        public DateTime Date { get; set; }
        public string? Time { get; set; }
        public string? User { get; set; }
        public string? Action { get; set; }
        public DateTime? From { get; set; }
        public DateTime? To { get; set; }
        #endregion
    }
}

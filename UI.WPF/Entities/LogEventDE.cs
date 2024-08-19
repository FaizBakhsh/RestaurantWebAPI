using Restaurant.Core.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.WPF.Entities
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
        #endregion
    }
}

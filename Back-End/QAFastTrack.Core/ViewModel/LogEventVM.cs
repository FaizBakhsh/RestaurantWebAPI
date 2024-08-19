using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Core.ViewModel
{
    public class LogEventVM:BaseViewModel
    {
        public string? Period { get; set; }
        public string? UserId { get; set; }
        public int ActionId { get; set; }
        public string? message { get; set; }
        public string? date { get; set; }
        public string? Time { get; set; }
        public string? user { get; set; }
        public string? Action { get; set; }
        public DateTime? From { get; set; }
        public DateTime? To { get; set; }
    }
}

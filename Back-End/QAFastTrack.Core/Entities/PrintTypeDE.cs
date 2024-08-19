using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Core.Entities
{
    public class PrintTypeDE:BaseDomain
    {
        #region Properties
        public int? PrinterId { get; set; }
        public int? TypeId { get; set; }
        public string? Terminal { get; set; }
        public string? Printer { get; set; }
        public string? Type { get; set; }
        #endregion
        #region Contructor
        public PrintTypeDE()
        {
            Terminal = null;
        }
        #endregion
    }
}

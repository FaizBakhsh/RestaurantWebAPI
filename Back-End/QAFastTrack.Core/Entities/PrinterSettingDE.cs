using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Core.Entities
{
    public class PrinterSettingDE:BaseDomain
    {
        #region Properties
        public int? PrinterId { get; set; }
        public int? CategoryId { get; set; }
        public int? SubCategoryId { get; set; }
        public int? NoofPrints { get; set; }
        public string? Printer { get; set; }
        public string? Category { get; set; }
        public string? SubCategory { get; set; }
        #endregion
    }
}

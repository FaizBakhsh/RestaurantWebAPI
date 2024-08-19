using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Core.Entities
{
    public class AttachSubItemDE:BaseDomain
    {
        #region Properties
        public int GroupId { get; set; }
        public int ItemId { get; set; }
        public int SizeId { get; set; }
        public int ModifierId { get; set; }
        public int SubItemId { get; set; }
        public int Qty { get; set; }
        public string? Group { get; set; }
        public string? Item { get; set; }
        public string? SubItem { get; set; }
        public string? Modifier { get; set; }
        public string? Size { get; set; }
        #endregion
    }
}

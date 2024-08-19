using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Core.Entities
{
    public class InventoryTransferDE:BaseDomain
    {
        #region Properties
        public int BranchId { get; set; }
        public string? KeyWord { get; set; }
        public DateTime Date { get; set; }
        public string? Branch { get; set; }
        #endregion
        #region Constructor
        public InventoryTransferDE()
        {
            this.KeyWord = null;
        }
        #endregion
    }
}

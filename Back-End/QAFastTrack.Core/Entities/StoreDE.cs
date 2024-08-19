using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Core.Entities
{
    public class StoreDE:BaseDomain
    {
        #region Properties
        public int BranchId { get; set; }
        public string? StoreName { get; set; }
        public string? StoreCode { get; set; }
        public bool? UploadStatus { get; set; }
        public string? Branch { get; set; }
        #endregion
        #region Constructor
        public StoreDE()
        {
            StoreName = null;
            StoreCode = null;
        }
        #endregion
    }
}

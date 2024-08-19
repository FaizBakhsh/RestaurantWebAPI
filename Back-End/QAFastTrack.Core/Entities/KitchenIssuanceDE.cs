using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Core.Entities
{
    public class KitchenIssuanceDE:BaseDomain
    {
        #region Properties
        public int StoreId { get; set; }
        public int BranchId { get; set; }
        public int KitchenId { get; set; }
        public string? KeyWord { get; set; }
        public DateTime Date { get; set; }
        #region View Properties
        public string? Branch { get; set; }
        public string? Store { get; set; }
        public string? Kitchen { get; set; }
        #endregion
        #endregion
    }
}

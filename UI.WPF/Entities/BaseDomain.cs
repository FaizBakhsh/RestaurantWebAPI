using Restaurant.Core.Entities;

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Core.Entities
{
    public abstract class BaseDomain  
    {
        #region Constructors
        public BaseDomain ( )
        {
            this.CreatedOn = DateTime.Now;
            ModifiedOn = DateTime.Now;
            this.IsActive = true;
        }
        #endregion
        #region Class Properties
        public int Id { get; set; }
        public int ClientId { get; set; }
        public bool IsActive { get; set; }
        public int CreatedById { get; set; }
        public int DBoperation { get; set; }
        public DateTime? CreatedOn { get; set; }
        public int ModifiedById { get; set; }
        public DateTime ModifiedOn { get; set; }
        public string? ReportName { get; set; }
        #endregion
    }
}

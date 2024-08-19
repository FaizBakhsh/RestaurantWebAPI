using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Core.Entities
{
    public class DeliveryDE:BaseDomain
    {
        #region properties
        public int SourceId { get; set; }
        public String? Source { get; set; }
        public String? PhoneNo { get; set; }
        public String? Address { get; set; }
        public String? Note { get; set; }
        public String? Name { get; set; }
        #endregion
        #region constructor
        public DeliveryDE() 
        {
            Source = null;
            PhoneNo = null;
            Address= null;
            Note = null;
            Name = null;
        }
        #endregion
    }
}

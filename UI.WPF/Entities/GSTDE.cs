using Restaurant.Core.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.WPF.Entities
{
        public class GSTDE : BaseDomain
        {
            #region Properties
            public int? GST { get; set; }
            public string? ReceiptTitle { get; set; }
            public int? PaymentTypeId { get; set; }
            public string? PaymentType { get; set; }
            #endregion
            #region Constructor
            public GSTDE()
            {
                ReceiptTitle = null;
            }
            #endregion
        }
}

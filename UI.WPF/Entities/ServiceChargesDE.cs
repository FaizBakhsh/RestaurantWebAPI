using Restaurant.Core.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.WPF.Entities
{
    public class ServiceChargesDE:BaseDomain
    {
        #region Properties
        public int OrderTypeId { get; set; }
        public string? OrderType { get; set; }
        public int PaymentTypeId { get; set; }
        public string? PaymentType { get; set; }
        public string? Name { get; set; }
        public string? Description { get; set; }
        public double Percentage { get; set; }
        #endregion
    }
}

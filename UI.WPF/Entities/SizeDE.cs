using Restaurant.Core.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.WPF.Entities
{
    public class SizeDE:BaseDomain
    {
        #region Properties
        public int? GroupId { get; set; }
        public int ItemId { get; set; }
        public string? KDSId { get; set; }
        public string? SizeName { get; set; }
        public float? Price { get; set; }
        public float? ActualPrice { get; set; }
        public float? Tax { get; set; }
        public float? Cost { get; set; }
        public float? SuggestedPrice { get; set; }
        public float? CurrentMargin { get; set; }
        public float? SuggestedMargin { get; set; }
        public string? KDS { get; set; }
        public string? Item { get; set; }
        public string? Group { get; set; }
        public string? ItemCode { get; set; }
        public int Qty { get; set; }
        public int AttribId { get; set; }
        public int AttribValId { get; set; }
        public string? Attribute { get; set; }
        public string? AttributeValue { get; set; }
        public float? ItemActualPrice { get; set; }
        public bool OptionalModifier { get; set; }
        #endregion
        public SizeDE()
        {
            this.Qty = 1;
        }
    }
}

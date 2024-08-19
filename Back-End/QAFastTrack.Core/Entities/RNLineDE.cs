using System.ComponentModel.DataAnnotations;

namespace Restaurant.Core.Entities
{
    public class RNLineDE : BaseDomain
    {
        public int RNId { get; set; }
        public int ItemId { get; set; }
        public int RequestedQty { get; set; }
        public string? Item { get; set; }
        public string? UOM { get; set; }
    }
}

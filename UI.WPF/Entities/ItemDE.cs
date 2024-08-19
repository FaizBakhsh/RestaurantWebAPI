using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Core.Entities
{
    public class ItemDE : BaseDomain
    {
        #region properties
        public int GroupId { get; set; }
        public int MenuItemId { get; set; }
        public int BranchId { get; set; }
        public int BrandId { get; set; }
        public int SupplierId { get; set; }
        public int SizeId { get; set; }
        public int StoreId { get; set; }
        public int ColorId { get; set; }
        public int FontColorId { get; set; }
        public int UOMId { get; set; }
        public string? KDSId { get; set; }
        public int CategoryId { get; set; }
        public int SubCategoryId { get; set; }
        public int ItemTypeId { get; set; }
        public string? ItemCode { get; set; }
        public string? ItemName { get; set; }
        public string? FontSize { get; set; }
        public string? Description { get; set; }
        public int Qty { get; set; }
        public float Price { get; set; }
        public float? ActualPrice { get; set; }
        public float? Tax { get; set; }
        public float? ProposedPrice { get; set; }
        public int KDSId2 { get; set; }
        public string? MakingTime { get; set; }
        public string? AlarmTime { get; set; }
        public int TotalItemsAllowed { get; set; }
        public DateTime? StartDate { get; set; }
        public float CurrentMargin { get; set; }
        public float ProposedMargin { get; set; }
        public string? BarCode { get; set; }
        public float Target { get; set; }
        public bool OptionalModifier { get; set; }
        public DateTime? EndDate { get; set; }
        public bool ManualQty { get; set; }
        public int VendorId { get; set; }
        public bool IsCritical { get; set; }
        public string? MinOrderLevel { get; set; }
        public int PackingQty { get; set; }
        public string? MaxOrderLevel { get; set; }
        public string? PackingName { get; set; }
        public int ParentId { get; set; }
        public int StageId { get; set; }
        public int StageQty { get; set; }
        public int TypeId { get; set; }
        public bool IsDealItem { get; set; }
        public string? ImageName { get; set; }
        public string? ImageSize { get; set; }
        public string? Base64FilePath { get; set; }
        public int RModId { get; set; }
        public bool IsRMod { get; set; }
        public int DealId { get; set; }

        #region View Fields
        public string? Group { get; set; }
        public string? MenuItem { get; set; }
        public string? Branch { get; set; }
        public string? Brand { get; set; }
        public string? Supplier { get; set; }
        public string? Size { get; set; }
        public string? Store { get; set; }
        public string? Color { get; set; }
        public string? FontColor { get; set; }
        public string? UOM { get; set; }
        public string? KDS { get; set; }
        public string? Category { get; set; }
        public string? ItemType { get; set; }
        public string? SubCategory { get; set; }
        public string? VendorName { get; set; }
        public string? KDS2 { get; set; }
        public string? DealName { get; set; }
        public string? OrderType { get; set; }
        public string? Stage { get; set; }
        #endregion
        #endregion
        #region constructor      
        public ItemDE()
        {
            this.Qty = 1;
            ItemCode = null;
            ItemName = null;
            FontSize = null;
            Description = null;
            PackingName = null;
            AlarmTime = null;
            MakingTime = null;
            BarCode = null;
            MaxOrderLevel = null;
            MinOrderLevel = null;
            EndDate = null;
            StartDate = null;
        }
        #endregion
    }
}

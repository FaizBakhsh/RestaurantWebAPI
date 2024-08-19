using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Core.Entities
{
    public class RecipeDE:BaseDomain
    {
        #region Properties
        public int? GroupId { get; set; }
        public int? ItemId { get; set; }
        public int? SizeId { get; set; }
        public int? RawItemId { get; set; }
        public int? OrderTypeId { get; set; }
        public int? RecipeTypeId { get; set; }
        public int? EntityId { get; set; }
        public int? RecipeModifierId { get; set; }
        public bool? PrintKitchen { get; set; }
        public bool? AttachRecipe { get; set; }
        public string? ItemEntity { get; set; }
        public string? SubItemEntity { get; set; }
        public string? RecipeModifier { get; set; }
        public string? RecipeType { get; set; }
        public string? UOM { get; set; }
        public int? QTY { get; set; }
        public float? Price { get; set; }
        public float? Amount { get; set; }
        public string? Group { get; set; }
        public string? MenuItem { get; set; }
        public string? RawItem { get; set; }
        public string? Size { get; set; }
        public string? OrderType { get; set; }
        #endregion
        #region Constructor
        public RecipeDE()
        {
            UOM = null;
        }
        #endregion
    }
}

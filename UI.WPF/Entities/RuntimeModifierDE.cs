using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Core.Entities
{
    public class RuntimeModifierDE:BaseDomain
    {
        #region Properties
        public int RawItemId { get; set; }
        public int MenuItemId { get; set; }
        public int TypeId { get; set; }
        public int KDSId { get; set; }
        public int KDS2Id { get; set; }
        public int Qty { get; set; }
        public int StageId { get; set; }
        public int StageQtyAllowed { get; set; }
        public float Price { get; set; }
        public string? ModifierName { get; set; }
        public string? ImageBase64Path { get; set; }
        public string? KDS { get; set; }
        public string? KDS2 { get; set; }
        public string? Type { get; set; }
        public string? RawItem { get; set; }
        public string? MenuItem { get; set; }
        public bool OptionalModifier { get; set; }
        #endregion
    }
}

using Restaurant.Core.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.WPF.Entities
{
    public class ModifierDE:BaseDomain
    {

        #region Class Properties
        public new int? Id { get; set; }
        public int RawItemId { get; set; }
        public int KDSId { get; set; }
        public int KDSId2 { get; set; }
        public string? ModifierName { get; set; }
        public float Price { get; set; }
        public int Qty { get; set; }
        public string? RawItem { get; set; }
        public string? KDS { get; set; }
        public string? KDS2 { get; set; }
        #endregion
    }
}

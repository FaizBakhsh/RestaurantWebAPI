using Restaurant.Core.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.WPF.Entities
{
    public class EnumLineDE:BaseDomain
    {
        #region Properties
        public int? ParentId { get; set; }
        public string? KeyCode { get; set; }
        public bool IsSystemDefined { get; set; }
        public int? EnumTypeId { get; set; }
        public string? Name { get; set; }
        public string? Value { get; set; }
        public string? ParentName { get; set; }
        public string? Description { get; set; }
        public string? SettingType { get; set; }
        #endregion
    }
}

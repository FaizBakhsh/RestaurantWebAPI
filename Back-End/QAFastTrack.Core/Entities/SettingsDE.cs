using System;
using System.Collections.Generic;
using System.Dynamic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Core.Entities
{
    public class SettingsDE:BaseDomain
    {
        #region Constructor
        public SettingsDE ( )
        {
            KeyCode = null;
            Name = null;
            Description = null;
            this.eLFData = new List<ExtraFieldDataDE> ();
            this.ExtraFieldsData = new Object ();
        }
        #endregion
        #region Properties
        public int ModuleId { get; set; }
        public int TypeModuleId { get; set; }
        public string? Module { get; set; }
        public int? ParentId { get; set; }
        public string? KeyCode { get; set; }
        public string? Value { get; set; }
        public int LevelId { get; set; }
        public string? AccountCode { get; set; }
        public bool IsSystemDefined { get; set; }
        public bool UploadStatus { get; set; }
        public int? EnumTypeId { get; set; }
        public string? Name { get; set; }
        public string? ParentName { get; set; }
        public string? Description { get; set; }
        public string? SettingType { get; set; }
        public string? TypeKeyCode { get; set; }
        public int TypeParentId { get; set; }
        public Object ExtraFieldsData { get; set; }
        public string? Level { get; set; }
        public bool ShouldDisplay { get; set; }
        public List<ExtraFieldDataDE> eLFData { get; set; }
        public IDictionary<string, string> d = new Dictionary<string, string>();


        #endregion
    }
}

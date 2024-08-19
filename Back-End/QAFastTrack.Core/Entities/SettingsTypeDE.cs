using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Core.Entities
{
    public class SettingsTypeDE:BaseDomain
    {
        #region Constructor
        public SettingsTypeDE ( )
        {
            KeyCode = null;
            Description = null;
            Name = null;
            this.eLFD = new Object ();
            this.settings = new List<SettingsDE> ();
            this.eLFieldsData = new List<Object> ();
        }
        #endregion
        #region Properties
        public int? ModuleId { get; set; }
        public string? Module { get; set; }
        public int? ParentId { get; set; }
        public string? KeyCode { get; set; }
        public bool IsSystemDefined { get; set; }
        public bool UploadStatus { get; set; }
        public string? Description { get; set; }
        public string? Name { get; set; }
        public string? ParentName { get; set; }
        public int? PParentId { get; set; }
        public bool IsAccountLevel { get; set; }
        public List<SettingsDE> settings { get; set; }
        public List<Object> eLFieldsData { get; set; }
        public Object eLFD { get; set; }
        #endregion
    }
}
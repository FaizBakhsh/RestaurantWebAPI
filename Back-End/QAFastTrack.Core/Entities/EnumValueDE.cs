using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Core.Entities
{
    public class EnumValueDE
    {
        #region properties
        public int Id { get; set; }
        public int EnumTypeId { get; set; }
        public string? Value { get; set; }
        #endregion
        #region constructor
        public EnumValueDE() 
        {
            Value= null;
        }
        #endregion
    }
}

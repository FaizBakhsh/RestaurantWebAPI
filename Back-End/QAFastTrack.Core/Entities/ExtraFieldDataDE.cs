using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Core.Entities
{
    public class ExtraFieldDataDE:BaseDomain
    {
        public int EnumLineId { get; set; }
        public string? FieldName { get; set; }
        public string? FieldValue { get; set; }

    }
}

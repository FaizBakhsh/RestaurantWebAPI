using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Core.Entities
{
    public class CompleteWasteDE:BaseDomain
    {
        #region Properties
        public int GroupId { get; set; }
        public string? KeyWord { get; set; }
        public DateTime Date { get; set; }
        public string? Group { get; set; }
        #endregion
        #region Constructor
        public CompleteWasteDE()
        {
            this.KeyWord = null;
        }
        #endregion
    }
}

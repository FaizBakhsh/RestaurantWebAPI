using Restaurant.Core.Enums;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Core.SearchCriteria
{
   public abstract class BaseSearchCriteria
    {
        public BaseSearchCriteria()
        {
            DBoperation = new DBoperations ();
            IsActive = true;
        }
        public DBoperations DBoperation { get; set; }
        public int Id { get; set; }
        public bool IsActive { get; set; }
        public DateTime? StartDate { get; set; }
        public DateTime? EndDate { get; set; }
        public DateTime? Date { get; set; }
        public int ClientId { get; set; }
    }
}

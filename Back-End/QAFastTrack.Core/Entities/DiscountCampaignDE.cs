using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Core.Entities
{
    public class DiscountCampaignDE:BaseDomain
    {
        #region Properties
        public string? Name { get; set; }
        public float Discount { get; set; }
        public string? Days { get; set; }
        public string? DaysIds { get; set; }
        public List<int> WeekDaysIds { get; set; }
        public string? StartTime { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }
        public string? EndTime { get; set; }
        public bool TillDayEnd { get; set; }
        public int TypeId { get; set; }
        public int MenuGroupId { get; set; }
        public bool Monday { get; set; }
        public bool Tuesday { get; set; }
        public bool Wednesday { get; set; }
        public bool Thursday { get; set; }
        public bool Friday { get; set; }
        public bool Saturday { get; set; }
        public bool Sunday { get; set; }
        public string? Group { get; set; }
        public string? Type { get; set; }
        #endregion
        #region Constructor
        public DiscountCampaignDE()
        {
            Name = null;
            this.WeekDaysIds =new List<int>();
        }
        #endregion
    }
}

using Restaurant.Core.Entities;
using Restaurant.Core.ViewModel;
using Restaurant.Core.ViewModel.Reports;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Core.Translators.Reports
{
    public static class SaleTranslators
    {
        public static HourlySaleReportLineVM ToTranslate(this SaleOrderDE mod)
        {
            return new HourlySaleReportLineVM()
            {

            };
            
        }
    }
}

using AspNetCore.Reporting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Restaurant.Core.Entities;
using Restaurant.Core.Entities.Reports;
using Restaurant.Service;

namespace Restaurant.WebAPI.Controllers
{
    [Route ("api/[controller]")]
    [ApiController]
    public class ReportController : ControllerBase
    {
        private ReportService _reportSvc;
        public ReportController ( )
        {
            _reportSvc = new ReportService ();
        }
        [HttpPost ("ShiftEndReport")]
        public IActionResult ShiftEndReportData (ShiftDE mod )
        {
           return  Ok(_reportSvc.GetShiftEndReportData (mod));
        }
        [HttpPost ("DayEndReport")]
        public IActionResult DayEndReportData ( SaleDayDE mod )
        {
            return Ok (_reportSvc.GetDayEndReportData (mod));
        }

    }
}

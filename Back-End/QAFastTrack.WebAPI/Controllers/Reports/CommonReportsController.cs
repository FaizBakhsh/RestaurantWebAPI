using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Restaurant.Core.Constants;
using Restaurant.Core.Entities;
using Restaurant.Core.SearchCriteria;
using Restaurant.Core.Translators;
using Restaurant.Service;
using Restaurant.Core.Extenstions;
using Restaurant.Services;

namespace Restaurant.WebAPI.Controllers.Reports
{
    [Route("api/[controller]")]
    [ApiController]
    public class CommonReportsController : ControllerBase
    {
        private readonly IHttpClientFactory _httpClientFactory;
        private ReportService _rptSvc;
        private CoreService _coreSvc;
        public CommonReportsController(IHttpClientFactory httpClientFactory)
        {
            _rptSvc = new ReportService();
            _coreSvc = new CoreService();
            _httpClientFactory = httpClientFactory;
        }
        [HttpPost("LogEvent")]
        public async Task<IActionResult> LogEventAsync(ReportSearchCriteria criteria)
        {
            try
            {
                bool hasData = true;
                var period = (criteria.StartDate?.ToDateString() + " - " + criteria.EndDate?.ToDateString()).ToString();
                var logEvents = _rptSvc.GetLogEvents(criteria);
                if (logEvents.Count == 0 || logEvents==null)
                {
                    hasData = false;
                    return Ok(new
                    {
                        hasData = hasData
                    });
                }
                var events = logEvents.ToTranslate();
                var companyInfo = _coreSvc.GetCompanyInfoByClient (criteria.ClientId);
                var requestPayload = new
                {
                    ReportData = events,
                    CompanyProfile = companyInfo
                };
                var client = _httpClientFactory.CreateClient();
                var url = AppConstants.SPRING_BOOT_API_URL + "LogEvent/Report/" + period;
                var response = await client.PostAsJsonAsync(url, requestPayload);

                if (response.IsSuccessStatusCode)
                {
                    var pdfBytes = await response.Content.ReadAsByteArrayAsync();
                    return File(pdfBytes, "application/pdf", "report.pdf");
                }
                else
                    return StatusCode((int)response.StatusCode, $"Failed to generate PDF: {response.ReasonPhrase}");
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal server error: {ex.Message}");
            }
        }
    }
}

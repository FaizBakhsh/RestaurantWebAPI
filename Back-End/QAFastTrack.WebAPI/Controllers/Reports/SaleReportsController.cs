using Microsoft.Extensions.Http;
using Microsoft.AspNetCore.Mvc;
using Restaurant.Core.Constants;
using Restaurant.Core.Entities;
using Restaurant.Service;
using Restaurant.Core.Translators.SaleOrder;
using Microsoft.OpenApi.Any;
using System.Net.Http;
using Restaurant.Core.Entities.Reports;
using Restaurant.Core.ViewModel.Reports;
using Restaurant.Core.SearchCriteria;
using Restaurant.Core.Extenstions;
using Restaurant.Core.ViewModel;
using Restaurant.Services;
using AutoMapper;
using System.Collections.Generic;
using AspNetCore.Reporting;

namespace Restaurant.WebAPI.Controllers.Reports
{
    [Route("api/[controller]")]
    [ApiController]
    public class SaleReportsController : ControllerBase
    {
        private ReportService _rptSvc;
        private CoreService _coreSvc;
        private readonly IHttpClientFactory _httpClientFactory;
        public SaleReportsController(IHttpClientFactory httpClientFactory)
        {
            _coreSvc = new CoreService ();
            _rptSvc = new ReportService ();
            _httpClientFactory = httpClientFactory;
        }

        [HttpPost("SaleRpt")]
        public async Task<IActionResult> SaleReportAsync(SaleOrderDE sale)
        {
            try
            {
                sale.SaleLines = sale.SaleOrderLines.ToTranslate();
                var client = _httpClientFactory.CreateClient();
                var url = AppConstants.SPRING_BOOT_API_URL + sale.ReportName + "/Report";

                var companyInfo = _coreSvc.GetCompanyInfoByClient (sale.ClientId);
                var requestPayload = new
                {
                    ReportData = sale,
                    CompanyProfile = companyInfo
                };

                var response = await client.PostAsJsonAsync(url, sale);

                if (response.IsSuccessStatusCode)
                {
                    var pdfBytes = await response.Content.ReadAsByteArrayAsync();
                    return File(pdfBytes, "application/pdf", "report.pdf");
                }
                else
                {
                    return StatusCode((int)response.StatusCode, $"Failed to generate PDF: {response.ReasonPhrase}");
                }
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal server error: {ex.Message}");
            }
        }

        [HttpPost("SaleInvoice")]
        public async Task<IActionResult> SaleInvoiceAsync(SaleOrderDE sale)
        {
            try
            {
                sale.SaleLines = sale.SaleOrderLines.ToTranslate();
                var client = _httpClientFactory.CreateClient();

                var url = AppConstants.SPRING_BOOT_API_URL + "SaleOrder/Report/" + sale.ReportName;

                var companyInfo = _coreSvc.GetCompanyInfoByClient (sale.ClientId);
                var requestPayload = new
                {
                    ReportData = sale,
                    CompanyProfile = companyInfo
                };
                var response = await client.PostAsJsonAsync(url, requestPayload);

                if (response.IsSuccessStatusCode)
                {
                    var pdfBytes = await response.Content.ReadAsByteArrayAsync();
                    return File(pdfBytes, "application/pdf", "report.pdf");
                }
                else
                {
                    return StatusCode((int)response.StatusCode, $"Failed to generate PDF: {response.ReasonPhrase}");
                }
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal server error: {ex.Message}");
            }
        }

        [HttpPost("SummaryRpt")]
        public async Task<IActionResult> SummaryReportAsync(SummaryReportDE rpt)
        {
            try
            {
                var client = _httpClientFactory.CreateClient();

                var url = AppConstants.SPRING_BOOT_API_URL + "EndReport/" + rpt.ReportName;
                var companyInfo = _coreSvc.GetCompanyInfoByClient (rpt.ClientId);
                var requestPayload = new
                {
                    ReportData = rpt,
                    CompanyProfile = companyInfo
                };
                var response = await client.PostAsJsonAsync(url, rpt);

                if (response.IsSuccessStatusCode)
                {
                    var pdfBytes = await response.Content.ReadAsByteArrayAsync();
                    return File(pdfBytes, "application/pdf", "report.pdf");
                }
                else
                {
                    return StatusCode((int)response.StatusCode, $"Failed to generate PDF: {response.ReasonPhrase}");
                }
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal server error: {ex.Message}");
            }
        }

        [HttpPost("HourlySaleRpt")]
        public async Task<IActionResult> HourlySaleReportAsyn(ReportSearchCriteria criteria)
        {
            try
            {
                bool hasData = true;
                var date = criteria.Date?.ToDateString();

                ReportService _rptSvc = new ReportService();
                var rpt = _rptSvc.GetHourlySaleReport(criteria);

                if (rpt.ReportLines.Count == 0)
                {
                    hasData = false;
                    return Ok(new
                    {
                        hasData = hasData
                    });
                }
                var companyInfo = _coreSvc.GetCompanyInfoByClient(criteria.ClientId);
                var requestPayload = new
                {
                    ReportData = rpt.ReportLines,
                    CompanyProfile = companyInfo
                };
                var client = _httpClientFactory.CreateClient();
                var url = AppConstants.SPRING_BOOT_API_URL + "HourlySales/Report/" + date;
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

        [HttpPost("InvoiceWiseRpt")]
        public async Task<IActionResult> InvoiceWiseReportAsync(ReportSearchCriteria criteria)
        {
            try
            {
                bool hasData = true;
                var period = (criteria.StartDate?.ToDateString() + " - " + criteria.EndDate?.ToDateString()).ToString();
                var sales = _rptSvc.GetInvoiceReport(criteria);
                if (sales.Count == 0)
                {
                    hasData = false;
                    return Ok(new
                    {
                        hasData = hasData
                    });
                }
                var companyInfo = _coreSvc.GetCompanyInfoByClient(criteria.ClientId);
                var requestPayload = new
                {
                    ReportData = sales,
                    CompanyProfile = companyInfo
                };
                var client = _httpClientFactory.CreateClient();
                var url = AppConstants.SPRING_BOOT_API_URL + "InvoiceWise/Report/" + period;
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

        [HttpPost("MenuItemWiseSaleRpt")]
        public async Task<IActionResult> MenuItemWiseSaleReportAsync(ReportSearchCriteria criteria)
        {
            try
            {
                bool hasData = true;
                var period = (criteria.StartDate?.ToDateString() + " - " + criteria.EndDate?.ToDateString()).ToString();
                var sales = _rptSvc.GetItemWiseSales(criteria);
                if (sales.Count == 0)
                {
                    hasData = false;
                    return Ok(new
                    {
                        hasData = hasData
                    });
                }
                var companyInfo = _coreSvc.GetCompanyInfoByClient(criteria.ClientId);
                var requestPayload = new
                {
                    ReportData = sales,
                    CompanyProfile = companyInfo
                };
                var client = _httpClientFactory.CreateClient();
                var url = AppConstants.SPRING_BOOT_API_URL + "MenuItemWiseSale/Report/" + period;
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
        [HttpPost("ComplimentaryRpt")]
        public async Task<IActionResult> ComplimentaryReportAsync(ReportSearchCriteria criteria)
        {
            try
            {
                bool hasData = true;
                var period = (criteria.StartDate?.ToDateString() + " - " + criteria.EndDate?.ToDateString()).ToString();
                var sales = _rptSvc.GetComplimentaryReport(criteria);
                if (sales.Count == 0)
                {
                    hasData = false;
                    return Ok(new
                    {
                        hasData = hasData
                    });
                }
                var companyInfo = _coreSvc.GetCompanyInfoByClient(criteria.ClientId);
                var requestPayload = new
                {
                    ReportData = sales,
                    CompanyProfile = companyInfo
                };
                var client = _httpClientFactory.CreateClient();
                var url = AppConstants.SPRING_BOOT_API_URL + "Complimentary/Report/" + period;
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

        [HttpPost("RawItemRpt")]
        public async Task<IActionResult> RawItemReportAsync(ReportSearchCriteria criteria)
        {
            try
            {
                bool hasData = true;
                var items = _rptSvc.GetRawItemReport(criteria);
                if (items.Count == 0)
                {
                    hasData = false;
                    return Ok(new
                    {
                        hasData = hasData
                    });
                }
                var companyInfo = _coreSvc.GetCompanyInfoByClient(criteria.ClientId);
                var requestPayload = new
                {
                    ReportData = items,
                    CompanyProfile = companyInfo
                };
                var client = _httpClientFactory.CreateClient();
                var url = AppConstants.SPRING_BOOT_API_URL + "RawItem/Report";
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

        [HttpPost("DiscountSaleRpt")]
        public async Task<IActionResult> DiscountSaleReportAsync(ReportSearchCriteria criteria)
        {
            try
            {
                var period = (criteria.StartDate?.ToDateString() + " - " + criteria.EndDate?.ToDateString()).ToString();
                bool hasData = true;
                var retVal = _rptSvc.GetDiscountSaleReport(criteria);
                if (retVal.Count == 0)
                {
                    hasData = false;
                    return Ok(new
                    {
                        hasData = hasData
                    });
                }
                var companyInfo = _coreSvc.GetCompanyInfoByClient(criteria.ClientId);
                var requestPayload = new
                {
                    ReportData = retVal,
                    CompanyProfile = companyInfo
                };
                var client = _httpClientFactory.CreateClient();
                var url = AppConstants.SPRING_BOOT_API_URL + "DiscountSale/Report/" + period;
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

        [HttpPost("RefundVoidRpt")]
        public async Task<IActionResult> RefundVoidReportAsync(ReportSearchCriteria criteria)
        {
            try
            {
                var period = (criteria.StartDate?.ToDateString() + " - " + criteria.EndDate?.ToDateString()).ToString();
                bool hasData = true;
                var retVal = _rptSvc.GetRefundVoidReport(criteria);
                if (retVal.Count == 0)
                {
                    hasData = false;
                    return Ok(new
                    {
                        hasData = hasData
                    });
                }
                var companyInfo = _coreSvc.GetCompanyInfoByClient(criteria.ClientId);
                var requestPayload = new
                {
                    ReportData = retVal,
                    CompanyProfile = companyInfo
                };
                var client = _httpClientFactory.CreateClient();
                var url = AppConstants.SPRING_BOOT_API_URL + "RefundVoid/Report/" + period;
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

        [HttpPost("PaymentWiseSaleRpt")]
        public async Task<IActionResult> PaymentWiseSaleReportAsync(ReportSearchCriteria criteria)
        {
            try
            {
                var period = (criteria.StartDate?.ToDateString() + " - " + criteria.EndDate?.ToDateString()).ToString();
                bool hasData = true;
                var retVal = _rptSvc.GetPaymentWiseReport(criteria);
                if (retVal.Count == 0)
                {
                    hasData = false;
                    return Ok(new
                    {
                        hasData = hasData
                    });
                }
                var companyInfo = _coreSvc.GetCompanyInfoByClient (criteria.ClientId);
                var requestPayload = new
                {
                    ReportData = retVal,
                    CompanyProfile = companyInfo
                };

                var client = _httpClientFactory.CreateClient ();
                var url = AppConstants.SPRING_BOOT_API_URL + "PaymentWiseSale/Report/" + period;
                var response = await client.PostAsJsonAsync (url, requestPayload);

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

        [HttpPost("DailySaleRpt")]
        public async Task<IActionResult> DailyReportReportAsync(ReportSearchCriteria criteria)
        {
            try
            {
                bool hasData = true;
                var retVal = _rptSvc.GetDailySaleReport(criteria);
                if (retVal.Sales.Count == 0)
                {
                    hasData = false;
                    return Ok(new
                    {
                        hasData = hasData
                    });
                }
                var companyInfo = _coreSvc.GetCompanyInfoByClient (criteria.ClientId);
                var requestPayload = new
                {
                    ReportData = retVal,
                    CompanyProfile = companyInfo
                };
                var period = String.Empty;
                if (criteria.Date != null)
                {
                    period = (criteria.Date?.ToDateString() + " - " + criteria.Date?.ToDateString()).ToString();
                    retVal.ReportTitle = "Shift Wise Report";
                }
                else
                {
                    period = (criteria.StartDate?.ToDateString() + " - " + criteria.EndDate?.ToDateString()).ToString();
                    retVal.ReportTitle = "Daily Sales Report";
                }
                var client = _httpClientFactory.CreateClient();
                var url = AppConstants.SPRING_BOOT_API_URL + "DailySale/Report/" + period;
                var response = await client.PostAsJsonAsync (url, requestPayload);

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

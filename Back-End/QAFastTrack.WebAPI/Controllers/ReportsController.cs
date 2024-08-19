
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
//using Microsoft.Reporting.WebForms;
using Microsoft.Reporting.NETCore;
using Restaurant.Core.Entities;
using System.Net;
using System.Reflection;
using Restaurant.Core.Extenstions;
using System.Web;

namespace Restaurant.WebAPI.Controllers
{
    [Route ("api/[controller]")]
    [ApiController]
    public class ReportsController : ControllerBase
        
    {
        public ReportsController()
        {
                
        }
        [HttpPost ("AddOnOrderPDF")]
        public IActionResult AddOnOrderPdf ( SaleOrderDE order )
        {
            if (order != null)
            {
                try
                {
                    string reportPath = "Reports\\AddOnLinesRPT.rdlc";
                    using var rs = Assembly.GetExecutingAssembly ().GetManifestResourceStream (reportPath);
                    var localReport = new LocalReport ();

                    var dataTable = order.SaleOrderLines.ToList ().ToDataTable ();
                    ReportDataSource reportDataSource = new ReportDataSource ();
                    // Must match the DataSource in the RDLC
                    reportDataSource.Name = "dsAddOn";
                    reportDataSource.Value = dataTable;
                    localReport.DataSources.Add (reportDataSource);
                    localReport.LoadReportDefinition (rs);
                    var reportParams = new[] 
                    {
                       new ReportParameter("Date", DateTime.Now.ToString () ),
                       new ReportParameter("KDSName", order.SaleOrderLines[0].KDS ),
                       new ReportParameter("OrderType", order.OrderType ),
                       new ReportParameter("BillTitle", order.BillTitle),
                       new ReportParameter("Status", "AddOn" ),
                       new ReportParameter("Amount", order.SaleOrderLines.Sum(sol => sol.LineTotal).ToString ()  ),
                       new ReportParameter("TotalItems",  order.SaleOrderLines.Sum(sol => sol.QTY).ToString ()   )
                    };
                    localReport.SetParameters (reportParams);
                    byte[] file = null;
                    try
                    {
                        file = localReport.Render ("PDF");
                    }
                    catch (Exception e)
                    {
                        Console.WriteLine ("{0} Exception caught.", e);
                        return Content (HttpStatusCode.InternalServerError.ToString (), e.Message);
                    }
                    return new FileContentResult (file, "application/pdf");
                }
                catch (Exception)
                {
                    return BadRequest ();
                }
            }
            else return Ok ();
        }
    }
}

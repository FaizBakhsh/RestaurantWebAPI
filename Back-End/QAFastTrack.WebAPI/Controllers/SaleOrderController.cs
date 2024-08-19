using Restaurant.Core.Entities;
using Restaurant.Core.Enums;
using Restaurant.Core.SearchCriteria;
using Restaurant.Core.ViewModel;
using Restaurant.Services;
using Microsoft.AspNetCore.Mvc;
//using Microsoft.Reporting.WebForms;
using System.IO;
//using AspNetCore.Reporting;
using System.Web;
using Org.BouncyCastle.Utilities.IO;
using System.Text;
using Restaurant.Core.Extenstions;

using Microsoft.Reporting.NETCore;
using AspNetCore.Reporting;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Restaurant.WebAPI.Controllers
{
    [Route ("api/[controller]")]
    [ApiController]
    public class SaleOrderController : ControllerBase
    {
        #region class Variables
        private readonly IWebHostEnvironment env;
        private SaleOrderService _soService;

        #endregion
        #region Constructors
        public SaleOrderController ( IWebHostEnvironment _env )
        {
            env = _env;
            _soService = new SaleOrderService ();
        }

        #endregion
        #region HTTP Verbs

        [HttpGet]
        public ActionResult Get ( )
        {
            SaleOrderDE sale = new SaleOrderDE ();
            List<SaleOrderDE> soList = _soService.SearchSaleOrders (sale);
            return Ok (soList);
        }
        [HttpPost ("Order")]
        public ActionResult GetOrders ( SaleOrderDE sale )
        {
            List<SaleOrderDE> soList = _soService.SearchOrderswithDeletedLines (sale);
            return Ok (soList);
        }
        [HttpPost ("{Search}")]
        public IActionResult Search ( SaleOrderDE Search )
        {
            List<SaleOrderDE> soList = _soService.SearchSaleOrders (Search);
            return Ok (soList);
        }
        [HttpPost]
        public ActionResult Post ( SaleOrderDE so )
        {
            so.DBoperation = DBoperations.Insert;
            foreach (SaleOrderLineDE line in so.SaleOrderLines)
            {
                line.DBoperation = so.DBoperation;
            }
            SaleOrderDE order = _soService.ManagementSaleOrder (so);
            return Ok (order);
        }
        [HttpPut]
        public ActionResult Put ( SaleOrderDE so )
        {
            so.DBoperation = DBoperations.Update;
            SaleOrderDE order = _soService.ManagementSaleOrder (so);
            return Ok (order);
        }
        [HttpDelete ("{id}")]
        public void Delete ( int id )
        {
            SaleOrderDE task = new SaleOrderDE { Id = id, DBoperation = DBoperations.DeActivate };
            _soService.ManagementSaleOrder (task);
        }
        #endregion
        //#region Reports
        //[HttpPost ("GetPDF")]
        //public IActionResult GetPDF ( SaleOrderDE Search )
        //{
        //    List<SaleOrderDE> soList = _soService.SearchSaleOrders (Search);

        //    if (soList != null)
        //    {
        //        var order = soList.FirstOrDefault ();
        //        if (order != null)
        //        {
        //            string mimeType = "application/pdf";
        //            string embaddedPath = "Reports\\SaleOrderRPT.rdlc";
        //            var dataTable = Core.HelperClass.ToDataTable (order.SaleOrderLines.ToList ());
        //            var localReport = new AspNetCore.Reporting.LocalReport (embaddedPath);
        //            localReport.AddDataSource ("dsSaleOrder", dataTable);
        //            Dictionary<string, string> parameter = new Dictionary<string, string>
        //            {
        //              { "ReportDate", DateTime.Now.ToString () },
        //              { "SaleNo", order.Id.ToString () },
        //              { "Total", order.Total.ToString () },
        //              { "Discount", order.Discount.ToString () },
        //              { "GST", order.GST.ToString () },
        //              { "NetPayable", order.NetTotal.ToString () },
        //             };
        //            var res = localReport.Execute (RenderType.Pdf, 1, parameter, mimeType);
        //            Response.Headers.Add ("Content-Disposition", "attachment; filename=SaleReport.pdf");
        //            return File (res.MainStream, mimeType, "SaleReport.pdf");
        //        }
        //        else return Ok ();
        //    }
        //    else return Ok ();
        //}
        //[HttpPost ("NewOrderPDF")]
        //public IActionResult NewOrderPdf ( SaleOrderDE order )
        //{
        //    if (order != null)
        //    {
        //        try
        //        {
        //            string mimeType = "application/pdf";
        //            string embaddedPath = "Reports\\NewOrderRPT.rdlc";
        //            var dataTable = Core.HelperClass.ToDataTable (order.SaleOrderLines.ToList ());
        //            var localReport = new AspNetCore.Reporting.LocalReport (embaddedPath);
        //            localReport.AddDataSource ("dsNewOrder", dataTable);
        //            Dictionary<string, string> parameter = new Dictionary<string, string>
        //            {
        //              { "Date", DateTime.Now.ToString () },
        //              { "KDSName", order.SaleOrderLines[0].KDS },
        //              { "OrderType", order.OrderType },
        //              { "BillTitle", order.BillTitle },
        //              { "Status", "New" },
        //              { "Amount", order.SaleOrderLines.Sum(sol => sol.LineTotal).ToString () },
        //              { "TotalItems",  order.SaleOrderLines.Sum(sol => sol.QTY).ToString () }
        //            };

        //            var parameters = new List<ReportParameter>
        //             {
        //               new ReportParameter("Date", DateTime.Now.ToString () ),
        //               new ReportParameter( "KDSName", order.SaleOrderLines[0].KDS ),
        //               new ReportParameter( "OrderType", order.OrderType  ),
        //               new ReportParameter( "Amount", order.SaleOrderLines.Sum(sol => sol.LineTotal).ToString ()),
        //               new ReportParameter( "BillTitle", order.BillTitle ),
        //               new ReportParameter(  "Status", "New" ),
        //               new ReportParameter( "TotalItems",  order.SaleOrderLines.Sum(sol => sol.QTY).ToString () ),
        //             };
        //            int ext = Math.Abs ((int)(DateTime.Now.Ticks >> 10));
        //            var res = localReport.Execute (RenderType.Pdf, 1, parameter, mimeType);
        //            Response.Headers.Add ("Content-Disposition", "attachment; filename=SaleReport.pdf");
        //            return File (res.MainStream, mimeType, "SaleOrderRPT.pdf");
        //        }
        //        catch (Exception)
        //        {
        //            return BadRequest ();
        //        }
        //    }
        //    else return Ok ();
        //}
        //[HttpPost ("AddOnOrderPDF")]
        //public IActionResult AddOnOrderPdf ( SaleOrderDE order )
        //{
        //    if (order != null)
        //    {
        //        try
        //        {
        //            string mimeType = "application/pdf";
        //            string embaddedPath = "Reports\\AddOnLinesRPT.rdlc";
        //            var dataTable = Core.HelperClass.ToDataTable (order.SaleOrderLines.ToList ());
        //            var localReport = new AspNetCore.Reporting.LocalReport(embaddedPath);
        //            localReport.AddDataSource ("dsAddOn", dataTable);
        //            Dictionary<string, string> parameter = new Dictionary<string, string>
        //            {
        //              { "Date", DateTime.Now.ToString () },
        //              { "KDSName", order.SaleOrderLines[0].KDS },
        //              { "OrderType", order.OrderType },
        //              { "BillTitle", order.BillTitle },
        //              { "Status", "AddOn" },
        //              { "Amount", order.SaleOrderLines.Sum(sol => sol.LineTotal).ToString () },
        //              { "TotalItems",  order.SaleOrderLines.Sum(sol => sol.QTY).ToString () }
        //             };
        //            int ext = Math.Abs ((int)(DateTime.Now.Ticks >> 10));
        //            var res = localReport.Execute (RenderType.Pdf, 1, parameter, mimeType);
        //            Response.Headers.Add ("Content-Disposition", "attachment; filename=SaleReport.pdf");
        //            return File (res.MainStream, mimeType, "AddOnRPT.pdf");
        //        }
        //        catch (Exception)
        //        {
        //            return BadRequest ();
        //        }
        //    }
        //    else return Ok ();
        //}
        //[HttpPost ("VoidOrderPDF")]
        //public IActionResult VoidOrderPdf ( SaleOrderDE order )
        //{
        //    if (order != null)
        //    {
        //        try
        //        {
        //            string mimeType = "application/pdf";
        //            string embaddedPath = "Reports\\VoidLineRPT.rdlc";
        //            var dataTable = Core.HelperClass.ToDataTable (order.SaleOrderLines.ToList ());
        //            //using (AspNetCore.Reporting.LocalReport localReport = new AspNetCore.Reporting.LocalReport (embaddedPath))
        //            //{

        //            //}
        //            var localReport = new LocalReport ();
        //            //localReport.AddDataSource ("dsVoidLine", dataTable);
        //            Dictionary<string, string> parameters = new Dictionary<string, string>
        //            {
        //              { "Date", DateTime.Now.ToString () },
        //              { "KDSName", order.SaleOrderLines[0].KDS },
        //              { "OrderType", order.OrderType.ToString() },
        //              { "BillTitle", order.BillTitle.ToString() },
        //              { "Status", "Void" },
        //             };
        //            int ext = Math.Abs ((int)(DateTime.Now.Ticks >> 10));
        //            //var res = localReport.Execute (RenderType.Pdf, 1, parameter, mimeType);
        //            //var res = localReport.Execute (RenderType.Pdf, ext, parameters, mimeType);
        //            var res = localReport.Render()
        //            //localReport.r
        //            //localReport.
        //            Response.Headers.Add ("Content-Disposition", "attachment; filename=VoidLineRPT.pdf");
        //            return File (res.MainStream, mimeType, "VoidLineRPT.pdf");
        //        }
        //        catch (Exception)
        //        {
        //            return BadRequest ();
        //        }
        //    }
        //    else return Ok ();
        //}
        //[HttpPost ("{SaleInvoice}/{InvType}")]
        //public IActionResult SaleInvoicePdf ( SaleOrderDE order, string InvType )
        //{
        //    if (order != null)
        //    {
        //        try
        //        {
        //            string mimeType = "application/pdf";
        //            string embaddedPath = "Reports\\SaleInvoiceRPT.rdlc";
        //            //var dataTable = Core.HelperClass.ToDataTable (order.SaleOrderLines.ToList ());
        //            var dataTable = order.SaleOrderLines.ToList ().ToDataTable (); // Core.HelperClass.ToDataTable (order.SaleOrderLines.ToList ());

        //            var localReport = new AspNetCore.Reporting.LocalReport (embaddedPath);
        //            localReport.AddDataSource ("dsSaleInvoice", dataTable);
        //            Dictionary<string, string> parameters = new Dictionary<string, string>
        //            {
        //              { "ResName", "Restaurant Name" },
        //              { "ResAddress", "Restaurant Address" },
        //              { "OrderType", order.OrderType.ToString() },
        //              { "BillTitle", order.BillTitle.ToString() },
        //              { "InvoiceType", InvType },
        //              { "Date", order.Date.ToString () },
        //              { "PhoneNo", order.PhoneNo },
        //              { "Terminal", order.Terminal },
        //              { "MOP", order.PaymentMethod },
        //              { "TotalItems",order.SaleOrderLines.Sum(sol => sol.QTY).ToString ()  },
        //              { "SubTotal", order.SaleOrderLines.Sum(sol => sol.LineTotal).ToString ()},
        //              { "Discount", order.DiscountValue.ToString() },
        //              { "GST", order.GST.ToString() },
        //              { "GSTValue", order.GSTValue.ToString() },
        //              { "ServiceCharges", order.Service.ToString() },
        //              { "PrintingDate", DateTime.Now.ToString () },
        //              { "NetTotal", order.NetTotal.ToString()},
        //              { "SaleNo", order.Id.ToString()},
        //             };
        //            int ext = Math.Abs ((Int32)(DateTime.Now.Ticks >> 10));
        //            //var res = localReport.Execute (RenderType.Pdf, 1, parameter, mimeType);
        //            var res = localReport.Execute (RenderType.Pdf, ext, parameters, mimeType);
        //            Response.Headers.Add ("Content-Disposition", "attachment; filename=SaleInvoiceRPT.pdf");
        //            return File (res.MainStream, mimeType, "SaleInvoiceRPT.pdf");
        //        }
        //        catch (Exception)
        //        {
        //            return BadRequest ();
        //        }
        //    }
        //    else return Ok ();
        //}
//#endregion
    }
}

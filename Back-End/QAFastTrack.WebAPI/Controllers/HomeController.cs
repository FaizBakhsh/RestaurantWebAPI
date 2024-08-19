using AspNetCore.Reporting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Restaurant.Core.Entities;
using Restaurant.Service;
using Restaurant.Services;

namespace Restaurant.WebAPI.Controllers
{
    public class HomeController : Controller
    {
        private readonly IWebHostEnvironment env;
        private SaleOrderService _soService;

        public HomeController ( IWebHostEnvironment _env )
        {
            env = _env;
            _soService = new SaleOrderService ();
        }
        public IActionResult Search ( SaleOrderDE Search )
        {

            SaleOrderDE sale = new SaleOrderDE ();
            List<SaleOrderDE> soList = _soService.SearchSaleOrders (sale);
            string mimeType = "application/pdf";
            string embaddedPath = "Reports\\SaleOrderRPT.rdlc";
            var dataTable = Core.HelperClass.ToDataTable (soList.FirstOrDefault ().SaleOrderLines.ToList ());
            var localReport = new LocalReport (embaddedPath);
            localReport.AddDataSource ("dsSaleOrder", dataTable);
            var res = localReport.Execute (RenderType.Pdf, 1, null, mimeType);
            return File (res.MainStream, mimeType);
            // return Ok(soList);
        }
    }
}

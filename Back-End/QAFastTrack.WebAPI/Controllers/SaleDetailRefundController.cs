using AspNetCore.Reporting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Restaurant.Core.Entities;
using Restaurant.Core.Enums;
using Restaurant.Service;
using Restaurant.Services;

namespace Restaurant.WebAPI.Controllers
{
    [Route ("api/[controller]")]
    [ApiController]
    public class SaleDetailRefundController : ControllerBase
    {
        #region class Variables
        private readonly IWebHostEnvironment env;
        private SaleDetailRefundService _sdrService;

        #endregion
        #region Constructors
        public SaleDetailRefundController ( IWebHostEnvironment _env )
        {
            env = _env;
            _sdrService = new SaleDetailRefundService ();
        }

        #endregion
        #region HTTP Verbs

        [HttpGet]
        public ActionResult Get ( )
        {
            SaleDetailRefundDE sale = new SaleDetailRefundDE ();
            List<SaleDetailRefundDE> soList = _sdrService.SearchSaleDetailRefunds (sale);
            return Ok (soList);
        }

        [HttpPost ("{Search}")]
        public IActionResult Search ( SaleDetailRefundDE Search )
        {
            List<SaleDetailRefundDE> soList = _sdrService.SearchSaleDetailRefunds (Search);
            return Ok (soList);
        }
        [HttpPost]
        public ActionResult Post ( SaleDetailRefundDE sdr )
        {
            sdr.DBoperation = DBoperations.Insert;
            SaleDetailRefundDE refund = _sdrService.ManagementSaleDetailRefund (sdr, null);
            return Ok (refund);
        }

        [HttpPut]
        public ActionResult Put ( SaleDetailRefundDE sdr )
        {
            sdr.DBoperation = DBoperations.Update;
            SaleDetailRefundDE refund = _sdrService.ManagementSaleDetailRefund (sdr, null);
            return Ok (refund);
        }

        [HttpDelete ("{id}")]
        public void Delete ( int id )
        {
            SaleDetailRefundDE refund = new SaleDetailRefundDE { Id = id, DBoperation = DBoperations.DeActivate };
            _sdrService.ManagementSaleDetailRefund (refund, null);
        }

        #endregion
    }
}

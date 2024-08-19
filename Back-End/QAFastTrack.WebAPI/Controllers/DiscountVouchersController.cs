using Microsoft.AspNetCore.Mvc;
using Restaurant.Core.Entities;
using Restaurant.Core.Enums;
using Restaurant.Service;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Restaurant.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class DiscountVouchersController : ControllerBase
    {

        #region Class Variables

        private DiscountVouchersService _discountVouchersSVC;

        #endregion
        #region Constructors
        public DiscountVouchersController()
        {
            _discountVouchersSVC = new DiscountVouchersService();
        }

        #endregion
        #region Http Verbs

        [HttpGet]
        public ActionResult Get()
        {
            DiscountVouchersDE DiscountVouchers = new DiscountVouchersDE ();
            List<DiscountVouchersDE> list = _discountVouchersSVC.SearchDiscountVoucherss(DiscountVouchers);
            return Ok(list);
        }
        [HttpGet("{id}")]
        public ActionResult GetDiscountVouchersById(int id)
        {
            DiscountVouchersDE DiscountVouchers = new DiscountVouchersDE { Id = id };
            var list = _discountVouchersSVC.SearchDiscountVoucherss(DiscountVouchers);
            return Ok(list);
        }
        [HttpPost("{Search}")]
        public ActionResult Search(DiscountVouchersDE Search)
        {
            //Search.IsActive = true;
            List<DiscountVouchersDE> list = _discountVouchersSVC.SearchDiscountVoucherss(Search);
            return Ok(list);
        }

        [HttpPost]
        public ActionResult Post(DiscountVouchersDE discount)
        {
            discount.DBoperation = DBoperations.Insert;
            bool DiscountVouchers = _discountVouchersSVC.ManagementDiscountVouchers(discount);
            return Ok(DiscountVouchers);
        }

        [HttpPut]
        public ActionResult Put(DiscountVouchersDE discount)
        {
            discount.DBoperation = DBoperations.Update;
            _discountVouchersSVC.ManagementDiscountVouchers(discount);
            return Ok();
        }
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
            DiscountVouchersDE DiscountVouchers = new DiscountVouchersDE { Id = id, DBoperation = DBoperations.DeActivate };
            _discountVouchersSVC.ManagementDiscountVouchers(DiscountVouchers);
        }

        #endregion
    }
}
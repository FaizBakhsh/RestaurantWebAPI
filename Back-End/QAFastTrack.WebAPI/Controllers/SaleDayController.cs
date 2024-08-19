using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Restaurant.Core.Entities;
using Restaurant.Core.Enums;
using Restaurant.Service;

namespace Restaurant.WebAPI.Controllers
{
    [Route ("api/[controller]")]
    [ApiController]
    public class SaleDayController : ControllerBase
    {
        #region Class Variables

        private SaleDayService _SaleDaySVC;

        #endregion
        #region Constructors
        public SaleDayController ( )
        {
            _SaleDaySVC = new SaleDayService ();
        }

        #endregion
        #region Http Verbs

        [HttpGet]
        public ActionResult Get ( )
        {
            SaleDayDE SaleDay = new SaleDayDE { IsActive = true };
            List<SaleDayDE> list = _SaleDaySVC.SearchSaleDays (SaleDay);
            return Ok (list);
        }
        [HttpGet ("{id}")]
        public ActionResult GetSaleDayById ( int id )
        {
            SaleDayDE SaleDay = new SaleDayDE { Id = id };
            var list = _SaleDaySVC.SearchSaleDays (SaleDay);
            return Ok (list);
        }
        [HttpPost ("{Search}")]
        public ActionResult Search ( SaleDayDE Search )
        {
            Search.IsActive = true;
            List<SaleDayDE> list = _SaleDaySVC.SearchSaleDays (Search);
            return Ok (list);
        }
        [HttpPost]
        public ActionResult Post ( SaleDayDE SaleDay )
        {
            SaleDay.DBoperation = DBoperations.Insert;
            SaleDayDE retVal = _SaleDaySVC.ManagementSaleDay (SaleDay);
            return Ok (retVal);
        }
        [HttpPut]
        public ActionResult Put ( SaleDayDE SaleDay )
        {
            SaleDay.DBoperation = DBoperations.Update;
            SaleDayDE retVal = _SaleDaySVC.ManagementSaleDay (SaleDay);
            return Ok (retVal);
        }
        [HttpDelete ("{id}")]
        public void Delete ( int id )
        {
            SaleDayDE SaleDay = new SaleDayDE { Id = id, DBoperation = DBoperations.DeActivate };
            _SaleDaySVC.ManagementSaleDay (SaleDay);
        }

        #endregion
    }
}

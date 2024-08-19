using Microsoft.AspNetCore.Mvc;
using Restaurant.Core.Entities;
using Restaurant.Core.Enums;
using Restaurant.Service;

namespace Restaurant.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UOMConversionController : ControllerBase
    {
        #region Class Variables
        private UOMConversionService _uomConversionSVC;
        #endregion
        #region Constructor
        public UOMConversionController()
        {
            _uomConversionSVC = new UOMConversionService();
        }
        #endregion
        #region Http Verbs

        [HttpGet]
        public ActionResult Get()
        {
            UOMConversionDE UOMConversion = new UOMConversionDE { IsActive=true};
            List<UOMConversionDE> uomCnvrsn = _uomConversionSVC.SearchUOMConversions(UOMConversion);
            return Ok(uomCnvrsn);
        }
        [HttpGet("{id}")]
        public ActionResult GetUOMConversionById(int id)
        {
            UOMConversionDE UOMConversion = new UOMConversionDE { Id = id };
            var uomCnvrsn = _uomConversionSVC.SearchUOMConversions(UOMConversion);
            return Ok(uomCnvrsn);
        }
        [HttpPost("{Search}")]
        public ActionResult Search(UOMConversionDE Search)
        {
            Search.IsActive = true;
            List<UOMConversionDE> uomCnvrsn = _uomConversionSVC.SearchUOMConversions(Search);
            return Ok(uomCnvrsn);
        }
        [HttpPost]
        public ActionResult Post(UOMConversionDE uomCnvrsn)
        {
            uomCnvrsn.DBoperation = DBoperations.Insert;
            bool UOMConversion = _uomConversionSVC.ManagementUOMConversion(uomCnvrsn);
            return Ok(UOMConversion);
        }
        [HttpPut]
        public ActionResult Put(UOMConversionDE uomCnvrsn)
        {
            uomCnvrsn.DBoperation = DBoperations.Update;
            _uomConversionSVC.ManagementUOMConversion(uomCnvrsn);
            return Ok();
        }
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
            UOMConversionDE UOMConversion = new UOMConversionDE { Id = id, DBoperation = DBoperations.DeActivate };
            _uomConversionSVC.ManagementUOMConversion(UOMConversion);
        }

        #endregion
    }
}

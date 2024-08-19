using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Restaurant.Core.Entities;
using Restaurant.Core.Enums;
using Restaurant.Service;

namespace Restaurant.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class KitchenIssuanceController : ControllerBase
    {
        #region Class Variables

        private KitchenIssuanceService _KitchenIssuanceSVC;

        #endregion
        #region Constructors
        public KitchenIssuanceController()
        {
            _KitchenIssuanceSVC = new KitchenIssuanceService();
        }

        #endregion
        #region Http Verbs

        [HttpGet]
        public ActionResult Get()
        {
            KitchenIssuanceDE KitchenIssuance = new KitchenIssuanceDE { IsActive=true};
            List<KitchenIssuanceDE> list = _KitchenIssuanceSVC.SearchKitchenIssuance(KitchenIssuance);
            return Ok(list);
        }
        [HttpGet("{id}")]
        public ActionResult GetKitchenIssuanceById(int id)
        {
            KitchenIssuanceDE KitchenIssuance = new KitchenIssuanceDE { Id = id };
            var list = _KitchenIssuanceSVC.SearchKitchenIssuance(KitchenIssuance);
            return Ok(list);
        }
        [HttpPost("{Search}")]
        public ActionResult Search(KitchenIssuanceDE Search)
        {
            Search.IsActive = true;
            List<KitchenIssuanceDE> list = _KitchenIssuanceSVC.SearchKitchenIssuance(Search);
            return Ok(list);
        }
        [HttpPost]
        public ActionResult Post(KitchenIssuanceDE KitchenIssuance)
        {
            KitchenIssuance.DBoperation = DBoperations.Insert;
           _KitchenIssuanceSVC.ManagementKitchenIssuance(KitchenIssuance);
            return Ok(KitchenIssuance);
        }
        [HttpPut]
        public ActionResult Put(KitchenIssuanceDE KitchenIssuance)
        {
            KitchenIssuance.DBoperation = DBoperations.Update;
            _KitchenIssuanceSVC.ManagementKitchenIssuance(KitchenIssuance);
            return Ok();
        }
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
            KitchenIssuanceDE KitchenIssuance = new KitchenIssuanceDE { Id = id, DBoperation = DBoperations.DeActivate };
            _KitchenIssuanceSVC.ManagementKitchenIssuance(KitchenIssuance);
        }

        #endregion
    }
}

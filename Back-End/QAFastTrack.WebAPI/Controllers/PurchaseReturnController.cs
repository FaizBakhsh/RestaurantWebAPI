using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Restaurant.Core.Entities;
using Restaurant.Core.Enums;
using Restaurant.Service;

namespace Restaurant.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PurchaseReturnController : ControllerBase
    {
        #region Class Variables

        private PurchaseReturnService _purchaseReturnSVC;

        #endregion
        #region Constructors
        public PurchaseReturnController()
        {
            _purchaseReturnSVC = new PurchaseReturnService();
        }
        #endregion
        #region Http Verbs

        [HttpGet]
        public ActionResult Get()
        {
            PurchaseReturnDE PurchaseReturn = new PurchaseReturnDE ();
            List<PurchaseReturnDE> list = _purchaseReturnSVC.SearchPurchaseReturns(PurchaseReturn);
            return Ok(list);
        }
        [HttpGet("{id}")]
        public ActionResult GetPurchaseReturnById(int id)
        {
            PurchaseReturnDE PurchaseReturn = new PurchaseReturnDE { Id = id };
            var list = _purchaseReturnSVC.SearchPurchaseReturns(PurchaseReturn);
            return Ok(list);
        }
        [HttpPost("{Search}")]
        public ActionResult Search(PurchaseReturnDE Search)
        {
           // Search.IsActive = true;
            List<PurchaseReturnDE> list = _purchaseReturnSVC.SearchPurchaseReturns(Search);
            return Ok(list);
        }
        [HttpPost]
        public ActionResult Post(PurchaseReturnDE pReturn)
        {
            pReturn.DBoperation = DBoperations.Insert;
            PurchaseReturnDE PurchaseReturn = _purchaseReturnSVC.ManagementPurchaseReturn(pReturn);
            return Ok(PurchaseReturn);
        }
        [HttpPut]
        public ActionResult Put(PurchaseReturnDE pReturn)
        {
            pReturn.DBoperation = DBoperations.Update;
            PurchaseReturnDE PurchaseReturn = _purchaseReturnSVC.ManagementPurchaseReturn(pReturn);
            return Ok(PurchaseReturn);
        }
        [HttpDelete("{id}")]
        public ActionResult Delete(int id)
        {
            PurchaseReturnDE pReturn = new PurchaseReturnDE { Id = id, DBoperation = DBoperations.Delete };
            PurchaseReturnDE PurchaseReturn = _purchaseReturnSVC.ManagementPurchaseReturn(pReturn);
            return Ok(PurchaseReturn);
        }

        #endregion
    }
}

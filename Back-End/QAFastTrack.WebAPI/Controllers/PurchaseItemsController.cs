using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Restaurant.Core.Entities;
using Restaurant.Core.Enums;
using Restaurant.Service;

namespace Restaurant.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PurchaseItemsController : ControllerBase
    {
        #region Class Variables

        private PurchaseItemsService _PurchaseItemsSVC;

        #endregion
        #region Constructors
        public PurchaseItemsController()
        {
            _PurchaseItemsSVC = new PurchaseItemsService();
        }

        #endregion
        #region Http Verbs
        [HttpGet]
        public ActionResult Get()
        {
            PurchaseItemsDE PurchaseItems = new PurchaseItemsDE { IsActive = true };
            List<PurchaseItemsDE> list = _PurchaseItemsSVC.SearchPurchaseItems(PurchaseItems);
            return Ok(list);
        }
        [HttpGet("{id}")]
        public ActionResult GetPurchaseItemsById(int id)
        {
            PurchaseItemsDE PurchaseItems = new PurchaseItemsDE { Id = id };
            var list = _PurchaseItemsSVC.SearchPurchaseItems(PurchaseItems);
            return Ok(list);
        }
        [HttpPost("{Search}")]
        public ActionResult Search(PurchaseItemsDE Search)
        {
            Search.IsActive = true;
            List<PurchaseItemsDE> list = _PurchaseItemsSVC.SearchPurchaseItems(Search);
            return Ok(list);
        }
        [HttpPost]
        public ActionResult Post(PurchaseItemsDE purchaseItems)
        {
            purchaseItems.DBoperation = DBoperations.Insert;
            PurchaseItemsDE PurchaseItems = _PurchaseItemsSVC.ManagementPurchaseItems(purchaseItems);
            return Ok(PurchaseItems);
        }
        [HttpPut]
        public ActionResult Put(PurchaseItemsDE purchaseItems)
        {
            purchaseItems.DBoperation = DBoperations.Update;
            PurchaseItemsDE PurchaseItems=_PurchaseItemsSVC.ManagementPurchaseItems(purchaseItems);
            return Ok(PurchaseItems);
        }
        [HttpDelete("{id}")]
        public ActionResult Delete(int id)
        {
            PurchaseItemsDE purchaseItems = new PurchaseItemsDE { Id = id, DBoperation = DBoperations.Delete };
            PurchaseItemsDE PurchaseItems = _PurchaseItemsSVC.ManagementPurchaseItems(purchaseItems);
            return Ok(PurchaseItems);
        }
        #endregion
    }
}

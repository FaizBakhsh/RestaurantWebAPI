using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Restaurant.Core.Entities;
using Restaurant.Core.Enums;
using Restaurant.Service;

namespace Restaurant.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PurchaseOrderController : ControllerBase
    {
        #region Class Variables

        private PurchaseOrderService _PurchaseOrderSVC;

        #endregion
        #region Constructors
        public PurchaseOrderController()
        {
            _PurchaseOrderSVC = new PurchaseOrderService();
        }

        #endregion
        #region Http Verbs

        [HttpGet]
        public ActionResult Get()
        {
            PurchaseOrderDE PurchaseOrder = new PurchaseOrderDE { IsActive = true };
            List<PurchaseOrderDE> list = _PurchaseOrderSVC.SearchPurchaseOrders(PurchaseOrder);
            return Ok(list);
        }
        [HttpGet("{id}")]
        public ActionResult GetPurchaseOrderById(int id)
        {
            PurchaseOrderDE PurchaseOrder = new PurchaseOrderDE { Id = id };
            var list = _PurchaseOrderSVC.SearchPurchaseOrders(PurchaseOrder);
            return Ok(list);
        }
        [HttpPost("{Search}")]
        public ActionResult Search(PurchaseOrderDE Search)
        {
            Search.IsActive = true;
            List<PurchaseOrderDE> list = _PurchaseOrderSVC.SearchPurchaseOrders(Search);
            return Ok(list);
        }
        [HttpPost]
        public ActionResult Post(PurchaseOrderDE purchaseOrder)
        {
            purchaseOrder.DBoperation = DBoperations.Insert;
            PurchaseOrderDE PurchaseOrder = _PurchaseOrderSVC.ManagementPurchaseOrder(purchaseOrder);
            return Ok(PurchaseOrder);
        }
        [HttpPut]
        public ActionResult Put(PurchaseOrderDE purchaseOrder)
        {
            purchaseOrder.DBoperation = DBoperations.Update;
            PurchaseOrderDE PurchaseOrder =  _PurchaseOrderSVC.ManagementPurchaseOrder(purchaseOrder);
            return Ok(PurchaseOrder);
        }
        [HttpDelete("{id}")]
        public ActionResult Delete(int id)
        {
            PurchaseOrderDE purchaseOrder = new PurchaseOrderDE { Id = id, DBoperation = DBoperations.Delete };
            PurchaseOrderDE PurchaseOrder = _PurchaseOrderSVC.ManagementPurchaseOrder(purchaseOrder);
            return Ok(PurchaseOrder);
        }

        #endregion
    }
}

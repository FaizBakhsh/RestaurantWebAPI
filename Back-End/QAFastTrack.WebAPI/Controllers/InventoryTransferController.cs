using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Restaurant.Core.Entities;
using Restaurant.Core.Enums;
using Restaurant.Service;

namespace Restaurant.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class InventoryTransferController : ControllerBase
    {
        #region Class Variables

        private InventoryTransferService _inventoryTransferSVC;

        #endregion
        #region Constructors
        public InventoryTransferController()
        {
            _inventoryTransferSVC = new InventoryTransferService();
        }
        #endregion
        #region Http Verbs

        [HttpGet]
        public ActionResult Get()
        {
            InventoryTransferDE InventoryTransfer = new InventoryTransferDE { IsActive=true};
            List<InventoryTransferDE> list = _inventoryTransferSVC.SearchInventoryTransfers(InventoryTransfer);
            return Ok(list);
        }
        [HttpGet("{id}")]
        public ActionResult GetInventoryTransferById(int id)
        {
            InventoryTransferDE InventoryTransfer = new InventoryTransferDE { Id = id };
            var list = _inventoryTransferSVC.SearchInventoryTransfers(InventoryTransfer);
            return Ok(list);
        }
        [HttpPost("{Search}")]
        public ActionResult Search(InventoryTransferDE Search)
        {
            Search.IsActive = true;
            List<InventoryTransferDE> list = _inventoryTransferSVC.SearchInventoryTransfers(Search);
            return Ok(list);
        }
        [HttpPost]
        public ActionResult Post(InventoryTransferDE invTrans)
        {
            invTrans.DBoperation = DBoperations.Insert;
            bool InventoryTransfer = _inventoryTransferSVC.ManagementInventoryTransfer(invTrans);
            return Ok(InventoryTransfer);
        }
        [HttpPut]
        public ActionResult Put(InventoryTransferDE invTrans)
        {
            invTrans.DBoperation = DBoperations.Update;
            _inventoryTransferSVC.ManagementInventoryTransfer(invTrans);
            return Ok();
        }
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
            InventoryTransferDE InventoryTransfer = new InventoryTransferDE { Id = id, DBoperation = DBoperations.DeActivate };
            _inventoryTransferSVC.ManagementInventoryTransfer(InventoryTransfer);
        }

        #endregion
    }
}

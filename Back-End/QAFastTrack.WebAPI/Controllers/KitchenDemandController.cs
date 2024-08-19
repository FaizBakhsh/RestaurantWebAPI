using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Restaurant.Core.Entities;
using Restaurant.Core.Enums;
using Restaurant.Service;

namespace Restaurant.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class KitchenDemandController : ControllerBase
    {
        #region Class Variables

        private KitchenDemandService _kitchenDemandSVC;

        #endregion
        #region Constructors
        public KitchenDemandController()
        {
            _kitchenDemandSVC = new KitchenDemandService();
        }
        #endregion
        #region Http Verbs

        [HttpGet]
        public ActionResult Get()
        {
            KitchenDemandDE KitchenDemand = new KitchenDemandDE { IsActive=true};
            List<KitchenDemandDE> list = _kitchenDemandSVC.SearchKitchenDemands(KitchenDemand);
            return Ok(list);
        }
        [HttpGet("{id}")]
        public ActionResult GetKitchenDemandById(int id)
        {
            KitchenDemandDE KitchenDemand = new KitchenDemandDE { Id = id };
            var list = _kitchenDemandSVC.SearchKitchenDemands(KitchenDemand);
            return Ok(list);
        }
        [HttpPost("{Search}")]
        public ActionResult Search(KitchenDemandDE Search)
        {
            Search.IsActive = true;
            List<KitchenDemandDE> list = _kitchenDemandSVC.SearchKitchenDemands(Search);
            return Ok(list);
        }
        [HttpPost]
        public ActionResult Post(KitchenDemandDE kitDemand)
        {
            kitDemand.DBoperation = DBoperations.Insert;
            bool KitchenDemand = _kitchenDemandSVC.ManagementKitchenDemand(kitDemand);
            return Ok(KitchenDemand);
        }
        [HttpPut]
        public ActionResult Put(KitchenDemandDE kitDemand)
        {
            kitDemand.DBoperation = DBoperations.Update;
            _kitchenDemandSVC.ManagementKitchenDemand(kitDemand);
            return Ok();
        }
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
            KitchenDemandDE KitchenDemand = new KitchenDemandDE { Id = id, DBoperation = DBoperations.DeActivate };
            _kitchenDemandSVC.ManagementKitchenDemand(KitchenDemand);
        }

        #endregion
    }
}

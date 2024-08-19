using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Restaurant.Core.Entities;
using Restaurant.Core.Enums;
using Restaurant.Service;

namespace Restaurant.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class DemandController : ControllerBase
    {
        #region Class Variables

        private DemandService _demandSVC;

        #endregion
        #region Constructors
        public DemandController()
        {
            _demandSVC = new DemandService();
        }
        #endregion
        #region Http Verbs

        [HttpGet]
        public ActionResult Get()
        {
            DemandDE Demand = new DemandDE { IsActive=true};
            List<DemandDE> list = _demandSVC.SearchDemands(Demand);
            return Ok(list);
        }
        [HttpGet("{id}")]
        public ActionResult GetDemandById(int id)
        {
            DemandDE Demand = new DemandDE { Id = id };
            var list = _demandSVC.SearchDemands(Demand);
            return Ok(list);
        }
        [HttpPost("{Search}")]
        public ActionResult Search(DemandDE Search)
        {
            Search.IsActive = true;
            List<DemandDE> list = _demandSVC.SearchDemands(Search);
            return Ok(list);
        }
        [HttpPost]
        public ActionResult Post(DemandDE demand)
        {
            demand.DBoperation = DBoperations.Insert;
            bool Demand = _demandSVC.ManagementDemand(demand);
            return Ok(Demand);
        }
        [HttpPut]
        public ActionResult Put(DemandDE demand)
        {
            demand.DBoperation = DBoperations.Update;
            _demandSVC.ManagementDemand(demand);
            return Ok();
        }
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
            DemandDE Demand = new DemandDE { Id = id, DBoperation = DBoperations.DeActivate };
            _demandSVC.ManagementDemand(Demand);
        }

        #endregion
    }
}

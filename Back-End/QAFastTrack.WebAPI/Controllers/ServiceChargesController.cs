using Microsoft.AspNetCore.Mvc;
using Restaurant.Core.Entities;
using Restaurant.Core.Enums;
using Restaurant.Service;

namespace Restaurant.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ServiceChargesController : ControllerBase
    {
        #region Class Variables
        private ServiceChargesService _ServiceChargesSVC;
        #endregion
        #region Constructor
        public ServiceChargesController()
        {
            _ServiceChargesSVC = new ServiceChargesService();
        }
        #endregion
        #region Http Verbs

        [HttpGet]
        public ActionResult Get()
        {
            ServiceChargesDE ServiceCharges = new ServiceChargesDE();
            List<ServiceChargesDE> ServiceChargess = _ServiceChargesSVC.SearchServiceChargess(ServiceCharges);
            return Ok(ServiceChargess);
        }
        [HttpGet("{id}")]
        public ActionResult GetServiceChargesById(int id)
        {
            ServiceChargesDE ServiceCharges = new ServiceChargesDE { Id = id };
            var ServiceChargess = _ServiceChargesSVC.SearchServiceChargess(ServiceCharges);
            return Ok(ServiceChargess);
        }
        [HttpPost("{Search}")]
        public ActionResult Search(ServiceChargesDE Search)
        {
            // Search.IsActive = true;
            List<ServiceChargesDE> ServiceChargess = _ServiceChargesSVC.SearchServiceChargess(Search);
            return Ok(ServiceChargess);
        }
        [HttpPost]
        public ActionResult Post(ServiceChargesDE ServiceCharges)
        {
            ServiceCharges.DBoperation = DBoperations.Insert;
            bool retVal = _ServiceChargesSVC.ManagementServiceCharges(ServiceCharges);
            return Ok(retVal);
        }
        [HttpPut]
        public ActionResult Put(ServiceChargesDE ServiceCharges)
        {
            ServiceCharges.DBoperation = DBoperations.Update;
            _ServiceChargesSVC.ManagementServiceCharges(ServiceCharges);
            return Ok();
        }
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
            ServiceChargesDE ServiceCharges = new ServiceChargesDE { Id = id, DBoperation = DBoperations.DeActivate };
            _ServiceChargesSVC.ManagementServiceCharges(ServiceCharges);
        }

        #endregion
    }
}

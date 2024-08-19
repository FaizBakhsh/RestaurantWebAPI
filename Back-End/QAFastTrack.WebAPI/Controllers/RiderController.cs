using Microsoft.AspNetCore.Mvc;
using Restaurant.Core.Entities;
using Restaurant.Core.Enums;
using Restaurant.Service;

namespace Restaurant.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RiderController : ControllerBase
    {
        #region Class Variables

        private RiderService _riderSVC;

        #endregion
        #region Constructors
        public RiderController()
        {
            _riderSVC = new RiderService();
        }

        #endregion
        #region Http Verbs

        [HttpGet]
        public ActionResult Get()
        {
            RiderDE Rider = new RiderDE { IsActive = true };
            List<RiderDE> list = _riderSVC.SearchRiders(Rider);
            return Ok(list);
        }
        [HttpGet("{id}")]
        public ActionResult GetRiderById(int id)
        {
            RiderDE Rider = new RiderDE { Id = id };
            var list = _riderSVC.SearchRiders(Rider);
            return Ok(list);
        }
        [HttpPost("{Search}")]
        public ActionResult Search(RiderDE Search)
        {
            Search.IsActive = true;
            List<RiderDE> list = _riderSVC.SearchRiders(Search);
            return Ok(list);
        }
        [HttpPost]
        public ActionResult Post(RiderDE rider)
        {
            rider.DBoperation = DBoperations.Insert;
            bool Rider = _riderSVC.ManagementRider(rider);
            return Ok(Rider);
        }
        [HttpPut]
        public ActionResult Put(RiderDE rider)
        {
            rider.DBoperation = DBoperations.Update;
            _riderSVC.ManagementRider(rider);
            return Ok();
        }
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
            RiderDE Rider = new RiderDE { Id = id, DBoperation = DBoperations.DeActivate };
            _riderSVC.ManagementRider(Rider);
        }

        #endregion
    }
}

using Microsoft.AspNetCore.Mvc;
using Restaurant.Core.Entities;
using Restaurant.Core.Enums;
using Restaurant.Service;
// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Restaurant.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class TakeAwayController : ControllerBase
    {
        #region Class Variables

        private TakeAwayService _takeAwaySVC;

        #endregion
        #region Constructors
        public TakeAwayController()
        {
            _takeAwaySVC = new TakeAwayService();
        }

        #endregion
        #region Http Verbs

        [HttpGet]
        public ActionResult Get()
        {
            TakeAwayDE TakeAway = new TakeAwayDE { IsActive = true };
            List<TakeAwayDE> categories = _takeAwaySVC.SearchTakeAway(TakeAway);
            return Ok(categories);
        }
        [HttpGet("{id}")]
        public ActionResult GetTakeAwayById(int id)
        {
            TakeAwayDE TakeAway = new TakeAwayDE { Id = id };
            var categories = _takeAwaySVC.SearchTakeAway(TakeAway);
            return Ok(categories);
        }
        [HttpPost("{Search}")]
        public ActionResult Search(TakeAwayDE Search)
        {
            Search.IsActive = true;
            List<TakeAwayDE> categories = _takeAwaySVC.SearchTakeAway(Search);
            return Ok(categories);
        }

        [HttpPost]
        public ActionResult Post(TakeAwayDE takeAway)
        {
            takeAway.DBoperation = DBoperations.Insert;
            bool TakeAway = _takeAwaySVC.ManagementTakeAway(takeAway);
            return Ok(TakeAway);
        }

        [HttpPut]
        public ActionResult Put(TakeAwayDE takeAway)
        {
            takeAway.DBoperation = DBoperations.Update;
            _takeAwaySVC.ManagementTakeAway(takeAway);
            return Ok();
        }
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
            TakeAwayDE TakeAway = new TakeAwayDE { Id = id, DBoperation = DBoperations.DeActivate };
            _takeAwaySVC.ManagementTakeAway(TakeAway);
        }



        #endregion
    }
}


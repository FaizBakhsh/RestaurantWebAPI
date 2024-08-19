using Microsoft.AspNetCore.Mvc;
using Restaurant.Core.Entities;
using Restaurant.Core.Enums;
using Restaurant.Service;
// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Restaurant.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class DineInController : ControllerBase
    {
        #region Class Variables

        private DineInService _dineInSVC;

        #endregion
        #region Constructors
        public DineInController()
        {
            _dineInSVC = new DineInService();
        }

        #endregion
        #region Http Verbs

        [HttpGet]
        public ActionResult Get()
        {
            DineInDE DineIn = new DineInDE { IsActive = true };
            List<DineInDE> categories = _dineInSVC.SearchDineIns(DineIn);
            return Ok(categories);
        }
        [HttpGet("{id}")]
        public ActionResult GetDineInById(int id)
        {
            DineInDE DineIn = new DineInDE { Id = id };
            var categories = _dineInSVC.SearchDineIns(DineIn);
            return Ok(categories);
        }
        [HttpPost("{Search}")]
        public ActionResult Search(DineInDE Search)
        {
            Search.IsActive = true;
            List<DineInDE> categories = _dineInSVC.SearchDineIns(Search);
            return Ok(categories);
        }

        [HttpPost]
        public ActionResult Post(DineInDE dineIn)
        {
            dineIn.DBoperation = DBoperations.Insert;
            bool DineIn = _dineInSVC.ManagementDineIn(dineIn);
            return Ok(DineIn);
        }

        [HttpPut]
        public ActionResult Put(DineInDE dineIn)
        {
            dineIn.DBoperation = DBoperations.Update;
            _dineInSVC.ManagementDineIn(dineIn);
            return Ok();
        }
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
            DineInDE DineIn = new DineInDE { Id = id, DBoperation = DBoperations.DeActivate };
            _dineInSVC.ManagementDineIn(DineIn);
        }



        #endregion
    }
}


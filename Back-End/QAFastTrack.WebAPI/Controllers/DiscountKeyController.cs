using Microsoft.AspNetCore.Mvc;
using Restaurant.Core.Entities;
using Restaurant.Core.Enums;
using Restaurant.Service;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Restaurant.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class DiscountKeyController : ControllerBase
    {
        #region Class Variables

        private DiscountKeyService _discountKeySVC;

        #endregion
        #region Constructors
        public DiscountKeyController()
        {
            _discountKeySVC = new DiscountKeyService();
        }

        #endregion
        #region Http Verbs

        [HttpGet]
        public ActionResult Get()
        {
            DiscountKeyDE DiscountKey = new DiscountKeyDE ();
            List<DiscountKeyDE> list = _discountKeySVC.SearchDiscountKeys(DiscountKey);
            return Ok(list);
        }
        [HttpGet("{id}")]
        public ActionResult GetDiscountKeyById(int id)
        {
            DiscountKeyDE DiscountKey = new DiscountKeyDE { Id = id };
            var list = _discountKeySVC.SearchDiscountKeys(DiscountKey);
            return Ok(list);
        }
        [HttpPost("{Search}")]
        public ActionResult Search(DiscountKeyDE Search)
        {
           // Search.IsActive = true;
            List<DiscountKeyDE> list = _discountKeySVC.SearchDiscountKeys(Search);
            return Ok(list);
        }
        [HttpPost]
        public ActionResult Post(DiscountKeyDE discountKey)
        {
            discountKey.DBoperation = DBoperations.Insert;
            bool DiscountKey = _discountKeySVC.ManagementDiscountKey(discountKey);
            return Ok(DiscountKey);
        }
        [HttpPut]
        public ActionResult Put(DiscountKeyDE discountKey)
        {
            discountKey.DBoperation = DBoperations.Update;
            _discountKeySVC.ManagementDiscountKey(discountKey);
            return Ok();
        }
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
            DiscountKeyDE DiscountKey = new DiscountKeyDE { Id = id, DBoperation = DBoperations.DeActivate };
            _discountKeySVC.ManagementDiscountKey(DiscountKey);
        }

        #endregion
    }
}

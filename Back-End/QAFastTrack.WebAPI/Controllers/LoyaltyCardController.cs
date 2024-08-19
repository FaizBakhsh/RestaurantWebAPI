using Microsoft.AspNetCore.Mvc;
using Restaurant.Core.Entities;
using Restaurant.Core.Enums;
using Restaurant.Service;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Restaurant.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LoyaltyCardController : ControllerBase
    {
        #region Class Variables

        private LoyaltyCardService _LoyaltyCardSVC;

        #endregion
        #region Constructors
        public LoyaltyCardController()
        {
            _LoyaltyCardSVC = new LoyaltyCardService();
        }

        #endregion
        #region Http Verbs

        [HttpGet]
        public ActionResult Get()
        {
            LoyaltyCardDE LoyaltyCard = new LoyaltyCardDE ();
            List<LoyaltyCardDE> list = _LoyaltyCardSVC.SearchLoyaltyCards(LoyaltyCard);
            return Ok(list);
        }
        [HttpGet("{id}")]
        public ActionResult GetLoyaltyCardById(int id)
        {
            LoyaltyCardDE LoyaltyCard = new LoyaltyCardDE { Id = id };
            var list = _LoyaltyCardSVC.SearchLoyaltyCards(LoyaltyCard);
            return Ok(list);
        }
        [HttpPost("{Search}")]
        public ActionResult Search(LoyaltyCardDE Search)
        {
            //Search.IsActive = true;
            List<LoyaltyCardDE> list = _LoyaltyCardSVC.SearchLoyaltyCards(Search);
            return Ok(list);
        }
        [HttpPost]
        public ActionResult Post(LoyaltyCardDE card)
        {
            card.DBoperation = DBoperations.Insert;
            bool LoyaltyCard = _LoyaltyCardSVC.ManagementLoyaltyCard(card);
            return Ok(LoyaltyCard);
        }
        [HttpPut]
        public ActionResult Put(LoyaltyCardDE card)
        {
            card.DBoperation = DBoperations.Update;
            _LoyaltyCardSVC.ManagementLoyaltyCard(card);
            return Ok();
        }
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
            LoyaltyCardDE LoyaltyCard = new LoyaltyCardDE { Id = id, DBoperation = DBoperations.DeActivate };
            _LoyaltyCardSVC.ManagementLoyaltyCard(LoyaltyCard);
        }

        #endregion
    }
}

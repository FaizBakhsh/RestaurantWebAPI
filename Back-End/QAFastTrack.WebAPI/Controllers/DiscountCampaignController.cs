using Microsoft.AspNetCore.Mvc;
using Restaurant.Core.Entities;
using Restaurant.Core.Enums;
using Restaurant.Service;

namespace Restaurant.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class DiscountCampaignController : ControllerBase
    {
        #region Class Variables

        private DiscountCampaignService _DiscountCampaignSVC;

        #endregion
        #region Constructors
        public DiscountCampaignController()
        {
            _DiscountCampaignSVC = new DiscountCampaignService();
        }

        #endregion
        #region Http Verbs

        [HttpGet]
        public ActionResult Get()
        {
            DiscountCampaignDE campaign = new DiscountCampaignDE ();
            List<DiscountCampaignDE> campaigns = _DiscountCampaignSVC.SearchDiscountCampaigns(campaign);
            return Ok(campaigns);
        }
        [HttpGet("{id}")]
        public ActionResult GetDiscountCampaignById(int id)
        {
            DiscountCampaignDE campaign = new DiscountCampaignDE { Id = id };
            var campaigns = _DiscountCampaignSVC.SearchDiscountCampaigns(campaign);
            return Ok(campaign);
        }
        [HttpPost("{Search}")]
        public ActionResult Search(DiscountCampaignDE Search)
        {
           // Search.IsActive = true;
            List<DiscountCampaignDE> campaigns = _DiscountCampaignSVC.SearchDiscountCampaigns(Search);
            return Ok(campaigns);
        }
        [HttpPost]
        public ActionResult Post(DiscountCampaignDE campaign)
        {
            campaign.DBoperation = DBoperations.Insert;
            bool DiscountCampaign = _DiscountCampaignSVC.ManagementDiscountCampaign(campaign);
            return Ok(DiscountCampaign);
        }
        [HttpPut]
        public ActionResult Put(DiscountCampaignDE campaign)
        {
            campaign.DBoperation = DBoperations.Update;
            _DiscountCampaignSVC.ManagementDiscountCampaign(campaign);
            return Ok();
        }
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
            DiscountCampaignDE campaign = new DiscountCampaignDE { Id = id, DBoperation = DBoperations.DeActivate };
            _DiscountCampaignSVC.ManagementDiscountCampaign(campaign);
        }

        #endregion
    }
}

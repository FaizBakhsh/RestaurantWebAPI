using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Restaurant.Core.Entities;
using Restaurant.Core.Entities.Security;
using Restaurant.Core.Enums;
using Restaurant.Service;

namespace Restaurant.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class OnlineDBSettingController : ControllerBase
    {
        #region Class Variables
        private OnlineDBSettingService _onlineDBSVC;
        #endregion
        #region Constructor
        public OnlineDBSettingController()
        {
            _onlineDBSVC = new OnlineDBSettingService();
        }
        #endregion
        #region Http Verbs

        [HttpGet]
        public ActionResult Get()
        {
            OnlineDBSettingDE OnlineDBSetting = new OnlineDBSettingDE { IsActive = true };
            List<OnlineDBSettingDE> OnlineDBSettings = _onlineDBSVC.SearchOnlineDBSettings(OnlineDBSetting);
            return Ok(OnlineDBSettings);
        }
        [HttpGet("{id}")]
        public ActionResult GetOnlineDBSettingById(int id)
        {
            OnlineDBSettingDE onlineDBSetting = new OnlineDBSettingDE { Id = id };
            var OnlineDBSettings = _onlineDBSVC.SearchOnlineDBSettings(onlineDBSetting);
            return Ok(OnlineDBSettings);
        }
        [HttpPost("{Search}")]
        public ActionResult Search(OnlineDBSettingDE Search)
        {
            Search.IsActive = true;
            List<OnlineDBSettingDE> OnlineDBSettings = _onlineDBSVC.SearchOnlineDBSettings(Search);
            return Ok(OnlineDBSettings);
        }
        [HttpPost]
        public ActionResult Post(OnlineDBSettingDE onlineDBSetting)
        {
            onlineDBSetting.DBoperation = DBoperations.Insert;
            bool OnlineDBSetting = _onlineDBSVC.ManagementOnlineDBSetting(onlineDBSetting);
            return Ok(OnlineDBSetting);
        }
        [HttpPut]
        public ActionResult Put(OnlineDBSettingDE onlineDBSetting)
        {
            onlineDBSetting.DBoperation = DBoperations.Update;
            _onlineDBSVC.ManagementOnlineDBSetting(onlineDBSetting);
            return Ok();
        }
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
            OnlineDBSettingDE OnlineDBSetting = new OnlineDBSettingDE { Id = id, DBoperation = DBoperations.DeActivate };
            _onlineDBSVC.ManagementOnlineDBSetting(OnlineDBSetting);
        }

        #endregion
    }
}

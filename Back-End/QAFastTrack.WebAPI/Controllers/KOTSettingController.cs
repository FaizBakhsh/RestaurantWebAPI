using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Restaurant.Core.Entities;
using Restaurant.Core.Enums;
using Restaurant.Service;

namespace Restaurant.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class KOTSettingController : ControllerBase
    {
        #region Class Variables

        private KOTSettingService _kotSettingSVC;

        #endregion
        #region Constructors
        public KOTSettingController()
        {
            _kotSettingSVC = new KOTSettingService();
        }
        #endregion
        #region Http Verbs

        [HttpGet]
        public ActionResult Get()
        {
            KOTSettingDE KOTSetting = new KOTSettingDE { IsActive = true };
            List<KOTSettingDE> list = _kotSettingSVC.SearchKOTSettings(KOTSetting);
            return Ok(list);
        }
        [HttpGet("{id}")]
        public ActionResult GetKOTSettingById(int id)
        {
            KOTSettingDE KOTSetting = new KOTSettingDE { Id = id };
            var list = _kotSettingSVC.SearchKOTSettings(KOTSetting);
            return Ok(list);
        }
        [HttpPost("{Search}")]
        public ActionResult Search(KOTSettingDE Search)
        {
            Search.IsActive = true;
            List<KOTSettingDE> list = _kotSettingSVC.SearchKOTSettings(Search);
            return Ok(list);
        }
        [HttpPost]
        public ActionResult Post(KOTSettingDE kotSetting)
        {
            kotSetting.DBoperation = DBoperations.Insert;
            bool KOTSetting = _kotSettingSVC.ManagementKOTSetting(kotSetting);
            return Ok(KOTSetting);
        }
        [HttpPut]
        public ActionResult Put(KOTSettingDE kotSetting)
        {
            kotSetting.DBoperation = DBoperations.Update;
            _kotSettingSVC.ManagementKOTSetting(kotSetting);
            return Ok();
        }
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
            KOTSettingDE KOTSetting = new KOTSettingDE { Id = id, DBoperation = DBoperations.DeActivate };
            _kotSettingSVC.ManagementKOTSetting(KOTSetting);
        }

        #endregion
    }
}

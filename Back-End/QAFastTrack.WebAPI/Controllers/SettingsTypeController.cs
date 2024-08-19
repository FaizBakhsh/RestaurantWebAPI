using Microsoft.AspNetCore.Mvc;
using Restaurant.Core.Entities;
using Restaurant.Core.Enums;
using Restaurant.Service;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Restaurant.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SettingsTypeController : ControllerBase
    {
        #region Class Variables
        private SettingsTypeService _settingsTypeSVC;
        #endregion
        #region Constructor
        public SettingsTypeController()
        {
            _settingsTypeSVC = new SettingsTypeService();
        }
        #endregion
        #region Http Verbs

        [HttpGet]
        public ActionResult Get()
        {
            SettingsTypeDE SettingsType = new SettingsTypeDE { IsActive=true};
            List<SettingsTypeDE> list = _settingsTypeSVC.SearchSettingsTypes(SettingsType);
            return Ok(list);
        }
        [HttpGet("{id}")]
        public ActionResult GetSettingsTypeById(int id)
        {
            SettingsTypeDE SettingsType = new SettingsTypeDE { Id = id };
            var list = _settingsTypeSVC.SearchSettingsTypes(SettingsType);
            return Ok(list);
        }
        [HttpPost("{Search}")]
        public ActionResult Search(SettingsTypeDE Search)
        {
            Search.IsActive = true;
            List<SettingsTypeDE> list = _settingsTypeSVC.SearchSettingsTypes(Search);
            return Ok(list);
        }
        [HttpPost ("Enum")]
        public ActionResult SearchEnum ( SettingsTypeDE Search )
        {
            //Search.IsActive = true;
            List<SettingsTypeDE> retVal = _settingsTypeSVC.SearchEnums (Search);
            return Ok (retVal);
        }
        [HttpPost]
        public ActionResult Post(SettingsTypeDE stngType)
        {
            stngType.DBoperation = DBoperations.Insert;
            bool SettingsType = _settingsTypeSVC.ManagementSettingsType(stngType);
            return Ok(SettingsType);
        }
        [HttpPut]
        public ActionResult Put(SettingsTypeDE stngType)
        {
            stngType.DBoperation = DBoperations.Update;
            _settingsTypeSVC.ManagementSettingsType(stngType);
            return Ok();
        }
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
            SettingsTypeDE SettingsType = new SettingsTypeDE { Id = id, DBoperation = DBoperations.DeActivate };
            _settingsTypeSVC.ManagementSettingsType(SettingsType);
        }

        #endregion
    }
}

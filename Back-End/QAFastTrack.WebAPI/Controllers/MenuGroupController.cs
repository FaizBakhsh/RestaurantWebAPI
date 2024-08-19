using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Restaurant.Core.Entities;
using Restaurant.Core.Enums;
using Restaurant.Service;

namespace Restaurant.WebAPI.Controllers
{
    [Route ("api/[controller]")]
    [ApiController]
    public class MenuGroupController : ControllerBase
    {
        #region Class Variables

        private MenuGroupService _MenuGroupSvc;

        #endregion
        #region Constructors
        public MenuGroupController ( )
        {
            _MenuGroupSvc = new MenuGroupService ();
        }

        #endregion
        #region Http Verbs

        [HttpGet]
        public ActionResult Get ( )
        {
            MenuGroupDE MenuGroup = new MenuGroupDE ();
            List<MenuGroupDE> list = _MenuGroupSvc.SearchMenuGroups (MenuGroup);
            return Ok (list);
        }
        [HttpGet ("{id}")]
        public ActionResult GetMenuGroupById ( int id )
        {
            MenuGroupDE MenuGroup = new MenuGroupDE { Id = id };
            var list = _MenuGroupSvc.SearchMenuGroups (MenuGroup);
            return Ok (list);
        }
        [HttpPost ("{Search}")]
        public ActionResult Search ( MenuGroupDE Search )
        {
            // Search.IsActive = true;
            List<MenuGroupDE> list = _MenuGroupSvc.SearchMenuGroups (Search);
            return Ok (list);
        }
        [HttpPost]
        public ActionResult Post ( MenuGroupDE MenuGroup )
        {
            MenuGroup.DBoperation = DBoperations.Insert;
            bool retVal = _MenuGroupSvc.ManageMenuGroup (MenuGroup);
            return Ok (retVal);
        }
        [HttpPut]
        public ActionResult Put ( MenuGroupDE MenuGroup )
        {
            MenuGroup.DBoperation = DBoperations.Update;
            bool retVal = _MenuGroupSvc.ManageMenuGroup (MenuGroup);
            return Ok (retVal);
        }
        [HttpDelete ("{id}")]
        public void Delete ( int id )
        {
            MenuGroupDE MenuGroup = new MenuGroupDE { Id = id, DBoperation = DBoperations.DeActivate };
            _MenuGroupSvc.ManageMenuGroup (MenuGroup);
        }

        #endregion
    }
}

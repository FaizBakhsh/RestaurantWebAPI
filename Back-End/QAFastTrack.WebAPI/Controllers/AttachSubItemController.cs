using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Restaurant.Core.Entities;
using Restaurant.Core.Enums;
using Restaurant.Service;

namespace Restaurant.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AttachSubItemController : ControllerBase
    {
        #region Class Variables

        private AttachSubItemService _attachSubItemSVC;

        #endregion
        #region Constructors
        public AttachSubItemController()
        {
            _attachSubItemSVC = new AttachSubItemService();
        }
        #endregion
        #region Http Verbs

        [HttpGet]
        public ActionResult Get()
        {
            AttachSubItemDE AttachSubItem = new AttachSubItemDE { IsActive = true };
            List<AttachSubItemDE> list = _attachSubItemSVC.SearchAttachSubItems(AttachSubItem);
            return Ok(list);
        }
        [HttpGet("{id}")]
        public ActionResult GetAttachSubItemById(int id)
        {
            AttachSubItemDE AttachSubItem = new AttachSubItemDE { Id = id };
            var list = _attachSubItemSVC.SearchAttachSubItems(AttachSubItem);
            return Ok(list);
        }
        [HttpPost("{Search}")]
        public ActionResult Search(AttachSubItemDE Search)
        {
            Search.IsActive = true;
            List<AttachSubItemDE> list = _attachSubItemSVC.SearchAttachSubItems(Search);
            return Ok(list);
        }
        [HttpPost]
        public ActionResult Post(AttachSubItemDE subItem)
        {
            subItem.DBoperation = DBoperations.Insert;
            bool AttachSubItem = _attachSubItemSVC.ManagementAttachSubItem(subItem);
            return Ok(AttachSubItem);
        }
        [HttpPut]
        public ActionResult Put(AttachSubItemDE subItem)
        {
            subItem.DBoperation = DBoperations.Update;
            _attachSubItemSVC.ManagementAttachSubItem(subItem);
            return Ok();
        }
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
            AttachSubItemDE AttachSubItem = new AttachSubItemDE { Id = id, DBoperation = DBoperations.DeActivate };
            _attachSubItemSVC.ManagementAttachSubItem(AttachSubItem);
        }

        #endregion
    }
}

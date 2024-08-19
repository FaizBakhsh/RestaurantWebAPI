using Microsoft.AspNetCore.Mvc;
using Restaurant.Core.Entities;
using Restaurant.Core.Enums;
using Restaurant.Service;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Restaurant.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SubItemController : ControllerBase
    {
        #region Class Variables

        private SubItemService _SubItemSVC;

        #endregion
        #region Constructors
        public SubItemController()
        {
            _SubItemSVC = new SubItemService();
        }
        #endregion
        #region Http Verbs

        [HttpGet]
        public ActionResult Get()
        {
            SubItemDE SubItem = new SubItemDE ();
            List<SubItemDE> list = _SubItemSVC.SearchSubItems(SubItem);
            return Ok(list);
        }
        [HttpGet("{id}")]
        public ActionResult GetSubItemById(int id)
        {
            SubItemDE SubItem = new SubItemDE { Id = id };
            var list = _SubItemSVC.SearchSubItems(SubItem);
            return Ok(list);
        }
        [HttpPost("{Search}")]
        public ActionResult Search(SubItemDE Search)
        {
           // Search.IsActive = true;
            List<SubItemDE> list = _SubItemSVC.SearchSubItems(Search);
            return Ok(list);
        }
        [HttpPost]
        public ActionResult Post(SubItemDE subItem)
        {
            subItem.DBoperation = DBoperations.Insert;
            bool SubItem = _SubItemSVC.ManagementSubItem(subItem);
            return Ok(SubItem);
        }
        [HttpPut]
        public ActionResult Put(SubItemDE subItem)
        {
            subItem.DBoperation = DBoperations.Update;
            _SubItemSVC.ManagementSubItem(subItem);
            return Ok();
        }
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
            SubItemDE SubItem = new SubItemDE { Id = id, DBoperation = DBoperations.DeActivate };
            _SubItemSVC.ManagementSubItem(SubItem);
        }

        #endregion
    }
}

using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Restaurant.Core.Entities;
using Restaurant.Core.Enums;
using Restaurant.Service;

namespace Restaurant.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class StaffController : ControllerBase
    {

        #region Class Variables

        private StaffService _staffSVC;

        #endregion
        #region Constructors
        public StaffController()
        {
            _staffSVC = new StaffService();
        }

        #endregion
        #region Http Verbs

        [HttpGet]
        public ActionResult Get()
        {
            StaffDE Staff = new StaffDE ();
            List<StaffDE> list = _staffSVC.SearchStaffs(Staff);
            return Ok(list);
        }
        [HttpGet("{id}")]
        public ActionResult GetStaffById(int id)
        {
            StaffDE Staff = new StaffDE { Id = id };
            var list = _staffSVC.SearchStaffs(Staff);
            return Ok(list);
        }
        [HttpPost("{Search}")]
        public ActionResult Search(StaffDE Search)
        {
            //Search.IsActive = true;
            List<StaffDE> list = _staffSVC.SearchStaffs(Search);
            return Ok(list);
        }
        [HttpPost]
        public ActionResult Post(StaffDE staff)
        {
            staff.DBoperation = DBoperations.Insert;
            bool Staff = _staffSVC.ManagementStaff(staff);
            return Ok(staff);
        }
        [HttpPut]
        public ActionResult Put(StaffDE staff)
        {
            staff.DBoperation = DBoperations.Update;
            _staffSVC.ManagementStaff(staff);
            return Ok();
        }
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
            StaffDE Staff = new StaffDE { Id = id, DBoperation = DBoperations.DeActivate };
            _staffSVC.ManagementStaff(Staff);
        }

        #endregion
    }
}


using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Restaurant.Core.Entities;
using Restaurant.Core.Enums;
using Restaurant.Service;

namespace Restaurant.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class EmployeeAttendanceController : ControllerBase
    {
        #region Class Variables

        private EmployeeAttendanceService _atndSVC;

        #endregion
        #region Constructors
        public EmployeeAttendanceController()
        {
            _atndSVC = new EmployeeAttendanceService();
        }

        #endregion
        #region Http Verbs

        [HttpGet]
        public ActionResult Get()
        {
            EmployeeAttendanceDE EmployeeAttendance = new EmployeeAttendanceDE { IsActive = true };
            List<EmployeeAttendanceDE> list = _atndSVC.SearchEmployeeAttendances(EmployeeAttendance);
            return Ok(list);
        }
        [HttpGet("{id}")]
        public ActionResult GetEmployeeAttendanceById(int id)
        {
            EmployeeAttendanceDE EmployeeAttendance = new EmployeeAttendanceDE { Id = id };
            var list = _atndSVC.SearchEmployeeAttendances(EmployeeAttendance);
            return Ok(list);
        }
        [HttpPost("{Search}")]
        public ActionResult Search(EmployeeAttendanceDE Search)
        {
            Search.IsActive = true;
            List<EmployeeAttendanceDE> list = _atndSVC.SearchEmployeeAttendances(Search);
            return Ok(list);
        }
        [HttpPost]
        public ActionResult Post(EmployeeAttendanceDE atnd)
        {
            atnd.DBoperation = DBoperations.Insert;
            bool EmployeeAttendance = _atndSVC.ManagementEmployeeAttendance(atnd);
            return Ok(EmployeeAttendance);
        }
        [HttpPut]
        public ActionResult Put(EmployeeAttendanceDE atnd)
        {
            atnd.DBoperation = DBoperations.Update;
            _atndSVC.ManagementEmployeeAttendance(atnd);
            return Ok();
        }
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
            EmployeeAttendanceDE EmployeeAttendance = new EmployeeAttendanceDE { Id = id, DBoperation = DBoperations.DeActivate };
            _atndSVC.ManagementEmployeeAttendance(EmployeeAttendance);
        }

        #endregion
    }
}

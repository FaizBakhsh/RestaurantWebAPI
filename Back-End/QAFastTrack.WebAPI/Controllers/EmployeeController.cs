using Microsoft.AspNetCore.Mvc;
using Restaurant.Core.Entities;
using Restaurant.Core.Enums;
using Restaurant.Service;
// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Restaurant.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class EmployeeController : ControllerBase
    {
        #region Class Variables

        private EmployeeService _employeeSVC;

        #endregion
        #region Constructors
        public EmployeeController()
        {
            _employeeSVC = new EmployeeService();
        }

        #endregion
        #region Http Verbs

        [HttpGet]
        public ActionResult Get()
        {
            EmployeeDE Employee = new EmployeeDE ();
            List<EmployeeDE> list = _employeeSVC.SearchEmployees(Employee);
            return Ok(list);
        }
        [HttpGet("{id}")]
        public ActionResult GetEmployeeById(int id)
        {
            EmployeeDE Employee = new EmployeeDE { Id = id };
            var list = _employeeSVC.SearchEmployees(Employee);
            return Ok(list);
        }
        [HttpPost("{Search}")]
        public ActionResult Search(EmployeeDE Search)
        {
            //Search.IsActive = true;
            List<EmployeeDE> list = _employeeSVC.SearchEmployees(Search);
            return Ok(list);
        }
        [HttpPost]
        public ActionResult Post(EmployeeDE employee)
        {
            employee.DBoperation = DBoperations.Insert;
            bool Employee = _employeeSVC.ManagementEmployee(employee);
            return Ok(Employee);
        }
        [HttpPut]
        public ActionResult Put(EmployeeDE employee)
        {
            employee.DBoperation = DBoperations.Update;
            _employeeSVC.ManagementEmployee(employee);
            return Ok();
        }
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
            EmployeeDE Employee = new EmployeeDE { Id = id, DBoperation = DBoperations.DeActivate };
            _employeeSVC.ManagementEmployee(Employee);
        }

        #endregion
    }
}

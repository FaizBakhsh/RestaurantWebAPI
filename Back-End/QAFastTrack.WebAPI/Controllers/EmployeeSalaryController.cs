using Microsoft.AspNetCore.Mvc;
using Restaurant.Core.Entities;
using Restaurant.Core.Enums;
using Restaurant.Core.ViewModel;
using Restaurant.Service;

namespace Restaurant.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class EmployeeSalaryController : ControllerBase
    {
        #region Class Variables

        private EmployeeSalaryService _empSalSVC;

        #endregion
        #region Constructors
        public EmployeeSalaryController()
        {
            _empSalSVC = new EmployeeSalaryService();
        }
        #endregion
        #region Http Verbs

        [HttpGet]
        public ActionResult Get()
        {
            EmployeeSalaryDE EmployeeSalary = new EmployeeSalaryDE { IsActive = true };
            List<EmployeeSalaryDE> EmployeeSalarys = _empSalSVC.SearchEmployeeSalary(EmployeeSalary);
            return Ok(EmployeeSalarys);
        }
        [HttpGet("{id}")]
        public ActionResult GetEmployeeSalaryById(int id)
        {
            EmployeeSalaryDE EmployeeSalary = new EmployeeSalaryDE { Id = id };
            var EmployeeSalarys = _empSalSVC.SearchEmployeeSalary(EmployeeSalary);
            return Ok(EmployeeSalarys);
        }
        [HttpPost("{Search}")]
        public ActionResult Search(EmployeeSalaryDE Search)
        {
            Search.IsActive = true;
            List<EmployeeSalaryDE> EmployeeSalary = _empSalSVC.SearchEmployeeSalary(Search);
            return Ok(EmployeeSalary);
        }
        [HttpPost]
        public ActionResult Post(EmployeeSalaryDE empSal)
        {
            empSal.DBoperation = DBoperations.Insert;
            bool EmployeeSalary = _empSalSVC.ManagementEmployeeSalary(empSal);
            return Ok(EmployeeSalary);
        }
        [HttpPut]
        public ActionResult Put(EmployeeSalaryDE empSal)
        {
            empSal.DBoperation = DBoperations.Update;
            _empSalSVC.ManagementEmployeeSalary(empSal);
            return Ok();
        }
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
            EmployeeSalaryDE empSal = new EmployeeSalaryDE { Id = id, DBoperation = DBoperations.DeActivate };
            _empSalSVC.ManagementEmployeeSalary(empSal);
        }

        #endregion
    }
}

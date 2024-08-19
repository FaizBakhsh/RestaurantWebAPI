using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Restaurant.Core.Entities;
using Restaurant.Core.Enums;
using Restaurant.DAL;
using Restaurant.Service;

namespace Restaurant.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class EmployeeSaleController : ControllerBase
    {
        #region Class Variables

        private EmployeeSaleService _EmployeeSaleSVC;

        #endregion
        #region Constructors
        public EmployeeSaleController()
        {
            _EmployeeSaleSVC = new EmployeeSaleService();
        }

        #endregion
        #region Http Verbs

        [HttpGet]
        public ActionResult Get()
        {
            EmployeeSaleDE EmployeeSale = new EmployeeSaleDE { IsActive = true };
            List<EmployeeSaleDE> list = _EmployeeSaleSVC.SearchEmployeeSales(EmployeeSale);
            return Ok(list);
        }
        [HttpGet("{id}")]
        public ActionResult GetEmployeeSaleById(int id)
        {
            EmployeeSaleDE EmployeeSale = new EmployeeSaleDE { Id = id };
            var list = _EmployeeSaleSVC.SearchEmployeeSales(EmployeeSale);
            return Ok(list);
        }
        [HttpPost("{Search}")]
        public ActionResult Search(EmployeeSaleDE Search)
        {
            Search.IsActive = true;
            List<EmployeeSaleDE> list = _EmployeeSaleSVC.SearchEmployeeSales(Search);
            return Ok(list);
        }
        [HttpPost]
        public ActionResult Post(EmployeeSaleDE employeesale)
        {
            employeesale.DBoperation = DBoperations.Insert;
            bool EmployeeSale = _EmployeeSaleSVC.ManagementEmployeeSale(employeesale);
            return Ok(EmployeeSale);
        }
        [HttpPut]
        public ActionResult Put(EmployeeSaleDE employeesale)
        {
            employeesale.DBoperation = DBoperations.Update;
            _EmployeeSaleSVC.ManagementEmployeeSale(employeesale);
            return Ok();
        }
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
            EmployeeSaleDE EmployeeSale = new EmployeeSaleDE { Id = id, DBoperation = DBoperations.DeActivate };
            _EmployeeSaleSVC.ManagementEmployeeSale(EmployeeSale);
        }

        #endregion
    }
}


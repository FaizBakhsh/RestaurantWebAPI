using Microsoft.AspNetCore.Mvc;
using Restaurant.Core.Entities;
using Restaurant.Core.Enums;
using Restaurant.Service;

namespace Restaurant.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ExpensesController : ControllerBase
    {
        #region Class Variables

        private ExpensesService _expensesSVC;

        #endregion
        #region Constructors
        public ExpensesController()
        {
            _expensesSVC = new ExpensesService();
        }

        #endregion
        #region Http Verbs

        [HttpGet]
        public ActionResult Get()
        {
            try
            {
                ExpensesDE Expenses = new ExpensesDE { IsActive=true};
                List<ExpensesDE> list = _expensesSVC.SearchExpenses(Expenses);
                return Ok(list);
            }
            catch (Exception)
            {
                throw;
            }
        }
        [HttpGet("{id}")]
        public ActionResult GetExpensesById(int id)
        {
            try
            {
                ExpensesDE Expenses = new ExpensesDE { Id = id };
                var list = _expensesSVC.SearchExpenses(Expenses);
                return Ok(list);
            }
            catch (Exception)
            {
                throw;
            }
        }
        [HttpPost("{Search}")]
        public ActionResult Search(ExpensesDE Search)
        {
            try
            {
                Search.IsActive = true;
                List<ExpensesDE> list = _expensesSVC.SearchExpenses(Search);
                return Ok(list);
            }
            catch (Exception)
            {
                throw;
            }

        }
        [HttpPost]
        public ActionResult Post(ExpensesDE expenses)
        {
            try
            {
                expenses.DBoperation = DBoperations.Insert;
                bool f = _expensesSVC.ManagementExpenses(expenses);
                return Ok(f);
            }
            catch (Exception)
            {
                throw;
            }

        }
        [HttpPut]
        public ActionResult Put(ExpensesDE expenses)
        {
            try
            {
                expenses.DBoperation = DBoperations.Update;
                _expensesSVC.ManagementExpenses(expenses);
                return Ok();
            }
            catch (Exception)
            {

                throw;
            }
        }
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
            try
            {
                ExpensesDE Expenses = new ExpensesDE { Id = id, DBoperation = DBoperations.DeActivate };
                _expensesSVC.ManagementExpenses(Expenses);
            }
            catch (Exception)
            {

                throw;
            }
        }

        #endregion
    }
}

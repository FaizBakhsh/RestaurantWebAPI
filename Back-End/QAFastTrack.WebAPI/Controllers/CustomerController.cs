using Microsoft.AspNetCore.Mvc;
using Restaurant.Core.Entities;
using Restaurant.Core.Enums;
using Restaurant.Service;
// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Restaurant.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CustomerController : ControllerBase
    {
        #region Class Variables

        private CustomerService _customerSVC;

        #endregion
        #region Constructors
        public CustomerController()
        {
            _customerSVC = new CustomerService();
        }

        #endregion
        #region Http Verbs

        [HttpGet]
        public ActionResult Get()
        {
            CustomerDE Customer = new CustomerDE ();
            List<CustomerDE> list = _customerSVC.SearchCustomers(Customer);
            return Ok(list);
        }
        [HttpGet("{id}")]
        public ActionResult GetCustomerById(int id)
        {
            CustomerDE Customer = new CustomerDE { Id = id };
            var list = _customerSVC.SearchCustomers(Customer);
            return Ok(list);
        }
        [HttpPost("{Search}")]
        public ActionResult Search(CustomerDE Search)
        {
           // Search.IsActive = true;
            List<CustomerDE> list = _customerSVC.SearchCustomers(Search);
            return Ok(list);
        }

        [HttpPost]
        public ActionResult Post(CustomerDE customer)
        {
            customer.DBoperation = DBoperations.Insert;
            bool Customer = _customerSVC.ManagementCustomer(customer);
            return Ok(Customer);
        }

        [HttpPut]
        public ActionResult Put(CustomerDE customer)
        {
            customer.DBoperation = DBoperations.Update;
            _customerSVC.ManagementCustomer(customer);
            return Ok();
        }
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
            CustomerDE Customer = new CustomerDE { Id = id, DBoperation = DBoperations.DeActivate };
            _customerSVC.ManagementCustomer(Customer);
        }

        #endregion
    }
}

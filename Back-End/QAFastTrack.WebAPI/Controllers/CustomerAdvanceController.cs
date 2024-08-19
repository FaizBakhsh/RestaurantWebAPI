using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Restaurant.Core.Entities;
using Restaurant.Core.Enums;
using Restaurant.Service;

namespace Restaurant.WebAPI.Controllers
{
    [Route ("api/[controller]")]
    [ApiController]
    public class CustomerAdvanceController : ControllerBase
    {
        #region Class Variables

        private CustomerAdvanceService _custAdvSVC;

        #endregion
        #region Constructors
        public CustomerAdvanceController ( )
        {
            _custAdvSVC = new CustomerAdvanceService ();
        }

        #endregion
        #region Http Verbs

        [HttpGet]
        public ActionResult Get ( )
        {
            CustomerAdvanceDE CustomerAdvance = new CustomerAdvanceDE { IsActive = true };
            List<CustomerAdvanceDE> list = _custAdvSVC.SearchCustomerAdvances (CustomerAdvance);
            return Ok (list);
        }
        [HttpGet ("{id}")]
        public ActionResult GetCustomerAdvanceById ( int id )
        {
            CustomerAdvanceDE CustomerAdvance = new CustomerAdvanceDE { Id = id };
            var list = _custAdvSVC.SearchCustomerAdvances (CustomerAdvance);
            return Ok (list);
        }
        [HttpPost ("{Search}")]
        public ActionResult Search ( CustomerAdvanceDE Search )
        {
            Search.IsActive = true;
            List<CustomerAdvanceDE> list = _custAdvSVC.SearchCustomerAdvances (Search);
            return Ok (list);
        }
        [HttpPost]
        public ActionResult Post ( CustomerAdvanceDE code )
        {
            code.DBoperation = DBoperations.Insert;
            bool CustomerAdvance = _custAdvSVC.ManagementCustomerAdvance (code);
            return Ok (CustomerAdvance);
        }
        [HttpPut]
        public ActionResult Put ( CustomerAdvanceDE code )
        {
            code.DBoperation = DBoperations.Update;
            _custAdvSVC.ManagementCustomerAdvance (code);
            return Ok ();
        }
        [HttpDelete ("{id}")]
        public void Delete ( int id )
        {
            CustomerAdvanceDE CustomerAdvance = new CustomerAdvanceDE { Id = id, DBoperation = DBoperations.DeActivate };
            _custAdvSVC.ManagementCustomerAdvance (CustomerAdvance);
        }

        #endregion
    }
}

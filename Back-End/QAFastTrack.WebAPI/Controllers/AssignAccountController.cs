using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Restaurant.Core.Entities;
using Restaurant.Core.Enums;
using Restaurant.Service;

namespace Restaurant.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AssignAccountController : ControllerBase
    {
        #region Class Variables

        private AssignAccountService _assignAccountSVC;

        #endregion
        #region Constructors
        public AssignAccountController()
        {
            _assignAccountSVC = new AssignAccountService();
        }

        #endregion
        #region Http Verbs

        [HttpGet]
        public ActionResult Get()
        {
            AssignAccountDE AssignAccount = new AssignAccountDE { IsActive=true};
            List<AssignAccountDE> list = _assignAccountSVC.SearchAssignAccounts(AssignAccount);
            return Ok(list);
        }
        [HttpGet("{id}")]
        public ActionResult GetAssignAccountById(int id)
        {
            AssignAccountDE AssignAccount = new AssignAccountDE { Id = id };
            var list = _assignAccountSVC.SearchAssignAccounts(AssignAccount);
            return Ok(list);
        }
        [HttpPost("{Search}")]
        public ActionResult Search(AssignAccountDE Search)
        {
            Search.IsActive = true;
            List<AssignAccountDE> list = _assignAccountSVC.SearchAssignAccounts(Search);
            return Ok(list);
        }
        [HttpPost]
        public ActionResult Post(AssignAccountDE account)
        {
            account.DBoperation = DBoperations.Insert;
            bool AssignAccount = _assignAccountSVC.ManagementAssignAccount(account);
            return Ok(AssignAccount);
        }
        [HttpPut]
        public ActionResult Put(AssignAccountDE account)
        {
            account.DBoperation = DBoperations.Update;
            _assignAccountSVC.ManagementAssignAccount(account);
            return Ok();
        }
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
            AssignAccountDE AssignAccount = new AssignAccountDE { Id = id, DBoperation = DBoperations.DeActivate };
            _assignAccountSVC.ManagementAssignAccount(AssignAccount);
        }

        #endregion
    }
}

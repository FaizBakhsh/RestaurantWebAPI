using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Restaurant.Core.Entities;
using Restaurant.Core.Enums;
using Restaurant.Service;

namespace Restaurant.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AccountCodeController : ControllerBase
    {
        #region Class Variables

        private AccountCodeService _accountCodeSVC;

        #endregion
        #region Constructors
        public AccountCodeController()
        {
            _accountCodeSVC = new AccountCodeService();
        }

        #endregion
        #region Http Verbs

        [HttpGet]
        public ActionResult Get()
        {
            AccountCodeDE AccountCode = new AccountCodeDE { IsActive=true};
            List<AccountCodeDE> list = _accountCodeSVC.SearchAccountCodes(AccountCode);
            return Ok(list);
        }
        [HttpGet("{id}")]
        public ActionResult GetAccountCodeById(int id)
        {
            AccountCodeDE AccountCode = new AccountCodeDE { Id = id };
            var list = _accountCodeSVC.SearchAccountCodes(AccountCode);
            return Ok(list);
        }
        [HttpPost("{Search}")]
        public ActionResult Search(AccountCodeDE Search)
        {
            Search.IsActive = true;
            List<AccountCodeDE> list = _accountCodeSVC.SearchAccountCodes(Search);
            return Ok(list);
        }
        [HttpPost]
        public ActionResult Post(AccountCodeDE code)
        {
            code.DBoperation = DBoperations.Insert;
            bool AccountCode = _accountCodeSVC.ManagementAccountCode(code);
            return Ok(AccountCode);
        }
        [HttpPut]
        public ActionResult Put(AccountCodeDE code)
        {
            code.DBoperation = DBoperations.Update;
            _accountCodeSVC.ManagementAccountCode(code);
            return Ok();
        }
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
            AccountCodeDE AccountCode = new AccountCodeDE { Id = id, DBoperation = DBoperations.DeActivate };
            _accountCodeSVC.ManagementAccountCode(AccountCode);
        }

        #endregion
    }
}

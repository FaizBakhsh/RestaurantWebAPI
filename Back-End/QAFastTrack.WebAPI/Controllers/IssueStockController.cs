using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Restaurant.Core.Entities;
using Restaurant.Core.Enums;
using Restaurant.Service;

namespace Restaurant.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class IssueStockController : ControllerBase
    {
        #region Class Variables

        private IssueStockService _IssueStockSVC;

        #endregion
        #region Constructors
        public IssueStockController()
        {
            _IssueStockSVC = new IssueStockService();
        }

        #endregion
        #region Http Verbs

        [HttpGet]
        public ActionResult Get()
        {
            IssueStockDE IssueStock = new IssueStockDE { IsActive = true };
            List<IssueStockDE> list = _IssueStockSVC.SearchIssueStocks(IssueStock);
            return Ok(list);
        }
        [HttpGet("{id}")]
        public ActionResult GetIssueStockById(int id)
        {
            IssueStockDE IssueStock = new IssueStockDE { Id = id };
            var list = _IssueStockSVC.SearchIssueStocks(IssueStock);
            return Ok(list);
        }
        [HttpPost("{Search}")]
        public ActionResult Search(IssueStockDE Search)
        {
            Search.IsActive = true;
            List<IssueStockDE> list = _IssueStockSVC.SearchIssueStocks(Search);
            return Ok(list);
        }
        [HttpPost]
        public ActionResult Post(IssueStockDE IssueStock)
        {
            IssueStock.DBoperation = DBoperations.Insert;
            bool issueStock = _IssueStockSVC.ManagementIssueStock(IssueStock);
            return Ok(IssueStock);
        }
        [HttpPut]
        public ActionResult Put(IssueStockDE IssueStock)
        {
            IssueStock.DBoperation = DBoperations.Update;
            _IssueStockSVC.ManagementIssueStock(IssueStock);
            return Ok();
        }
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
            IssueStockDE IssueStock = new IssueStockDE { Id = id, DBoperation = DBoperations.DeActivate };
            _IssueStockSVC.ManagementIssueStock(IssueStock);
        }

        #endregion
    }
}

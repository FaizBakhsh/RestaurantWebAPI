using Microsoft.AspNetCore.Mvc;
using Restaurant.Core.Entities;
using Restaurant.Core.Enums;
using Restaurant.Core.SearchCriteria;
using Restaurant.Service;
// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Restaurant.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BranchController : ControllerBase
    {
        #region Class Variables

        private ReportService _rptSvc;
        private BranchService _branchSVC;

        #endregion
        #region Constructors
        public BranchController()
        {
            _rptSvc = new ReportService();
            _branchSVC = new BranchService();
        }

        #endregion
        #region Http Verbs

        [HttpGet]
        public ActionResult Get()
        {
            BranchDE Branch = new BranchDE ();
            List<BranchDE> list = _branchSVC.SearchBranchs(Branch);
            return Ok(list);
        }
        [HttpGet("{id}")]
        public ActionResult GetBranchById(int id)
        {
            BranchDE Branch = new BranchDE { Id = id };
            var list = _branchSVC.SearchBranchs(Branch);
            return Ok(list);
        }
        [HttpPost("{Search}")]
        public ActionResult Search(BranchDE Search)
        {
            //Search.IsActive = true;
            List<BranchDE> list = _branchSVC.SearchBranchs(Search);
            return Ok(list);
        }
        [HttpPost]
        public ActionResult Post(BranchDE branch)
        {
            branch.DBoperation = DBoperations.Insert;
            bool Branch = _branchSVC.ManagementBranch(branch);
            return Ok(Branch);
        }
        [HttpPut]
        public ActionResult Put(BranchDE branch)
        {
            branch.DBoperation = DBoperations.Update;
            _branchSVC.ManagementBranch(branch);
            return Ok();
        }
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
            BranchDE Branch = new BranchDE { Id = id, DBoperation = DBoperations.DeActivate };
            _branchSVC.ManagementBranch(Branch);
        }

        #endregion
    }
}

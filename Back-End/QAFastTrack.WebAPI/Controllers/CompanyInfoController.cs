using Microsoft.AspNetCore.Mvc;
using Restaurant.Core.Entities;
using Restaurant.Core.Enums;
using Restaurant.Core.ViewModel;
using Restaurant.Service;

namespace Restaurant.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CompanyInfoController : ControllerBase
    {
        #region Class Variables

        private CompanyInfoService _comInfoSVC;

        #endregion
        #region Constructors
        public CompanyInfoController()
        {
            _comInfoSVC = new CompanyInfoService();
        }
        #endregion
        #region Http Verbs

        [HttpGet]
        public ActionResult Get()
        {
            CompanyInfoDE CompanyInfo = new CompanyInfoDE { IsActive = true };
            List<CompanyInfoDE> CompanyInfos = _comInfoSVC.SearchCompanyInfos(CompanyInfo);
            return Ok(CompanyInfos);
        }
        [HttpGet("{id}")]
        public ActionResult GetCompanyInfoById(int id)
        {
            CompanyInfoDE CompanyInfo = new CompanyInfoDE { Id = id };
            var CompanyInfos = _comInfoSVC.SearchCompanyInfos(CompanyInfo);
            return Ok(CompanyInfos);
        }
        [HttpPost("{Search}")]
        public ActionResult Search(CompanyInfoDE Search)
        {
            Search.IsActive = true;
            List<CompanyInfoDE> CompanyInfo = _comInfoSVC.SearchCompanyInfos(Search);
            return Ok(CompanyInfo);
        }
        [HttpPost]
        public ActionResult Post(CompanyInfoDE comInfo)
        {
            comInfo.DBoperation = DBoperations.Insert;
            bool CompanyInfo = _comInfoSVC.ManagementCompanyInfo(comInfo);
            return Ok(CompanyInfo);
        }
        [HttpPut]
        public ActionResult Put(CompanyInfoDE comInfo)
        {
            comInfo.DBoperation = DBoperations.Update;
            _comInfoSVC.ManagementCompanyInfo(comInfo);
            return Ok();
        }
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
            CompanyInfoDE comInfo = new CompanyInfoDE { Id = id, DBoperation = DBoperations.DeActivate };
            _comInfoSVC.ManagementCompanyInfo(comInfo);
        }

        #endregion
    }
}

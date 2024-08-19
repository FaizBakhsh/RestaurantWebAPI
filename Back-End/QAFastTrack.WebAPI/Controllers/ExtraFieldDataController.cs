using Microsoft.AspNetCore.Mvc;
using Restaurant.Core.Entities;
using Restaurant.Core.Enums;
using Restaurant.Service;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Restaurant.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ExtraFieldDataController : ControllerBase
    {
        #region Class Variables

        private ExtraFieldDataService _fieDataSvc;

        #endregion
        #region Constructors
        public ExtraFieldDataController()
        {
            _fieDataSvc = new ExtraFieldDataService();
        }

        #endregion
        #region Http Verbs

        [HttpGet]
        public ActionResult Get()
        {
            ExtraFieldDataDE ExtraFieldData = new ExtraFieldDataDE { IsActive = true };
            List<ExtraFieldDataDE> list = _fieDataSvc.SearchExtraFieldData(ExtraFieldData);
            return Ok(list);
        }
        [HttpGet("{id}")]
        public ActionResult GetExtraFieldDataById(int id)
        {
            ExtraFieldDataDE ExtraFieldData = new ExtraFieldDataDE { Id = id };
            var list = _fieDataSvc.SearchExtraFieldData(ExtraFieldData);
            return Ok(list);
        }
        [HttpPost("{Search}")]
        public ActionResult Search(ExtraFieldDataDE Search)
        {
            Search.IsActive = true;
            List<ExtraFieldDataDE> list = _fieDataSvc.SearchExtraFieldData(Search);
            return Ok(list);
        }
        [HttpPost]
        public ActionResult Post(ExtraFieldDataDE ExtraFieldData)
        {
            ExtraFieldData.DBoperation = DBoperations.Insert;
            bool retVal = _fieDataSvc.ManagementExtraFieldData(ExtraFieldData);
            return Ok(retVal);
        }
        [HttpPut]
        public ActionResult Put(ExtraFieldDataDE ExtraFieldData)
        {
            ExtraFieldData.DBoperation = DBoperations.Update;
            _fieDataSvc.ManagementExtraFieldData(ExtraFieldData);
            return Ok();
        }
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
            ExtraFieldDataDE ExtraFieldData = new ExtraFieldDataDE { Id = id, DBoperation = DBoperations.DeActivate };
            _fieDataSvc.ManagementExtraFieldData(ExtraFieldData);
        }

        #endregion
    }
}

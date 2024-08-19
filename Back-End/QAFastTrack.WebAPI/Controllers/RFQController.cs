using Microsoft.AspNetCore.Mvc;
using Restaurant.Core.Entities;
using Restaurant.Core.Enums;
using Restaurant.Service;

namespace Restaurant.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RFQController : ControllerBase
    {
        #region Class Variables

        private RFQService _RFQSVC;

        #endregion
        #region Constructors
        public RFQController()
        {
            _RFQSVC = new RFQService();
        }
        #endregion
        #region Http Verbs

        [HttpGet]
        public ActionResult Get()
        {
            RFQDE RFQ = new RFQDE();
            List<RFQDE> list = _RFQSVC.SearchRFQs(RFQ);
            return Ok(list);
        }
        [HttpGet("{id}")]
        public ActionResult GetRFQById(int id)
        {
            RFQDE RFQ = new RFQDE { Id = id };
            var list = _RFQSVC.SearchRFQs(RFQ);
            return Ok(list);
        }
        [HttpPost("{Search}")]
        public ActionResult Search(RFQDE Search)
        {
            // Search.IsActive = true;
            List<RFQDE> list = _RFQSVC.SearchRFQs(Search);
            return Ok(list);
        }
        [HttpPost]
        public ActionResult Post(RFQDE preturn)
        {
            preturn.DBoperation = DBoperations.Insert;
            RFQDE RFQ = _RFQSVC.ManagementRFQ(preturn);
            return Ok(RFQ);
        }
        [HttpPut]
        public ActionResult Put(RFQDE preturn)
        {
            preturn.DBoperation = DBoperations.Update;
            RFQDE RFQ = _RFQSVC.ManagementRFQ(preturn);
            return Ok(RFQ);
        }
        [HttpDelete("{id}")]
        public ActionResult Delete(int id)
        {
            RFQDE preturn = new RFQDE { Id = id, DBoperation = DBoperations.Delete };
            RFQDE RFQ = _RFQSVC.ManagementRFQ(preturn);
            return Ok(RFQ);
        }

        #endregion
    }
}

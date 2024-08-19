using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Restaurant.Core.Entities;
using Restaurant.Core.Enums;
using Restaurant.Service;


namespace Restaurant.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class GSTController : ControllerBase
    {
        #region Class Variables
        private GSTService _gstSVC;
        #endregion
        #region Constructor
        public GSTController()
        {
            _gstSVC = new GSTService();
        }
        #endregion
        #region Http Verbs

        [HttpGet]
        public ActionResult Get()
        {
            GSTDE GST = new GSTDE ();
            List<GSTDE> GSTs = _gstSVC.SearchGSTs(GST);
            return Ok(GSTs);
        }
        [HttpGet("{id}")]
        public ActionResult GetGSTById(int id)
        {
            GSTDE GST = new GSTDE { Id = id };
            var GSTs = _gstSVC.SearchGSTs(GST);
            return Ok(GSTs);
        }
        [HttpPost("{Search}")]
        public ActionResult Search(GSTDE Search)
        {
            //Search.IsActive = true;
            List<GSTDE> GSTs = _gstSVC.SearchGSTs(Search);
            return Ok(GSTs);
        }
        [HttpPost]
        public ActionResult Post(GSTDE gst)
        {
            gst.DBoperation = DBoperations.Insert;
            bool GST = _gstSVC.ManagementGST(gst);
            return Ok(GST);
        }
        [HttpPut]
        public ActionResult Put(GSTDE gst)
        {
            gst.DBoperation = DBoperations.Update;
            _gstSVC.ManagementGST(gst);
            return Ok();
        }
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
            GSTDE GST = new GSTDE { Id = id, DBoperation = DBoperations.Delete };
            _gstSVC.ManagementGST(GST);
        }

        #endregion
    }
}

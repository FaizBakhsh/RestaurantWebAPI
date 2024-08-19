using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Restaurant.Core.Entities;
using Restaurant.Core.Enums;
using Restaurant.Service;


namespace Restaurant.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MemberPointsController : ControllerBase
    {
        #region Class Variables
        private MemberPointsService _pointsSVC;
        #endregion
        #region Constructor
        public MemberPointsController()
        {
            _pointsSVC = new MemberPointsService();
        }
        #endregion
        #region Http Verbs

        [HttpGet]
        public ActionResult Get()
        {
            MemberPointsDE MemberPoints = new MemberPointsDE { IsActive = true };
            List<MemberPointsDE> list = _pointsSVC.SearchMemberPoints(MemberPoints);
            return Ok(list);
        }
        [HttpGet("{id}")]
        public ActionResult GetMemberPointsById(int id)
        {
            MemberPointsDE points = new MemberPointsDE { Id = id };
            var list = _pointsSVC.SearchMemberPoints(points);
            return Ok(list);
        }
        [HttpPost("{Search}")]
        public ActionResult Search(MemberPointsDE Search)
        {
            Search.IsActive = true;
            List<MemberPointsDE> list = _pointsSVC.SearchMemberPoints(Search);
            return Ok(list);
        }
        [HttpPost]
        public ActionResult Post(MemberPointsDE points)
        {
            points.DBoperation = DBoperations.Insert;
            bool MemberPoints = _pointsSVC.ManagementMemberPoints(points);
            return Ok(MemberPoints);
        }
        [HttpPut]
        public ActionResult Put(MemberPointsDE points)
        {
            points.DBoperation = DBoperations.Update;
            _pointsSVC.ManagementMemberPoints(points);
            return Ok();
        }
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
            MemberPointsDE MemberPoints = new MemberPointsDE { Id = id, DBoperation = DBoperations.DeActivate };
            _pointsSVC.ManagementMemberPoints(MemberPoints);
        }

        #endregion
    }
}

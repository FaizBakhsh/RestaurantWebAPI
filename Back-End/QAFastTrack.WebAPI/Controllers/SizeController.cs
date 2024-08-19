using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Restaurant.Core.Entities;
using Restaurant.Core.Enums;
using Restaurant.Service;
using System.Drawing;

namespace Restaurant.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SizeController : ControllerBase
    {
        #region Class Variables

        private SizeService _SizeSVC;

        #endregion
        #region Constructors
        public SizeController()
        {
            _SizeSVC = new SizeService();
        }
        #endregion
        #region Http Verbs

        [HttpGet]
        public ActionResult Get()
        {
            SizeDE Size = new SizeDE();
            List<SizeDE> list = _SizeSVC.SearchSizes(Size);
            return Ok(list);
        }
        [HttpGet("{id}")]
        public ActionResult GetSizeById(int id)
        {
            SizeDE Size = new SizeDE { Id = id };
            var list = _SizeSVC.SearchSizes(Size);
            return Ok(list);
        }
        [HttpPost("{Search}")]
        public ActionResult Search(SizeDE Search)
        {
            //Search.IsActive = true;
            List<SizeDE> list = _SizeSVC.SearchSizes(Search);
            return Ok(list);
        }
        [HttpPost ("Delete")]
        public ActionResult delete ( SizeDE size )
        {
            size.DBoperation = DBoperations.Delete;
            bool Size = _SizeSVC.ManagementSize (size);
            return Ok (Size);
        }
        [HttpPost]
        public ActionResult Post(SizeDE size)
        {
            size.DBoperation = DBoperations.Insert;
            bool Size = _SizeSVC.ManagementSize(size);
            return Ok(Size);
        }
        [HttpPut]
        public ActionResult Put(SizeDE size)
        {
            size.DBoperation = DBoperations.Update;
            _SizeSVC.ManagementSize(size);
            return Ok();
        }
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
            SizeDE Size = new SizeDE { Id = id, DBoperation = DBoperations.DeActivate };
            _SizeSVC.ManagementSize(Size);
        }

        #endregion
    }
}

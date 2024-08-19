using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Restaurant.Core.Entities.Acc;
using Restaurant.Core.Enums;
using Restaurant.Service.Acc;

namespace Restaurant.WebAPI.Controllers.Acc
{
    [Route("api/[controller]")]
    [ApiController]
    public class VoucherTypeController : ControllerBase
    {
        public readonly IAccService _accSvc;
        public VoucherTypeController ( IAccService coaSvc )
        {
            _accSvc = coaSvc;
        }
        #region Http Verbs

        [HttpGet]
        public ActionResult Get()
        {
            VoucherTypeDE VoucherType = new VoucherTypeDE();
            List<VoucherTypeDE> val = _accSvc.SearchVoucherTypes(VoucherType);
            return Ok(val);
        }
        [HttpGet("{id}")]
        public ActionResult GetVoucherTypeById(int id)
        {
            VoucherTypeDE VoucherType = new VoucherTypeDE { Id = id };
            var categories = _accSvc.SearchVoucherTypes(VoucherType);
            return Ok(categories);
        }
        [HttpPost("{Search}")]
        public ActionResult Search(VoucherTypeDE Search)
        {
            //Search.IsActive = true;
            List<VoucherTypeDE> categories = _accSvc.SearchVoucherTypes(Search);
            return Ok(categories);
        }
        [HttpPost]
        public ActionResult Post(VoucherTypeDE voucherType)
        {
            voucherType.DBoperation = DBoperations.Insert;
             voucherType = _accSvc.ManageVoucherType(voucherType);
            return Ok(voucherType);
        }
        [HttpPut]
        public ActionResult Put(VoucherTypeDE voucherType)
        {
            voucherType.DBoperation = DBoperations.Update;
            voucherType = _accSvc.ManageVoucherType (voucherType);
            return Ok (voucherType);
        }
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
            VoucherTypeDE VoucherType = new VoucherTypeDE { Id = id, DBoperation = DBoperations.DeActivate };
            _accSvc.ManageVoucherType(VoucherType);
        }

        #endregion
    }
}

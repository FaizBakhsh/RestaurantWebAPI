using Restaurant.Core.Enums;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Restaurant.DAL;
using Restaurant.Core.Entities.Acc;
using Restaurant.Service.Acc;

namespace Restaurant.WebAPI.Controllers.Acc
{
    [Route("api/[controller]")]
    [ApiController]
    public class VoucherController : ControllerBase
    {
        public readonly IAccService _accSvc;
        public VoucherController ( IAccService coaSvc )
        {
            _accSvc = coaSvc;
        }
        #region Http Verbs

        [HttpGet]
        public ActionResult Get()
        {
            VoucherDE Voucher = new VoucherDE();
            List<VoucherDE> values = _accSvc.SearchVouchers(Voucher);
            return Ok(values);
        }
        [HttpGet("{id}")]
        public ActionResult GetVoucherById(int id)
        {
            VoucherDE Voucher = new VoucherDE { Id = id };
            var values = _accSvc.SearchVouchers(Voucher);
            return Ok(values);
        }
        [HttpPost("{Search}")]
        public ActionResult Search(VoucherDE Search)
        {
            //Search.IsActive = true;
            List<VoucherDE> values = _accSvc.SearchVouchers(Search);
            return Ok(values);
        }
        [HttpPost("SearchVchDetail")]
        public ActionResult SearchVchDetail(VoucherDetailDE Search)
        {
            List<VoucherDetailDE> values = _accSvc.SearchVoucherLines(Search);
            return Ok(values);
        }
        [HttpPost("VchNo")]
        public ActionResult GetVchNo(VoucherDE vch)
        {
            vch = _accSvc.GetNextVchValues (vch);
            return Ok(vch);
        }
        [HttpPost]
        public ActionResult Post(VoucherDE vch)
        {
            vch.DBoperation = DBoperations.Insert;
            foreach (VoucherDetailDE line in vch.VoucherDetails)
            {
                line.DBoperation = vch.DBoperation;
            }
            VoucherDE Voucher = _accSvc.ManageVoucher(vch);
            return Ok(Voucher);
        }
        [HttpPut("{Update}/{Activate}")]
        public ActionResult Activate(VoucherDE vch)
        {
            vch.DBoperation = DBoperations.Activate;
            _accSvc.ManageVoucher(vch);
            return Ok();
        }
        [HttpPut("{DeActivate}")]
        public ActionResult DeActivate(VoucherDE vch)
        {
            vch.DBoperation = DBoperations.DeActivate;
            _accSvc.ManageVoucher(vch);
            return Ok();
        }
        [HttpPut]
        public ActionResult Put(VoucherDE vch)
        {
            vch.DBoperation = DBoperations.Update;
            VoucherDE Voucher = _accSvc.ManageVoucher(vch);
            return Ok(Voucher);
        }
        [HttpPost("Delete")]
        public void Delete(VoucherDE vch)
        {
            VoucherDE Voucher = new VoucherDE { Id = vch.Id, DBoperation = DBoperations.Delete, ClientId = vch.ClientId };
            _accSvc.ManageVoucher(Voucher);
        }

        #endregion
    }
}

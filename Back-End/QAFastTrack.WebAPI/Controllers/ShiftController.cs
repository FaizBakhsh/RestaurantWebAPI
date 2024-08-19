using Microsoft.AspNetCore.Mvc;
using Microsoft.Reporting.Map.WebForms.BingMaps;
using Restaurant.Core.Entities;
using Restaurant.Core.Enums;
using Restaurant.Service;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Restaurant.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ShiftController : ControllerBase
    {
        #region Class Variables

        private ShiftService _shiftSVC;

        #endregion
        #region Constructors
        public ShiftController()
        {
            _shiftSVC = new ShiftService();
        }

        #endregion
        #region Http Verbs

        [HttpGet]
        public ActionResult Get()
        {
            ShiftDE Shift = new ShiftDE { IsActive = true };
            List<ShiftDE> list = _shiftSVC.SearchShifts(Shift);
            return Ok(list);
        }
        [HttpGet("{id}")]
        public ActionResult GetShiftById(int id)
        {
            ShiftDE Shift = new ShiftDE { Id = id };
            var list = _shiftSVC.SearchShifts(Shift);
            return Ok(list);
        }
        [HttpPost("{Search}")]
        public ActionResult Search(ShiftDE Search)
        {
            Search.IsActive = true;
            List<ShiftDE> list = _shiftSVC.SearchShifts(Search);
            return Ok(list);
        }
        [HttpPost]
        public ActionResult Post(ShiftDE shift)
        {
            shift.DBoperation = DBoperations.Insert;
            ShiftDE Shift = _shiftSVC.ManagementShift(shift);
            return Ok(Shift);
        }
        [HttpPut]
        public ActionResult Put(ShiftDE shift)
        {
            shift.DBoperation = DBoperations.Update;
            ShiftDE Shift = _shiftSVC.ManagementShift (shift);
            return Ok (Shift);
        }
        [HttpDelete("{id}")]
        public ActionResult Delete (int id)
        {
            ShiftDE _Shift = new ShiftDE { Id = id, DBoperation = DBoperations.DeActivate };
            ShiftDE Shift = _shiftSVC.ManagementShift (_Shift);
            return Ok (Shift);
        }

        #endregion
    }
}

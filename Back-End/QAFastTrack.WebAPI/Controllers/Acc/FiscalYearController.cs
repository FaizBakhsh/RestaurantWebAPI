
using Restaurant.Core.Enums;
using Restaurant.Service;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Restaurant.Core.Entities.Acc;
using Restaurant.Service.Acc;

namespace Restaurant.WebAPI.Acc.Controllers
{
    [Route("api/[controller]")]
    [ApiController]

    public class FiscalYearController : ControllerBase
    {
        public readonly IAccService _coaSvc;
        public FiscalYearController(IAccService coaSvc)
        {
            _coaSvc = coaSvc;
        }
        [HttpGet]
        public IActionResult GetFiscalYear()
        {
            List<FiscalYearDE> list = new List<FiscalYearDE>();
            list = _coaSvc.SearchFiscalYear(new FiscalYearDE());
            return Ok(list);
        }

        [HttpPost("{Search}")]
        public IActionResult SearchFiscalYear(FiscalYearDE FiscalYear)
        {
            List<FiscalYearDE> list = _coaSvc.SearchFiscalYear(FiscalYear);
            return Ok(list);
        }

        [HttpPost("FiscalYear")]
        public IActionResult GetFiscalYear(FiscalYearDE FiscalYear)
        {
            List<FiscalYearDE> list = _coaSvc.SearchFiscalYear(FiscalYear);
            return Ok(list);
        }

        [HttpGet("{id}")]
        public IActionResult GetFiscalYearById(int id)
        {
            List<FiscalYearDE> list = new List<FiscalYearDE>();
            list = _coaSvc.SearchFiscalYear(new FiscalYearDE { Id = id });
            return Ok(list[0]);

        }

        [HttpPost]
        public IActionResult PostFiscalYear(FiscalYearDE FiscalYear)
        {
            FiscalYear.DBoperation = DBoperations.Insert;
            _coaSvc.ManageFiscalYear(FiscalYear);
            return Ok(FiscalYear);
        }

        [HttpPut]
        public IActionResult PutFiscalYear(FiscalYearDE FiscalYear)
        {
            FiscalYear.DBoperation = DBoperations.Update;
            _coaSvc.ManageFiscalYear(FiscalYear);
            return Ok(FiscalYear);
        }

        [HttpDelete("{id}")]
        public IActionResult DeleteFiscalYear(int id)
        {
            FiscalYearDE FiscalYearDe = new FiscalYearDE();
            FiscalYearDe.DBoperation = DBoperations.Delete;
            FiscalYearDe.Id = id;
            _coaSvc.ManageFiscalYear(FiscalYearDe);
            return Ok();
        }
    }
}

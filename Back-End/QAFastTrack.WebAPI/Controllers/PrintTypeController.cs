using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Restaurant.Core.Entities;
using Restaurant.Core.Enums;
using Restaurant.Service;

namespace Restaurant.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PrintTypeController : ControllerBase
    {
        #region Class Variables

        private PrintTypeService _PrintTypeSVC;

        #endregion
        #region Constructors
        public PrintTypeController()
        {
            _PrintTypeSVC = new PrintTypeService();
        }
        #endregion
        #region Http Verbs

        [HttpGet]
        public ActionResult Get()
        {
            PrintTypeDE PrintType = new PrintTypeDE { IsActive = true };
            List<PrintTypeDE> list = _PrintTypeSVC.SearchPrintTypes(PrintType);
            return Ok(list);
        }
        [HttpGet("{id}")]
        public ActionResult GetPrintTypeById(int id)
        {
            PrintTypeDE PrintType = new PrintTypeDE { Id = id };
            var list = _PrintTypeSVC.SearchPrintTypes(PrintType);
            return Ok(list);
        }
        [HttpPost("{Search}")]
        public ActionResult Search(PrintTypeDE Search)
        {
            Search.IsActive = true;
            List<PrintTypeDE> list = _PrintTypeSVC.SearchPrintTypes(Search);
            return Ok(list);
        }
        [HttpPost]
        public ActionResult Post(PrintTypeDE printType)
        {
            printType.DBoperation = DBoperations.Insert;
            bool PrintType = _PrintTypeSVC.ManagementPrintType(printType);
            return Ok(PrintType);
        }
        [HttpPut]
        public ActionResult Put(PrintTypeDE printType)
        {
            printType.DBoperation = DBoperations.Update;
            _PrintTypeSVC.ManagementPrintType(printType);
            return Ok();
        }
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
            PrintTypeDE PrintType = new PrintTypeDE { Id = id, DBoperation = DBoperations.DeActivate };
            _PrintTypeSVC.ManagementPrintType(PrintType);
        }

        #endregion
    }
}

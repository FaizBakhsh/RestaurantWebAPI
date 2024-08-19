using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Restaurant.Core.Entities;
using Restaurant.Core.Enums;
using Restaurant.Service;

namespace Restaurant.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PrinterSettingController : ControllerBase
    {
        #region Class Variables

        private PrinterSettingService _printerSettingSVC;

        #endregion
        #region Constructors
        public PrinterSettingController()
        {
            _printerSettingSVC = new PrinterSettingService();
        }
        #endregion
        #region Http Verbs

        [HttpGet]
        public ActionResult Get()
        {
            PrinterSettingDE PrinterSetting = new PrinterSettingDE ();
            List<PrinterSettingDE> list = _printerSettingSVC.SearchPrinterSettings(PrinterSetting);
            return Ok(list);
        }
        [HttpGet("{id}")]
        public ActionResult GetPrinterSettingById(int id)
        {
            PrinterSettingDE PrinterSetting = new PrinterSettingDE { Id = id };
            var list = _printerSettingSVC.SearchPrinterSettings(PrinterSetting);
            return Ok(list);
        }
        [HttpPost("{Search}")]
        public ActionResult Search(PrinterSettingDE Search)
        {
           // Search.IsActive = true;
            List<PrinterSettingDE> list = _printerSettingSVC.SearchPrinterSettings(Search);
            return Ok(list);
        }
        [HttpPost]
        public ActionResult Post(PrinterSettingDE printerSetting)
        {
            printerSetting.DBoperation = DBoperations.Insert;
            bool PrinterSetting = _printerSettingSVC.ManagementPrinterSetting(printerSetting);
            return Ok(PrinterSetting);
        }
        [HttpPut]
        public ActionResult Put(PrinterSettingDE printerSetting)
        {
            printerSetting.DBoperation = DBoperations.Update;
            _printerSettingSVC.ManagementPrinterSetting(printerSetting);
            return Ok();
        }
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
            PrinterSettingDE PrinterSetting = new PrinterSettingDE { Id = id, DBoperation = DBoperations.Delete };
            _printerSettingSVC.ManagementPrinterSetting(PrinterSetting);
        }

        #endregion
    }
}

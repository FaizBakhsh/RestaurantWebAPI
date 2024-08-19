using Microsoft.AspNetCore.Mvc;
using Restaurant.Core.Entities;
using Restaurant.Core.Enums;
using Restaurant.Service;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Restaurant.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ThemeDataController : ControllerBase
    {

        #region class Variables

        private ThemeDataService _tdService;

        #endregion
        #region Constructors
        public ThemeDataController()
        {
            _tdService = new ThemeDataService();
        }

        #endregion
        #region HTTP Verbs

        [HttpGet]
        public ActionResult Get()
        {
            ThemeDataDE data = new ThemeDataDE();
            List<ThemeDataDE> tdataList = _tdService.SearchThemeDatas(data);
            return Ok(tdataList);
        }
        [HttpPost ("{Search}")]
        public ActionResult Serach (ThemeDataDE data )
        {
            List<ThemeDataDE> tdataList = _tdService.SearchThemeDatas (data);
            return Ok (tdataList);
        }

        [HttpPost]
        public void Post(List<ThemeDataDE> tdata)
        {
            _tdService.AddThemeData(tdata);
        }

        //[HttpPut]
        //public void Put(ThemeDataDE tdata)
        //{
        //    tdata.DBoperation = DBoperations.Update;
        //    _tdService.ManagementThemeData(tdata);
        //}
        [HttpDelete]
        public void Delete(int cltId)
        {
            _tdService.DaleteThemeData(cltId);
        }

        #endregion

    }
}

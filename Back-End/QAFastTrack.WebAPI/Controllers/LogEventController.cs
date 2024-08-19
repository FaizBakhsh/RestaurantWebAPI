using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Restaurant.Core.Entities;
using Restaurant.Core.Enums;
using Restaurant.Service;

namespace Restaurant.WebAPI.Controllers
{
    [Route ("api/[controller]")]
    [ApiController]
    public class LogEventController : ControllerBase
    {
        #region Class Variables

        private LogEventService _LogEventSVC;

        #endregion
        #region Constructors
        public LogEventController ( )
        {
            _LogEventSVC = new LogEventService ();
        }

        #endregion
        #region Http Verbs

        [HttpGet]
        public ActionResult Get ( )
        {
            LogEventDE LogEvent = new LogEventDE ();
            List<LogEventDE> list = _LogEventSVC.SearchLogEvents (LogEvent);
            return Ok (list);
        }
        [HttpGet ("{id}")]
        public ActionResult GetLogEventById ( int id )
        {
            LogEventDE LogEvent = new LogEventDE { Id = id };
            var list = _LogEventSVC.SearchLogEvents (LogEvent);
            return Ok (list);
        }
        [HttpPost ("{Search}")]
        public ActionResult Search ( LogEventDE Search )
        {
            //Search.IsActive = true;
            List<LogEventDE> list = _LogEventSVC.SearchLogEvents (Search);
            return Ok (list);
        }
        [HttpPost]
        public ActionResult Post ( LogEventDE LogEvent )
        {
            LogEvent.DBoperation = DBoperations.Insert;
            bool retVal = _LogEventSVC.ManagementLogEvent (LogEvent, null);
            return Ok (retVal);
        }
        [HttpPut]
        public ActionResult Put ( LogEventDE LogEvent )
        {
            LogEvent.DBoperation = DBoperations.Update;
            bool retVal = _LogEventSVC.ManagementLogEvent (LogEvent, null);
            return Ok (retVal);
        }
        [HttpDelete ("{id}")]
        public void Delete ( int id )
        {
            LogEventDE LogEvent = new LogEventDE { Id = id, DBoperation = DBoperations.DeActivate };
            _LogEventSVC.ManagementLogEvent (LogEvent, null);
        }

        #endregion
    }
}

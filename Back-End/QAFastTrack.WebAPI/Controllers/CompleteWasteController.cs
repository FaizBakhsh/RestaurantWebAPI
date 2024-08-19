using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Restaurant.Core.Entities;
using Restaurant.Core.Enums;
using Restaurant.Service;

namespace Restaurant.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CompleteWasteController : ControllerBase
    {
        #region Class Variables

        private CompleteWasteService _completeWasteSVC;

        #endregion
        #region Constructors
        public CompleteWasteController()
        {
            _completeWasteSVC = new CompleteWasteService();
        }
        #endregion
        #region Http Verbs

        [HttpGet]
        public ActionResult Get()
        {
            CompleteWasteDE CompleteWaste = new CompleteWasteDE { IsActive=true};
            List<CompleteWasteDE> list = _completeWasteSVC.SearchCompleteWastes(CompleteWaste);
            return Ok(list);
        }
        [HttpGet("{id}")]
        public ActionResult GetCompleteWasteById(int id)
        {
            CompleteWasteDE CompleteWaste = new CompleteWasteDE { Id = id };
            var list = _completeWasteSVC.SearchCompleteWastes(CompleteWaste);
            return Ok(list);
        }
        [HttpPost("{Search}")]
        public ActionResult Search(CompleteWasteDE Search)
        {
            Search.IsActive = true;
            List<CompleteWasteDE> list = _completeWasteSVC.SearchCompleteWastes(Search);
            return Ok(list);
        }
        [HttpPost]
        public ActionResult Post(CompleteWasteDE waste)
        {
            waste.DBoperation = DBoperations.Insert;
            bool CompleteWaste = _completeWasteSVC.ManagementCompleteWaste(waste);
            return Ok(CompleteWaste);
        }
        [HttpPut]
        public ActionResult Put(CompleteWasteDE waste)
        {
            waste.DBoperation = DBoperations.Update;
            _completeWasteSVC.ManagementCompleteWaste(waste);
            return Ok();
        }
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
            CompleteWasteDE CompleteWaste = new CompleteWasteDE { Id = id, DBoperation = DBoperations.DeActivate };
            _completeWasteSVC.ManagementCompleteWaste(CompleteWaste);
        }

        #endregion
    }
}

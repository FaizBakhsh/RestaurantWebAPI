using Microsoft.AspNetCore.Mvc;
using Restaurant.Core.Entities;
using Restaurant.Core.Enums;
using Restaurant.Service;

namespace Restaurant.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RuntimeModifierController : ControllerBase
    {
        #region Class Variables

        private RuntimeModifierService _RuntimeModifierSVC;

        #endregion
        #region Constructors
        public RuntimeModifierController()
        {
            _RuntimeModifierSVC = new RuntimeModifierService();
        }

        #endregion
        #region Http Verbs

        [HttpGet]
        public ActionResult Get()
        {
            RuntimeModifierDE RuntimeModifier = new RuntimeModifierDE ();
            List<RuntimeModifierDE> list = _RuntimeModifierSVC.SearchRuntimeModifiers(RuntimeModifier);
            return Ok(list);
        }
        [HttpGet("{id}")]
        public ActionResult GetRuntimeModifierById(int id)
        {
            RuntimeModifierDE RuntimeModifier = new RuntimeModifierDE { Id = id };
            var list = _RuntimeModifierSVC.SearchRuntimeModifiers(RuntimeModifier);
            return Ok(list);
        }
        [HttpPost("{Search}")]
        public ActionResult Search(RuntimeModifierDE Search)
        {
            //Search.IsActive = true;
            List<RuntimeModifierDE> list = _RuntimeModifierSVC.SearchRuntimeModifiers(Search);
            return Ok(list);
        }
        [HttpPost]
        public ActionResult Post(RuntimeModifierDE RuntimeModifier)
        {
            RuntimeModifier.DBoperation = DBoperations.Insert;
            bool retVal = _RuntimeModifierSVC.ManagementRuntimeModifier(RuntimeModifier);
            return Ok(retVal);
        }
        [HttpPut]
        public ActionResult Put(RuntimeModifierDE RuntimeModifier)
        {
            RuntimeModifier.DBoperation = DBoperations.Update;
            _RuntimeModifierSVC.ManagementRuntimeModifier(RuntimeModifier);
            return Ok();
        }
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
            RuntimeModifierDE RuntimeModifier = new RuntimeModifierDE { Id = id, DBoperation = DBoperations.DeActivate };
            _RuntimeModifierSVC.ManagementRuntimeModifier(RuntimeModifier);
        }

        #endregion
    }
}

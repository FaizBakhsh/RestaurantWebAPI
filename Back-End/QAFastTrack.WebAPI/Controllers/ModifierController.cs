using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Restaurant.Core.Entities;
using Restaurant.Core.Enums;
using Restaurant.Service;

namespace Restaurant.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ModifierController : ControllerBase
    {
        #region Class Variables

        private ModifierService _ModifierSVC;

        #endregion
        #region Constructors
        public ModifierController()
        {
            _ModifierSVC = new ModifierService();
        }

        #endregion
        #region Http Verbs

        [HttpGet]
        public ActionResult Get()
        {
            ModifierDE Modifier = new ModifierDE ();
            List<ModifierDE> categories = _ModifierSVC.SearchModifiers(Modifier);
            return Ok(categories);
        }
        [HttpGet("{id}")]
        public ActionResult GetModifierById(int id)
        {
            ModifierDE Modifier = new ModifierDE { Id = id };
            var categories = _ModifierSVC.SearchModifiers(Modifier);
            return Ok(categories);
        }
        [HttpPost("{Search}")]
        public ActionResult Search(ModifierDE Search)
        {
            //Search.IsActive = true;
            List<ModifierDE> categories = _ModifierSVC.SearchModifiers(Search);
            return Ok(categories);
        }
        [HttpPost]
        public ActionResult Post(ModifierDE modifier)
        {
            modifier.DBoperation = DBoperations.Insert;
            bool Modifier = _ModifierSVC.ManagementModifier(modifier);
            return Ok(Modifier);
        }
        [HttpPut]
        public ActionResult Put(ModifierDE Modifier)
        {
            Modifier.DBoperation = DBoperations.Update;
            _ModifierSVC.ManagementModifier(Modifier);
            return Ok();
        }
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
            ModifierDE Modifier = new ModifierDE { Id = id, DBoperation = DBoperations.DeActivate };
            _ModifierSVC.ManagementModifier(Modifier);
        }

        #endregion
    }
}

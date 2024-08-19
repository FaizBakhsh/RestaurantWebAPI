using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Restaurant.Core.Entities;
using Restaurant.Core.Enums;
using Restaurant.Service;

namespace Restaurant.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SubRecipeController : ControllerBase
    {
        #region Class Variables

        private SubRecipeService _subRecipeSVC;

        #endregion
        #region Constructors
        public SubRecipeController()
        {
            _subRecipeSVC = new SubRecipeService();
        }
        #endregion
        #region Http Verbs

        [HttpGet]
        public ActionResult Get()
        {
            SubRecipeDE SubRecipe = new SubRecipeDE { IsActive = true };
            List<SubRecipeDE> list = _subRecipeSVC.SearchSubRecipe(SubRecipe);
            return Ok(list);
        }
        [HttpGet("{id}")]
        public ActionResult GetSubRecipeById(int id)
        {
            SubRecipeDE SubRecipe = new SubRecipeDE { Id = id };
            var list = _subRecipeSVC.SearchSubRecipe(SubRecipe);
            return Ok(list);
        }
        [HttpPost("{Search}")]
        public ActionResult Search(SubRecipeDE Search)
        {
            Search.IsActive = true;
            List<SubRecipeDE> list = _subRecipeSVC.SearchSubRecipe(Search);
            return Ok(list);
        }
        [HttpPost]
        public ActionResult Post(SubRecipeDE rec)
        {
            rec.DBoperation = DBoperations.Insert;
            bool SubRecipe = _subRecipeSVC.ManagementSubRecipe(rec);
            return Ok(SubRecipe);
        }
        [HttpPut]
        public ActionResult Put(SubRecipeDE size)
        {
            size.DBoperation = DBoperations.Update;
            _subRecipeSVC.ManagementSubRecipe(size);
            return Ok();
        }
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
            SubRecipeDE SubRecipe = new SubRecipeDE { Id = id, DBoperation = DBoperations.DeActivate };
            _subRecipeSVC.ManagementSubRecipe(SubRecipe);
        }

        #endregion
    }
}

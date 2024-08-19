using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Restaurant.Core.Entities;
using Restaurant.Core.Enums;
using Restaurant.Service;

namespace Restaurant.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RecipeController : ControllerBase
    {
        #region Class Variables

        private RecipeService _RecipeSVC;

        #endregion
        #region Constructors
        public RecipeController()
        {
            _RecipeSVC = new RecipeService();
        }
        #endregion
        #region Http Verbs

        [HttpGet]
        public ActionResult Get()
        {
            RecipeDE Recipe = new RecipeDE();
            List<RecipeDE> list = _RecipeSVC.SearchRecipes(Recipe);
            return Ok(list);
        }
        [HttpGet("{id}")]
        public ActionResult GetRecipeById(int id)
        {
            RecipeDE Recipe = new RecipeDE { Id = id };
            var list = _RecipeSVC.SearchRecipes(Recipe);
            return Ok(list);
        }
        [HttpPost("{Search}")]
        public ActionResult Search(RecipeDE Search)
        {
            //Search.IsActive = true;
            List<RecipeDE> list = _RecipeSVC.SearchRecipes(Search);
            return Ok(list);
        }
        [HttpPost]
        public ActionResult Post(RecipeDE recipe)
        {
            recipe.DBoperation = DBoperations.Insert;
            bool Recipe = _RecipeSVC.ManagementRecipe(recipe);
            return Ok(Recipe);
        }
        [HttpPost("{Delete}/{recipe}")]
        public void Delete(RecipeDE recipe)
        {
            recipe.DBoperation = DBoperations.Delete;
            _RecipeSVC.ManagementRecipe(recipe);
        }
        [HttpPut]
        public ActionResult Put(RecipeDE Recipe)
        {
            Recipe.DBoperation = DBoperations.Update;
            _RecipeSVC.ManagementRecipe(Recipe);
            return Ok();
        }
        //[HttpDelete("{recipe}")]
        //public void Delete(RecipeDE recipe)
        //{
        //    recipe.DBoperation = DBoperations.DeActivate;
        //   // RecipeDE Recipe = new RecipeDE { Id = id, DBoperation = DBoperations.DeActivate };
        //    _RecipeSVC.ManagementRecipe(recipe);
        //}

        #endregion
    }
}

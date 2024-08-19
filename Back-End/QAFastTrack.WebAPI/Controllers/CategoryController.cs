using Microsoft.AspNetCore.Mvc;
using Restaurant.Core.Entities;
using Restaurant.Core.Enums;
using Restaurant.Service;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Restaurant.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CategoryController : ControllerBase
    {
        #region Class Variables

        private CategoryService _categorySVC;

        #endregion
        #region Constructors
        public CategoryController()
        {
            _categorySVC = new CategoryService();
        }

        #endregion
        #region Http Verbs

        [HttpGet]
        public ActionResult Get()
        {
            CategoryDE category = new CategoryDE { IsActive = true };
            List<CategoryDE> categories = _categorySVC.SearchCategorys(category);
            return Ok(categories);
        }
        [HttpGet("{id}")]
        public ActionResult GetCategoryById(int id)
        {
            CategoryDE category = new CategoryDE { Id = id };
            var categories = _categorySVC.SearchCategorys(category);
            return Ok(categories);
        }
        [HttpPost("{Search}")]
        public ActionResult Search(CategoryDE Search)
        {
            Search.IsActive = true;
            List<CategoryDE> categories = _categorySVC.SearchCategorys(Search);
            return Ok(categories);
        }

        [HttpPost]
        public ActionResult Post(CategoryDE category)
        {
            category.DBoperation = DBoperations.Insert;
            bool Category = _categorySVC.ManagementCategory(category);
            return Ok(Category);
        }

        [HttpPut]
        public ActionResult Put(CategoryDE category)
        {
            category.DBoperation = DBoperations.Update;
            _categorySVC.ManagementCategory(category);
            return Ok();
        }
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
            CategoryDE category = new CategoryDE { Id = id, DBoperation = DBoperations.DeActivate };
            _categorySVC.ManagementCategory(category);
        }

       

        #endregion
    }
}

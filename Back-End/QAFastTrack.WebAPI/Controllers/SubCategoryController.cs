using Microsoft.AspNetCore.Mvc;
using Restaurant.Core.Entities;
using Restaurant.Core.Enums;
using Restaurant.Service;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Restaurant.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SubCategoryController : ControllerBase
    {
        #region Class Variables

        private SubCategoryService _subCategorySVC;

        #endregion
        #region Constructors
        public SubCategoryController()
        {
            _subCategorySVC = new SubCategoryService();
        }

        #endregion
        #region Http Verbs

        [HttpGet]
        public ActionResult Get()
        {
            SubCategoryDE subCategorySC = new SubCategoryDE { IsActive = true };
            List<SubCategoryDE> subCategory = _subCategorySVC.SearchSubCategorys(subCategorySC);
            return Ok(subCategory);
        }
        [HttpGet("{id}")]
        public ActionResult GetSubCategoryById(int id)
        {
            SubCategoryDE subCategorySC = new SubCategoryDE { Id = id };
            var subCategory = _subCategorySVC.SearchSubCategorys(subCategorySC);
            return Ok(subCategory);
        }
        [HttpPost("{Search}")]
        public ActionResult Search(SubCategoryDE Search)
        {
            Search.IsActive=true;
            List<SubCategoryDE> subCategory = _subCategorySVC.SearchSubCategorys(Search);
            return Ok(subCategory);
        }

        [HttpPost]
        public ActionResult Post(SubCategoryDE subCategory)
        {
            subCategory.DBoperation = DBoperations.Insert;
            bool SubCategory = _subCategorySVC.ManagementSubCategory(subCategory);
            return Ok(SubCategory);
        }

        [HttpPut]
        public ActionResult Put(SubCategoryDE subCategory)
        {
            subCategory.DBoperation = DBoperations.Update;
            _subCategorySVC.ManagementSubCategory(subCategory);
            return Ok();
        }
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
            SubCategoryDE subCategory = new SubCategoryDE { Id = id, DBoperation = DBoperations.DeActivate };
            _subCategorySVC.ManagementSubCategory(subCategory);
        }
       

        #endregion
    }
}

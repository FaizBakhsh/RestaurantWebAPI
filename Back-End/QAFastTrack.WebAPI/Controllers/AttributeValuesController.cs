using Microsoft.AspNetCore.Mvc;
using Restaurant.Core.Entities;
using Restaurant.Core.Enums;
using Restaurant.Core.ViewModel;
using Restaurant.Service;

namespace Restaurant.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AttributeValuesController : ControllerBase
    {
        #region Class Variables

        private AttributeValuesService _AttributeValuesSVC;

        #endregion
        #region Constructors
        public AttributeValuesController()
        {
            _AttributeValuesSVC = new AttributeValuesService();
        }

        #endregion
        #region Http Verbs

        [HttpGet]
        public ActionResult Get()
        {
            AttributeValuesDE AttributeValues = new AttributeValuesDE { IsActive = true };
            List<AttributeValuesDE> AttributeValuess = _AttributeValuesSVC.SearchAttributeValues(AttributeValues);
            return Ok(AttributeValuess);
        }
        [HttpGet("{id}")]
        public ActionResult GetAttributeValuesById(int id)
        {
            AttributeValuesDE AttributeValues = new AttributeValuesDE { Id = id };
            var AttributeValuess = _AttributeValuesSVC.SearchAttributeValues(AttributeValues);
            return Ok(AttributeValuess);
        }
        [HttpPost("{Search}")]
        public ActionResult Search(AttributeValuesDE Search)
        {
            Search.IsActive = true;
            List<AttributeValuesDE> AttributeValues = _AttributeValuesSVC.SearchAttributeValues(Search);
            return Ok(AttributeValues);
        }
        [HttpPost]
        public ActionResult Post(AttributeValuesDE _attVal)
        {
            _attVal.IsActive = true;
            _attVal.DBoperation = DBoperations.Insert;
            bool retVla = _AttributeValuesSVC.ManagementAttributeValues(_attVal);
            return Ok(retVla);
        }
        [HttpPut]
        public ActionResult Put(AttributeValuesDE _attVal)
        {
            _attVal.IsActive = true;
            _attVal.DBoperation = DBoperations.Update;
            _AttributeValuesSVC.ManagementAttributeValues(_attVal);
            return Ok();
        }
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
            AttributeValuesDE _attVal = new AttributeValuesDE { Id = id, DBoperation = DBoperations.DeActivate };
            _AttributeValuesSVC.ManagementAttributeValues(_attVal);
        }

        #endregion
    }
}

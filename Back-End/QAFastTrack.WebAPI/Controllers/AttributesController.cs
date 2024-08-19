using Microsoft.AspNetCore.Mvc;
using Restaurant.Core.Entities;
using Restaurant.Core.Enums;
using Restaurant.Core.ViewModel;
using Restaurant.Service;
using Restaurant.WebAPI.Models;

namespace Restaurant.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AttributesController : ControllerBase
    {
        #region Class Variables

        private AttributesService _AttributesSVC;

        #endregion
        #region Constructors
        public AttributesController()
        {
            _AttributesSVC = new AttributesService();
        }

        #endregion
        #region Http Verbs

        [HttpGet]
        public ActionResult Get()
        {
            AttributesDE Attributes = new AttributesDE { IsActive = true };
            List<AttributesDE> Attributess = _AttributesSVC.SearchAttributes(Attributes);
            return Ok(Attributess);
        }
        [HttpGet("{id}")]
        public ActionResult GetAttributesById(int id)
        {
            AttributesDE Attributes = new AttributesDE { Id = id };
            var Attributess = _AttributesSVC.SearchAttributes(Attributes);
            return Ok(Attributess);
        }
        [HttpPost("{Search}")]
        public ActionResult Search(AttributesDE Search)
        {
            Search.IsActive = true;
            List<AttributesDE> Attributes = _AttributesSVC.SearchAttributes(Search);
            return Ok(Attributes);
        }
        [HttpPost]
        public ActionResult Post(AttributesDE _att)
        {
            _att.IsActive = true;
            _att.DBoperation = DBoperations.Insert;
            bool retVla = _AttributesSVC.ManagementAttributes(_att);
            return Ok(retVla);
        }
        [HttpPut]
        public ActionResult Put(AttributesDE _att)
        {
            _att.IsActive = true;
            _att.DBoperation = DBoperations.Update;
            _AttributesSVC.ManagementAttributes(_att);
            return Ok();
        }
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
            AttributesDE _att = new AttributesDE { Id = id, DBoperation = DBoperations.DeActivate };
            _AttributesSVC.ManagementAttributes(_att);
        }

        #endregion
    }
}

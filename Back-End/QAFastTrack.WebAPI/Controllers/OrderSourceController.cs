using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Restaurant.Core.Entities;
using Restaurant.Core.Enums;
using Restaurant.Service;


namespace Restaurant.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class OrderSourceController : ControllerBase
    {
        #region Class Variables
        private OrderSourceService _sourceSVC;
        #endregion
        #region Constructor
        public OrderSourceController()
        {
            _sourceSVC = new OrderSourceService();
        }
        #endregion
        #region Http Verbs

        [HttpGet]
        public ActionResult Get()
        {
            OrderSourceDE OrderSource = new OrderSourceDE { IsActive=true};
            List<OrderSourceDE> OrderSources = _sourceSVC.SearchOrderSources(OrderSource);
            return Ok(OrderSources);
        }
        [HttpGet("{id}")]
        public ActionResult GetOrderSourceById(int id)
        {
            OrderSourceDE source = new OrderSourceDE { Id = id };
            var OrderSources = _sourceSVC.SearchOrderSources(source);
            return Ok(OrderSources);
        }
        [HttpPost("{Search}")]
        public ActionResult Search(OrderSourceDE Search)
        {
            Search.IsActive = true;
            List<OrderSourceDE> OrderSources = _sourceSVC.SearchOrderSources(Search);
            return Ok(OrderSources);
        }
        [HttpPost]
        public ActionResult Post(OrderSourceDE source)
        {
            source.DBoperation = DBoperations.Insert;
            bool OrderSource = _sourceSVC.ManagementOrderSource(source);
            return Ok(OrderSource);
        }
        [HttpPut]
        public ActionResult Put(OrderSourceDE source)
        {
            source.DBoperation = DBoperations.Update;
            _sourceSVC.ManagementOrderSource(source);
            return Ok();
        }
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
            OrderSourceDE OrderSource = new OrderSourceDE { Id = id, DBoperation = DBoperations.DeActivate };
            _sourceSVC.ManagementOrderSource(OrderSource);
        }

        #endregion
    }
}

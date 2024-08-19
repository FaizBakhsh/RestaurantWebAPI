using Microsoft.AspNetCore.Mvc;
using Restaurant.Core.Entities;
using Restaurant.Core.Enums;
using Restaurant.Service;
// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Restaurant.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class DeliveryController : ControllerBase
    {
        #region Class Variables

        private DeliveryService _deliverySVC;

        #endregion
        #region Constructors
        public DeliveryController()
        {
            _deliverySVC = new DeliveryService();
        }

        #endregion
        #region Http Verbs

        [HttpGet]
        public ActionResult Get()
        {
            DeliveryDE Delivery = new DeliveryDE { IsActive = true };
            List<DeliveryDE> categories = _deliverySVC.SearchDelivery(Delivery);
            return Ok(categories);
        }
        [HttpGet("{id}")]
        public ActionResult GetDeliveryById(int id)
        {
            DeliveryDE Delivery = new DeliveryDE { Id = id };
            var categories = _deliverySVC.SearchDelivery(Delivery);
            return Ok(categories);
        }
        [HttpPost("{Search}")]
        public ActionResult Search(DeliveryDE Search)
        {
            Search.IsActive = true;
            List<DeliveryDE> categories = _deliverySVC.SearchDelivery(Search);
            return Ok(categories);
        }

        [HttpPost]
        public ActionResult Post(DeliveryDE delivery)
        {
            delivery.DBoperation = DBoperations.Insert;
            bool Delivery = _deliverySVC.ManagementDelivery(delivery);
            return Ok(Delivery);
        }

        [HttpPut]
        public ActionResult Put(DeliveryDE delivery)
        {
            delivery.DBoperation = DBoperations.Update;
            _deliverySVC.ManagementDelivery(delivery);
            return Ok();
        }
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
            DeliveryDE Delivery = new DeliveryDE { Id = id, DBoperation = DBoperations.DeActivate };
            _deliverySVC.ManagementDelivery(Delivery);
        }



        #endregion
    }
}


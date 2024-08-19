using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Restaurant.Core.Entities;
using Restaurant.Core.Enums;
using Restaurant.Service;

namespace Restaurant.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class StockEstimationController : ControllerBase
    {
        #region Class Variables

        private StockEstimationService _stockEstimationSVC;

        #endregion
        #region Constructors
        public StockEstimationController()
        {
            _stockEstimationSVC = new StockEstimationService();
        }

        #endregion
        #region Http Verbs

        [HttpGet]
        public ActionResult Get()
        {
            StockEstimationDE StockEstimation = new StockEstimationDE ();
            List<StockEstimationDE> list = _stockEstimationSVC.SearchStockEstimations(StockEstimation);
            return Ok(list);
        }
        [HttpGet("{id}")]
        public ActionResult GetStockEstimationById(int id)
        {
            StockEstimationDE StockEstimation = new StockEstimationDE { Id = id };
            var list = _stockEstimationSVC.SearchStockEstimations(StockEstimation);
            return Ok(list);
        }
        [HttpPost("{Search}")]
        public ActionResult Search(StockEstimationDE Search)
        {
            //Search.IsActive = true;
            List<StockEstimationDE> list = _stockEstimationSVC.SearchStockEstimations(Search);
            return Ok(list);
        }
        [HttpPost]
        public ActionResult Post(StockEstimationDE stock)
        {
            stock.DBoperation = DBoperations.Insert;
            bool StockEstimation = _stockEstimationSVC.ManagementStockEstimation(stock);
            return Ok(StockEstimation);
        }
        [HttpPut]
        public ActionResult Put(StockEstimationDE stock)
        {
            stock.DBoperation = DBoperations.Update;
            _stockEstimationSVC.ManagementStockEstimation(stock);
            return Ok();
        }
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
            StockEstimationDE StockEstimation = new StockEstimationDE { Id = id, DBoperation = DBoperations.Delete };
            _stockEstimationSVC.ManagementStockEstimation(StockEstimation);
        }

        #endregion
    }
}

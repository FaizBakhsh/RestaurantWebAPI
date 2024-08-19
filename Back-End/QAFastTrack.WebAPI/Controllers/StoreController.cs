using Microsoft.AspNetCore.Mvc;
using Restaurant.Core.Entities;
using Restaurant.Core.Enums;
using Restaurant.Service;

namespace Restaurant.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class StoreController : ControllerBase
    {
        #region Class Variables
        private StoreService _storeSVC;
        #endregion
        #region Constructor
        public StoreController()
        {
            _storeSVC = new StoreService();
        }
        #endregion
        #region Http Verbs

        [HttpGet]
        public ActionResult Get()
        {
            StoreDE Store = new StoreDE ();
            List<StoreDE> stores = _storeSVC.SearchStores(Store);
            return Ok(stores);
        }
        [HttpGet("{id}")]
        public ActionResult GetStoreById(int id)
        {
            StoreDE Store = new StoreDE { Id = id };
            var stores = _storeSVC.SearchStores(Store);
            return Ok(stores);
        }
        [HttpPost("{Search}")]
        public ActionResult Search(StoreDE Search)
        {
           // Search.IsActive = true;
            List<StoreDE> stores = _storeSVC.SearchStores(Search);
            return Ok(stores);
        }
        [HttpPost]
        public ActionResult Post(StoreDE store)
        {
            store.DBoperation = DBoperations.Insert;
            bool Store = _storeSVC.ManagementStore(store);
            return Ok(Store);
        }
        [HttpPut]
        public ActionResult Put(StoreDE store)
        {
            store.DBoperation = DBoperations.Update;
            _storeSVC.ManagementStore(store);
            return Ok();
        }
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
            StoreDE Store = new StoreDE { Id = id, DBoperation = DBoperations.DeActivate };
            _storeSVC.ManagementStore(Store);
        }

        #endregion
    }
}

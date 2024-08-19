using Microsoft.AspNetCore.Mvc;
using Restaurant.Core.Entities;
using Restaurant.Core.Enums;
using Restaurant.Service;
// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Restaurant.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class FloorController : ControllerBase
    {
        #region Class Variables

        private FloorService _floorSVC;

        #endregion
        #region Constructors
        public FloorController()
        {
            _floorSVC = new FloorService();
        }

        #endregion
        #region Http Verbs

        [HttpGet]
        public ActionResult Get()
        {
            try
            {
                FloorDE Floor = new FloorDE { IsActive = true };
                List<FloorDE> categories = _floorSVC.SearchFloors(Floor);
                return Ok(categories);
            }catch (Exception )
            {
                throw;
            }         
        }
        [HttpGet("{id}")]
        public ActionResult GetFloorById(int id)
        {
            try
            {
                FloorDE Floor = new FloorDE { Id = id };
                var categories = _floorSVC.SearchFloors(Floor);
                return Ok(categories);
            }
            catch (Exception)
            {
                throw;
            }          
        }
        [HttpPost("{Search}")]
        public ActionResult Search(FloorDE Search)
        {
            try
            {
                Search.IsActive = true;
                List<FloorDE> categories = _floorSVC.SearchFloors(Search);
                return Ok(categories);
            }
            catch (Exception)
            {
                throw;
            }
           
        }
        [HttpPost]
        public ActionResult Post(FloorDE floor)
        {
            try
            {
                floor.DBoperation = DBoperations.Insert;
                bool f = _floorSVC.ManagementFloor(floor);
                return Ok(f);
            }
            catch (Exception)
            {
                throw;
            }
         
        }
        [HttpPut]
        public ActionResult Put(FloorDE floor)
        {
            try
            {
                floor.DBoperation = DBoperations.Update;
                _floorSVC.ManagementFloor(floor);
                return Ok();
            }
            catch (Exception)
            {

                throw;
            }          
        }
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
            try
            {
                FloorDE Floor = new FloorDE { Id = id, DBoperation = DBoperations.DeActivate };
                _floorSVC.ManagementFloor(Floor);
            }
            catch (Exception)
            {

                throw;
            }            
        }

        #endregion
    }
}

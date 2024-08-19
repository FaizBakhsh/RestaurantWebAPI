using Microsoft.AspNetCore.Mvc;
using Restaurant.Core.Entities;
using Restaurant.Core.Enums;
using Restaurant.Service;
// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Restaurant.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class TableController : ControllerBase
    {
        #region Class Variables

        private TableService _tableSVC;

        #endregion
        #region Constructors
        public TableController()
        {
            _tableSVC = new TableService();
        }

        #endregion
        #region Http Verbs

        [HttpGet]
        public ActionResult Get()
        {
            try
            {
                TableDE Table = new TableDE { IsActive = true };
                List<TableDE> categories = _tableSVC.SearchTables(Table);
                return Ok(categories);
            }
            catch (Exception)
            {

                throw;
            }
        }
        [HttpGet("{id}")]
        public ActionResult GetTableById(int id)
        {
            try
            {
                TableDE Table = new TableDE { Id = id };
                var categories = _tableSVC.SearchTables(Table);
                return Ok(categories);
            }
            catch (Exception)
            {
                throw;
            }
           
        }
        [HttpPost("{Search}")]
        public ActionResult Search(TableDE Search)
        {
            try
            {
                Search.IsActive = true;
                List<TableDE> categories = _tableSVC.SearchTables(Search);
                return Ok(categories);
            }
            catch (Exception)
            {
                throw;
            }
         
        }
        [HttpPost]
        public ActionResult Post(TableDE table)
        {
            try
            {
                table.DBoperation = DBoperations.Insert;
                bool Table = _tableSVC.ManagementTable(table);
                return Ok(Table);
            }
            catch (Exception)
            {
                throw;
            }
          
        }
        [HttpPut]
        public ActionResult Put(TableDE table)
        {
            try
            {
                table.DBoperation = DBoperations.Update;
                _tableSVC.ManagementTable(table);
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
                TableDE Table = new TableDE { Id = id, DBoperation = DBoperations.DeActivate };
                _tableSVC.ManagementTable(Table);
            }
            catch (Exception)
            {
                throw;
            }        
        }

        #endregion
    }
}

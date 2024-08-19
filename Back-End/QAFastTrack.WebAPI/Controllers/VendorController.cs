using Microsoft.AspNetCore.Mvc;
using Restaurant.Core.Entities;
using Restaurant.Core.Enums;
using Restaurant.Service;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Restaurant.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class VendorController : ControllerBase
    {
        #region Class Variables

        private VendorService _VendorSVC;

        #endregion
        #region Constructors
        public VendorController()
        {
            _VendorSVC = new VendorService();
        }

        #endregion
        #region Http Verbs

        [HttpGet]
        public ActionResult Get()
        {
            try
            {
                VendorDE Vendor = new VendorDE { IsActive = true };
                List<VendorDE> categories = _VendorSVC.SearchVendors(Vendor);
                return Ok(categories);
            }
            catch (Exception)
            {
                throw;
            }
        }
        [HttpGet("{id}")]
        public ActionResult GetVendorById(int id)
        {
            try
            {
                VendorDE Vendor = new VendorDE { Id = id };
                var categories = _VendorSVC.SearchVendors(Vendor);
                return Ok(categories);
            }
            catch (Exception)
            {
                throw;
            }
        }
        [HttpPost("{Search}")]
        public ActionResult Search(VendorDE Search)
        {
            try
            {
                Search.IsActive = true;
                List<VendorDE> categories = _VendorSVC.SearchVendors(Search);
                return Ok(categories);
            }
            catch (Exception)
            {
                throw;
            }

        }
        [HttpPost]
        public ActionResult Post(VendorDE Vendor)
        {
            try
            {
                Vendor.DBoperation = DBoperations.Insert;
                bool f = _VendorSVC.ManagementVendor(Vendor);
                return Ok(f);
            }
            catch (Exception)
            {
                throw;
            }

        }
        [HttpPut]
        public ActionResult Put(VendorDE Vendor)
        {
            try
            {
                Vendor.DBoperation = DBoperations.Update;
                _VendorSVC.ManagementVendor(Vendor);
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
                VendorDE Vendor = new VendorDE { Id = id, DBoperation = DBoperations.DeActivate };
                _VendorSVC.ManagementVendor(Vendor);
            }
            catch (Exception)
            {

                throw;
            }
        }

        #endregion
    }
}

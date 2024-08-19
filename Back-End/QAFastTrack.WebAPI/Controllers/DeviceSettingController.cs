using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Restaurant.Core.Entities;
using Restaurant.Core.Enums;
using Restaurant.Service;

namespace Restaurant.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class DeviceSettingController : ControllerBase
    {
        #region Class Variables

        private DeviceSettingService _deviceSettingSVC;

        #endregion
        #region Constructors
        public DeviceSettingController()
        {
            _deviceSettingSVC = new DeviceSettingService();
        }
        #endregion
        #region Http Verbs

        [HttpGet]
        public ActionResult Get()
        {
            DeviceSettingDE DeviceSetting = new DeviceSettingDE { IsActive = true };
            List<DeviceSettingDE> list = _deviceSettingSVC.SearchDeviceSettings(DeviceSetting);
            return Ok(list);
        }
        [HttpGet("{id}")]
        public ActionResult GetDeviceSettingById(int id)
        {
            DeviceSettingDE DeviceSetting = new DeviceSettingDE { Id = id };
            var list = _deviceSettingSVC.SearchDeviceSettings(DeviceSetting);
            return Ok(list);
        }
        [HttpPost("{Search}")]
        public ActionResult Search(DeviceSettingDE Search)
        {
            Search.IsActive = true;
            List<DeviceSettingDE> list = _deviceSettingSVC.SearchDeviceSettings(Search);
            return Ok(list);
        }
        [HttpPost]
        public ActionResult Post(DeviceSettingDE deviceSetting)
        {
            deviceSetting.DBoperation = DBoperations.Insert;
            bool DeviceSetting = _deviceSettingSVC.ManagementDeviceSetting(deviceSetting);
            return Ok(DeviceSetting);
        }
        [HttpPut]
        public ActionResult Put(DeviceSettingDE deviceSetting)
        {
            deviceSetting.DBoperation = DBoperations.Update;
            _deviceSettingSVC.ManagementDeviceSetting(deviceSetting);
            return Ok();
        }
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
            DeviceSettingDE DeviceSetting = new DeviceSettingDE { Id = id, DBoperation = DBoperations.DeActivate };
            _deviceSettingSVC.ManagementDeviceSetting(DeviceSetting);
        }

        #endregion
    }
}

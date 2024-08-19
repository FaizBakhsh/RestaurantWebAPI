using Restaurant.Core.Entities;
using Restaurant.Core.Enums;
using Restaurant.Core.SearchCriteria;
using Restaurant.Services;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Restaurant.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class EnumValuesController : ControllerBase
    {

        #region Class Variables

        private CoreService _coreSVC;

        #endregion
        #region Constructors
        public EnumValuesController()
        {
            _coreSVC = new CoreService();
        }

        #endregion
      
    }
}

using Restaurant.Core.Entities.Security;
using Restaurant.Core.Enums;
using Restaurant.Services;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Restaurant.Service.IServices;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Restaurant.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    //[Authorize(Policy = "ManagerOnly")]
    public class PermissionsController : ControllerBase
    {

        #region Class Variables

        private readonly IPermissionService _permsSVC;

        #endregion
        #region Constructors
        public PermissionsController(IPermissionService permSvc)
        {
            _permsSVC = permSvc;
        }

        #endregion
        #region Http Verbs

        [HttpGet]
        public ActionResult Get()
        {
            PermissionDE permsSC = new PermissionDE();
            List<PermissionDE> perms = _permsSVC.SearchPermissions(permsSC);
            return Ok(perms);
        }

        [HttpPost("{Search}")]
        public ActionResult Search(PermissionDE Search)
        {
            List<PermissionDE> perms = _permsSVC.SearchPermissions(Search);
            return Ok(perms);
        }
        [HttpPost ("Permission")]
        public ActionResult SearchPermissions ( PermissionDE Search )
        {
            List<PermissionDE> perms = _permsSVC.SearchPerms (Search);
            return Ok (perms);
        }

        [HttpPost]
        public ActionResult Post(List<PermissionDE> perms)
        {
            bool per= _permsSVC.ManagementPermissions(perms);
            return Ok(per);
        }

        [HttpPut]
        public ActionResult Put(List<PermissionDE> perms)
        {
          
            bool per = _permsSVC.ManagementPermissions(perms);
            return Ok(per);
        }


        #endregion

    }
}

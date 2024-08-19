using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Restaurant.Data;
using Restaurant.Models;
using Restaurant.Service;
using Restaurant.WebAPI.Models;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Restaurant.Controllers
{
    [Route ("api/[controller]")]
    [ApiController]
    // [Authorize]
    //[Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    // [AllowAnonymous]
    public class UserController : ControllerBase
    {
        public UserService _userService;
        private UserManager<User> userManager;
        private IPasswordHasher<User> passwordHasher;
        public UserController (  UserManager<User> usrMgr, IPasswordHasher<User> passwordHash )
        {
            _userService = new UserService ();
            userManager = usrMgr;
            passwordHasher = passwordHash;
        }
        [HttpGet ("{id}")]
        public async Task<ActionResult> GetUserById ( String id )
        {
            User u = await userManager.FindByIdAsync (id);
            if (u != null)
            {
                return Ok (u);
            }
            else
            {
                return BadRequest ("Invalid client request");
            }

        }
        [HttpPost]
        public async Task<ActionResult> Create ( User user )
        {
            try
            {
                User appUser = new User
                {
                    EmployeeId = user.EmployeeId,
                    RoleId =user.RoleId,
                    UserPassword = user.UserPassword,
                    Name = user.Name,
                    IsActive = user.IsActive,
                    UserName = user.UserName,
                    Email = user.Email,
                    PhoneNumber = user.PhoneNumber,
                    BranchId = user.BranchId,
                    Address = user.Address,
                    FatherName = user.FatherName,
                    FirstName = user.FirstName,
                    Designation = user.Designation,
                    DiscountLimit = user.DiscountLimit,
                    MSCardNo = user.MSCardNo,
                    ClientId = user.ClientId,
                    ModuleId = user.ModuleId,
                    CNIC = user.CNIC
                };
                IdentityResult result = await userManager.CreateAsync (appUser, user.PasswordHash);
                if (result.Succeeded) return Ok (new
                {
                    result,
                    UserId = appUser.Id,
                });
                else
                {
                    return BadRequest ("Invalid client request");
                }
            }
            catch (Exception ex)
            {
                return BadRequest ("Invalid client request");
            }
            finally
            {

            }

        }
        [HttpDelete]
        public async Task<ActionResult> Delete ( string id )
        {
            User user = await userManager.FindByIdAsync (id);
            if (user != null)
            {
                IdentityResult result = await userManager.DeleteAsync (user);

                if (!result.Succeeded) { return BadRequest ("Invalid client request"); }
            }
            return Ok ();
        }
        [HttpPut]
        public async Task<ActionResult> Update ( User users )
        {
            try
            {
                User user = await userManager.FindByIdAsync (users.Id);
                user.EmployeeId = users.EmployeeId;
                user.RoleId = users.RoleId;
                user.UserPassword = users.UserPassword;
                user.Name = users.Name;
                user.UserName = users.UserName;
                user.Email = users.Email;
                user.PhoneNumber = users.PhoneNumber;
                user.BranchId = users.BranchId;
                user.Address = users.Address;
                user.FatherName = users.FatherName;
                user.FirstName = users.FirstName;
                user.Designation = users.Designation;
                user.DiscountLimit = users.DiscountLimit;
                user.MSCardNo = users.MSCardNo;
                user.CNIC = users.CNIC;
                user.ClientId = users.ClientId;
                user.ModuleId = users.ModuleId;
                user.IsActive = users.IsActive;

                user.PasswordHash = passwordHasher.HashPassword (user, users.PasswordHash);
                IdentityResult result = await userManager.UpdateAsync (user);
                if (result.Succeeded) return Ok (new
                {
                    result,
                    UserId = user.Id,
                });
                else
                    return BadRequest ("Invalid client request");
            }
            catch (Exception ex)
            {
                return BadRequest ("Invalid client request");
            }
            finally
            {

            }
        }
        [HttpGet]
        public ActionResult GetUsers ( )
        {
            var users = userManager.Users;
            return Ok (users);
        }
        [HttpPost ("{Search}")]
        public ActionResult Search ( UserVM Search )
        {
            List<UserVM> users = _userService.SearchUser (Search);
            return Ok (users);
        }
    }
}
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;
using Restaurant.Core.Entities.Security;
using Restaurant.Core.Services.Token;
using Restaurant.Models;
using Restaurant.Service;
using Restaurant.Service.IServices;
using Restaurant.Services;
using Restaurant.WebAPI.Models;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Restaurant.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AccountController : ControllerBase
    {
        public UserService _userService;
        private IConfiguration _config;
        private readonly RoleManager<IdentityRole> _roleManager;
        private readonly IJWTTokenGenerator _jwtToken;
        private readonly SignInManager<User> _signInManager;
        private UserManager<User> _userManager;
        private IPermissionService _permSvc;
        public AccountController (
            SignInManager<User> signInManager,
            UserManager<User> usrMgr,
            IJWTTokenGenerator jwtToken,
            RoleManager<IdentityRole> roleMgr,
            IPermissionService permSvc
            , IConfiguration config)
        {
            _permSvc = permSvc;
            _userService = new UserService ();
            _jwtToken = jwtToken;
            _roleManager = roleMgr;
            _signInManager = signInManager;
            _userManager = usrMgr;
            _config = config;
        }

        [HttpPost]
        public async Task<ActionResult> Login(LoginModel model)
        {
            #region
            try
            {
                var user = await _userManager.FindByNameAsync(model.UserName);

                if (user != null)
                {
                    var result = await _signInManager.CheckPasswordSignInAsync(user, model.Password, false);
                    var reslt = await _userManager.CheckPasswordAsync(user, model.Password);
                    var results = await _signInManager.PasswordSignInAsync(model.UserName, model.Password, true, true);
                    if (!result.Succeeded)
                    {
                        return Ok(result);
                    }
                    else
                    {
                        if (model.Name != null)
                        {
                            if (user.Name != model.Name)
                            {
                                return BadRequest("Invalid client request");

                            }
                        }
                    }
                    var _user = new UserVM ();
                    _user.Id = user.Id;
                    _user.ModuleId = user.ModuleId;
                    List<UserVM> users = _userService.SearchUser (_user);
                    if (users != null && users.Count > 0)
                    {
                        _user = users[0];
                    }
                    var roles = await _userManager.GetRolesAsync(user);
                    return Ok(new
                    {
                        result = results,
                        id = user.Id,
                        cLTId = _user.CLTId,
                        userName = user.UserName,
                        email = user.Email,
                        name = user.Name,
                        role=_user.Role,
                        roleId=_user.RoleId,
                        clientId = user.ClientId,
                        //role = roles,
                        token = _jwtToken.GenerateToken(user, roles)

                    });
                }
                else
                {
                    return BadRequest("Invalid client request");
                }
            }        
            catch (Exception )
            {
                throw ;

            }
            finally { }
            #endregion
        }
        [HttpPost("Login")]
        public async Task<ActionResult> WebLogin ( LoginModel model )
        {
            #region
            try
            {
                var user = await _userManager.FindByEmailAsync (model.Email);

                if (user != null)
                {
                    var result = await _signInManager.CheckPasswordSignInAsync (user, model.Password, false);
                    var reslt = await _userManager.CheckPasswordAsync (user, model.Password);
                    var results = await _signInManager.PasswordSignInAsync (user.UserName, model.Password, true, true);
                    if (!result.Succeeded)
                    {
                        return Ok (result);
                    }
                    else
                    {
                        if (model.Name != null)
                        {
                            if (user.Name != model.Name)
                            {
                                return BadRequest ("Invalid client request");

                            }
                        }
                    }
                    var _user = new UserVM ();
                    var roles = await _userManager.GetRolesAsync (user);
                    _user.Id = user.Id;
                    _user.ModuleId = user.ModuleId;
                    List<UserVM> users = _userService.SearchUser (_user);
                    if (users != null && users.Count > 0)
                    {
                        _user = users[0];
                    }
                    var _permissions = new List<PermissionDE> ();
                    _permissions = _permSvc.GetPermsByUserOrRole (user.Id, (int)_user.RoleId);
                    return Ok (new
                    {
                        result = results,
                        id = user.Id,
                        clientId = user.ClientId,
                        client = _user.Client,
                        moduleIds = _user.ModuleIds,
                        cLTId = _user.CLTId,
                        cLTModuleIds = _user.CLTModuleIds,
                        userName = user.UserName,
                        email = user.Email,
                        name = user.Name,
                        //role = roles,
                        role=_user.Role,
                        roleId = _user.RoleId,
                        token = _jwtToken.GenerateToken (user, new List<string> { _user.Role }),
                        permissions = _permissions
                    });
                }
                else
                    return BadRequest ("Invalid client request");
            }
            catch (Exception)
            {
                throw;

            }
            finally { }
            #endregion
        }
        private string GenerateJSONWebToken(User userInfo)
        {
            var securityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_config["Jwt:Key"]));
            var credentials = new SigningCredentials(securityKey, SecurityAlgorithms.HmacSha256);

            var claims = new[]
            {
                      new Claim(JwtRegisteredClaimNames.Sub, userInfo.UserName),
                      new Claim(JwtRegisteredClaimNames.Email, userInfo.Email),

            };
            var token = new JwtSecurityToken(_config["Jwt:Issuer"],
            _config["Jwt:Issuer"],
            claims,
            expires: DateTime.Now.AddMinutes(120),
            signingCredentials: credentials);

            return new JwtSecurityTokenHandler().WriteToken(token);
        }
    }
}

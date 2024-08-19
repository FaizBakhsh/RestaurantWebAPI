using Restaurant.Core.Entities;
using Restaurant.Core.Enums;
using Restaurant.Service;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Restaurant.Controllers;
using Microsoft.AspNetCore.Identity;
using Restaurant.Models;
using Restaurant.DAL;

namespace Restaurant.WebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ClientsController : ControllerBase
    {
        private UserManager<User> userManager;
        private IPasswordHasher<User> passwordHasher;
        private UserController _userController;
        private ClientsService _clientsSvc;
        private CoreDAL _coreDAL;
        public ClientsController( UserManager<User> _userManager, IPasswordHasher<User> _passwordHasher )
        {
            _coreDAL = new CoreDAL ();
            userManager = _userManager;
            passwordHasher = _passwordHasher;
            _userController = new UserController (_userManager,_passwordHasher);
            _clientsSvc = new ClientsService();
        }
        // HTTP Methods 
        [HttpGet]
        public IActionResult GetClients()
        {
            List<ClientsDE> list = new List<ClientsDE>();
            list = _clientsSvc.SearchClients(new ClientsDE());
            return Ok(list);
        }

        [HttpPost("{Search}")]
        public IActionResult SearchClients(ClientsDE clients)
        {
            List<ClientsDE> list = _clientsSvc.SearchClients(clients);
            return Ok(list);
        }


        [HttpGet("{id}")]
        public IActionResult GetClientsById(int id)
        {
            List<ClientsDE> list = new List<ClientsDE>();
            list = _clientsSvc.SearchClients(new ClientsDE { Id = id });
            return Ok(list[0]);

        }

        [HttpPost]
        public async Task<IActionResult>PostClients(ClientsDE clients)
        {
            clients.DBoperation = DBoperations.Insert;
            ClientsDE client = _clientsSvc.ManageClients (clients);
            //if (client != null && client.Id > 0)
            //{
                //var adminUser = new User ();
                //adminUser.Email = clients.Email;
                //adminUser.PasswordHash = _coreDAL.GenerateUniquePassword ();
                //adminUser.UserPassword = adminUser.PasswordHash;
                //adminUser.UserName = adminUser.PasswordHash;
                //adminUser.Name = "admin";
                //adminUser.FirstName = "admin";
                //adminUser.RoleId = (int)Roles.Admin;
                //adminUser.ClientId = client.Id;
                //await _userController.Create (adminUser);

                //var cashierUser = new User ();
                //cashierUser.Email = "cashier" + client.Id.ToString () + "@gmail.com";
                //cashierUser.PasswordHash = _coreDAL.GenerateUniquePassword ();
                //cashierUser.UserPassword = cashierUser.PasswordHash;
                //cashierUser.UserName = cashierUser.PasswordHash;
                //cashierUser.Name = "cashier" + client.Id.ToString ();
                //cashierUser.FirstName = "cashier" + client.Id.ToString ();
                //cashierUser.RoleId = (int)Roles.Cashier;
                //cashierUser.ClientId = client.Id;
                //await _userController.Create (cashierUser);
           // }
            return Ok (client);
        }

        [HttpPut]
        public IActionResult PutClients(ClientsDE clients)
        {
            clients.DBoperation = DBoperations.Update;
           ClientsDE client= _clientsSvc.ManageClients(clients);
            return Ok(client);
        }

        [HttpDelete("{id}")]
        public IActionResult DeleteClients(int id)
        {
            ClientsDE clientsDe = new ClientsDE();
            clientsDe.DBoperation = DBoperations.Delete;
            clientsDe.Id = id;
            ClientsDE client = _clientsSvc.ManageClients (clientsDe);
            return Ok (client);
        }
    }
}

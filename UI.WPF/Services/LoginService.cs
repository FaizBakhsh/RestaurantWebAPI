using Restaurant.Models;
using Restaurant.WPF.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace Restaurant.WPF.Services
{
    public class LoginService
    {
        HttpClient client;
        public LoginService ( )
        {
            client = new HttpClient ();
        }
        public async Task<HttpResponseMessage> Login ( LoginModel login )
        {
            try
            {
                client.DefaultRequestHeaders.Accept.Add (new MediaTypeWithQualityHeaderValue ("application/json"));
                var response = await client.PostAsJsonAsync (Globals.BASE_API_URL + "Account", login);
                return response;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return new HttpResponseMessage ();
        }
    }
}

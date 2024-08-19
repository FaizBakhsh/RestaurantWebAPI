using Restaurant.WebAPI.Models;
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
    public class UserService
    {
        HttpClient client;
        List<UserVM> userList;
        public UserService ( )
        {
            client = new HttpClient ();
            userList = new List<UserVM> ();
        }
        public async Task<HttpResponseMessage> SearchUser ( UserVM user )
        {
            try
            {
                user.IsActive = true;
                user.ClientId = Properties.Settings.Default.ClientId;
                client.DefaultRequestHeaders.Accept.Add (new MediaTypeWithQualityHeaderValue ("application/json"));
                var response = await client.PostAsJsonAsync (Globals.BASE_API_URL + "User/Search", user);
                return response;
            }
            catch (Exception ex)
            {
                MessageBox.Show (ex.Message.ToString (), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            return new HttpResponseMessage ();
        }
    }
}

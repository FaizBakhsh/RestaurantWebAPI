using Newtonsoft.Json;
using Restaurant.Core.Entities;
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
    public class CustomerService
    {
        HttpClient client;
        List<CustomerDE> custList;
        public CustomerService ( )
        {
            client = new HttpClient ();
            custList = new List<CustomerDE> ();
        }
        public async Task<List<CustomerDE>> SearchCustomer ( )
        {
            try
            {
                CustomerDE cust = new CustomerDE ();
                cust.IsActive = true;
                cust.ClientId = Properties.Settings.Default.ClientId;
                client.DefaultRequestHeaders.Accept.Add (new MediaTypeWithQualityHeaderValue ("application/json"));
                var response = await client.PostAsJsonAsync (Globals.BASE_API_URL + "Customer/Search", cust);
                if (response != null)
                {
                    var res = response.StatusCode.ToString ();
                    if (res == "OK")
                    {
                        var jsonString = await response.Content.ReadAsStringAsync ();
                        custList = JsonConvert.DeserializeObject<List<CustomerDE>> (jsonString);
                    }
                }
                if (custList != null)
                    return custList;
                else
                {
                    custList = new List<CustomerDE> ();
                    return custList;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show (ex.Message.ToString (), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            return custList;
        }
    }
}

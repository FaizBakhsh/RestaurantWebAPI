using Newtonsoft.Json;
using Restaurant.Core.Entities;
using Restaurant.WPF.Entities;
using Restaurant.WPF.Views;
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
    public class ServiceChargeservice
    {
        HttpClient client;
        List<ServiceChargesDE> ServiceCharges;
        public ServiceChargeservice ( )
        {
            client = new HttpClient ();
            ServiceCharges = new List<ServiceChargesDE> ();
        }
        public async Task<List<ServiceChargesDE>> GetServiceCharges ( )
        {
            var response = await client.GetStringAsync (Globals.BASE_API_URL + "ServiceCharges");
            ServiceCharges = JsonConvert.DeserializeObject<List<ServiceChargesDE>> (response);
            if (ServiceCharges != null)
            {
                return ServiceCharges;
            }
            else
            {
                ServiceCharges = new List<ServiceChargesDE> ();
                return ServiceCharges;
            }
        }
        public async Task<List<ServiceChargesDE>> SearchServiceCharges ( ServiceChargesDE Charges )
        {
            try
            {
                Charges.IsActive = true;
                Charges.ClientId = Properties.Settings.Default.ClientId;
                client.DefaultRequestHeaders.Accept.Add (new MediaTypeWithQualityHeaderValue ("application/json"));
                var response = await client.PostAsJsonAsync (Globals.BASE_API_URL + "ServiceCharges/Search", Charges);
                if (response != null)
                {
                    var res = response.StatusCode.ToString ();
                    if (res == "OK")
                    {
                        var jsonString = await response.Content.ReadAsStringAsync ();
                        ServiceCharges = JsonConvert.DeserializeObject<List<ServiceChargesDE>> (jsonString);
                    }
                }
                if (ServiceCharges != null)
                    return ServiceCharges;
                else
                {
                    ServiceCharges = new List<ServiceChargesDE> ();
                    return ServiceCharges;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show (ex.Message.ToString (), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
                return ServiceCharges;
            }
        }
    }
}

using Newtonsoft.Json;
using Restaurant.WPF.Entities;
using Restaurant.WPF.Entities.Enums;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace Restaurant.WPF.Services
{
    public class StaffService
    {
        HttpClient client;
        List<StaffDE> riderList;
        public StaffService ( )
        {
            client = new HttpClient ();
            riderList = new List<StaffDE> ();
        }
        public async Task<List<StaffDE>> GetStaffs ( StaffDE staff )
        {
            try
            {
                staff.IsActive = true;
                staff.ClientId = Properties.Settings.Default.ClientId;
                client.DefaultRequestHeaders.Accept.Add (new MediaTypeWithQualityHeaderValue ("application/json"));
                var response = await client.PostAsJsonAsync (Globals.BASE_API_URL + "Staff/Search", staff);
                if (response != null)
                {
                    var res = response.StatusCode.ToString ();
                    if (res == "OK")
                    {
                        var jsonString = await response.Content.ReadAsStringAsync ();
                        riderList = JsonConvert.DeserializeObject<List<StaffDE>> (jsonString);
                    }
                }
                if (riderList != null)
                    return riderList;
                else
                {
                    riderList = new List<StaffDE> ();
                    return riderList;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show (ex.Message.ToString (), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            return riderList;
        }
    }
}

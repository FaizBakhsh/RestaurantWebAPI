using Newtonsoft.Json;
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
    public class GSTService
    {
        HttpClient client;
        public List<GSTDE> gstList;
        public GSTService ( )
        {
            client = new HttpClient ();
            gstList = new List<GSTDE> ();
        }
        public async Task<List<GSTDE>> SearchGST ( GSTDE gst )
        {
            try
            {
                gst.IsActive = true;
                gst.ClientId = Properties.Settings.Default.ClientId;
                client.DefaultRequestHeaders.Accept.Add (new MediaTypeWithQualityHeaderValue ("application/json"));
                var response = await client.PostAsJsonAsync (Globals.BASE_API_URL + "GST/Search", gst);
                if (response != null)
                {
                    var jsonString = await response.Content.ReadAsStringAsync ();
                    gstList = JsonConvert.DeserializeObject<List<GSTDE>> (jsonString);
                }
                if (gstList != null)
                    return gstList;
                else
                {
                    gstList = new List<GSTDE> ();
                    return gstList;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show (ex.Message.ToString (), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            return gstList;
        }
    }
}

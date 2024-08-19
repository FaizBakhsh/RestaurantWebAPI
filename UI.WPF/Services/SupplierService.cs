using Newtonsoft.Json;
using Restaurant.WPF.Entities;
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
    public class SupplierService
    {
        HttpClient client;
        List<SupplierDE> SupplierList;
        public SupplierService ( )
        {
            client = new HttpClient ();
            SupplierList = new List<SupplierDE> ();
        }
        public async Task<List<SupplierDE>> GetSuppliers ( )
        {
            try
            {
                var sup = new SupplierDE ();
                sup.IsActive = true;
                sup.ClientId = Properties.Settings.Default.ClientId;
                client.DefaultRequestHeaders.Accept.Add (new MediaTypeWithQualityHeaderValue ("application/json"));
                var response = await client.PostAsJsonAsync (Globals.BASE_API_URL + "Supplier/Search", sup);
                if (response != null)
                {
                    var res = response.StatusCode.ToString ();
                    if (res == "OK")
                    {
                        var jsonString = await response.Content.ReadAsStringAsync ();
                        SupplierList = JsonConvert.DeserializeObject<List<SupplierDE>> (jsonString);
                    }
                }
                if (SupplierList != null)
                    return SupplierList;
                else
                {
                    SupplierList = new List<SupplierDE> ();
                    return SupplierList;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show (ex.Message.ToString (), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            return SupplierList;
        }
        public async Task<HttpResponseMessage> UpdateSupplier ( SupplierDE Supplier )
        {
            client.DefaultRequestHeaders.Accept.Add (new MediaTypeWithQualityHeaderValue ("application/json"));
            var response = await client.PutAsJsonAsync (Globals.BASE_API_URL + "Supplier", Supplier);
            return response;
        }
        public async Task<HttpResponseMessage> PostSupplier ( SupplierDE Supplier )
        {
            client.DefaultRequestHeaders.Accept.Add (new MediaTypeWithQualityHeaderValue ("application/json"));
            var response = await client.PostAsJsonAsync (Globals.BASE_API_URL + "Supplier", Supplier);
            return response;
        }
    }
}

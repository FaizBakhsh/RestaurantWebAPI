using Newtonsoft.Json;
using Restaurant.WPF.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http.Headers;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using Restaurant.Core.Entities;
using ImTools;

namespace Restaurant.WPF.Services
{
    public class SaleDayService
    {
        HttpClient client;
        List<SaleDayDE> saleDayList;
        public SaleDayService ( )
        {
            client = new HttpClient ();
            saleDayList = new List<SaleDayDE> ();
        }
        public async Task<List<SaleDayDE>> GetSaleDays ( )
        {
            var response = await client.GetStringAsync (Globals.BASE_API_URL + "SaleDay");
            saleDayList = JsonConvert.DeserializeObject<List<SaleDayDE>> (response);
            if (saleDayList != null)
            {
                return saleDayList;
            }
            else
            {
                saleDayList = new List<SaleDayDE> ();
                return saleDayList;
            }
        }
        public async Task<List<SaleDayDE>> SearchSaleDay ( SaleDayDE SaleDay )
        {
            try
            {
                SaleDay.IsActive = true;
                SaleDay.ClientId = Properties.Settings.Default.ClientId;
                client.DefaultRequestHeaders.Accept.Add (new MediaTypeWithQualityHeaderValue ("application/json"));
                var response = await client.PostAsJsonAsync (Globals.BASE_API_URL + "SaleDay/Search", SaleDay);
                if (response != null)
                {
                    var jsonString = await response.Content.ReadAsStringAsync ();
                    saleDayList = JsonConvert.DeserializeObject<List<SaleDayDE>> (jsonString);
                }
                if (saleDayList != null)
                    return saleDayList;
                else
                {
                    saleDayList = new List<SaleDayDE> ();
                    return saleDayList;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show (ex.Message.ToString (), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
                return saleDayList;
            }
        }
        public async Task<Boolean> Save ( SaleDayDE saleDay )
        {
            bool retVal = false;
            try
            {
                saleDay.ClientId = Properties.Settings.Default.ClientId;
                client.DefaultRequestHeaders.Accept.Add (new MediaTypeWithQualityHeaderValue ("application/json"));
                var response = await client.PostAsJsonAsync (Globals.BASE_API_URL + "SaleDay", saleDay);
                if (response != null)
                {
                    var res = response.StatusCode.ToString ();
                    if (res == "OK")
                        retVal = true;
                    else
                    {
                        MessageBox.Show ("        Error Occurred ,Please Try Again       ", "Error");
                        retVal = false;
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show (ex.Message.ToString (), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            return retVal;
        }
        public async Task<Boolean> Update ( SaleDayDE saleDay )
        {
            bool retVal = false;
            SaleDayDE SaleDay = new SaleDayDE ();
            client.DefaultRequestHeaders.Accept.Add (new MediaTypeWithQualityHeaderValue ("application/json"));
            var response = await client.PutAsJsonAsync (Globals.BASE_API_URL + "SaleDay", saleDay);
            if (response != null)
            {
                var res = response.StatusCode.ToString ();
                if (res == "OK")
                    retVal = true;
                else
                {
                    MessageBox.Show ("        Error Occurred ,Please Try Again       ", "Error");
                    retVal = false;
                }
            }
            return retVal;
        }
        public async Task<SaleDayDE> UpdateSaleDay ( SaleDayDE SaleDay )
        {
            SaleDayDE _SaleDay = new SaleDayDE ();
            SaleDay.ClientId = Properties.Settings.Default.ClientId;
            client.DefaultRequestHeaders.Accept.Add (new MediaTypeWithQualityHeaderValue ("application/json"));
            var response = await client.PutAsJsonAsync (Globals.BASE_API_URL + "SaleDay", SaleDay);
            if (response != null)
            {
                var res = response.StatusCode.ToString ();
                if (res == "OK")
                {
                    var jsonString = await response.Content.ReadAsStringAsync ();
                    _SaleDay = JsonConvert.DeserializeObject<SaleDayDE> (jsonString);
                }
                else
                    MessageBox.Show ("        Error Occurred ,Please Try Again       ", "Error");
            }
            return _SaleDay;
        }
    }
}

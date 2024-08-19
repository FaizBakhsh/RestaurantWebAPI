using Newtonsoft.Json;
using Restaurant.Core.Entities;
using Restaurant.WPF.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Printing;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace Restaurant.WPF.Services
{
    public class ShiftService
    {
        HttpClient client;
        List<ShiftDE> shiftList;
        public ShiftService ( )
        {
            client = new HttpClient ();
            shiftList = new List<ShiftDE> ();
        }
        public async Task<List<ShiftDE>> SearchShift ( ShiftDE shift )
        {
            try
            {
                shift.IsActive = true;
                shift.ClientId = Properties.Settings.Default.ClientId;
                client.DefaultRequestHeaders.Accept.Add (new MediaTypeWithQualityHeaderValue ("application/json"));
                var response = await client.PostAsJsonAsync (Globals.BASE_API_URL + "Shift/Search", shift);
                if (response != null)
                {
                    var res = response.StatusCode.ToString ();
                    if (res == "OK")
                    {
                        var jsonString = await response.Content.ReadAsStringAsync ();
                        shiftList = JsonConvert.DeserializeObject<List<ShiftDE>> (jsonString);
                    }
                }
                if (shiftList != null)
                    return shiftList;
                else
                {
                    shiftList = new List<ShiftDE> ();
                    return shiftList;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show (ex.Message.ToString (), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            return shiftList;
        }
        public async Task<List<ShiftDE>> GetShift ( )
        {
            var response = await client.GetStringAsync (Globals.BASE_API_URL + "Shift");
            shiftList = JsonConvert.DeserializeObject<List<ShiftDE>> (response);
            if (shiftList != null)
            {
                return shiftList;
            }
            else
            {
                shiftList = new List<ShiftDE> ();
                return shiftList;
            }
        }
        public async Task<HttpResponseMessage> UpdateShift ( ShiftDE shift )
        {
            client.DefaultRequestHeaders.Accept.Add (new MediaTypeWithQualityHeaderValue ("application/json"));
            var response = await client.PutAsJsonAsync (Globals.BASE_API_URL + "Shift", shift);
            return response;
        }
        public async Task<HttpResponseMessage> PostShift ( ShiftDE shift )
        {
            try
            {
                shift.ClientId = Properties.Settings.Default.ClientId;
                client.DefaultRequestHeaders.Accept.Add (new MediaTypeWithQualityHeaderValue ("application/json"));
                var response = await client.PostAsJsonAsync (Globals.BASE_API_URL + "Shift", shift);
                return response;
            }
            catch (Exception ex)
            {
                MessageBox.Show (ex.Message.ToString (), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            return new HttpResponseMessage ();
        }
        public async Task<ShiftDE> Update ( ShiftDE shift )
        {
            ShiftDE _shift = new ShiftDE ();
            try
            {
                shift.ClientId = Properties.Settings.Default.ClientId;
                client.DefaultRequestHeaders.Accept.Add (new MediaTypeWithQualityHeaderValue ("application/json"));
                var response = await client.PutAsJsonAsync (Globals.BASE_API_URL + "Shift", shift);
                if (response != null)
                {
                    var res = response.StatusCode.ToString ();
                    if (res == "OK")
                    {
                        var jsonString = await response.Content.ReadAsStringAsync ();
                        _shift = JsonConvert.DeserializeObject<ShiftDE> (jsonString);
                    }
                    else
                        MessageBox.Show ("        Error Occurred ,Please Try Again       ", "Error");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show (ex.Message.ToString (), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            return _shift;
        }
    }
}

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
    public class EnumLineService
    {
        HttpClient client;
        List<EnumLineDE> EnumLineList;
        public EnumLineService()
        {
            client = new HttpClient();
            EnumLineList = new List<EnumLineDE>();
        }
        public async Task<List<EnumLineDE>> GetEnumLine()
        {
            var response = await client.GetStringAsync(Globals.BASE_API_URL+ "Settings");
            EnumLineList = JsonConvert.DeserializeObject<List<EnumLineDE>>(response);
            if (EnumLineList != null)
            {
                return EnumLineList;
            }
            else
            {
                EnumLineList = new List<EnumLineDE>();
                return EnumLineList;
            }
        }
        public async Task<List<EnumLineDE>> SearchEnumLine (EnumLineDE EnumLine)
        {
            try { 
            EnumLine.IsActive=true;
            client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
            var response = await client.PostAsJsonAsync(Globals.BASE_API_URL+ "Settings/Search", EnumLine);
            if (response != null)
            {
                var jsonString = await response.Content.ReadAsStringAsync ();
                EnumLineList = JsonConvert.DeserializeObject<List<EnumLineDE>> (jsonString);
            }
            if (EnumLineList != null)
                return EnumLineList;
            else
            {
                EnumLineList = new List<EnumLineDE> ();
                return EnumLineList;
            }
            }
            catch (Exception ex)
            {
                MessageBox.Show (ex.Message.ToString (), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            return EnumLineList;
        }
        public async Task<EnumLineDE> Save ( EnumLineDE eLine )
        {
            EnumLineDE line = new EnumLineDE ();
            client.DefaultRequestHeaders.Accept.Add (new MediaTypeWithQualityHeaderValue ("application/json"));
            var response = await client.PostAsJsonAsync (Globals.BASE_API_URL + "Settings",eLine);
            if (response != null)
            {
                var res = response.StatusCode.ToString ();
                if (res == "OK")
                {
                    var jsonString = await response.Content.ReadAsStringAsync ();
                    line = JsonConvert.DeserializeObject<EnumLineDE> (jsonString);
                }
                else
                    MessageBox.Show ("        Error Occurred ,Please Try Again       ", "Error");
            }
            return line;
        }
        public  async Task<HttpResponseMessage> SaveEnumLine ( EnumLineDE line )
        {
            try { 
            client.DefaultRequestHeaders.Accept.Add (new MediaTypeWithQualityHeaderValue ("application/json"));
            var response = await client.PostAsJsonAsync (Globals.BASE_API_URL + "Settings", line);
            return response;
            }
            catch (Exception ex)
            {
                MessageBox.Show (ex.Message.ToString (), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }return new HttpResponseMessage ();
        }

    }
}

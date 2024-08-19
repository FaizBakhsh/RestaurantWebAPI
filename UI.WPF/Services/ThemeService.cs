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
    public class ThemeService:BaseService
    {
        HttpClient client;
        List<ThemeDataDE> themeData;
        public ThemeService()
        {
            client=new HttpClient();
            themeData= new List<ThemeDataDE>();
        }
        public async Task<HttpResponseMessage> SetTheme ( )
        {
            try
            {
                var data = new ThemeDataDE ();
                data.IsActive = true;
                data.ClientId = Properties.Settings.Default.ClientId;
                client.DefaultRequestHeaders.Accept.Add (new MediaTypeWithQualityHeaderValue ("application/json"));
                var response = await client.PostAsJsonAsync (Globals.BASE_API_URL + "ThemeData/Search", data);
                if (response != null)
                {
                    var jsonString = await response.Content.ReadAsStringAsync ();
                    themeData = JsonConvert.DeserializeObject<List<ThemeDataDE>> (jsonString);
                }
                if (themeData?.Count != 0)
                {
                    for (int i = 0; i < themeData?.Count; i++)
                    {
                        Application.Current.Resources.MergedDictionaries.Add (new ResourceDictionary
                        {
                            Source = new Uri (themeData[i].Source, UriKind.RelativeOrAbsolute)
                        });
                    }
                }
                return response;
            }
            catch (Exception ex)
            {
                MessageBox.Show (ex.Message.ToString (), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
                return new HttpResponseMessage ();
            }
        }
    }
}

using Newtonsoft.Json;
using Restaurant.Core.Entities;
using Restaurant.WPF.Entities;
using Restaurant.WPF.Views;
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
    public class ModifierService
    {
        HttpClient client;
        List<ModifierDE> Modifiers;
        public ModifierService ( )
        {
            client = new HttpClient ();
            Modifiers = new List<ModifierDE> ();
        }
        public async Task<List<ModifierDE>> GetModifiers ( )
        {
            try
            {
                var modifier = new ModifierDE ();
                modifier.IsActive = true;
                modifier.ClientId = Properties.Settings.Default.ClientId;
                client.DefaultRequestHeaders.Accept.Add (new MediaTypeWithQualityHeaderValue ("application/json"));
                var response = await client.PostAsJsonAsync (Globals.BASE_API_URL + "Modifier/Search", modifier);
                if (response != null)
                {
                    var res = response.StatusCode.ToString ();
                    if (res == "OK")
                    {
                        var jsonString = await response.Content.ReadAsStringAsync ();
                        Modifiers = JsonConvert.DeserializeObject<List<ModifierDE>> (jsonString);
                    }
                }
                if (Modifiers != null)
                    return Modifiers;
                else
                {
                    Modifiers = new List<ModifierDE> ();
                    return Modifiers;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show (ex.Message.ToString (), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            return Modifiers;
        }
    }
}

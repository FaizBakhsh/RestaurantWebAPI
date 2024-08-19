using Newtonsoft.Json;
using Restaurant.Core.Entities;
using Restaurant.WPF.Entities;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace Restaurant.WPF.Services
{
    public class RuntimeModifierService
    {
        HttpClient client;
        List<RuntimeModifierDE> modifiers;
        public RuntimeModifierService ( )
        {
            this.client = new HttpClient ();
            this.modifiers = new List<RuntimeModifierDE> ();
        }
        public async Task<List<RuntimeModifierDE>> GetRuntimeModifiers ( )
        {
            var response = await client.GetStringAsync (Globals.BASE_API_URL + "RuntimeModifier");
            modifiers = JsonConvert.DeserializeObject<List<RuntimeModifierDE>> (response);
            if (modifiers != null)
            {
                return modifiers;
            }
            else
            {
                modifiers = new List<RuntimeModifierDE> ();
                return modifiers;
            }
        }
        public async Task<List<RuntimeModifierDE>> SearchRuntimeModifier ( RuntimeModifierDE _rm )
        {
            try
            {
                _rm.IsActive = true;
                _rm.ClientId = Properties.Settings.Default.ClientId;
                client.DefaultRequestHeaders.Accept.Add (new MediaTypeWithQualityHeaderValue ("application/json"));
                var response = await client.PostAsJsonAsync (Globals.BASE_API_URL + "RuntimeModifier/Search", _rm);
                if (response != null)
                {
                    var res = response.StatusCode.ToString ();
                    if (res == "OK")
                    {
                        var jsonString = await response.Content.ReadAsStringAsync ();
                        modifiers = JsonConvert.DeserializeObject<List<RuntimeModifierDE>> (jsonString);
                    }
                }
                if (modifiers != null)
                    return modifiers;
                else
                {
                    modifiers = new List<RuntimeModifierDE> ();
                    return modifiers;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show (ex.Message.ToString (), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            return modifiers;
        }
    }
}

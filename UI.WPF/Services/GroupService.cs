using ImTools;
using Newtonsoft.Json;
using Restaurant.Core.Entities;
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
    public class GroupService : BaseService
    {
        public List<MenuGroupDE> GroupList;
        public GroupService ( )
        {
            client = new HttpClient ();
            GroupList = new List<MenuGroupDE> ();
        }
        public async Task<List<MenuGroupDE>> SearchGroup ( MenuGroupDE Group )
        {
            try
            {
                Group.IsActive = true;
                Group.ClientId = Properties.Settings.Default.ClientId;
                client.DefaultRequestHeaders.Accept.Add (new MediaTypeWithQualityHeaderValue ("application/json"));
                var response = await client.PostAsJsonAsync (Globals.BASE_API_URL + "MenuGroup/Search", Group);
                if (response != null)
                {
                    var jsonString = await response.Content.ReadAsStringAsync ();
                    GroupList = JsonConvert.DeserializeObject<List<MenuGroupDE>> (jsonString);
                }
                if (GroupList != null)
                    return GroupList;
                else
                {
                    GroupList = new List<MenuGroupDE> ();
                    return GroupList;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show (ex.Message.ToString (), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            return GroupList;
        }
    }
}

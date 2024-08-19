using Newtonsoft.Json;
using Restaurant.Core.Entities;
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
    public class ItemService
    {
        HttpClient client;
        public List<ItemDE> ItemList;
        public List<SizeDE> sizes;
        public ItemService ( )
        {
            client = new HttpClient ();
            ItemList = new List<ItemDE> ();
            sizes = new List<SizeDE> ();
        }
        public async Task<List<ItemDE>> GetItem ( )
        {
            var response = await client.GetStringAsync (Globals.BASE_API_URL + "Item");
            ItemList = JsonConvert.DeserializeObject<List<ItemDE>> (response);
            if (ItemList != null)
            {
                return ItemList;
            }
            else
            {
                ItemList = new List<ItemDE> ();
                return ItemList;
            }
        }
        public async Task<List<ItemDE>> SearchItem ( ItemDE Item )
        {
            try
            {
                Item.IsActive = true;
                Item.ClientId = Properties.Settings.Default.ClientId;
                client.DefaultRequestHeaders.Accept.Add (new MediaTypeWithQualityHeaderValue ("application/json"));
                var response = await client.PostAsJsonAsync (Globals.BASE_API_URL + "Item/Search", Item);
                if (response != null)
                {
                    var jsonString = await response.Content.ReadAsStringAsync ();
                    ItemList = JsonConvert.DeserializeObject<List<ItemDE>> (jsonString);
                }
                if (ItemList != null)
                    return ItemList;
                else
                {
                    ItemList = new List<ItemDE> ();
                    return ItemList;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show (ex.Message.ToString (), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            return ItemList;
        }
        public async Task<List<SizeDE>> SearchSize ( SizeDE size )
        {
            try
            {
                size.IsActive = true;
                size.ClientId = Properties.Settings.Default.ClientId;
                client.DefaultRequestHeaders.Accept.Add (new MediaTypeWithQualityHeaderValue ("application/json"));
                var response = await client.PostAsJsonAsync (Globals.BASE_API_URL + "Size/Search", size);
                if (response != null)
                {
                    var jsonString = await response.Content.ReadAsStringAsync ();
                    sizes = JsonConvert.DeserializeObject<List<SizeDE>> (jsonString);
                }
                if (sizes != null)
                    return sizes;
                else
                {
                    sizes = new List<SizeDE> ();
                    return sizes;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show (ex.Message.ToString (), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            return sizes;
        }
    }
}

using Newtonsoft.Json;
using Restaurant.Core.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http.Headers;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace Restaurant.WPF.Services
{
    public class OrderSourceService : BaseService
    {
        public List<OrderSourceDE> OrderSourceList;
        public OrderSourceService ( )
        {
            client = new HttpClient ();
            OrderSourceList = new List<OrderSourceDE> ();
        }
        public async Task<List<OrderSourceDE>> SearchOrderSource ( )
        {
            try
            {
                var OrderSource = new OrderSourceDE ();
                OrderSource.IsActive = true;
                OrderSource.ClientId = Properties.Settings.Default.ClientId;
                client.DefaultRequestHeaders.Accept.Add (new MediaTypeWithQualityHeaderValue ("application/json"));
                var response = await client.PostAsJsonAsync (Globals.BASE_API_URL + "OrderSource/Search", OrderSource);
                if (response != null)
                {
                    var jsonString = await response.Content.ReadAsStringAsync ();
                    OrderSourceList = JsonConvert.DeserializeObject<List<OrderSourceDE>> (jsonString);
                }
                if (OrderSourceList != null)
                    return OrderSourceList;
                else
                {
                    OrderSourceList = new List<OrderSourceDE> ();
                    return OrderSourceList;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show (ex.Message.ToString (), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            return OrderSourceList;
        }
    }
}

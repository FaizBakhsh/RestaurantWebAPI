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
    public class SaleDetailRefundService
    {
        HttpClient client;
        List<SaleDetailRefundDE> SaleDetailRefundList;
        public SaleDetailRefundService ( )
        {
            client = new HttpClient ();
            SaleDetailRefundList = new List<SaleDetailRefundDE> ();
        }
        public async Task<List<SaleDetailRefundDE>> GetSaleDetailRefunds ( )
        {
            var response = await client.GetStringAsync (Globals.BASE_API_URL + "SaleDetailRefund");
            SaleDetailRefundList = JsonConvert.DeserializeObject<List<SaleDetailRefundDE>> (response);
            if (SaleDetailRefundList != null)
            {
                return SaleDetailRefundList;
            }
            else
            {
                SaleDetailRefundList = new List<SaleDetailRefundDE> ();
                return SaleDetailRefundList;
            }
        }
        public async Task<List<SaleDetailRefundDE>> SearchSaleDetailRefund ( SaleDetailRefundDE SaleDetailRefund )
        {
            try
            {
                SaleDetailRefund.IsActive = true;
                SaleDetailRefund.ClientId = Properties.Settings.Default.ClientId;
                client.DefaultRequestHeaders.Accept.Add (new MediaTypeWithQualityHeaderValue ("application/json"));
                var response = await client.PostAsJsonAsync (Globals.BASE_API_URL + "SaleDetailRefund/Search", SaleDetailRefund);
                if (response != null)
                {
                    var jsonString = await response.Content.ReadAsStringAsync ();
                    SaleDetailRefundList = JsonConvert.DeserializeObject<List<SaleDetailRefundDE>> (jsonString);
                }
                if (SaleDetailRefundList != null)
                    return SaleDetailRefundList;
                else
                {
                    SaleDetailRefundList = new List<SaleDetailRefundDE> ();
                    return SaleDetailRefundList;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show (ex.Message.ToString (), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
                return SaleDetailRefundList;
            }
        }
        public async Task<Boolean> Save ( SaleDetailRefundDE refund )
        {
            bool retVal = false;
            client.DefaultRequestHeaders.Accept.Add (new MediaTypeWithQualityHeaderValue ("application/json"));
            var response = await client.PostAsJsonAsync (Globals.BASE_API_URL + "SaleDetailRefund", refund);
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
        public async Task<Boolean> Update ( SaleDetailRefundDE refund )
        {
            bool retVal = false;
            client.DefaultRequestHeaders.Accept.Add (new MediaTypeWithQualityHeaderValue ("application/json"));
            var response = await client.PutAsJsonAsync (Globals.BASE_API_URL + "SaleDetailRefund", refund);
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
    }
}

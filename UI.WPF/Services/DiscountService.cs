using Newtonsoft.Json;
using Restaurant.Core.Entities;
using Restaurant.WPF.Entities;
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
    public class DiscountService
    {
        HttpClient client;
        List<DiscountKeyDE> discountKeys;
        List<DiscountVouchersDE> discountVouchers;
        public DiscountService ( )
        {
            client = new HttpClient ();
            discountKeys = new List<DiscountKeyDE> ();
            discountVouchers = new List<DiscountVouchersDE> ();
        }
        public async Task<List<DiscountKeyDE>> GetDiscountKeys ( )
        {
            try
            {
                var key = new DiscountKeyDE ();
                key.IsActive = true;
                key.ClientId = Properties.Settings.Default.ClientId;
                client.DefaultRequestHeaders.Accept.Add (new MediaTypeWithQualityHeaderValue ("application/json"));
                var response = await client.PostAsJsonAsync (Globals.BASE_API_URL + "DiscountKey/Search", key);
                if (response != null)
                {
                    var jsonString = await response.Content.ReadAsStringAsync ();
                    discountKeys = JsonConvert.DeserializeObject<List<DiscountKeyDE>> (jsonString);
                }
                if (discountKeys != null)
                    return discountKeys;
                else
                {
                    discountKeys = new List<DiscountKeyDE> ();
                    return discountKeys;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show (ex.Message.ToString (), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            return discountKeys;
        }
        public async Task<List<DiscountVouchersDE>> GetDiscountVoucher ( )
        {
            try
            {
                var Vouchers = new DiscountVouchersDE ();
                Vouchers.IsActive = true;
                Vouchers.ClientId = Properties.Settings.Default.ClientId;
                client.DefaultRequestHeaders.Accept.Add (new MediaTypeWithQualityHeaderValue ("application/json"));
                var response = await client.PostAsJsonAsync (Globals.BASE_API_URL + "DiscountVouchers/Search", Vouchers);
                if (response != null)
                {
                    var jsonString = await response.Content.ReadAsStringAsync ();
                    discountVouchers = JsonConvert.DeserializeObject<List<DiscountVouchersDE>> (jsonString);
                }
                if (discountVouchers != null)
                    return discountVouchers;
                else
                {
                    discountVouchers = new List<DiscountVouchersDE> ();
                    return discountVouchers;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show (ex.Message.ToString (), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            return discountVouchers;
        }
    }
}

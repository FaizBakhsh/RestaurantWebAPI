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
    public class LoyaltyCardService
    {
        HttpClient client;
        List<LoyaltyCardDE> cardList;
        public LoyaltyCardService ( )
        {
            client = new HttpClient ();
            cardList = new List<LoyaltyCardDE> ();
        }
        public async Task<List<LoyaltyCardDE>> GetLoyaltyCards ( )
        {
            try
            {
                var response = await client.GetStringAsync (Globals.BASE_API_URL + "LoyaltyCard");
                cardList = JsonConvert.DeserializeObject<List<LoyaltyCardDE>> (response);
                if (cardList != null)
                {
                    return cardList;
                }
                else
                {
                    cardList = new List<LoyaltyCardDE> ();
                    return cardList;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show (ex.Message.ToString (), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            return cardList;
        }
        public async Task<List<LoyaltyCardDE>> SearchLoyaltyCard ( LoyaltyCardDE card )
        {
            try
            {
                client.DefaultRequestHeaders.Accept.Add (new MediaTypeWithQualityHeaderValue ("application/json"));
                var response = await client.PostAsJsonAsync (Globals.BASE_API_URL + "LoyaltyCard/Search", card);
                if (response != null)
                {
                    var res = response.StatusCode.ToString ();
                    if (res == "OK")
                    {
                        var jsonString = await response.Content.ReadAsStringAsync ();
                        cardList = JsonConvert.DeserializeObject<List<LoyaltyCardDE>> (jsonString);
                    }
                }
                if (cardList != null)
                    return cardList;
                else
                {
                    cardList = new List<LoyaltyCardDE> ();
                    return cardList;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show (ex.Message.ToString (), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            return cardList;
        }
    }
}

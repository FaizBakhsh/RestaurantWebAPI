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
using Restaurant.WPF.Entities;

namespace Restaurant.WPF.Services
{
    public class LogEventService
    {
        HttpClient client;
        List<LogEventDE> eventList;
        public LogEventService ( )
        {
            client = new HttpClient ();
            eventList = new List<LogEventDE> ();
        }
        public async Task<List<LogEventDE>> GetLogEvents ( )
        {
            var response = await client.GetStringAsync (Globals.BASE_API_URL + "LogEvent");
            eventList = JsonConvert.DeserializeObject<List<LogEventDE>> (response);
            if (eventList != null)
            {
                return eventList;
            }
            else
            {
                eventList = new List<LogEventDE> ();
                return eventList;
            }
        }
        public async Task<Boolean> Save ( LogEventDE events )
        {
            bool retVal = false;
            try
            {
                events.ClientId = Properties.Settings.Default.ClientId;
                client.DefaultRequestHeaders.Accept.Add (new MediaTypeWithQualityHeaderValue ("application/json"));
                var response = await client.PostAsJsonAsync (Globals.BASE_API_URL + "LogEvent", events);
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
            catch (Exception ex)
            {
                MessageBox.Show (ex.Message.ToString (), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            return retVal;
        }
        public async Task<Boolean> Update ( LogEventDE events )
        {
            bool retVal = false;
            try
            {
                client.DefaultRequestHeaders.Accept.Add (new MediaTypeWithQualityHeaderValue ("application/json"));
                var response = await client.PutAsJsonAsync (Globals.BASE_API_URL + "LogEvent", events);
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
            }
            catch (Exception ex)
            {
                MessageBox.Show (ex.Message.ToString (), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
                return retVal;
            }
            return retVal;
        }
    }
}

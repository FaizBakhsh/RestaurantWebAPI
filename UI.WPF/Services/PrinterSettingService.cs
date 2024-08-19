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
    public class PrinterSettingService : BaseService
    {
        private List<PrinterSettingDE> printStngs;
        List<PrinterSettingDE> printSvc;
        public PrinterSettingService ( )
        {
            printStngs = new List<PrinterSettingDE> ();
            printSvc = new List<PrinterSettingDE> ();
            client = new HttpClient ();

        }
        public async Task<List<PrinterSettingDE>> SearchPrinterSetting ( PrinterSettingDE PrinterSetting )
        {
            try
            {
                PrinterSetting.IsActive = true;
                PrinterSetting.ClientId = Properties.Settings.Default.ClientId;
                client.DefaultRequestHeaders.Accept.Add (new MediaTypeWithQualityHeaderValue ("application/json"));
                var response = await client.PostAsJsonAsync (Globals.BASE_API_URL + "PrinterSetting/Search", PrinterSetting);
                if (response != null)
                {
                    var jsonString = await response.Content.ReadAsStringAsync ();
                    printStngs = JsonConvert.DeserializeObject<List<PrinterSettingDE>> (jsonString);
                }
                if (printStngs != null)
                    return printStngs;
                else
                {
                    printStngs = new List<PrinterSettingDE> ();
                    return printStngs;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show (ex.Message.ToString (), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            return printStngs;
        }
    }
}

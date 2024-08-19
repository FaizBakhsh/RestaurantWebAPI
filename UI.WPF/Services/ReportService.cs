using Restaurant.Core.Entities;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Net.Http.Headers;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using Newtonsoft.Json;
using Restaurant.WPF.Entities.Reports;
using Restaurant.WPF.Core.Extensions;
using Restaurant.WPF.Entities.Enums;

namespace Restaurant.WPF.Services
{
    public class ReportService : BaseService
    {
        private PrinterSettingService pStngSvc;
        public ReportService ( )
        {
            pStngSvc = new PrinterSettingService ();
            client = new HttpClient ();
        }
        public async Task<SummaryReportDE> ShiftEndSummaryReport ( ShiftDE shift )
        {
            shift.ClientId = Properties.Settings.Default.ClientId;
            SummaryReportDE _data = new SummaryReportDE ();
            try
            {
                client.DefaultRequestHeaders.Accept.Add (new MediaTypeWithQualityHeaderValue ("application/json"));
                var response = await client.PostAsJsonAsync (Globals.BASE_API_URL + "Report/ShiftEndReport", shift);
                if (response != null)
                {
                    var res = response.StatusCode.ToString ();
                    if (res == "OK")
                    {
                        var jsonString = await response.Content.ReadAsStringAsync ();
                        _data = JsonConvert.DeserializeObject<SummaryReportDE> (jsonString);
                        await GenerateReport (_data, "ShiftReport", (int)ReportSubCategories.ShiftEndReport);
                    }
                    else
                        MessageBox.Show ("        Error Occurred ,Please Try Again       ", "Error");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show (ex.Message.ToString (), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            return _data;
        }
        public async Task<SummaryReportDE> DayEndSummaryReport ( SaleDayDE day )
        {
            day.ClientId = Properties.Settings.Default.ClientId;
            SummaryReportDE _data = new SummaryReportDE ();
            try
            {
                client.DefaultRequestHeaders.Accept.Add (new MediaTypeWithQualityHeaderValue ("application/json"));
                var response = await client.PostAsJsonAsync (Globals.BASE_API_URL + "Report/DayEndReport", day);
                if (response != null)
                {
                    var res = response.StatusCode.ToString ();
                    if (res == "OK")
                    {
                        var jsonString = await response.Content.ReadAsStringAsync ();
                        _data = JsonConvert.DeserializeObject<SummaryReportDE> (jsonString);
                        await GenerateReport (_data, "DayReport", (int)ReportSubCategories.DayEndReport);
                    }
                    else
                        MessageBox.Show ("        Error Occurred ,Please Try Again       ", "Error");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show (ex.Message.ToString (), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            return _data;
        }
        public async Task GenerateReport ( SummaryReportDE data, string type, int ReportSubCat )
        {
            try
            {
                using (var httpClient = new HttpClient ())
                {
                    var tempPdfDirectory = Path.Combine (Path.GetTempPath (), "YourAppTempFiles");
                    Directory.CreateDirectory (tempPdfDirectory);
                    client.DefaultRequestHeaders.Accept.Add (new MediaTypeWithQualityHeaderValue ("application/json"));
                    data.ReportName = type;
                  //  var _response = await httpClient.PostAsJsonAsync (Globals.SpringBoot_API_URL + "EndReport/" + type, data);
                    var _response = await client.PostAsJsonAsync (Globals.BASE_API_URL + "SaleReports/SummaryRpt", data);
                    if (_response.IsSuccessStatusCode)
                    {
                        byte[] pdfBytes = await _response.Content.ReadAsByteArrayAsync ();
                        string tempPdfPath = Path.Combine (tempPdfDirectory, $"report_{Guid.NewGuid ()}.pdf");
                        File.WriteAllBytes (tempPdfPath, pdfBytes);
                        var printerInfo = await pStngSvc.SearchPrinterSetting (new PrinterSettingDE
                        {
                            SubCategoryId = (int)ReportSubCat,
                        });

                        if (printerInfo != null && printerInfo.Count > 0)
                        {
                            string printerName = printerInfo[0].Printer;
                            int? numberOfPrints = printerInfo[0].NoofPrints;

                            if (printerName.PrinterIsInstalled ())
                            {
                                for (int i = 0; i < numberOfPrints; i++)
                                {
                                    printerName.Printing (tempPdfPath);
                                }
                            }
                            else
                            {
                                MessageBox.Show ($"Printer '{printerName}' is not installed or not available.");
                                tempPdfPath.OpenPdf ();
                            }
                        }
                        else
                            tempPdfPath.OpenPdf ();
                    }
                    else
                        MessageBox.Show ($"Failed to generate PDF: {_response.ReasonPhrase}");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show (ex.Message.ToString (), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
    }
}

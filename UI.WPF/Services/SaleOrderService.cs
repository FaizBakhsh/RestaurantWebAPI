using Newtonsoft.Json;
using Restaurant.Core.Entities;
using Restaurant.WPF.Entities;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using PdfiumViewer;
using System.Windows.Controls;
using Syncfusion.Windows.PdfViewer;
using System.Diagnostics;
using System.Reflection;
using DocumentFormat.OpenXml.Drawing.Charts;
using Restaurant.Core.Enums;
using System.Printing;
using System.Drawing.Printing;
using System.Drawing; // Make sure to add a reference to System.Drawing assembly
using ImTools;
using Image = System.Drawing.Image;
using Restaurant.WPF.Core.Extensions;
using Restaurant.WPF.Entities.Enums;
using ControlzEx.Standard;
using System.Text.RegularExpressions;

namespace Restaurant.WPF.Services
{

    public class SaleOrderService : BaseService
    {
        //HttpClient client;
        List<SaleOrderDE> saleList;
        private EnumLineService lineService;
        private PrinterSettingService pStngSvc;
        private PrintDocument printDocument = new PrintDocument ();
        public SaleOrderService ( )
        {
            printDocument.PrintPage += PrintPage;
            pStngSvc = new PrinterSettingService ();
            client = new HttpClient ();
            saleList = new List<SaleOrderDE> ();
            lineService = new EnumLineService ();
        }
        private void PrintPage ( object sender, PrintPageEventArgs e )
        {
            // Your printing logic goes here
            // For example, you can draw text or images on the page
            e.Graphics.DrawString ("Hello, Printer!", new Font ("Arial", 12), Brushes.Black, 10, 10);
        }
        public async Task<List<SaleOrderDE>> GetOrders ( )
        {
            try
            {
                var order = new SaleOrderDE ();
                order.ClientId = Properties.Settings.Default.ClientId;
                client.DefaultRequestHeaders.Accept.Add (new MediaTypeWithQualityHeaderValue ("application/json"));
                var response = await client.PostAsJsonAsync (Globals.BASE_API_URL + "SaleOrder/Search", order);
                if (response != null)
                {
                    var jsonString = await response.Content.ReadAsStringAsync ();
                    saleList = JsonConvert.DeserializeObject<List<SaleOrderDE>> (jsonString);
                }
                if (saleList != null)
                {
                    return saleList;
                }
                else
                {
                    saleList = new List<SaleOrderDE> ();
                    return saleList;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show (ex.Message.ToString (), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
                return saleList;
            }
        }
        public async Task<List<SaleOrderDE>> Orders ( )
        {
            try
            {
                var order = new SaleOrderDE ();
                order.ClientId = Properties.Settings.Default.ClientId;
                client.DefaultRequestHeaders.Accept.Add (new MediaTypeWithQualityHeaderValue ("application/json"));
                var response = await client.PostAsJsonAsync (Globals.BASE_API_URL + "SaleOrder/Order", order);
                if (response != null)
                {
                    var jsonString = await response.Content.ReadAsStringAsync ();
                    saleList = JsonConvert.DeserializeObject<List<SaleOrderDE>> (jsonString);
                }
                if (saleList != null)
                {
                    return saleList;
                }
                else
                {
                    saleList = new List<SaleOrderDE> ();
                    return saleList;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show (ex.Message.ToString (), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
                return saleList;
            }
        }
        public async Task<List<SaleOrderDE>> SearchSaleOrder ( SaleOrderDE SaleOrder )
        {
            try
            {
                SaleOrder.IsActive = true;
                SaleOrder.ClientId = Properties.Settings.Default.ClientId;
                client.DefaultRequestHeaders.Accept.Add (new MediaTypeWithQualityHeaderValue ("application/json"));
                var response = await client.PostAsJsonAsync (Globals.BASE_API_URL + "SaleOrder/Search", SaleOrder);
                if (response != null)
                {
                    var jsonString = await response.Content.ReadAsStringAsync ();
                    saleList = JsonConvert.DeserializeObject<List<SaleOrderDE>> (jsonString);
                }
                if (saleList != null)
                    return saleList;
                else
                {
                    saleList = new List<SaleOrderDE> ();
                    return saleList;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show (ex.Message.ToString (), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
                return saleList;
            }
        }
        public async Task<SaleOrderDE> Save ( SaleOrderDE order )
        {
            SaleOrderDE saleOrder = new SaleOrderDE ();
            try
            {
                order.ClientId = Properties.Settings.Default.ClientId;
                client.DefaultRequestHeaders.Accept.Add (new MediaTypeWithQualityHeaderValue ("application/json"));
                var response = await client.PostAsJsonAsync (Globals.BASE_API_URL + "SaleOrder", order);
                if (response != null)
                {
                    var res = response.StatusCode.ToString ();
                    if (res == "OK")
                    {
                        var jsonString = await response.Content.ReadAsStringAsync ();
                        saleOrder = JsonConvert.DeserializeObject<SaleOrderDE> (jsonString);
                    }
                    else
                        MessageBox.Show ("        Error Occurred ,Please Try Again       ", "Error");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show (ex.Message.ToString (), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            return saleOrder;
        }
        public async Task<SaleOrderDE> Update ( SaleOrderDE order )
        {
            SaleOrderDE saleOrder = new SaleOrderDE ();
            order.ClientId = Properties.Settings.Default.ClientId;
            var orders = await SearchSaleOrder (order);
            try
            {
                client.DefaultRequestHeaders.Accept.Add (new MediaTypeWithQualityHeaderValue ("application/json"));
                var response = await client.PutAsJsonAsync (Globals.BASE_API_URL + "SaleOrder", order);
                if (response != null)
                {
                    var res = response.StatusCode.ToString ();
                    if (res == "OK")
                    {
                        var jsonString = await response.Content.ReadAsStringAsync ();
                        saleOrder = JsonConvert.DeserializeObject<SaleOrderDE> (jsonString);
                        var _order = new SaleOrderDE ();
                        foreach (PropertyInfo propertyInfo in typeof (SaleOrderDE).GetProperties ())
                        {
                            if (propertyInfo.Name != "SaleOrderLines")
                                propertyInfo.SetValue (_order, propertyInfo.GetValue (saleOrder));
                        }
                        _order.SaleOrderLines.AddRange (order.SaleOrderLines.FindAll (X => X.DBoperation == (int)DBoperations.Insert));
                        if (orders != null)
                            if (orders.Count > 0)
                            {
                                foreach (var item in orders[0].SaleOrderLines)
                                {
                                    var line = order.SaleOrderLines.Find (x => x.Id == item.Id);
                                    if (line != null)
                                        if (line.QTY > item.QTY)
                                        {
                                            line.QTY = line.QTY - item.QTY;
                                            line.LineTotal = line.QTY * line.Price;
                                            _order.SaleOrderLines.Add (line);
                                        }
                                }
                            }
                        if (_order.SaleOrderLines.Count > 0)
                            this.GeneratePDF (_order, "AddOn", (int)ReportSubCategories.AddOnReport);
                    }
                    else
                        MessageBox.Show ("        Error Occurred ,Please Try Again       ", "Error");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show (ex.Message.ToString (), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            return saleOrder;
        }
        public async Task<HttpResponseMessage> UpdateOrder ( SaleOrderDE order )
        {
            order.ClientId = Properties.Settings.Default.ClientId;
            SaleOrderDE saleOrder = new SaleOrderDE ();
            try
            {
                client.DefaultRequestHeaders.Accept.Add (new MediaTypeWithQualityHeaderValue ("application/json"));
                var response = await client.PutAsJsonAsync (Globals.BASE_API_URL + "SaleOrder", order);
                var res = response.StatusCode.ToString ();
                if (res == "OK")
                {
                    var jsonString = await response.Content.ReadAsStringAsync ();
                    saleOrder = JsonConvert.DeserializeObject<SaleOrderDE> (jsonString);
                    var _order = new SaleOrderDE ();
                    foreach (PropertyInfo propertyInfo in typeof (SaleOrderDE).GetProperties ())
                    {
                        if (propertyInfo.Name != "SaleOrderLines")
                            propertyInfo.SetValue (_order, propertyInfo.GetValue (saleOrder));
                    }
                    _order.SaleOrderLines.AddRange (order.SaleOrderLines.FindAll (X => X.DBoperation == (int)DBoperations.Insert));

                    this.GeneratePDF (_order, "AddOn", (int)ReportSubCategories.AddOnReport);
                }
                return response;
            }
            catch (Exception ex)
            {
                MessageBox.Show (ex.Message.ToString (), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
                return new HttpResponseMessage ();
            }
        }
        public async Task<HttpResponseMessage> PostOrder ( SaleOrderDE saleOrder )
        {
            client.DefaultRequestHeaders.Accept.Add (new MediaTypeWithQualityHeaderValue ("application/json"));
            var response = await client.PostAsJsonAsync (Globals.BASE_API_URL + "SaleOrder", saleOrder);
            return response;
        }

        #region Report
        public async void GeneratePDF ( SaleOrderDE order, string pdfType, int ReportSubCat )
        {
            try
            {
                var groupedByKDS = order.SaleOrderLines.GroupBy (ol => ol.KDSId);
                foreach (var group in groupedByKDS)
                {

                    var _order = new SaleOrderDE ();
                    foreach (PropertyInfo propertyInfo in typeof (SaleOrderDE).GetProperties ())
                    {
                        if (propertyInfo.Name != "SaleOrderLines")
                            propertyInfo.SetValue (_order, propertyInfo.GetValue (order));
                    }
                    var newOrder = new SaleOrderDE ();
                    newOrder = _order;
                    //newOrder.SaleOrderLines.Clear ();
                    newOrder.SaleOrderLines.AddRange (group);
                    if (newOrder.SaleOrderLines != null)
                        if (newOrder.SaleOrderLines.Count > 0)
                        {
                            var kdsId = newOrder.SaleOrderLines[0].KDSId;
                            if (kdsId != 0)
                            {
                                var enumline = new EnumLineDE ();
                                enumline.Id = kdsId;
                                enumline.ClientId = Properties.Settings.Default.ClientId;
                                var kdslist = await lineService.SearchEnumLine (enumline);
                                if (kdslist != null)
                                    if (kdslist.Count > 0)
                                    {
                                        var kds = kdslist[0].Name;
                                        foreach (var line in newOrder.SaleOrderLines)
                                        {
                                            line.KDS = kds;
                                        }
                                    }
                            }
                        }
                    await CallAPIforPDF (newOrder, pdfType, ReportSubCat);
                }
            }
            catch { }
        }
        public async Task CallAPIforPDF ( SaleOrderDE sale, string pdfType, int ReportSubCat )
        {
            try
            {
                using (var httpClient = new HttpClient ())
                {
                    var tempPdfDirectory = Path.Combine (Path.GetTempPath (), "YourAppTempFiles");
                    Directory.CreateDirectory (tempPdfDirectory);

                    httpClient.DefaultRequestHeaders.Accept.Add (new MediaTypeWithQualityHeaderValue ("application/json"));

                    //var response = await httpClient.PostAsJsonAsync (Globals.BASE_API_URL + "SaleOrder/" + pdfType, sale);
                    string json = JsonConvert.SerializeObject (sale);
                    StringContent content = new StringContent (json, Encoding.UTF8, "application/json");
                    sale.ReportName = pdfType;
                    var response = await client.PostAsJsonAsync (Globals.BASE_API_URL +"SaleReports/SaleRpt", sale);
                    //var response = await httpClient.PostAsJsonAsync (Globals.SpringBoot_API_URL + pdfType + "/Report", sale);

                    if (response.IsSuccessStatusCode)
                    {

                        byte[] pdfBytes = await response.Content.ReadAsByteArrayAsync ();
                        // Generate a unique temporary file name
                        string tempPdfPath = Path.Combine (tempPdfDirectory, $"report_{Guid.NewGuid ()}.pdf");
                        // Save the PDF to the temporary file
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
                        MessageBox.Show ($"Failed to generate PDF: {response.ReasonPhrase}");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show (ex.Message.ToString (), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
        public async Task SaleInvoice ( SaleOrderDE sale, string invType )
        {
            try
            {
                using (var httpClient = new HttpClient ())
                {
                    var tempPdfDirectory = Path.Combine (Path.GetTempPath (), "YourAppTempFiles");
                    Directory.CreateDirectory (tempPdfDirectory);

                    client.DefaultRequestHeaders.Accept.Add (new MediaTypeWithQualityHeaderValue ("application/json"));
                    //var response = await httpClient.PostAsJsonAsync (Globals.BASE_API_URL + "SaleOrder/SaleInvoice/"+invType, sale);
                    var _response = await httpClient.PostAsJsonAsync (Globals.SpringBoot_API_URL + "SaleOrder/Report/" + invType, sale);
                    if (_response.IsSuccessStatusCode)
                    {
                        byte[] pdfBytes = await _response.Content.ReadAsByteArrayAsync ();
                        // Generate a unique temporary file name
                        string tempPdfPath = Path.Combine (tempPdfDirectory, $"report_{Guid.NewGuid ()}.pdf");
                        // Save the PDF to the temporary file
                        File.WriteAllBytes (tempPdfPath, pdfBytes);
                        // Open the PDF file with the default PDF viewer
                        Process.Start (new ProcessStartInfo
                        {
                            FileName = tempPdfPath,
                            UseShellExecute = true
                        });
                    }
                    else
                    {
                        MessageBox.Show ($"Failed to generate PDF: {_response.ReasonPhrase}");
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show (ex.Message.ToString (), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
        public async Task SaleInvoice ( SaleOrderDE sale, InvoiceTypes invType, int ReportSubCat )
        {
            try
            {
                using (var httpClient = new HttpClient ())
                {
                    var tempPdfDirectory = Path.Combine (Path.GetTempPath (), "YourAppTempFiles");
                    Directory.CreateDirectory (tempPdfDirectory);

                    httpClient.DefaultRequestHeaders.Accept.Add (new MediaTypeWithQualityHeaderValue ("application/json"));
                    sale.ReportName = Regex.Replace (invType.ToString (), "(?<!^)([A-Z])", " $1") ;
                    sale.DisplayCash =invType==InvoiceTypes.SaleInvoice?true:false;
                    var response = await client.PostAsJsonAsync (Globals.BASE_API_URL + "SaleReports/SaleInvoice", sale);

                    if (response.IsSuccessStatusCode)
                    {
                        byte[] pdfBytes = await response.Content.ReadAsByteArrayAsync ();
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
                                //using (FileStream fs = new FileStream (tempPdfPath, FileMode.Open, FileAccess.Read))
                                //{
                                //    using (Image image = Image.FromStream (fs))
                                //    {
                                //        for (int i = 0; i < numberOfPrints; i++)
                                //        {
                                //            PrintDocument pd = new PrintDocument ();
                                //            pd.PrinterSettings.PrinterName = printerName;
                                //            pd.PrintPage += ( s, e ) =>
                                //            {
                                //                e.Graphics.DrawImage (image, e.MarginBounds);
                                //            };
                                //            pd.Print ();
                                //        }
                                //    }
                                //}
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
                        MessageBox.Show ($"Failed to generate PDF: {response.ReasonPhrase}");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show (ex.Message.ToString (), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        #endregion
    }
}

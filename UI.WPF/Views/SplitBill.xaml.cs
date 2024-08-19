using Newtonsoft.Json;
using Restaurant.Core.Entities;
using Restaurant.Core.Enums;
using Restaurant.WPF.Entities.Enums;
using Restaurant.WPF.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace Restaurant.WPF.Views
{
    /// <summary>
    /// Interaction logic for SplitBill.xaml
    /// </summary>
    public partial class SplitBill
    {
        #region Properties

        List<SaleOrderDE> saleList;
        List<SaleOrderDE> list;
        List<SaleOrderLineDE> sLine;
        SaleOrderService saleService;
        SaleOrderDE order;
        SaleOrderDE newOrder;
        HttpClient client;

        #endregion
        #region Constructor

        public SplitBill ( )
        {

            saleService = new SaleOrderService ();
            saleList = new List<SaleOrderDE> ();
            list = new List<SaleOrderDE> ();
            sLine = new List<SaleOrderLineDE> ();
            order = new SaleOrderDE ();
            newOrder = new SaleOrderDE ();
            client = new HttpClient ();
            InitializeComponent ();
            GetOrders ();

        }

        #endregion
        #region Methods
        public async void GetOrders ( )
        {
            try
            {
                orderListSP.Children.Clear ();
                LineGrid.ItemsSource = null;
                selectedLines.ItemsSource = null;
                var _order = new SaleOrderDE ();
                _order.BillStatusId = (int)BillStatuses.Pending;
                saleList = await saleService.SearchSaleOrder (_order);
                list = saleList;
                if (saleList != null)
                {
                    saleList = saleList.Where (x => x.StatusId != (int)Statuses.Close).ToList ();
                    for (int i = 0; i < saleList.Count; i++)
                    {
                        Button button = new Button ();
                        if (saleList[i].OrderTypeId == (int)OrderTypes.TakeAway)
                        {
                            button.Background = new SolidColorBrush (Colors.CadetBlue);
                            // button.Foreground = new SolidColorBrush(Colors.White);
                        }
                        else if (saleList[i].OrderTypeId == (int)OrderTypes.DineIn)
                        {
                            button.Background = new SolidColorBrush (Colors.DimGray);
                            //button.Foreground = new SolidColorBrush(Colors.White);
                        }
                        else if (saleList[i].OrderTypeId == (int)OrderTypes.Delivery)
                        {
                            button.Background = new SolidColorBrush (Colors.DarkKhaki);
                            //button.Foreground = new SolidColorBrush(Colors.White);
                        }
                        button.Content = saleList[i].BillTitle;
                        button.FontSize = 19;
                        button.Padding = new Thickness (10, 10, 10, 10);
                        button.CommandParameter = saleList[i];
                        button.Click += new RoutedEventHandler (ShowSelectedOrder);

                        orderListSP.Children.Add (button);
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show (ex.Message.ToString (), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
        public void ShowSelectedOrder ( object sender, RoutedEventArgs e )
        {
            Button? btn = sender as Button;
            if (btn != null)
            {

                order = (SaleOrderDE)btn.CommandParameter;
                foreach (var item in order.SaleOrderLines)
                {
                    item.Status = "Pending";
                    item.ForeGround = "Black";
                    item.Color = "White";
                }
                LineGrid.ItemsSource = order.SaleOrderLines;
                newOrder.SaleOrderLines = new List<SaleOrderLineDE> ();
                selectedLines.ItemsSource = null;
            }
        }
        public void Row_DoubleClick ( object sender, MouseButtonEventArgs e )
        {
            if (order.SaleOrderLines.Count > 1)
            {
                DataGridRow row = (DataGridRow)sender;
                SaleOrderLineDE line = (SaleOrderLineDE)row.Item;
                if (line.Status != "Splitted")
                {
                    // row.Background = new SolidColorBrush(Colors.Dark);
                    line.Status = "Splitted";
                    line.Color = "DarkRed";
                    line.ForeGround = "White";
                    line.DBoperation = 3;
                    newOrder.SaleOrderLines.Add (line);
                    selectedLines.ItemsSource = newOrder.SaleOrderLines;
                    CollectionViewSource.GetDefaultView (selectedLines.ItemsSource).Refresh ();
                    LineGrid.CommitEdit ();
                    LineGrid.CancelEdit ();
                    CollectionViewSource.GetDefaultView (LineGrid.ItemsSource).Refresh ();

                }
            }
            else
                MessageBox.Show ("Can't Spilt The Order Having Only One Item");
        }
        public void Back ( object sender, RoutedEventArgs e )
        {
            // POS window = new POS ();
            //window.Show ();
            this.Close ();
        }
        public async void UpdateOrder ( )
        {
            var _order = await saleService.Update (order);
            if (_order.Id > 0)
            {
                foreach (Window window in Application.Current.Windows)
                {
                    if (window.GetType () == typeof (POS))
                    {
                        POS pos = (POS)window;
                        await pos.getOrders ();
                        this.GetOrders ();
                        splitButton.IsEnabled = true;
                        break;
                    }
                }
                // POS window = new POS();
                //window.Show();
                // this.Close();
            }
            else
            {
                MessageBox.Show ("Error Occurred ");
                splitButton.IsEnabled = true;
            }
        }
        public async void AddNewOrder ( )
        {
            var res = await saleService.Save (newOrder);
            if (res.Id > 0)
            {
                UpdateOrder ();
            }
            else
            {
                MessageBox.Show ("Error Occurred ");
                splitButton.IsEnabled = true;
            }
        }
        public void SplitBill_btn ( object sender, RoutedEventArgs e )
        {
            try
            {
                if (newOrder.SaleOrderLines.Count > 0)
                {
                    splitButton.IsEnabled = false;
                    newOrder = new SaleOrderDE
                    {
                        Discount = order.Discount,
                        DiscountValue = order.DiscountValue,
                        GST = order.GST,
                        GSTValue = order.GSTValue,
                        IsActive = order.IsActive,
                        CreatedOn = order.CreatedOn,
                        CustomerId = order.CustomerId,
                        TableNo = order.TableNo,
                        SourceId = order.SourceId,
                        Guest = order.Guest,
                        WaiterId = order.WaiterId,
                        RestaurantId = order.RestaurantId,
                        OrderTypeId = order.OrderTypeId,
                        PhoneNo = order.PhoneNo,
                        Address = order.Address,
                        Name = order.Name,
                        BillTitle = order.BillTitle + "  " + "I",
                        ShiftId = order.ShiftId,
                        Note = order.Note,
                        StatusId = order.StatusId,
                        BillStatusId = order.BillStatusId,
                        TerminalId = order.TerminalId,
                        PaymentMethodId = order.PaymentMethodId,
                        SaleOrderLines = newOrder.SaleOrderLines,
                        DiscountTypeId = order.DiscountTypeId,
                        DiscountNarration = order.DiscountNarration,
                        VoucherNarration = order.VoucherNarration,
                        Comments = order.Comments,
                        Date = Properties.Settings.Default.CurrentDate,
                        Time = DateTime.Now.ToShortTimeString ()
                    };
                    var value = list.Find (x => x.BillTitle == newOrder.BillTitle);
                    while (value != null)
                    {
                        newOrder.BillTitle = newOrder.BillTitle + "  " + "I";
                        var odr = list.Find (x => x.BillTitle == newOrder.BillTitle);
                        if (odr == null)
                            value = null;
                    }
                    GetTotal ();
                    NetTotal ();
                    AddNewOrder ();
                }
                else
                    MessageBox.Show ("Please Select Items to Split");
            }
            catch (Exception ex)
            {
                MessageBox.Show (ex.Message.ToString (), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
        public void GetTotal ( )
        {
            order.Total = 0;
            foreach (var item in order.SaleOrderLines)
            {
                if (item.Status != "Splitted")
                    order.Total += item.LineTotal;
            }
            foreach (var item in newOrder.SaleOrderLines)
            {
                newOrder.Total += item.LineTotal;
            }
        }
        public void NetTotal ( )
        {
            try
            {
                if (order.DiscountTypeId == (int)DiscountTypes.DiscountKey)
                {
                    var discount = (order.Discount * order.Total) / 100;
                    discount = Double.IsNaN (discount) ? 0 : discount;
                    var gst = (order.GST * order.Total) / 100;
                    gst = Double.IsNaN (gst) ? 0 : gst;
                    order.Service = order.Service;
                    order.NetTotal = (float)((order.Total - discount) + gst + order.Service + order.DeliveryCharges + order.POSFee);

                    var newOrderDiscount = (order.Discount * newOrder.Total) / 100;
                    newOrderDiscount = Double.IsNaN (newOrderDiscount) ? 0 : newOrderDiscount;
                    var newOrderGST = (order.GST * newOrder.Total) / 100;
                    newOrderGST = Double.IsNaN (newOrderGST) ? 0 : newOrderGST;
                    discount = Double.IsNaN (discount) ? 0 : discount;
                    newOrder.Service = order.Service;
                    newOrder.DeliveryCharges = order.DeliveryCharges;
                    newOrder.POSFee = order.POSFee;
                    newOrder.NetTotal = (float)((newOrder.Total - newOrderDiscount) + newOrderGST + newOrder.Service + order.DeliveryCharges + order.POSFee);
                    if (Double.IsNaN (newOrder.NetTotal))
                        newOrder.NetTotal = 0;

                    order.DiscountValue = discount;
                    newOrder.DiscountValue = newOrderDiscount;
                }
                else
                {
                    var discount = (order.DiscountValue * 100) / order.Total;
                    discount = Double.IsNaN (discount) ? 0 : discount;
                    var gst = (order.GST * order.Total) / 100;
                    gst = Double.IsNaN (gst) ? 0 : gst;
                    order.Service = order.Service;
                    order.NetTotal = (float)((order.Total - discount) + gst + order.Service + order.DeliveryCharges + order.POSFee);

                    var newOrderDiscount = (order.DiscountValue * 100) / newOrder.Total;
                    newOrderDiscount = Double.IsNaN (newOrderDiscount) ? 0 : newOrderDiscount;
                    var newOrderGST = (order.GST * newOrder.Total) / 100;
                    newOrderGST = Double.IsNaN (newOrderGST) ? 0 : newOrderGST;
                    newOrder.Service = order.Service;
                    newOrder.DeliveryCharges = order.DeliveryCharges;
                    newOrder.POSFee = order.POSFee;
                    newOrder.NetTotal = (float)((newOrder.Total - newOrderDiscount) + newOrderGST + newOrder.Service + order.DeliveryCharges + order.POSFee);
                    if (Double.IsNaN (newOrder.NetTotal))
                        newOrder.NetTotal = 0;

                    order.Discount = discount;
                    newOrder.Discount = newOrderDiscount;
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

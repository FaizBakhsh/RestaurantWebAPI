

using ControlzEx.Theming;
using DocumentFormat.OpenXml.Spreadsheet;
using ImTools;
using Newtonsoft.Json;
using Restaurant.Core.Entities;
using Restaurant.Core.Enums;
using Restaurant.WPF.Entities.Enums;
using Restaurant.WPF.Services;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Reflection;
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
    public partial class KitchenInventry
    {

        #region Class Variables

        private HttpClient _client;
        private SaleOrderService saleSvc;
        private SaleDetailRefundService sdrSvc;
        List<SaleOrderDE> saleOrders;
        List<SaleOrderDE> ordersList;

        #endregion
        public KitchenInventry ( )
        {
            InitializeComponent ();
            ordersList = new List<SaleOrderDE> ();
            _client = new HttpClient ();
            saleSvc = new SaleOrderService ();
            sdrSvc = new SaleDetailRefundService ();
            saleOrders = new List<SaleOrderDE> ();
            getOrders ();
        }
        public async void getOrders ( )
        {
            try
            {
                orders.Children.Clear ();
                saleOrders = new List<SaleOrderDE> ();
                ordersList = await saleSvc.Orders ();
                if (ordersList != null)
                {
                    //ordersList = ordersList.Where(x => x.StatusId != (int)Statuses.Close).ToList();
                    foreach (var order in ordersList)
                    {
                        var deletedLines = new List<SaleOrderLineDE> ();
                        List<SaleDetailRefundDE> sdr = await sdrSvc.SearchSaleDetailRefund (new SaleDetailRefundDE { SaleOrderId = order.Id });
                        foreach (var line in sdr)
                        {
                            SaleOrderLineDE _line = new SaleOrderLineDE ();
                            _line.QTY = -line.QTY;
                            _line.ItemName = line.ItemName;
                            deletedLines.Add (_line);
                        }
                        order.SaleOrderLines = order.SaleOrderLines.Where (x => x.StatusId != (int)Statuses.Close).ToList ();
                        var groupedByAddOnNo = order.SaleOrderLines.GroupBy (ol => ol.AddOnNo);
                        foreach (var group in groupedByAddOnNo)
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
                            newOrder.SaleOrderLines.AddRange (deletedLines);
                            saleOrders.Add (newOrder);
                        }
                    }
                    for (int i = 0; i < saleOrders.Count; i++)
                    {
                        DataGrid grid = new DataGrid ();
                        grid.ItemsSource = saleOrders[i].SaleOrderLines;
                        grid.AutoGenerateColumns = false;
                        grid.Columns.Add (new DataGridTextColumn { Foreground = (Brush)this.FindResource ("MahApps.Brushes.Text"), Header = "ItemName", Binding = new Binding ("ItemName"), Width = new DataGridLength (30, DataGridLengthUnitType.Star), });
                        grid.Columns.Add (new DataGridTextColumn { Foreground = (Brush)this.FindResource ("MahApps.Brushes.Text"), Header = "QTY", Binding = new Binding ("QTY") });
                        grid.Padding = new System.Windows.Thickness (10, 0, 10, 0);
                        grid.Margin = new System.Windows.Thickness (6, 6, 6, 3);
                        grid.Height = 210;
                        double parentWidth = ActualWidth;
                        grid.Width = (parentWidth * 23) / 100.0; ;
                        grid.Foreground = Brushes.Black;
                        grid.CanUserResizeColumns = false;
                        grid.VerticalScrollBarVisibility = ScrollBarVisibility.Auto;
                        grid.HorizontalScrollBarVisibility = ScrollBarVisibility.Disabled;
                        grid.Background = (Brush)this.FindResource ("MahApps.Brushes.Accent4");
                        grid.CanUserResizeRows = false;
                        Button button = new Button ();
                        button.Height = 68;
                        StackPanel contentPanel = new StackPanel ();
                        TextBlock part1Text = new TextBlock ();
                        TextBlock part2Text = new TextBlock ();
                        if (saleOrders[i].SaleOrderLines.Any (x => x.AddOnNo > 1))
                            part1Text.Text = "Add On-";
                        else
                            part1Text.Text = "";
                        if (saleOrders[i].OrderTypeId == 1004001)
                            part1Text.Text += "Take Away-Order No: " + saleOrders[i].Id;
                        else if (saleOrders[i].OrderTypeId == 1004002)
                            part1Text.Text += "DineIn-Order No: " + saleOrders[i].Id;
                        else if (saleOrders[i].OrderTypeId == 1004003)
                            part1Text.Text += "Delivery-Order No: " + saleOrders[i].Id;
                        part1Text.Text += "!";
                        part2Text.Text += saleOrders[i].BillTitle + "-" + saleOrders[i].Terminal;
                        part1Text.FontSize = 16;
                        part2Text.FontSize = 16;
                        part1Text.TextWrapping = TextWrapping.Wrap;
                        part2Text.TextWrapping = TextWrapping.Wrap;
                        part1Text.IsHitTestVisible = false;
                        part2Text.IsHitTestVisible = false;
                        contentPanel.Children.Add (part1Text);
                        contentPanel.Children.Add (part2Text);
                        contentPanel.IsHitTestVisible = false;
                        ScrollViewer scrollViewer = new ScrollViewer ();
                        scrollViewer.HorizontalScrollBarVisibility = ScrollBarVisibility.Auto;
                        scrollViewer.VerticalScrollBarVisibility = ScrollBarVisibility.Hidden;
                        scrollViewer.IsHitTestVisible = false;
                        scrollViewer.Content = contentPanel;
                        button.Content = scrollViewer;

                        button.Margin = new Thickness (5, 5, 5, 5);
                        button.Padding = new Thickness (10, 5, 10, 5);
                        button.Background = (Brush)this.FindResource ("MahApps.Brushes.HighContrastCornflowerBlue");
                        button.Foreground = Brushes.White;
                        button.Width = grid.Width;
                        button.CommandParameter = saleOrders[i];
                        button.Click += new RoutedEventHandler (ChangeStatus);

                        TextBlock _tBlock = new TextBlock ();
                        _tBlock.Height = 25;
                        _tBlock.Margin = new Thickness (5, 0, 5, 5);
                        _tBlock.Padding = new Thickness (10, 5, 10, 5);
                        _tBlock.Background = (Brush)this.FindResource ("MahApps.Brushes.HighContrastCornflowerBlue");
                        _tBlock.Foreground = Brushes.White;
                        _tBlock.Width = grid.Width;
                        grid.LoadingRow += ( sender, e ) =>
                        {
                            if (e.Row.Item is SaleOrderLineDE rowView)
                            {
                                // Assuming "Qty" is the name of the column
                                if (rowView.QTY < 0)
                                {
                                    e.Row.Background = Brushes.LightGray;
                                }
                            }
                        };
                        WrapPanel panel = new WrapPanel ();
                        panel.Children.Add (button);
                        panel.Children.Add (grid);
                        panel.Children.Add (_tBlock);
                        panel.Orientation = Orientation.Vertical;

                        orders.Children.Add (panel);
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show (ex.Message.ToString (), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
        public SaleOrderDE OrderWithoutLine ( SaleOrderDE order )
        {
            order.SaleOrderLines.Clear ();
            return order;
        }
        public async void ChangeStatus ( object sender, RoutedEventArgs e )
        {
            try
            {
                Button? btn = sender as Button;
                if (btn != null)
                {
                    SaleOrderDE value = (SaleOrderDE)btn.CommandParameter;
                    MessageBoxResult result = System.Windows.MessageBox.Show ("             Are You Sure Order is Ready?          ", "Order Confirmation", System.Windows.MessageBoxButton.YesNo, MessageBoxImage.Warning);
                    if (result == MessageBoxResult.Yes)
                    {
                        var sOrder = new SaleOrderDE ();
                        sOrder.Id = value.Id;
                        var list = await saleSvc.SearchSaleOrder (sOrder);
                        if (list != null)
                            if (list.Count > 0)
                            {
                                foreach (var line in value.SaleOrderLines)
                                {
                                    if (!line.IsDeleted)
                                    {
                                        line.DBoperation = (int)DBoperations.Update;
                                        line.StatusId = (int)Statuses.Close;
                                    }
                                }
                                var response = await saleSvc.Update (value);
                                if (response.Id > 0)
                                {
                                    var order = list.FirstOrDefault ();
                                    if (order.BillStatusId == (int)BillStatuses.Paid)
                                        if (order.SaleOrderLines.Any (x => x.StatusId == (int)Statuses.InProgress))
                                        {

                                        }
                                        else
                                        {
                                            order.StatusId = ((int)Statuses.Close);
                                            var res = await saleSvc.Update (order);
                                        }
                                    orders.Children.Clear ();
                                    getOrders ();
                                }
                            }
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show (ex.Message.ToString (), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
        public void Close ( object sender, RoutedEventArgs e )
        {
            POS pos = new POS ();
            pos.Show ();
            this.Close ();
        }
    }
}

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
    public partial class DiscountIndividual
    {
        #region Properties

        public SaleOrderService saleSvc;
        public DiscountService disSvc;
        HttpClient client;
        List<DiscountKeyDE> discountKey;
        SaleOrderDE order;

        #endregion
        #region Constructor
        public DiscountIndividual ( )
        {
            saleSvc = new SaleOrderService ();
            disSvc = new DiscountService ();
            discountKey = new List<DiscountKeyDE> ();
            client = new HttpClient ();
            order = new SaleOrderDE ();
            InitializeComponent ();
            ItemList ();
            GetDiscountKeys ();
            foreach (Window window in Application.Current.Windows)
            {
                if (window.GetType () == typeof (POS))
                {
                    POS pos = (POS)window;
                    pos.Hide ();
                    break;
                }
            }
        }
        #endregion
        #region Methods
        public async void GetDiscountKeys ( )
        {
            discountKey = await disSvc.GetDiscountKeys ();
            if (discountKey != null)
            {
                for (int i = 0; i < discountKey.Count; i++)
                {
                    Button button = new Button ();
                    button.Content = discountKey[i].DiscountKey;
                    button.Padding = new Thickness (30, 10, 30, 10);
                    button.CommandParameter = discountKey[i];
                    button.Background = new SolidColorBrush (Colors.DarkGray);
                    button.Foreground = new SolidColorBrush (Colors.White);
                    button.Click += new RoutedEventHandler (DiscountButton);
                    DiscountWP.Children.Add (button);
                }
            }
        }
        public void ItemList ( )
        {
            foreach (Window window in Application.Current.Windows)
            {
                if (window.GetType () == typeof (POS))
                {
                    POS pos = (POS)window;
                    SOLineGrid.ItemsSource = pos.SOLineGrid.ItemsSource;
                    break;
                }
            }
        }
        private void DiscountButton ( object sender, RoutedEventArgs e )
        {
            try
            {
                if (SOLineGrid.SelectedItem != null)
                {
                    foreach (SaleOrderLineDE item in SOLineGrid.ItemsSource)
                    {
                        if (item.IsChecked == true)
                        {
                            Button? btn = sender as Button;
                            DiscountKeyDE value = (DiscountKeyDE)btn.CommandParameter;
                            item.DiscountKeyId = value.Id;
                            item.DiscountValue = ((item.Price * value.Value) / 100);
                            item.Price = item.Price - ((item.Price * value.Value) / 100);
                            item.LineTotal = item.Price * item.QTY;
                            if (item.DBoperation != (int)DBoperations.Insert)
                                item.DBoperation = (int)DBoperations.Update;
                            CollectionViewSource.GetDefaultView (SOLineGrid.ItemsSource).Refresh ();
                        }
                        item.IsChecked = false;
                    }
                    Update (sender, e);
                }
                else
                    MessageBox.Show ("No Item Selected");
            }
            catch (Exception ex)
            {
                MessageBox.Show (ex.Message.ToString (), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
        public async void Update ( object sender, RoutedEventArgs e )
        {
            try
            {
                foreach (Window window in Application.Current.Windows)
                {
                    if (window.GetType () == typeof (POS))
                    {
                        POS pos = (POS)window;
                        CollectionViewSource.GetDefaultView (pos.SOLineGrid.ItemsSource).Refresh ();
                        if (pos.SumofLineTotal.Text == 0.ToString ())
                        {
                            pos.GSTValue.Text = 0.ToString ();
                            pos.GSTPercentage.Text = 0.ToString ();
                            pos.DiscountPercentage.Text = 0.ToString ();
                            pos.DiscountValue.Text = 0.ToString ();
                            pos.SrvcCharges.Text = 0.ToString ();
                            pos.DeliveryCharges.Text = 0.ToString ();
                            pos.POSFee.Text = "0";
                        }
                        if (commentBox.Text != "" && commentBox.Text != null)
                            pos.SelectedOrder.DiscountNarration += " " + commentBox.Text;
                        await pos.UpdateSelectedOrder ();
                        //pos.getNetTotal();
                        if (pos.UpdateMode == true)
                        {
                            if (pos.EditMode == true)
                            {
                                await pos.UpdateSelectedOrder ();
                                order = pos.SelectedOrder;
                                client.DefaultRequestHeaders.Accept.Add (new MediaTypeWithQualityHeaderValue ("application/json"));
                                var response = await saleSvc.UpdateOrder (order);
                                var res = response.StatusCode.ToString ();
                                if (res == "OK")
                                {
                                    foreach (var value in pos.SelectedOrder.SaleOrderLines)
                                    {
                                        value.DBoperation = 0;
                                    }
                                    pos.Show ();
                                    pos.getOrders ();
                                    pos.Reset ();
                                    this.Close ();
                                }
                                else
                                    MessageBox.Show ("      Error Occurred , Please try Again      ", "Error");
                            }
                            else
                            {
                                pos.Show ();
                                this.Close ();
                                pos.getOrders ();
                            }
                        }
                        break;
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show (ex.Message.ToString (), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
        private void Back ( object sender, RoutedEventArgs e )
        {
            foreach (Window window in Application.Current.Windows)
            {
                if (window.GetType () == typeof (POS))
                {
                    POS pos = (POS)window;
                    pos.Show ();
                    this.Close ();
                    break;
                }
            }
        }
        #endregion
    }
}

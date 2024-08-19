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
    public partial class Complimentary
    {
        #region Properties
        HttpClient client;
        SaleOrderDE order;
        public SaleOrderService saleSvc;
        #endregion
        #region Constructor
        public Complimentary ( )
        {
            client = new HttpClient ();
            order = new SaleOrderDE ();
            saleSvc = new SaleOrderService ();
            InitializeComponent ();
            ItemList ();
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
        public void ItemList ( )
        {
            try
            {
                foreach (Window window in Application.Current.Windows)
                {
                    if (window.GetType () == typeof (POS))
                    {
                        POS pos = (POS)window;
                        SOLineGrid.ItemsSource = pos.SOLineGrid.ItemsSource;
                        if (SOLineGrid.ItemsSource != null)
                        {
                            List<SaleOrderLineDE> line = (List<SaleOrderLineDE>)SOLineGrid.ItemsSource;
                            foreach (var item in line)
                            {
                                item.IsChecked = false;
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
        private void ComplimentaryButton ( object sender, RoutedEventArgs e )
        {
            try
            {
                if (SOLineGrid.SelectedItem != null)
                {
                    foreach (SaleOrderLineDE item in SOLineGrid.ItemsSource)
                    {
                        if (item.IsChecked == true)
                        {
                            item.IsComp = true;
                            item.DiscountValue = 0;
                            item.DiscountKeyId = 0;
                            item.LineTotal = 0;
                            if (item.DBoperation != (int)DBoperations.Insert)
                                item.DBoperation = (int)DBoperations.Update;
                            CollectionViewSource.GetDefaultView (SOLineGrid.ItemsSource).Refresh ();
                        }
                        item.IsChecked = false;
                    }
                    Update (sender, e);
                }
                else
                {
                    MessageBox.Show ("No Item Selected");
                }
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
                            pos.DeliveryCharges.Text = "0";
                            pos.POSFee.Text = "0";
                        }
                        if (commentBox.Text != "" && commentBox.Text != null)
                            pos.SelectedOrder.Comments += " " + commentBox.Text;
                        await pos.UpdateSelectedOrder ();
                        //pos.getNetTotal();
                        if (pos.UpdateMode == true)
                        {
                            order = pos.SelectedOrder;
                            var response = await saleSvc.UpdateOrder (order);
                            var res = response.StatusCode.ToString ();
                            if (res == "OK")
                            {
                                foreach (var value in pos.SelectedOrder.SaleOrderLines)
                                {
                                    value.DBoperation = 0;
                                }
                                await pos.getOrders ();
                                pos.Reset ();
                                pos.Show ();
                                this.Close ();
                            }
                            else
                                MessageBox.Show ("      Error Occurred , Please try Again      ", "Error");
                        }
                        else
                        {
                            pos.Show ();
                            await pos.getOrders ();
                            this.Close ();
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

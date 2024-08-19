using Newtonsoft.Json;
using Restaurant.Core.Entities;
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
    public partial class DiscountKeys
    {
        #region Properties
        public DiscountService disSvc;
        public SaleOrderService saleSvc;
        public int Service { get; set; }
        public string? PaymentMethod { get; set; }
        public int LineTotalCost { get; set; }
        public int NetPayable { get; set; }
        SaleOrderDE order;
        HttpClient client = new HttpClient ();
        List<DiscountKeyDE> discountKey = new List<DiscountKeyDE> ();
        #endregion
        #region Constructor
        public DiscountKeys ( )
        {
            saleSvc = new SaleOrderService ();
            disSvc = new DiscountService ();
            order = new SaleOrderDE ();
            WindowStartupLocation = System.Windows.WindowStartupLocation.CenterScreen;
            InitializeComponent ();
            GetDiscountKeys ();
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
                    button.Padding = new Thickness (10, 10, 10, 10);
                    button.CommandParameter = discountKey[i];
                    button.Background = (Brush)this.FindResource ("MahApps.Brushes.Accent2");
                    button.Click += new RoutedEventHandler (DiscountKey);
                    discountKeys.Children.Add (button);
                }
            }
        }
        public async void DiscountKey ( object sender, RoutedEventArgs e )
        {
            try
            {
                Button? btn = sender as Button;
                DiscountKeyDE value = (DiscountKeyDE)btn.CommandParameter;
                foreach (Window window in Application.Current.Windows)
                {
                    if (window.GetType () == typeof (POS))
                    {
                        POS pos = (POS)window;
                        pos.DiscountPercentage.Text = value.Value.ToString ();
                        pos.calculateDiscount ();
                        if (commentBox.Text != "" && commentBox.Text != null)
                            pos.SelectedOrder.DiscountNarration += " " + commentBox.Text;
                        await pos.UpdateSelectedOrder ();
                        order = pos.SelectedOrder;
                        pos.order.DiscountTypeId = (int)DiscountTypes.DiscountKey;
                        order.DiscountTypeId = (int)DiscountTypes.DiscountKey;
                        if (pos.UpdateMode == true)
                        {
                            //order.NetTotal = pos.NetPayable;
                            //var discount= Int16.Parse(pos.DiscountPercentage.Text);
                            //order.Discount = discount;
                            UpdateOrder ();
                        }
                        this.Close ();
                        break;
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show (ex.Message.ToString (), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
        public void Exit ( object sender, RoutedEventArgs e )
        {
            this.Close ();
        }
        public async void UpdateOrder ( )
        {
            try
            {
                var response = await saleSvc.UpdateOrder (order);
                var res = response.StatusCode.ToString ();
                if (res == "OK")
                {
                    foreach (Window window in Application.Current.Windows)
                    {
                        if (window.GetType () == typeof (POS))
                        {
                            POS pos = (POS)window;
                            foreach (var value in pos.SelectedOrder.SaleOrderLines)
                            {
                                value.DBoperation = 0;
                            }
                            await pos.getOrders ();
                            pos.Reset ();
                            break;
                        }
                    }
                    this.Close ();
                }
                else
                {
                    MessageBox.Show ("      Error Occurred , Please try Again      ", "Error");
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

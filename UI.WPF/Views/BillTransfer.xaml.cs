using Restaurant.Core.Entities;
using Restaurant.Core.Enums;
using Restaurant.WPF.Entities.Enums;
using Restaurant.WPF.Services;
using System;
using System.Collections.Generic;
using System.Linq;
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
    /// Interaction logic for BillTransfer.xaml
    /// </summary>
    public partial class BillTransfer
    {
        public SaleOrderService saleService;
        public BillTransfer ( )
        {
            saleService = new SaleOrderService ();
            InitializeComponent ();
            getOrders ();
        }
        public async void getOrders ( )
        {
            var saleList = await saleService.GetOrders ();
            if (saleList != null)
            {
                saleList = saleList.Where (x => x.StatusId != (int)Statuses.Close).ToList ();
                orderList.ItemsSource = saleList;
                CollectionViewSource.GetDefaultView (orderList.ItemsSource).Refresh ();
            }
        }
        public void Exit ( object sender, RoutedEventArgs e )
        {
            this.Close ();
        }
        public async void Update ( object sender, RoutedEventArgs e )
        {
            try
            {
                if (orderList.SelectedItem != null)
                {
                    var saleOrder = (SaleOrderDE)orderList.SelectedItem;
                    if (saleOrder != null)
                    {
                        Cash_btn.IsEnabled = false;
                        Card_btn.IsEnabled = false;
                        Button btn = sender as Button;
                        if (btn != null)
                        {
                            if (btn.Content.ToString () == "Cash")
                                saleOrder.PaymentMethodId = (int)PaymentMethods.Cash;
                            else if (btn.Content.ToString () == "Visa Card")
                                saleOrder.PaymentMethodId = (int)PaymentMethods.Card;
                        }
                        var response = await saleService.UpdateOrder (saleOrder);
                        var res = response.StatusCode.ToString ();
                        if (res == "OK")
                        {
                            CollectionViewSource.GetDefaultView (orderList.ItemsSource).Refresh ();
                            MessageBox.Show ("Successfully Updated");
                        }
                        else
                            MessageBox.Show ("Error Occurred");
                        Cash_btn.IsEnabled = true;
                        Card_btn.IsEnabled = true;
                    }
                }
                else
                    MessageBox.Show (" Please select an order to Continue ");
                getOrders ();
            }
            catch (Exception ex)
            {
                MessageBox.Show (ex.Message.ToString (), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
    }
}

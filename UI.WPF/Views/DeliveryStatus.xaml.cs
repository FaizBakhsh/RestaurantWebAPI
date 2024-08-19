using Restaurant.Core.Entities;
using Restaurant.Core.Enums;
using Restaurant.WPF.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
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
    public partial class DeliveryStatus
    {
        #region Properties
        List<SaleOrderDE> saleList;
        HttpClient client;
        SaleOrderService saleService;
        #endregion
        #region Constructor
        public DeliveryStatus()
        {
            client = new HttpClient();
            saleList = new List<SaleOrderDE>();
            saleService = new SaleOrderService();
            InitializeComponent();
            getOrders();
        }
        #endregion
        #region Methods
        public async void getOrders()
        {
            var saleList = await saleService.GetOrders();
            if (saleList != null)
            {
                saleList = saleList.Where(x => x.StatusId == (int)Statuses.Dispatched || x.StatusId == (int)Statuses.Delivered).ToList();
                dispatchedOrders.ItemsSource = saleList;
                CollectionViewSource.GetDefaultView(dispatchedOrders.ItemsSource).Refresh();
            }
        }
        public void Exit(object sender, RoutedEventArgs e)
        {
            this.Close();
        }
        public async void Delivered(object sender, RoutedEventArgs e)
        {
            try { 
            if (dispatchedOrders.SelectedItem != null)
            {
                var saleOrder = (SaleOrderDE)dispatchedOrders.SelectedItem;
                if (saleOrder != null)
                {
                    if (saleOrder.StatusId == (int)Statuses.Delivered)
                        MessageBox.Show(" You already delivered this order ");
                    else
                    {
                        saleOrder.StatusId = (int)Statuses.Delivered;
                        saleOrder.DeliveryTime = DateTime.Now;
                        var response = await saleService.UpdateOrder(saleOrder);
                        var res = response.StatusCode.ToString();
                        if (res == "OK")
                        {
                            MessageBox.Show("Successfully Delivered");
                            CollectionViewSource.GetDefaultView(dispatchedOrders.ItemsSource).Refresh();
                        }
                        else
                            MessageBox.Show("Error Occurred");
                    }
                   
                }
            }
            else
                MessageBox.Show(" Please select an order to Delivered ");
            getOrders();
            }
            catch (Exception ex)
            {
                MessageBox.Show (ex.Message.ToString (), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
        public void AssignRider(object sender, RoutedEventArgs e)
        {
            if (dispatchedOrders.SelectedItem != null)
            {
                AssignRider window = new AssignRider();
                window.Show();
            }
            else
                MessageBox.Show(" Please select an order to UpdateRider ");
        }
        #endregion
    }
}

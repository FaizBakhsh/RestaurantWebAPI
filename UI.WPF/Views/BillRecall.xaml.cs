using Newtonsoft.Json;
using Restaurant.Core.Entities;
using Restaurant.Core.Enums;
using Restaurant.WPF.Entities.Enums;
using Restaurant.WPF.Services;
using Restaurant.WPF.Views;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
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
    public partial class BillRecall
    {
        #region Properties & Class Members
        List<SaleOrderDE> saleList;
        HttpClient client;
        SaleOrderService saleService;
        #endregion
        #region Constructor
        public BillRecall()
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
            saleList = await saleService.GetOrders();
            if (saleList != null)
            {
                // saleList = saleList.Where(x => x.StatusId != (int)Statuses.Close).ToList();
                OrderList.ItemsSource = saleList;
                CollectionViewSource.GetDefaultView(OrderList.ItemsSource).Refresh();
            }
        }
        public void Recall(object sender, RoutedEventArgs e)
        {
            if (OrderList.SelectedItem != null)
            {
                SaleOrderDE order = (SaleOrderDE)OrderList.SelectedItem;
                Button? btn = sender as Button;
                if (btn != null)
                {
                    btn.CommandParameter = order;
                    POS pos = new POS();
                    pos.ShowSelectedOrder(btn, e);
                    pos.Show();
                    this.Close();
                }
            }
            else
                MessageBox.Show(" Please select an order to Recall ");
        }
        public void Back(object sender, RoutedEventArgs e)
        {
            POS pos = new POS();
            pos.Show();
            this.Close();
        }
        public void ViewAll(object sender, RoutedEventArgs e)
        {
            this.getOrders();
        }
        public void Dispatch(object sender, RoutedEventArgs e)
        {
            if (OrderList.SelectedItem != null)
            {
                SaleOrderDE order = (SaleOrderDE)OrderList.SelectedItem;
                if (order.OrderTypeId == (int)OrderTypes.Delivery)
                {
                    OrderDispatch window = new OrderDispatch();
                    window.Show();
                }
                else
                    MessageBox.Show(" Please select an Delivery Order to DisPatch ");
            }
            else
                MessageBox.Show(" Please select an order to DisPatch ");
        }
        public void CashOut(object sender, RoutedEventArgs e)
        {
            try { 
            if (OrderList.SelectedItem != null)
            {
                SaleOrderDE order = (SaleOrderDE)OrderList.SelectedItem;
                    Button? btn = sender as Button;
                    if (btn != null)
                    {
                        btn.CommandParameter = order;
                        POS pos = new POS ();
                        pos.Show ();
                        pos.ShowSelectedOrder (btn, e);
                    }
                CashTender window = new CashTender();
                if (order.PaymentMethodId == (int)PaymentMethods.Cash)
                    window.CardBtn.IsEnabled = false;
                else if (order.PaymentMethodId == (int)PaymentMethods.Card)
                    window.CashBtn.IsEnabled = false;
                window.selectedOrder = order;
                window.openedFromRecall = true;
                window.TotalBill.Text = order.NetTotal.ToString();
                window.Show();
                this.Close();
            }
            else
                MessageBox.Show(" Please select an order to CashOut ");
            }
            catch (Exception ex)
            {
                MessageBox.Show (ex.Message.ToString (), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
        private void SearchButton_OnClick(object sender, RoutedEventArgs e)
        {
            var list = saleList.Where(x => x.Id.ToString().Contains(SearchBox.Text)).ToList();
            OrderList.ItemsSource = list;
            OrderList.Items.Refresh();
        }
        #endregion
    }
}


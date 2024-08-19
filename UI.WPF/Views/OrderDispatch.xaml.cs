using Restaurant.Core.Entities;
using Restaurant.Core.Enums;
using Restaurant.WPF.Entities;
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
    public partial class OrderDispatch
    {
        public List<StaffDE> riderList;
        public StaffService riderService;
        public SaleOrderService saleService;
        public SaleOrderDE saleOrder;
        public OrderDispatch ( )
        {
            riderList = new List<StaffDE> ();
            saleService = new SaleOrderService ();
            riderService = new StaffService ();
            saleOrder = new SaleOrderDE ();
            InitializeComponent ();
            GetRiders ();
        }
        public async void GetRiders ( )
        {
            var staff = new StaffDE ();
            staff.TypeId = (int)StaffTypes.Rider;
            riderList = await riderService.GetStaffs (staff);
            riderCombo.ItemsSource = riderList;
        }
        public void Exit ( object sender, RoutedEventArgs e )
        {
            this.Close ();
        }
        public async void Dispatch ( object sender, RoutedEventArgs e )
        {
            try
            {
                dispatchBtn.IsEnabled = false;
                deliveryBtn.IsEnabled = false;
                foreach (Window window in Application.Current.Windows)
                {
                    if (window.GetType () == typeof (BillRecall))
                    {
                        BillRecall recallWindow = (BillRecall)window;
                        var order = (SaleOrderDE)recallWindow.OrderList.SelectedItem;
                        if (order != null)
                            saleOrder = order;
                        if (saleOrder != null)
                        {
                            if (saleOrder.StatusId == (int)Statuses.Dispatched)
                                MessageBox.Show (" You already dispatched this order ");
                            else if (saleOrder.StatusId == (int)Statuses.Delivered)
                                MessageBox.Show (" You already Delivered this order ");
                            else if (saleOrder.StatusId == (int)Statuses.Close)
                                MessageBox.Show (" This order is Closed ");
                            else
                            {
                                if (riderCombo.SelectedValue != null)
                                {
                                    saleOrder.StatusId = (int)Statuses.Dispatched;
                                    saleOrder.DispatchedTime = DateTime.Now;
                                    saleOrder.RiderId = (int)riderCombo.SelectedValue;
                                    var response = await saleService.UpdateOrder (saleOrder);
                                    var res = response.StatusCode.ToString ();
                                    if (res == "OK")
                                    {
                                        MessageBox.Show ("Successfully Dispatched");
                                        CollectionViewSource.GetDefaultView (recallWindow.OrderList.ItemsSource).Refresh ();
                                    }
                                    else
                                        MessageBox.Show ("Error Occurred");
                                }
                                else
                                    RiderValidation.Visibility = Visibility.Visible;
                                recallWindow.getOrders ();
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
            dispatchBtn.IsEnabled = true;
            deliveryBtn.IsEnabled = true;
        }
        public async void Delivered ( object sender, RoutedEventArgs e )
        {
            try
            {
                dispatchBtn.IsEnabled = false;
                deliveryBtn.IsEnabled = false;
                foreach (Window window in Application.Current.Windows)
                {
                    if (window.GetType () == typeof (BillRecall))
                    {
                        BillRecall recallWindow = (BillRecall)window;
                        var order = (SaleOrderDE)recallWindow.OrderList.SelectedItem;
                        if (order != null)
                            saleOrder = order;
                        if (saleOrder != null)
                        {
                            if (saleOrder.StatusId == (int)Statuses.Delivered)
                                MessageBox.Show (" You already Delivered this order ");
                            else if (saleOrder.StatusId == (int)Statuses.Close)
                                MessageBox.Show (" This order is Closed ");
                            else if (saleOrder.StatusId == (int)Statuses.Dispatched)
                            {
                                saleOrder.StatusId = (int)Statuses.Delivered;
                                saleOrder.DeliveryTime = DateTime.Now;
                                var response = await saleService.UpdateOrder (saleOrder);
                                var res = response.StatusCode.ToString ();
                                if (res == "OK")
                                {
                                    MessageBox.Show ("Successfully Delivered");
                                    CollectionViewSource.GetDefaultView (recallWindow.OrderList.ItemsSource).Refresh ();
                                }
                                else
                                    MessageBox.Show ("Error Occurred");
                            }
                            else
                                MessageBox.Show (" Please First Dispatch this order ");
                            recallWindow.getOrders ();
                        }
                        break;
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show (ex.Message.ToString (), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            dispatchBtn.IsEnabled = true;
            deliveryBtn.IsEnabled = true;
        }
        public void RiderCheck ( object sender, RoutedEventArgs e )
        {
            RiderValidation.Visibility = Visibility.Hidden;
            if (riderCombo.SelectedItem == null)
                RiderValidation.Visibility = Visibility.Visible;
        }
    }
}

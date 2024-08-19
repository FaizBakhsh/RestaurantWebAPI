using Restaurant.Core.Entities;
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
    /// <summary>
    /// Interaction logic for AssignRider.xaml
    /// </summary>
    public partial class AssignRider
    {
        #region Properties
        public List<StaffDE> riderList;
        public StaffService riderService;
        public SaleOrderService saleService;
        public SaleOrderDE saleOrder;
        #endregion
        #region Contructor
        public AssignRider()
        {
            riderList = new List<StaffDE>();
            saleService = new SaleOrderService();
            riderService = new StaffService();
            saleOrder = new SaleOrderDE();
            InitializeComponent();
            GetRiders();
        }
        #endregion
        #region Methods
        public async void GetRiders()
        {
            var staff = new StaffDE ();
            staff.TypeId = (int)StaffTypes.Rider;
            riderList = await riderService.GetStaffs(staff);
            riderCombo.ItemsSource = riderList;
        }
        public void Exit(object sender, RoutedEventArgs e)
        {
            this.Close();
        }
        public async void Assign(object sender, RoutedEventArgs e)
        {
            try
            {
                if (riderCombo.SelectedItem != null)
                {
                    riderBtn.IsEnabled = false;
                    foreach (Window window in Application.Current.Windows)
                    {
                        if (window.GetType () == typeof (DeliveryStatus))
                        {
                            DeliveryStatus deliveryStatus = (DeliveryStatus)window;
                            var order = (SaleOrderDE)deliveryStatus.dispatchedOrders.SelectedItem;
                            if (order != null)
                                saleOrder = order;
                            if (saleOrder != null)
                            {
                                saleOrder.RiderId = (int)riderCombo.SelectedValue;
                                var response = await saleService.UpdateOrder (saleOrder);
                                var res = response.StatusCode.ToString ();
                                if (res == "OK")
                                {
                                    MessageBox.Show ("Successfully Updated");
                                    CollectionViewSource.GetDefaultView (deliveryStatus.dispatchedOrders.ItemsSource).Refresh ();
                                }
                                else
                                    MessageBox.Show ("Error Occurred");
                                deliveryStatus.getOrders ();
                            }
                            break;
                        }
                    }
                    riderBtn.IsEnabled = true;
                }
                else
                    RiderValidation.Visibility = Visibility.Visible;
            }
            catch (Exception ex)
            {
                MessageBox.Show (ex.Message.ToString ());
            }
        }
        public void RiderCheck(object sender, RoutedEventArgs e)
        {
            RiderValidation.Visibility = Visibility.Hidden;
            if (riderCombo.SelectedItem == null)
                RiderValidation.Visibility = Visibility.Visible;
        }
        #endregion
    }
}

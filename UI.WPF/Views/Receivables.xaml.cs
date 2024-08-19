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
    public partial class Receivables
    {
        public CustomerService CustomerService;
        public List<CustomerDE> CustomerList;
        public SaleOrderService saleService;
        public Receivables ( )
        {
            CustomerList = new List<CustomerDE> ();
            saleService = new SaleOrderService ();
            CustomerService = new CustomerService ();
            InitializeComponent ();
            GetCustomers ();
        }
        public void CustomerCheck ( object sender, RoutedEventArgs e )
        {
            CustomerValidation.Visibility = Visibility.Hidden;
            if (CustomerCombo.SelectedItem == null)
                CustomerValidation.Visibility = Visibility.Visible;

        }
        public async void GetCustomers ( )
        {
            CustomerList = await CustomerService.SearchCustomer ();
            CustomerCombo.ItemsSource = CustomerList;
        }
        public async void Submit ( object sender, RoutedEventArgs e )
        {
            CustomerCheck (sender, e);
            if (CustomerCombo.SelectedItem != null)
                foreach (Window window in Application.Current.Windows)
                {
                    if (window.GetType () == typeof (POS))
                    {
                        POS pos = (POS)window;
                        pos.SelectedOrder.CustomerId = (int)(CustomerCombo.SelectedValue);
                        pos.SelectedOrder.CustTypeId = (int)CustTypes.ActualCustomer;
                        pos.SelectedOrder.IsPaid = false;
                        await pos.CloseOrder (sender, e);
                        await pos.Clear (sender, e);
                        this.Close ();
                        break;
                    }
                }
        }
        public void Cancel ( object sender, RoutedEventArgs e )
        {
            this.Close ();
        }
    }
}

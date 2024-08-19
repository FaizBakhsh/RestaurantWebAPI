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
    public partial class Discount
    {
        public Discount()
        {
            WindowStartupLocation = System.Windows.WindowStartupLocation.CenterScreen;
            InitializeComponent();
        }
        public void Exit(object sender, RoutedEventArgs e)
        {
            this.Close();
        }
        public void DiscountKeys(object sender, RoutedEventArgs e)
        {
            DiscountKeys window = new DiscountKeys();
            window.Show();
            this.Close();
        }
        public void VoucherDiscount(object sender, RoutedEventArgs e)
        {
            VouchersDiscount window = new VouchersDiscount();
            window.Show();
            this.Close();
        }
    }
}

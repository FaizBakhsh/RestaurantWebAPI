using Newtonsoft.Json;
using Restaurant.Core.Entities;
using Restaurant.WPF.Entities;
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
    /// <summary>
    /// Interaction logic for VouchersDiscount.xaml
    /// </summary>
    public partial class VouchersDiscount
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
        List<DiscountVouchersDE> discount = new List<DiscountVouchersDE> ();
        #endregion
        #region Constructor
        public VouchersDiscount ( )
        {
            saleSvc = new SaleOrderService ();
            disSvc = new DiscountService ();
            WindowStartupLocation = System.Windows.WindowStartupLocation.CenterScreen;
            InitializeComponent ();
            GetDiscountVch ();
            order = new SaleOrderDE ();
        }
        #endregion
        #region Methods
        public async void GetDiscountVch ( )
        {
            discount = await disSvc.GetDiscountVoucher ();
            if (discount != null)
            {
                for (int i = 0; i < discount.Count; i++)
                {
                    // this.index = i;
                    Button button = new Button ();
                    button.Content = discount[i].KeyValue;
                    // button.Name = Category[i]?.CategoryName?.ToString();
                    button.Padding = new Thickness (10, 10, 10, 10);
                    button.CommandParameter = discount[i];
                    button.Background = (Brush)this.FindResource ("MahApps.Brushes.Accent2");
                    button.Click += new RoutedEventHandler (Discount);
                    //  button.Click += SubCategories(Category[i]);
                    discountKeys.Children.Add (button);
                }
            }
        }
        public void Discount ( object sender, RoutedEventArgs e )
        {
            try
            {
                Button? btn = sender as Button;
                DiscountVouchersDE value = (DiscountVouchersDE)btn.CommandParameter;
                foreach (Window window in Application.Current.Windows)
                {
                    if (window.GetType () == typeof (POS))
                    {
                        POS pos = (POS)window;
                        pos.DiscountValue.Text = value.Value.ToString ();
                        pos.calculateDiscountByValue ();
                        if (commentBox.Text != "" && commentBox.Text != null)
                            pos.SelectedOrder.VoucherNarration += " " + commentBox.Text;
                        order = pos.SelectedOrder;
                        pos.order.DiscountTypeId = (int)DiscountTypes.DiscountVoucher;
                        if (pos.UpdateMode == true)
                        {
                            order.Total = float.Parse (pos.SumofLineTotal.Text);
                            order.DiscountTypeId = (int)DiscountTypes.DiscountVoucher;
                            order.NetTotal = pos.NetPayable;
                            var discount = float.Parse (pos.DiscountPercentage.Text);
                            order.DiscountValue = float.Parse (pos.DiscountValue.Text);
                            order.Discount = discount;
                            UpdateOrder ();
                        }
                        else
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
        public async void UpdateOrder ( )
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
                MessageBox.Show ("      Error Occurred , Please try Again      ", "Error");
        }
        public void Exit ( object sender, RoutedEventArgs e )
        {
            this.Close ();
        }
        #endregion
    }
}

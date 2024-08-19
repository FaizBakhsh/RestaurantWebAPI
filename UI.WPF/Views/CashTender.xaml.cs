
using DocumentFormat.OpenXml.Drawing.Charts;
using Restaurant.Core.Entities;
using Restaurant.WPF.Entities.Enums;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Policy;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Restaurant.WPF.Views
{
    public partial class CashTender
    {
        public bool openedFromRecall { get; set; }
        public SaleOrderDE selectedOrder { get; set; }
        public CashTender ( )
        {
            InitializeComponent ();
            openedFromRecall = false;
            selectedOrder = new SaleOrderDE ();
        }
        public void CalculateRemaining ( object sender, TextChangedEventArgs args )
        {
            try
            {
                if (CashReceived.Text == "")
                    CashReceived.Text = 0.ToString ();
                if (TotalBill.Text != "" && CashReceived.Text != "")
                {
                    var total = float.Parse (TotalBill.Text);
                    var received = float.Parse (CashReceived.Text);
                    Remaining.Text = (received - total).ToString ();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show (ex.Message.ToString (), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
        public async void Back ( object sender, RoutedEventArgs e )
        {

            foreach (Window window in Application.Current.Windows)
            {
                if (window.GetType () == typeof (POS))
                {
                    POS pos = (POS)window;
                    await pos.Clear (sender, e);
                    this.Close ();
                    break;
                }
            }

        }
        public void Visa ( object sender, RoutedEventArgs e )
        {
            Visa visa = new Visa ();
            visa.Show ();
            this.Close ();
        }
        public void Receivable ( object sender, RoutedEventArgs e )
        {
            Receivables rec = new Receivables ();
            rec.Show ();
            this.Close ();
        }
        public void Cash ( object sender, RoutedEventArgs e )
        {
            if (TotalBill.Text != "" && CashReceived.Text != "" && TotalBill.Text != 0.ToString () && CashReceived.Text != 0.ToString ())
            {
                
                if (float.Parse (CashReceived.Text) < float.Parse (TotalBill.Text))
                    MessageBox.Show ("Received Amount is less than Total Amount");
                else
                    CashOrder (sender, e);
            }
            else
                CashOrder (sender, e);
        }
        public async void CashOrder ( object sender, RoutedEventArgs e )
        {
            try
            {
                CashBtn.IsEnabled = false;
                CardBtn.IsEnabled = false;
                Cash cash = new Cash ();
                foreach (Window window in Application.Current.Windows)
                {
                    if (window.GetType () == typeof (POS))
                    {
                        POS pos = (POS)window;
                        var o = pos.order;
                        var order = pos.SelectedOrder;
                        pos.SelectedOrder.RemainingCash = CashReceived.Text == "" ?0:float.Parse(Remaining.Text);

                        pos.SelectedOrder.CashReceived = CashReceived.Text == ""? float.Parse(TotalBill.Text): float.Parse(CashReceived.Text);
                        await pos.CloseOrder (sender, e);
                        await pos.Clear (sender, e);

                        if (CashReceived.Text == 0.ToString () || CashReceived.Text == "")
                            CashReceived.Text = TotalBill.Text.ToString ();
                        cash.totalAmount.Text = TotalBill.Text.ToString ();
                        cash.amountReceived.Text = CashReceived.Text.ToString ();
                        cash.Change.Text = Remaining.Text.ToString ();
                        cash.Show ();
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
    }
}

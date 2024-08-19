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
    public partial class ChangeBill
    {
        public SaleOrderService saleSvc;
        public ChangeBill ( )
        {
            saleSvc = new SaleOrderService ();
            InitializeComponent ();
        }
        public void Exit ( object sender, RoutedEventArgs e )
        {
            this.Close ();
        }
        public void ReName ( object sender, RoutedEventArgs e )
        {
            try
            {
                foreach (Window win in Application.Current.Windows)
                {
                    if (win.GetType () == typeof (POS))
                    {
                        Tender tender = new Tender ();
                        POS pos = (POS)win;
                        if (pos.UpdateMode == true)
                        {
                            if (pos.order.OrderTypeId == (int)OrderTypes.Delivery)
                                MessageBox.Show ("You Cann't Change a Delivery Order ");
                            else if (pos.order.OrderTypeId == (int)OrderTypes.TakeAway)
                            {
                                tender.TakeAway_btn.IsEnabled = false;
                                tender.Delivery_btn.IsEnabled = false;
                                tender.EditMode = true;
                                tender.DineInButton.Content = "Update";
                                Button? btn = sender as Button;
                                if (btn != null)
                                {
                                    btn.CommandParameter = "DineIn_btn";
                                    tender.TopArea (btn, e);
                                }
                                pos.Hide ();
                                tender.Show ();
                            }
                            else if (pos.order.OrderTypeId == (int)OrderTypes.DineIn)
                            {
                                //tender.DineIn_btn.IsEnabled = false;
                                tender.Delivery_btn.IsEnabled = false;
                                tender.EditMode = true;
                                tender.TakeAwayButton.Content = "Update";
                                tender.DineInButton.Content = "Update";
                                Button? btn = sender as Button;
                                if (btn != null)
                                {
                                    btn.CommandParameter = "TakeAway_btn";
                                    tender.TopArea (btn, e);
                                }
                                pos.Hide ();
                                tender.Show ();
                            }
                            else
                                MessageBox.Show ("  Please tender order to rename  ");
                        }
                        else
                            MessageBox.Show ("  Please tender order to rename  ");
                    }
                }
                this.Close ();
            }
            catch (Exception ex)
            {
                MessageBox.Show (ex.Message.ToString (), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
        public async void ReOpen ( object sender, RoutedEventArgs e )
        {
            try
            {
                foreach (Window win in Application.Current.Windows)
                {
                    if (win.GetType () == typeof (POS))
                    {
                        POS pos = (POS)win;
                        if (pos.UpdateMode == true)
                        {
                            pos.SelectedOrder.BillStatusId = (int)BillStatuses.Pending;
                            var response = await saleSvc.UpdateOrder (pos.SelectedOrder);
                            var res = response.StatusCode.ToString ();
                            if (res == "OK")
                            {
                                // MessageBox.Show ("Successfully Updated");
                                foreach (var value in pos.SelectedOrder.SaleOrderLines)
                                {
                                    value.DBoperation = 0;
                                }
                                await pos.getOrders ();
                                //ViewMode ();
                            }
                            else
                            {
                                MessageBox.Show ("Error Occurred");
                            }


                            pos.CashBtn.IsEnabled = true;
                            pos.CardBtn.IsEnabled = true;
                            pos.EditMode = true;
                            pos.ClearSvc_btn.IsEnabled = true;
                            pos.ClearGST_btn.IsEnabled = true;
                            pos.SrvcCharges.IsReadOnly = false;
                            pos.DeliveryCharges.IsReadOnly = false;
                            pos.POSFee.IsReadOnly = false;
                            pos.DiscountPercentage.IsReadOnly = false;
                            pos.IncreaseQty_btn.IsEnabled = true;
                            pos.DecreaseQty_btn.IsEnabled = true;
                            this.Close ();
                        }
                        else
                        {
                            MessageBox.Show ("Please Select an order to Upadate");
                            this.Close ();
                        }
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

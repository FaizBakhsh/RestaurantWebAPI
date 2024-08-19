using Restaurant.Core.Entities;
using Restaurant.Core.Enums;
using Restaurant.WPF.Entities.Enums;
using Restaurant.WPF.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Printing;
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
    public partial class Delete
    {
        #region Properties
        SaleOrderDE order;
        SaleOrderLineDE orderLine;
        HttpClient client;
        public SaleOrderService saleSvc;
        public bool? IsShift { get; set; }
        #endregion
        #region Constructor
        public Delete ( )
        {
            client = new HttpClient ();
            orderLine = new SaleOrderLineDE ();
            order = new SaleOrderDE ();
            saleSvc = new SaleOrderService ();
            IsShift = false;
            WindowStartupLocation = System.Windows.WindowStartupLocation.CenterScreen;
            InitializeComponent ();
        }
        #endregion
        #region Methods
        public void ByMistake ( object sender, RoutedEventArgs e )
        {
            Submit (sender, e);
        }
        public async void DeleteItem ( object sender, RoutedEventArgs e )
        {
            try
            {
                foreach (Window window in Application.Current.Windows)
                {
                    if (window.GetType () == typeof (POS))
                    {
                        POS pos = (POS)window;
                        if (pos.SOLineGrid.SelectedItem != null)
                        {
                            MessageBoxResult result = System.Windows.MessageBox.Show ("             Are You Sure you want to Delete it?          ", "Delete Confirmation", System.Windows.MessageBoxButton.YesNo, MessageBoxImage.Warning);
                            if (result == MessageBoxResult.Yes)
                            {
                                SaleOrderLineDE line = (SaleOrderLineDE)pos.SOLineGrid.SelectedItem;
                                line.DBoperation = (int)DBoperations.Delete;
                                pos.soLineList.Remove ((SaleOrderLineDE)pos.SOLineGrid.SelectedItem);
                                CollectionViewSource.GetDefaultView (pos.SOLineGrid.ItemsSource).Refresh ();
                                await pos.UpdateSelectedOrder ();
                                if (pos.UpdateMode == true)
                                {
                                    if (pos.EditMode == true)
                                    {
                                        order = pos.SelectedOrder;
                                        SaleOrderDE saleOrder = new SaleOrderDE
                                        {
                                            Id = order.Id,
                                            Total = float.Parse (pos.SumofLineTotal.Text),
                                            Discount = float.Parse (pos.DiscountPercentage.Text),
                                            GST = float.Parse (pos.GSTPercentage.Text),
                                            DiscountValue = float.Parse (pos.DiscountValue.Text),
                                            GSTValue = float.Parse (pos.GSTValue.Text),
                                            Service = float.Parse (pos.SrvcCharges.Text),
                                            POSFee = float.Parse (pos.POSFee.Text),
                                            DeliveryCharges = float.Parse (pos.DeliveryCharges.Text),
                                            NetTotal = pos.NetPayable,
                                            IsActive = order.IsActive,
                                            CreatedOn = order.CreatedOn,
                                            CustomerId = order.CustomerId,
                                            TableNo = order.TableNo,
                                            SourceId = order.SourceId,
                                            Guest = order.Guest,
                                            WaiterId = order.WaiterId,
                                            RestaurantId = order.RestaurantId,
                                            OrderTypeId = order.OrderTypeId,
                                            DiscountTypeId = order.DiscountTypeId,
                                            PhoneNo = order.PhoneNo,
                                            Address = order.Address,
                                            Name = order.Name,
                                            Note = order.Note,
                                            BillTitle = order.BillTitle,
                                            ShiftId = order.ShiftId,
                                            StatusId = order.StatusId,
                                            BillStatusId = order.BillStatusId,
                                            PaymentMethodId = order.PaymentMethodId,
                                            DiscountNarration = order.DiscountNarration,
                                            VoucherNarration = order.VoucherNarration,
                                            SaleOrderLines = new List<SaleOrderLineDE> { line }
                                        };
                                        foreach (var item in order.SaleOrderLines)
                                        {
                                            saleOrder.SaleOrderLines.Add (item);
                                        }
                                        var response = await saleSvc.UpdateOrder (saleOrder);
                                        var res = response.StatusCode.ToString ();
                                        if (res == "OK")
                                        {
                                            MessageBox.Show ("      Successfully Updated      ", "Success");
                                            foreach (var item in pos.SelectedOrder.SaleOrderLines)
                                            {
                                                item.DBoperation = 0;
                                            }
                                            pos.getOrders ();
                                            pos.Reset ();
                                            this.Close ();
                                        }
                                        else
                                            MessageBox.Show ("      Error Occurred , Please try Again      ", "Error");
                                    }
                                }
                                else
                                    this.Close ();
                            }
                        }
                        else
                        {
                            MessageBox.Show ("      Please Select an Item to Delete      ", "Info");
                            this.Close ();
                        }
                        break;
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show (ex.Message.ToString (), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
        public void Submit ( object sender, RoutedEventArgs e )
        {
            var window = new OrderMakeStatus ();
            window.SaleRefund.Reason = commentBox.Text;
            window.Show ();
            this.Close ();
        }
        public void DeletionReason ( object sender, RoutedEventArgs e )
        {
            var window = new OrderMakeStatus ();
            Button? btn = sender as Button;
            window.SaleRefund.Reason = (string?)btn.Content;
            window.Show ();
            this.Close ();
        }
        #region KeyBoard
        public void KeyBoard_Button ( object sender, RoutedEventArgs e )
        {
            IInputElement focusedElement = FocusManager.GetFocusedElement (this);
            if (focusedElement != null)
            {
                if (focusedElement.GetType () == typeof (TextBox))
                {
                    Button? btn = sender as Button;
                    if (btn != null)
                    {
                        TextBox textBox = (TextBox)FocusManager.GetFocusedElement (this);
                        string text;
                        if (IsShift == true)
                            text = btn.Content.ToString ().ToUpper ();
                        else
                            text = btn.Content.ToString ();
                        int pos = textBox.SelectionStart;
                        textBox.Text = textBox.Text.Insert (textBox.CaretIndex, text);
                        textBox.Select (textBox.Text.Length, 0);
                    }
                };
            }
        }
        public void Exit ( object sender, RoutedEventArgs e )
        {
            this.Close ();
        }
        public void Clear ( object sender, RoutedEventArgs e )
        {
            commentBox.Text = "";
        }
        public void BackSpace ( object sender, RoutedEventArgs e )
        {
            IInputElement focusedElement = FocusManager.GetFocusedElement (this);
            if (focusedElement != null)
            {
                if (focusedElement.GetType () == typeof (TextBox))
                {
                    TextBox textBox = (TextBox)FocusManager.GetFocusedElement (this);
                    if (textBox.CaretIndex > 0)
                    {
                        int pos = textBox.SelectionStart;
                        textBox.Text = textBox.Text.Remove (textBox.CaretIndex - 1, 1);
                        textBox.CaretIndex = textBox.Text.Length;
                        textBox.ScrollToEnd ();
                        textBox.Focus ();
                        //textBox.Select(textBox.Text.Length, 0);
                    }
                }
            };
        }
        public void Space ( object sender, RoutedEventArgs e )
        {
            IInputElement focusedElement = FocusManager.GetFocusedElement (this);
            if (focusedElement != null)
            {
                if (focusedElement.GetType () == typeof (TextBox))
                {
                    Button? btn = sender as Button;
                    if (btn != null)
                    {
                        TextBox textBox = (TextBox)FocusManager.GetFocusedElement (this);
                        int pos = textBox.SelectionStart;
                        textBox.Text = textBox.Text.Insert (textBox.CaretIndex, " ");
                        textBox.Select (textBox.Text.Length, 0);
                    }
                }
            };
        }
        public void Shift_Click ( object sender, RoutedEventArgs e )
        {
            if (IsShift == false)
            {
                this.IsShift = true;
                shift_btn.Background = new SolidColorBrush (Colors.DarkGray);
            }
            else
            {
                this.IsShift = false;
                shift_btn.Background = (Brush)this.FindResource ("MahApps.Brushes.Accent");
            }
        }
        public void C_Click ( object sender, RoutedEventArgs e )
        {
            String text = commentBox.Text;
            var y = text.Length;
            if (text.Length > 0)
                commentBox.Text = text.Remove (text.Length - 1, 1);
        }
        #endregion
        #endregion
    }
}




using DocumentFormat.OpenXml.Presentation;
using Restaurant.Core.Entities;
using Restaurant.Core.Enums;
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
    public partial class Comment
    {
        #region Properties
        public bool? IsShift { get; set; }
        SaleOrderDE order;
        SaleOrderLineDE orderLine;
        HttpClient client;
        public SaleOrderService saleSvc;
        #endregion
        #region Constructor
        public Comment ( )
        {
            order = new SaleOrderDE ();
            orderLine = new SaleOrderLineDE ();
            client = new HttpClient ();
            saleSvc = new SaleOrderService ();
            WindowStartupLocation = System.Windows.WindowStartupLocation.CenterScreen;
            IsShift = false;
            InitializeComponent ();
        }
        #endregion
        #region Methods
        public void KeyBoard_Button ( object sender, RoutedEventArgs e )
        {
            IInputElement focusedElement = FocusManager.GetFocusedElement (this);
            if (focusedElement != null)
            {
                if (focusedElement.GetType () == typeof (TextBox))
                {
                    {
                        Button? btn = sender as Button;
                        if (btn != null)
                        {
                            TextBox textBox = (TextBox)FocusManager.GetFocusedElement (this);
                            if (IsShift == true)
                            {
                                var text = btn.Content.ToString ().ToLower ();
                                int pos = textBox.SelectionStart;
                                textBox.Text = textBox.Text.Insert (textBox.CaretIndex, text);
                                textBox.Select (textBox.Text.Length, 0);
                            }
                            else
                            {
                                var text = btn.Content.ToString (); int pos = textBox.SelectionStart;
                                textBox.Text = textBox.Text.Insert (textBox.CaretIndex, text);
                                textBox.Select (textBox.Text.Length, 0);
                            }
                        }
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
                shift_btn.Background = (Brush)this.FindResource ("MahApps.Brushes.Accent2");
            }
        }
        public void C_Click ( object sender, RoutedEventArgs e )
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
        public void Exit ( object sender, RoutedEventArgs e )
        {
            this.Close ();
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
        public void SaveComment ( object sender, RoutedEventArgs e )
        {
            if (InputBox.Text != "")
                AddComment (sender, e);
            else
                MessageBox.Show ("Please write some comment");
        }
        public async void AddComment ( object sender, RoutedEventArgs e )
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
                            SaleOrderLineDE item = (SaleOrderLineDE)pos.SOLineGrid.SelectedItem;
                            item.Comments = ((item.Comments) != null ? (item.Comments + ",") : "") + InputBox.Text;
                            //item.ItemName = item.ItemName + " " + InputBox.Text;
                            pos.SOLineGrid.CommitEdit ();
                            pos.SOLineGrid.CommitEdit ();
                            CollectionViewSource.GetDefaultView (pos.SOLineGrid.ItemsSource).Refresh ();
                            if (pos.UpdateMode == true)
                            {
                                await pos.UpdateSelectedOrder ();
                                order = pos.SelectedOrder;
                                orderLine = (SaleOrderLineDE)pos.SOLineGrid.SelectedItem;
                                if (orderLine.DBoperation != (int)DBoperations.Insert)
                                    orderLine.DBoperation = (int)DBoperations.Update;
                                var _order = await saleSvc.Update (order);
                                if (_order.Id > 0)
                                {
                                    MessageBox.Show ("      Successfully Updated      ");
                                    foreach (var value in order.SaleOrderLines)
                                    {
                                        value.DBoperation = 0;
                                    }
                                    pos.SelectedOrder = _order;
                                    order = pos.SelectedOrder;
                                    pos.soLineList = order.SaleOrderLines;
                                    pos.SOLineGrid.ItemsSource = pos.soLineList;
                                    CollectionViewSource.GetDefaultView (pos.SOLineGrid.ItemsSource).Refresh ();
                                    await pos.getOrders ();
                                    pos.Reset ();
                                    this.Close ();
                                }
                                //var response = await saleSvc.UpdateOrder(order); ;
                                //var res = response.StatusCode.ToString();
                                //if (res == "OK")
                                //{
                                //    MessageBox.Show("      Successfully Updated      ", "Success");
                                //    foreach (var value in pos.SelectedOrder.SaleOrderLines)
                                //    {
                                //        value.DBoperation = 0;
                                //    }
                                //    pos.getOrders();
                                //    pos.Reset();
                                //    this.Close();
                                //}
                                else
                                    MessageBox.Show ("      Error Occurred , Please try Again      ", "Error");
                            }
                            else
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
        private void OnKeyDown ( object sender, KeyEventArgs e )
        {
            if (e.Key == Key.Enter)
                AddComment (sender, e);
        }
        #endregion
    }
}

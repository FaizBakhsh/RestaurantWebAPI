using Newtonsoft.Json;
using Restaurant.Core.Enums;
using Restaurant.WebAPI.Models;
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
    public partial class Authentication
    {
        #region Properties
        HttpClient client;
        public UserService userSvc;
        public SaleOrderService saleSvc;
        public bool? IsShift { get; set; }
        public LogEventDE log;
        public String? WindowName { get; set; }
        List<UserVM> vw_user = new List<UserVM> ();
        #endregion
        #region Constructor
        public Authentication ( )
        {
            userSvc = new UserService ();
            saleSvc = new SaleOrderService ();
            client = new HttpClient ();
            log = new LogEventDE ();
            InitializeComponent ();
            WindowStartupLocation = System.Windows.WindowStartupLocation.CenterScreen;
            this.IsShift = false;
            InputBox.Focus ();
        }
        #endregion
        #region Methods
        public void KeyBoard_Button ( object sender, RoutedEventArgs e )
        {
            Button? btn = sender as Button;
            if (btn != null)
            {
                if (IsShift == true)
                    InputBox.Password += btn.Content.ToString ().ToUpper ();
                else
                    InputBox.Password += btn.Content;
            }
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
            String text = InputBox.Password;
            var y = text.Length;
            if (text.Length > 0)
                InputBox.Password = text.Remove (text.Length - 1, 1);
        }
        public void Clear_Click ( object sender, RoutedEventArgs e )
        {
            InputBox.Password = "";
        }
        public void Exit_Click ( object sender, RoutedEventArgs e )
        {
            this.Close ();
        }
        public async void Submit ( object sender, RoutedEventArgs e )
        {
            try
            {
                UserVM user = new UserVM
                {
                    UserPassword = InputBox.Password,
                    ClientId = Properties.Settings.Default.ClientId
                };
                var response = await userSvc.SearchUser (user);
                if (response != null)
                {
                    var jsonString = await response.Content.ReadAsStringAsync ();
                    vw_user = JsonConvert.DeserializeObject<List<UserVM>> (jsonString);
                    var res = response.StatusCode.ToString ();
                    if (res == "OK")
                    {
                        if (vw_user != null)
                        {
                            if (vw_user.Count != 0)
                            {
                                var _user = vw_user.Find (x => x.RoleId == (int)Roles.Admin);
                                //foreach (var u in vw_user)
                                //{
                                if (_user != null)
                                {
                                    switch (WindowName)
                                    {
                                        case "EmployeeFunctions":
                                            {
                                                EmployeeFunctions window = new EmployeeFunctions ();
                                                window.Show ();
                                                this.Close ();
                                            }
                                            break;
                                        case "Discount":
                                            {
                                                Discount window = new Discount ();
                                                window.Show ();
                                                this.Close ();
                                            }
                                            break;
                                        case "DiscountIndividual":
                                            {
                                                DiscountIndividual window = new DiscountIndividual ();
                                                window.Show ();
                                                this.Close ();
                                            }
                                            break;
                                        case "Complimentary":
                                            {
                                                Complimentary window = new Complimentary ();
                                                window.Show ();
                                                this.Close ();
                                            }
                                            break;
                                        case "Delete":
                                            {
                                                Delete window = new Delete ();
                                                window.Show ();
                                                this.Close ();
                                            }
                                            break;
                                        case "DiscountKeys":
                                            {
                                                DiscountKeys window = new DiscountKeys ();
                                                window.Show ();
                                                this.Close ();
                                            }
                                            break;
                                        case "SplitBill":
                                            {
                                                SplitBill window = new SplitBill ();
                                                window.Show ();
                                                this.Close ();
                                            }
                                            break;
                                        case "ReOpen":
                                            {
                                                foreach (Window win in Application.Current.Windows)
                                                {
                                                    if (win.GetType () == typeof (POS))
                                                    {
                                                        POS pos = (POS)win;
                                                        if (pos.UpdateMode == true)
                                                        {
                                                            log = new LogEventDE
                                                            {
                                                                UserId = Properties.Settings.Default.UserId,
                                                                Message = "Bill ReOpened",
                                                                DBoperation = (int)DBoperations.Insert,
                                                                ActionId = (int)LogActions.ReOpen,
                                                                Date = DateTime.Now,
                                                                Time = DateTime.Now.ToShortTimeString ()
                                                            };
                                                            pos.SelectedOrder.LogEvent = log;
                                                            pos.SelectedOrder.BillStatusId = (int)BillStatuses.Pending;
                                                            pos.SelectedOrder.StatusId = (int)Statuses.ReOpen;
                                                            var resp = await saleSvc.UpdateOrder (pos.SelectedOrder);
                                                            var _res = resp.StatusCode.ToString ();
                                                            if (_res == "OK")
                                                            {
                                                                // MessageBox.Show ("Successfully Updated");
                                                                foreach (var value in pos.SelectedOrder.SaleOrderLines)
                                                                {
                                                                    value.DBoperation = 0;
                                                                }
                                                                await pos.getOrders ();
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
                                                                //ViewMode ();
                                                            }
                                                            else
                                                                MessageBox.Show ("Error Occurred");

                                                        }
                                                        else
                                                        {
                                                            MessageBox.Show ("Please Select an order to Upadate");
                                                            this.Close ();
                                                        }
                                                    }
                                                }
                                            }
                                            break;
                                    }
                                }
                                else
                                    MessageBox.Show ("        Incorrect Password       ", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
                                // }
                            }
                            else
                                MessageBox.Show ("        Incorrect Password       ", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
                        }
                    }
                    else
                        MessageBox.Show ("        Error Occurred Please Try Again       ", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show (ex.Message.ToString (), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
        private void CloseAllWindows ( )
        {
            POS pos = Application.Current.Windows.OfType<POS> ().FirstOrDefault ();
            if (pos != null)
                pos.Close ();
        }
        public void ShowAuthWindows ( String Name )
        {
            if (Name != null)
                WindowName = Name;
            this.Show ();
        }
        private void OnKeyDown ( object sender, KeyEventArgs e )
        {
            if (e.Key == Key.Enter)
                Submit (sender, e);
        }
        #endregion
    }
}

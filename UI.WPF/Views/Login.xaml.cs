using DocumentFormat.OpenXml.Wordprocessing;
using Hanssens.Net;
using Meziantou.Framework.Win32;
using Microsoft.AspNetCore.Http;
using Newtonsoft.Json;
using Restaurant.Core.Enums;
using Restaurant.Models;
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
    public partial class Login
    {
        #region Properties
        HttpClient client;
        LoginService loginService;
        ThemeService themeService;
        public LoggedInUserVM user;
        public LogEventDE log;
        private LogEventService logService;
        #endregion
        #region Constructor
        public Login ( )
        {
            WindowStartupLocation = System.Windows.WindowStartupLocation.CenterScreen;
            client = new HttpClient ();
            user = new LoggedInUserVM ();
            loginService = new LoginService ();
            logService = new LogEventService ();
            themeService= new ThemeService ();
            log = new LogEventDE ();
            InitializeComponent ();
            InputBox.Focus ();
        }
        #endregion
        #region Methods
        private async void Login_btn ( object sender, RoutedEventArgs e )
        {
            try
            {
                if (InputBox.Password.Length != 0)
                {
                    loginBtn.IsEnabled = false;
                    LoginModel login = new LoginModel
                    {
                        Password = InputBox.Password,
                        UserName = InputBox.Password
                    };
                    var response = await loginService.Login (login);
                    if (response != null)
                    {
                        var jsonString = await response.Content.ReadAsStringAsync ();
                        var res = response.StatusCode.ToString ();
                        if (res == "OK")
                        {
                            user = JsonConvert.DeserializeObject<LoggedInUserVM> (jsonString);
                            if (user != null)
                            {
                                log = new LogEventDE
                                {
                                    UserId = user.id,
                                    ClientId = user.clientId,
                                    Message = "User Successfully Login",
                                    DBoperation = (int)DBoperations.Insert,
                                    ActionId = (int)LogActions.Login,
                                    Date = DateTime.Now,
                                    Time = DateTime.Now.ToShortTimeString ()
                                };
                                var retVal = await logService.Save (log);
                                if (retVal)
                                {
                                    if (Properties.Settings.Default.UserId != null)
                                        if (user.id != Properties.Settings.Default.UserId)
                                            Properties.Settings.Default.PreviousUserId = Properties.Settings.Default.UserId;
                                    Properties.Settings.Default.UserId = user.id;
                                    if (user.cLTId > 0)
                                        Properties.Settings.Default.ClientId = user.cLTId;
                                    else
                                        Properties.Settings.Default.ClientId = user.clientId;
                                    Properties.Settings.Default.Save ();
                                    MessageBox.Show ("        Welcome to Ftech POS Software        ", "Welcome");
                                   await themeService.SetTheme ();
                                    POS newWindow = new POS ();
                                    newWindow.Show ();
                                    this.Close ();
                                }
                                else
                                {
                                    loginBtn.IsEnabled = true;
                                    MessageBox.Show ("        Error Occurred, Please Try Again       ", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
                                }
                            }
                        }
                        else
                        {
                            loginBtn.IsEnabled = true;
                            MessageBox.Show ("        No User Found for this Password       ", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
                        }
                    }
                    else
                    {
                        loginBtn.IsEnabled = true;
                        MessageBox.Show ("        No User Found for this Password       ", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
                    }
                }
                else
                    MessageBox.Show ("        Please Enter Password       ", "Alert", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            catch (Exception ex)
            {
                loginBtn.IsEnabled = true;
                MessageBox.Show (ex.Message.ToString (), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
        private void Button_Click ( object sender, RoutedEventArgs e )
        {
            Button? btn = sender as Button;
            if (btn != null)
                InputBox.Password += btn.Content;
        }
        private void Exit_btn ( object sender, RoutedEventArgs e )
        {
            Close ();
        }
        private void Logout_btn ( object sender, RoutedEventArgs e )
        {
        }
        private void Clear_btn ( object sender, RoutedEventArgs e )
        {
            InputBox.Password = "";
        }
        private void BackSpace_btn ( object sender, RoutedEventArgs e )
        {
            String text = InputBox.Password;
            var y = text.Length;
            if (text.Length > 0)
            {
                InputBox.Password = text.Remove (text.Length - 1, 1);
            }
        }
        private void OnKeyDown ( object sender, KeyEventArgs e )
        {
            if (e.Key == Key.Enter)
                Login_btn (sender, e); 
        }
        #endregion
    }
}

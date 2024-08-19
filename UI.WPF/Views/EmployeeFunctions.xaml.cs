using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using Restaurant.Core.Entities;
using Newtonsoft.Json;
using Restaurant.WPF.Services;
using Restaurant.WPF.Entities;
using Restaurant.Core.Enums;
using Restaurant.WPF.Entities.Enums;
using DocumentFormat.OpenXml.Spreadsheet;

namespace Restaurant.WPF.Views
{
    public partial class EmployeeFunctions
    {
        #region Properties/ Class Members
        HttpClient client = new HttpClient ();
        List<EnumLineDE> enumValues;
        public List<ShiftDE> shiftList;
        public ShiftService shiftService;
        public EnumLineService enumLineSvc;
        public SaleDayService dayService;
        private ReportService _rptSvc;
        public DateTime CurrentDate { get; set; }
        public LogEventDE log;
        private LogEventService logService;
        #endregion
        #region Constructors
        public EmployeeFunctions ( )
        {
            WindowStartupLocation = System.Windows.WindowStartupLocation.CenterScreen;
            shiftList = new List<ShiftDE> ();
            enumValues = new List<EnumLineDE> ();
            enumLineSvc = new EnumLineService ();
            CurrentDate = DateTime.Now.Date;
            shiftService = new ShiftService ();
            dayService = new SaleDayService ();
            _rptSvc = new ReportService ();
            logService = new LogEventService ();
            log = new LogEventDE ();
            InitializeComponent ();
            GetShiftValuesAsync ();
            IsDayStarted ();
            CheckDayandShiftStatus ();
        }
        #endregion
        #region Methods

        #region Day & Shift
        public async void IsDayStarted ( )
        {
            if (Properties.Settings.Default.TerminalId == 0) { }
            else
            {
                var saleDay = new SaleDayDE ();

                saleDay.DayStatusId = (int)DayStatuses.Open;
                saleDay.TerminalId = Properties.Settings.Default.TerminalId;
                saleDay.ClientId = Properties.Settings.Default.ClientId;
                //saleDay.Date = Properties.Settings.Default.CurrentDate;
                var days = await dayService.SearchSaleDay (saleDay);
                var day = days.FirstOrDefault ();
                if (day != null)
                {
                    Properties.Settings.Default.IsDayStarted = true;
                    Properties.Settings.Default.DayId = day.Id;
                    Properties.Settings.Default.CurrentDate = day.Date;
                    CheckDayandShiftStatus ();
                }
                else
                {
                    Properties.Settings.Default.IsDayStarted = false;
                    Properties.Settings.Default.DayId = 0;
                    CheckDayandShiftStatus ();
                }
            }
        }
        public void ShiftStart ( object sender, RoutedEventArgs e )
        {
            if (shift.Visibility == Visibility.Visible)
                shift.Visibility = Visibility.Hidden;
            else
                shift.Visibility = Visibility.Visible;
        }
        public void Start ( object sender, RoutedEventArgs e )
        {
            // ShiftCheck (sender, e);
            StartShift (sender, e);
        }
        public async void StartShift(object sender, RoutedEventArgs e)
        {
            this.ShiftCheck(sender, e);
            if (shiftCombo.SelectedItem != null)
            {
                try
                {
                    if (Properties.Settings.Default.TerminalId == 0)
                    {
                        MessageBox.Show ("Terminal not found");
                        return;
                    }
                    ShiftDE shiftCheck = new ShiftDE
                    {
                        DayId = Properties.Settings.Default.DayId,
                        ClientId = Properties.Settings.Default.ClientId,
                        ShiftTypeId = (int)shiftCombo.SelectedValue
                    };
                    List<ShiftDE> shiftList = await shiftService.SearchShift(shiftCheck);

                    if (shiftList != null && shiftList.Count > 0)
                    {
                        MessageBox.Show("Shift already started");
                        return;
                    }

                    ShiftDE newShift = new ShiftDE
                    {
                        ClientId = Properties.Settings.Default.ClientId,
                        FloatingCash = InputBox.Text,
                        ShiftTypeId = (int)shiftCombo.SelectedValue,
                        ShiftStartUserId = Properties.Settings.Default.UserId,
                        StartTime = DateTime.Now.ToLongTimeString(),
                        TerminalId = Properties.Settings.Default.TerminalId,
                        DayId = Properties.Settings.Default.DayId,
                        ShiftStatusId = (int)ShiftStatus.Open
                    };
                    var response = await shiftService.PostShift(newShift);
                    var res = response.StatusCode.ToString();

                    if (res == "OK")
                    {
                        MessageBox.Show("Shift successfully started");
                        shift.Visibility = Visibility.Hidden;
                        POS pos = new POS();
                        //pos.Show();
                        //Properties.Settings.Default.IsShiftStarted = true;
                        //Properties.Settings.Default.ShiftId = newShift.Id;
                        CheckDayandShiftStatus();
                    }
                    else
                        MessageBox.Show("Error occurred while starting the shift");
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message, "Error", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
        }

        public void ShiftEnd ( object sender, RoutedEventArgs e )
        {
            shift.Visibility = Visibility.Hidden;
            ShiftEnd window = new ShiftEnd ();
            window.Show ();
        }
        public async void DayEnd ( object sender, RoutedEventArgs e )
        {
            try
            {
                if (Properties.Settings.Default.TerminalId == 0) { MessageBox.Show ("Terminal not found"); }
                else
                {
                    foreach (Window window in Application.Current.Windows)
                    {
                        if (window.GetType () == typeof (POS))
                        {
                            POS pos = (POS)window;
                            if (pos.saleList.Count > 0)
                                MessageBox.Show ("There are Pendings Orders,Please Clear Pending Orders before DayEnd.");
                            else
                            {
                                if (!Properties.Settings.Default.IsShiftStarted)
                                {
                                    MessageBoxResult result = MessageBox.Show ("             Are You Sure you want to End the Day ?          ", " Day End Confirmation", MessageBoxButton.YesNo, MessageBoxImage.Warning);
                                    if (result == MessageBoxResult.Yes)
                                    {
                                        var saleDay = new SaleDayDE ();
                                        saleDay.ClientId = Properties.Settings.Default.ClientId;
                                        saleDay.DayStatusId = (int)DayStatuses.Open;
                                        //saleDay.Terminal = Environment.MachineName;
                                        //DateTime dateOnly = Properties.Settings.Default.CurrentDate;
                                        //saleDay.Date = dateOnly.AddTicks (-dateOnly.Ticks);
                                        saleDay.Date = Properties.Settings.Default.CurrentDate;
                                        var days = await dayService.SearchSaleDay (saleDay);
                                        var day = days.FirstOrDefault ();
                                        if (day != null)
                                        {
                                            day.ClientId = Properties.Settings.Default.ClientId;
                                            day.DayStatusId = (int)DayStatuses.Closed;
                                            day.EndUserId = Properties.Settings.Default.UserId;
                                            var endDay = await dayService.UpdateSaleDay (day);
                                            if (endDay.Id > 0)
                                            {
                                                Properties.Settings.Default.IsDayStarted = false;
                                                Properties.Settings.Default.CurrentDate = DateTime.Now.Date;
                                                this.CheckDayandShiftStatus ();
                                                pos.saleDate.Text = "";
                                                await _rptSvc.DayEndSummaryReport (endDay);
                                            }
                                            else
                                                MessageBox.Show ("Error Occurred");
                                        }
                                    }
                                }
                                else
                                    MessageBox.Show ("  Please end the shift first  ");
                            }
                            break;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show (ex.Message.ToString (), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
        public async void DayStartBtnClick ( object sender, RoutedEventArgs e )
        {
            await DayStart ();
        }
        public async Task DayStart ( )
        {
            try
            {
                if (Properties.Settings.Default.TerminalId == 0) { MessageBox.Show ("Terminal not found"); }
                else
                {
                    MessageBoxResult result = MessageBox.Show ("             Are You Sure you want to Start the Day ?          ", " Day StartConfirmation", MessageBoxButton.YesNo, MessageBoxImage.Warning);
                    if (result == MessageBoxResult.Yes)
                    {
                        var saleDay = new SaleDayDE ();
                        saleDay.ClientId = Properties.Settings.Default.ClientId;
                        saleDay.StartUserId = Properties.Settings.Default.UserId;
                        saleDay.DayStatusId = (int)DayStatuses.Open;
                        saleDay.TerminalId = Properties.Settings.Default.TerminalId;
                        //saleDay.Terminal = Environment.MachineName;
                        DateTime dateTime = DateTime.Now;
                        saleDay.Date = new DateTime (dateTime.Year, dateTime.Month, dateTime.Day);
                        var RetVal = await dayService.Save (saleDay);
                        if (RetVal)
                        {
                            Properties.Settings.Default.IsDayStarted = true;
                            Properties.Settings.Default.CurrentDate = saleDay.Date;
                            Properties.Settings.Default.Save ();
                            this.CheckDayandShiftStatus ();
                            foreach (Window window in Application.Current.Windows)
                            {
                                if (window.GetType () == typeof (POS))
                                {
                                    POS pos = (POS)window;
                                    pos.saleDate.Text = Properties.Settings.Default.CurrentDate.ToShortDateString ();
                                    this.IsDayStarted ();
                                    break;
                                }
                            }
                        }
                        else
                            MessageBox.Show ("Error Occurred");
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show (ex.Message.ToString (), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
        public void ShiftCheck ( object sender, RoutedEventArgs e )
        {
            ShiftValidation.Visibility = Visibility.Hidden;
            if (shiftCombo.SelectedItem == null)
                ShiftValidation.Visibility = Visibility.Visible;
        }
        public void CheckDayandShiftStatus ( )
        {
            if (Properties.Settings.Default.IsDayStarted)
            {
                DayStartBtn.Visibility = Visibility.Collapsed;
                if (Properties.Settings.Default.IsShiftStarted)
                {
                    ShiftStartBtn.Visibility = Visibility.Collapsed;
                    ShiftEndBtn.Visibility = Visibility.Visible;
                    DayEndBtn.Visibility = Visibility.Collapsed;
                }
                else
                {
                    ShiftStartBtn.Visibility = Visibility.Visible;
                    ShiftEndBtn.Visibility = Visibility.Collapsed;
                    DayEndBtn.Visibility = Visibility.Visible;
                }
            }
            else
            {
                ShiftStartBtn.Visibility = Visibility.Collapsed;
                ShiftEndBtn.Visibility = Visibility.Collapsed;
                DayStartBtn.Visibility = Visibility.Visible;
                DayEndBtn.Visibility = Visibility.Collapsed;
            }
        }
        public void Cancel ( object sender, RoutedEventArgs e )
        {
            shift.Visibility = Visibility.Hidden;
        }

        #endregion
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
                        String text = btn.Content.ToString ();
                        int pos = textBox.SelectionStart;
                        textBox.Text = textBox.Text.Insert (textBox.CaretIndex, text);
                        textBox.Select (textBox.Text.Length, 0);
                    }
                }
            };
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
            }
        }
        #endregion
        #region Others
        public void Back ( object sender, RoutedEventArgs e )
        {
            this.Close ();
        }
        public void Expense ( object sender, RoutedEventArgs e )
        {
            Expenses window = new Expenses ();
            window.Show ();
        }
        public async Task GetShiftValuesAsync ( )
        {
            EnumLineDE line = new EnumLineDE ();
            line.EnumTypeId = (int)EnumType.Shift;
            line.ClientId = Properties.Settings.Default.ClientId;
            enumValues = await enumLineSvc.SearchEnumLine (line);
            if (enumValues.Count > 0)
                shiftCombo.ItemsSource = enumValues;
        }
        public async void Logout ( object sender, RoutedEventArgs e )
        {
            log = new LogEventDE
            {
                UserId = Properties.Settings.Default.UserId,
                Message = "User Successfully Logout",
                DBoperation = (int)DBoperations.Insert,
                ActionId = (int)LogActions.Logout,
                Date = DateTime.Now,
                Time = DateTime.Now.ToShortTimeString ()
            };
            var retVal = await logService.Save (log);
            if (retVal)
            {
                foreach (Window win in Application.Current.Windows)
                {
                    if (win.GetType () == typeof (POS))
                    {
                        POS pos = (POS)win;
                        pos.Close ();
                    }
                }
                Login window = new Login ();
                window.Show ();
                this.Close ();
            }
            else
            {
                MessageBox.Show ("        Error Occurred, Please Try Again       ", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
        public void BillTransfer ( object sender, RoutedEventArgs e )
        {
            BillTransfer window = new BillTransfer ();
            window.Show ();
        }
        public void DeliveryStatus ( object sender, RoutedEventArgs e )
        {
            DeliveryStatus window = new DeliveryStatus ();
            window.Show ();
        }
        #endregion

        #endregion
    }
}

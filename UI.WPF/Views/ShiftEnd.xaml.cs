using Newtonsoft.Json;
using Restaurant.Core.Entities;
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
    /// Interaction logic for ShiftEnd.xaml
    /// </summary>
    public partial class ShiftEnd
    {
        #region Properties
        HttpClient client;
        public List<ShiftDE> shiftList;
        private ShiftService _shiftSvc;
        private ReportService _rptSvc;
        #endregion
        #region Constructor
        public ShiftEnd ( )
        {
            client = new HttpClient ();
            _rptSvc = new ReportService ();
            _shiftSvc = new ShiftService ();
            shiftList = new List<ShiftDE> ();
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
            }
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
        public void Cancel ( object sender, RoutedEventArgs e )
        {
            this.Close ();
        }
        public async void End ( object sender, RoutedEventArgs e )
        {
            try
            {
                if (Properties.Settings.Default.TerminalId == 0) { MessageBox.Show ("Terminal not found"); }
                else
                {
                    if (InputBox.Text != "")
                    {
                        ShiftDE shift = new ()
                        {
                            TerminalId = Properties.Settings.Default.TerminalId,
                            DayId = Properties.Settings.Default.DayId,
                            ClientId = Properties.Settings.Default.ClientId
                        };
                        client.DefaultRequestHeaders.Accept.Add (new MediaTypeWithQualityHeaderValue ("application/json"));
                        var response = await client.PostAsJsonAsync (Globals.BASE_API_URL + "Shift/Search", shift);
                        if (response != null)
                        {
                            var jsonString = await response.Content.ReadAsStringAsync ();
                            shiftList = JsonConvert.DeserializeObject<List<ShiftDE>> (jsonString);
                            var res = response.StatusCode.ToString ();
                            if (res == "OK")
                            {
                                if (shiftList != null)
                                {
                                    shiftList = shiftList.Where (shift => shift.EndTime == null).ToList ();
                                    if (shiftList.Count != 0)
                                    {
                                        ShiftDE todayShift = shiftList.FirstOrDefault ();
                                        todayShift.EndTime = DateTime.Now.ToLongTimeString ();
                                        todayShift.ShiftEndCash = InputBox.Text;
                                        todayShift.ShiftStatusId = (int)ShiftStatus.Close;
                                        todayShift.ShiftEndUserId = Properties.Settings.Default.UserId;
                                        todayShift.ClientId = Properties.Settings.Default.ClientId;
                                        var _shift = await _shiftSvc.Update (todayShift);
                                        if (_shift.Id > 0)
                                        {
                                            foreach (Window window in Application.Current.Windows)
                                            {
                                                if (window.GetType () == typeof (EmployeeFunctions))
                                                {
                                                    Properties.Settings.Default.IsShiftStarted = false;
                                                    EmployeeFunctions fun = (EmployeeFunctions)window;
                                                    fun.CheckDayandShiftStatus ();
                                                    break;
                                                }
                                            }
                                            await _rptSvc.ShiftEndSummaryReport (_shift);
                                            MessageBox.Show ("Shift Successfully Ended");
                                            POS pos = new POS ();
                                            this.Close ();
                                        }
                                        else
                                            MessageBox.Show ("Error Occurred");
                                    }
                                    else
                                    {
                                        MessageBox.Show ("You did not start any shift");
                                        this.Close ();
                                    }
                                }

                            }
                        }
                    }
                    else
                        CashValidation.Visibility = Visibility.Visible;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show (ex.Message.ToString (), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
        public void CashCheck ( object sender, TextChangedEventArgs args )
        {
            CashValidation.Visibility = Visibility.Hidden;
            if (InputBox.Text == "")
                CashValidation.Visibility = Visibility.Visible;
        }
        #endregion
    }
}

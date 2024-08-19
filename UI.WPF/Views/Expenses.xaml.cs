using DocumentFormat.OpenXml.Drawing.Charts;
using Newtonsoft.Json;
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
    /// Interaction logic for Expenses.xaml
    /// </summary>
    public partial class Expenses
    {
        #region Properties
        public bool? IsShift { get; set; }
        public List<SupplierDE> supplierList;
        public List<ExpenseDE> expenseList;
        public ExpenseService expenseService;
        public SupplierService supplierService;
        HttpClient client;
        #endregion
        #region Constructor
        public Expenses ( )
        {
            supplierService = new SupplierService ();
            expenseService = new ExpenseService ();
            supplierList = new List<SupplierDE> ();
            expenseList = new List<ExpenseDE> ();
            client = new HttpClient ();
            InitializeComponent ();
            IsShift = false;
            GetSupplieres ();
            GetExpensess ();
        }
        #endregion
        #region Methods
        public async void GetSupplieres ( )
        {
            supplierList = await supplierService.GetSuppliers ();
            if (supplierList != null)
                supplierCombo.ItemsSource = supplierList;
        }
        public async void GetExpensess ( )
        {
            expenseList = await expenseService.SearchExpenses ();
        }
        public async void Submit ( object sender, RoutedEventArgs e )
        {
            try
            {
                Submit_btn.IsEnabled = false;
                if (supplierCombo.SelectedItem == null)
                    SupplierValidation.Visibility = Visibility.Visible;
                if (AmountBox.Text != "" && supplierCombo.SelectedItem != null)
                {
                    ExpenseDE expense = new ExpenseDE ()
                    {
                        SourceId = (int)ExpenseSources.CashierExpenses,
                        Amount = int.Parse (AmountBox.Text),
                        SupplierId = (int)supplierCombo.SelectedValue,
                        Comments = CommentBox.Text,
                        UserId = Properties.Settings.Default.UserId,
                        ShiftId = Properties.Settings.Default.ShiftId,
                        TerminalId = Properties.Settings.Default.TerminalId,
                        Date = Properties.Settings.Default.CurrentDate,
                        ClientId = Properties.Settings.Default.ClientId
                    };
                    var response = await expenseService.PostExpense (expense);
                    var res = response.StatusCode.ToString ();
                    if (res == "OK")
                    {
                        AmountBox.Text = null;
                        CommentBox.Text = "";
                        MessageBox.Show ("Expense Added");
                    }
                    else
                        MessageBox.Show ("Error Occurred");
                }
                Submit_btn.IsEnabled = true;
            }
            catch (Exception ex)
            {
                MessageBox.Show (ex.Message.ToString (), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
        public void AmountCheck ( object sender, TextChangedEventArgs args )
        {
            AmountValidation.Visibility = Visibility.Hidden;
            if (AmountBox.Text == "")
                AmountValidation.Visibility = Visibility.Visible;
        }
        #region KeyBoard
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
        public void Exit ( object sender, RoutedEventArgs e )
        {
            this.Close ();
        }
        public void Clear ( object sender, RoutedEventArgs e )
        {
            CommentBox.Text = "";
            AmountBox.Text = "";
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
        public void Shift ( object sender, RoutedEventArgs e )
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
        #endregion

        #endregion
    }
}

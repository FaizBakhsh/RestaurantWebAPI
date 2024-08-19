
using DocumentFormat.OpenXml.Drawing.Charts;
using DocumentFormat.OpenXml.Office2016.Drawing.ChartDrawing;
using DocumentFormat.OpenXml.Presentation;
using ImTools;
using Newtonsoft.Json;
using Restaurant.Core.Entities;
using Restaurant.Core.Enums;
using Restaurant.WebAPI.Models;
using Restaurant.WPF.Entities;
using Restaurant.WPF.Entities.Enums;
using Restaurant.WPF.Services;
using System;
using System.Collections;
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

    public partial class Tender
    {
        #region Properties/ Class Members

        SaleOrderService saleService;
        HttpClient client;
        public List<OrderSourceDE> enumValues;
        public List<EmployeeDE> employees;
        public List<StaffDE> waiterList;
        public List<EnumLineDE> floors;
        public List<EnumLineDE> tables;
        public SaleOrderDE sOrder;
        public EnumLineService enumLineService;
        public OrderSourceService sourceSvc;
        public StaffService staffSvc;
        public ServiceChargeservice SrvcChrhsSvc;
        public List<ServiceChargesDE> serviceChargesList;
        public List<SaleOrderDE> autoSuggestLits;
        public double ServiceCharges { get; set; }
        public String? RequestResponse { get; set; }
        public bool EditMode { get; set; }
        public String? FloorName { get; set; }

        #endregion
        #region Constructors
        public Tender ( )
        {
            serviceChargesList = new List<ServiceChargesDE> ();
            enumLineService = new EnumLineService ();
            SrvcChrhsSvc = new ServiceChargeservice ();
            sourceSvc = new OrderSourceService ();
            enumValues = new List<OrderSourceDE> ();
            employees = new List<EmployeeDE> ();
            waiterList = new List<StaffDE> ();
            floors = new List<EnumLineDE> ();
            tables = new List<EnumLineDE> ();
            autoSuggestLits = new List<SaleOrderDE> ();
            sOrder = new SaleOrderDE ();
            client = new HttpClient ();
            saleService = new SaleOrderService ();
            staffSvc = new StaffService ();
            InitializeComponent ();
            this.GetSourceValues ();
            this.GetEmployees ();
            this.GetFloor ();
            EditMode = false;
            getOrderList ();
            CustomerId.Focus ();
        }
        #endregion
        #region Methods
        #region TakeAway
        public void SaveTakeAway ( object sender, RoutedEventArgs e )
        {
            if (CustomerId.Text != "")
            {
                foreach (Window window in Application.Current.Windows)
                {
                    if (window.GetType () == typeof (POS))
                    {
                        POS pos = (POS)window;
                        if (EditMode == false)
                            pos.SaveOrder ();
                        this.sOrder = pos.order;
                        if (EditMode == true)
                        {
                            sOrder.TableNo = null;
                            sOrder.RestaurantId = 0;
                            sOrder.WaiterId = 0;
                            sOrder.Guest = null;
                        }
                        //this.sOrder.CustomerId = CustomerId.Text;
                        sOrder.BillTitle = CustomerId.Text;
                        this.sOrder.OrderTypeId = (int)OrderTypes.TakeAway;
                        break;
                    }
                }
                this.SaveOrder ();
            }
            else
            {
                MessageBox.Show ("      Please Enter Bill Title     ");
            }
        }
        #endregion
        #region DineIn
        public async void GetFloor ( )
        {
            EnumLineDE line = new EnumLineDE ();
            line.EnumTypeId = (int)EnumType.Floor;
            line.ClientId = Properties.Settings.Default.ClientId;
            floors = await enumLineService.SearchEnumLine (line);
            if (floors.Count > 0)
            {
                for (int i = 0; i < floors.Count; i++)
                {
                    Button button = new Button
                    {
                        Content = floors[i].Name,
                        Padding = new System.Windows.Thickness (50, 5, 50, 5),
                        CommandParameter = floors[i]
                    };
                    button.Click += new RoutedEventHandler (Tables);
                    floorSP.Children.Add (button);
                }
            }
        }
        public async void Tables ( object sender, RoutedEventArgs e )
        {
            tableSP.Children.Clear ();
            Button? btn = sender as Button;
            if (btn != null)
            {
                EnumLineDE value = (EnumLineDE)btn.CommandParameter;
                EnumLineDE line = new EnumLineDE ();
                line.ParentId = value.Id;
                line.ClientId = Properties.Settings.Default.ClientId;
                tables = await enumLineService.SearchEnumLine (line);
                if (tables.Count > 0)
                {
                    for (int i = 0; i < tables.Count; i++)
                    {
                        // this.index = i;
                        Button button = new Button
                        {
                            Content = tables[i].Name,
                            Padding = new System.Windows.Thickness (40, 5, 40, 5),
                            Background = (Brush)this.FindResource ("MahApps.Brushes.Accent2"),
                            CommandParameter = tables[i]
                        };
                        foreach (Window window in Application.Current.Windows)
                        {
                            if (window.GetType () == typeof (POS))
                            {
                                POS pos = (POS)window;
                                var search = pos.saleList.Find (x => x.TableNo == btn.Content.ToString () + " / " + tables[i].Name);
                                if (search != null)
                                    button.IsEnabled = false;
                                break;
                            }
                        }
                        button.Click += new RoutedEventHandler (AddTableNo);
                        tableSP.Children.Add (button);

                    }
                    this.FloorName = btn.Content.ToString ();
                    tableSP.Visibility = Visibility.Visible;
                }
            }
        }
        public void AddTableNo ( object sender, RoutedEventArgs e )
        {
            Button? btn = sender as Button;
            if (btn != null)
                TableNo.Text = this.FloorName + " / " + btn.Content;
        }
        public void ShowFloors ( object sender, RoutedEventArgs e )
        {
            if (tableSP.Visibility == Visibility.Hidden)
            {

                tableSP.Visibility = Visibility.Visible;
            }
            else
            {

                tableSP.Visibility = Visibility.Hidden;
            }
        }
        public async void GetEmployees ( )
        {
            var staff = new StaffDE ();
            staff.TypeId = (int)StaffTypes.Waiter;
            waiterList = await staffSvc.GetStaffs (staff);
            if (waiterList != null)
                waiterCombo.ItemsSource = waiterList;
        }
        public void DineInOrderCheck ( )
        {
            WaiterValidation.Visibility = Visibility.Hidden;
            TableNoValidation.Visibility = Visibility.Hidden;
            //if (waiterCombo.SelectedItem == null)
            //    WaiterValidation.Visibility = Visibility.Visible;
            if (TableNo.Text == "")
                TableNoValidation.Visibility = Visibility.Visible;
        }
        public void SaveDineIn ( object sender, RoutedEventArgs e )
        {
            DineInOrderCheck ();
            if (TableNo.Text != "")
            {
                foreach (Window window in Application.Current.Windows)
                {
                    if (window.GetType () == typeof (POS))
                    {
                        POS pos = (POS)window;
                        if (EditMode == false)
                            pos.SaveOrder ();
                        this.sOrder = pos.order;
                        //if (EditMode == true)
                        //    sOrder.CustomerId = null;
                        this.sOrder.TableNo = TableNo.Text;
                        this.sOrder.BillTitle = TableNo.Text;
                        this.sOrder.OrderTypeId = (int)OrderTypes.DineIn;
                        if (ResId.Text != "")
                            this.sOrder.RestaurantId = Int16.Parse (ResId.Text);
                        if (waiterCombo.SelectedItem != null)
                            this.sOrder.WaiterId = (int)waiterCombo.SelectedValue;
                        if (Guest.Text != "")
                            this.sOrder.Guest = Guest.Text;
                        break;
                    }
                }
                this.SaveOrder ();
            }
        }
        #endregion
        #region Delivery
        public async void GetSourceValues ( )
        {

            enumValues = await sourceSvc.SearchOrderSource ();
            if (enumValues.Count > 0)
                sourceCombo.ItemsSource = enumValues;
        }
        public void NameCheck ( object sender, TextChangedEventArgs args )
        {
            NameValidation.Visibility = Visibility.Hidden;
            if (Name.Text == "")
                NameValidation.Visibility = Visibility.Visible;
        }
        public void PhoneNoCheck ( object sender, TextChangedEventArgs args )
        {
            try
            {
                PhoneNoValidation.Visibility = Visibility.Hidden;
                if (PhoneNo.Text == "")
                    PhoneNoValidation.Visibility = Visibility.Visible;
                // Verification.  
                if (string.IsNullOrEmpty (this.PhoneNo.Text))
                {
                    // Disable.  
                    this.CloseAutoSuggestionBox ();
                    return;
                }
                // Enable.  
                this.OpenAutoSuggestionBox ();

                // Settings.  
                this.autoList.ItemsSource = autoSuggestLits.Where (p => p.PhoneNo.ToLower ().Contains (PhoneNo.Text.ToLower ())).ToList ();
            }
            catch (Exception ex)
            {
                // Info.  
                MessageBox.Show (ex.Message, "Error", MessageBoxButton.OK, MessageBoxImage.Error);
                Console.Write (ex);
            }
        }
        private void AutoList_SelectionChanged ( object sender, SelectionChangedEventArgs e )
        {
            try
            {
                if (this.autoList.SelectedIndex <= -1)
                {
                    this.CloseAutoSuggestionBox ();
                    return;
                }

                // Disable.  
                this.CloseAutoSuggestionBox ();
                SaleOrderDE selectedOrder = (SaleOrderDE)autoList.SelectedItem;
                PhoneNo.Text = selectedOrder.PhoneNo.ToString ();
                Address.Text = selectedOrder.Address.ToString ();
                Name.Text = selectedOrder.Name.ToString ();
                autoList.SelectedIndex = -1;
            }
            catch (Exception ex)
            {
                // Info.  
                MessageBox.Show (ex.Message, "Error", MessageBoxButton.OK, MessageBoxImage.Error);
                Console.Write (ex);
            }
        }
        public void AddressCheck ( object sender, TextChangedEventArgs args )
        {
            AddressValidation.Visibility = Visibility.Hidden;
            if (Address.Text == "")
                AddressValidation.Visibility = Visibility.Visible;
        }
        public void TableNoCheck ( object sender, TextChangedEventArgs args )
        {
            TableNoValidation.Visibility = Visibility.Hidden;
            if (TableNo.Text == "")
                TableNoValidation.Visibility = Visibility.Visible;
        }
        public void DeliveryOrderCheck ( )
        {
            SourceValidation.Visibility = Visibility.Hidden;
            AddressValidation.Visibility = Visibility.Hidden;
            PhoneNoValidation.Visibility = Visibility.Hidden;
            NameValidation.Visibility = Visibility.Hidden;
            if (sourceCombo.SelectedItem == null)
                SourceValidation.Visibility = Visibility.Visible;
            if (Address.Text == "")
                AddressValidation.Visibility = Visibility.Visible;
            if (PhoneNo.Text == "")
                PhoneNoValidation.Visibility = Visibility.Visible;
            if (Name.Text == "")
                NameValidation.Visibility = Visibility.Visible;
        }
        public void SaveDelivery ( object sender, RoutedEventArgs e )
        {
            this.DeliveryOrderCheck ();
            if (sourceCombo.SelectedItem != null && Address.Text != "" && PhoneNo.Text != "" && Name.Text != "")
            {
                foreach (Window window in Application.Current.Windows)
                {
                    if (window.GetType () == typeof (POS))
                    {
                        POS pos = (POS)window;
                        pos.SaveOrder ();
                        this.sOrder = pos.order;
                        this.sOrder.OrderTypeId = (int)OrderTypes.Delivery;
                        this.sOrder.PhoneNo = PhoneNo.Text;
                        this.sOrder.Address = Address.Text;
                        this.sOrder.Name = Name.Text;
                        this.sOrder.BillTitle = "D-" + Name.Text;
                        if (Note.Text != "")
                            this.sOrder.Note = Note.Text;
                        this.sOrder.SourceId = (int)sourceCombo.SelectedValue;
                        break;
                    }
                }
                this.SaveOrder ();
            }
        }
        private void CloseAutoSuggestionBox ( )
        {
            try
            {
                // Enable.  
                this.autoListPopup.Visibility = Visibility.Collapsed;
                this.autoListPopup.IsOpen = false;
                autoBorder.Visibility = Visibility.Collapsed;
                this.autoList.Visibility = Visibility.Collapsed;
            }
            catch (Exception ex)
            {
                // Info.  
                MessageBox.Show (ex.Message, "Error", MessageBoxButton.OK, MessageBoxImage.Error);
                Console.Write (ex);
            }
        }
        private void OpenAutoSuggestionBox ( )
        {
            try
            {
                // Enable.  
                this.autoListPopup.Visibility = Visibility.Visible;
                this.autoListPopup.IsOpen = true;
                autoBorder.Visibility = Visibility.Visible;
                this.autoList.Visibility = Visibility.Visible;
            }
            catch (Exception ex)
            {
                // Info.  
                MessageBox.Show (ex.Message, "Error", MessageBoxButton.OK, MessageBoxImage.Error);
                Console.Write (ex);
            }
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
                        var text = btn.Content.ToString ();
                        int pos = textBox.SelectionStart;
                        textBox.Text = textBox.Text.Insert (textBox.CaretIndex, text);
                        textBox.Select (textBox.Text.Length, 0);
                    }
                };
            }
        }
        public void Exit ( object sender, RoutedEventArgs e )
        {
            foreach (Window window in Application.Current.Windows)
            {
                if (window.GetType () == typeof (POS))
                {
                    POS pos = (POS)window;
                    pos.Show ();
                    //  (window as POS).calculateDiscount();
                    break;
                }
            }
            // POS window = new POS();

            //  window.Show();
            this.Close ();
            EditMode = false;
        }
        public void Clear ( object sender, RoutedEventArgs e )
        {
            ClearTexBoxes ();
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
        #endregion
        #region Others
        public async void getOrderList ( )
        {
            var list = await saleService.GetOrders ();
            autoSuggestLits = list.Where (x => x.PhoneNo != null).ToList ();
        }
        public async void SaveOrder ( )
        {
            try
            {
                ServiceChargesDE _line = new ServiceChargesDE ();
                _line.OrderTypeId = (int)sOrder.OrderTypeId;
                _line.PaymentTypeId = (int)sOrder.PaymentMethodId;
                serviceChargesList = await SrvcChrhsSvc.SearchServiceCharges (_line);
                if (serviceChargesList.Count != 0)
                    sOrder.Service = (float)serviceChargesList.FirstOrDefault ().Percentage;

                ServiceChargesDE line = new ServiceChargesDE ();
                line.IsActive = true;
                serviceChargesList = await SrvcChrhsSvc.SearchServiceCharges (line);
                if (serviceChargesList.Count != 0)
                {
                    var charges = serviceChargesList.FindAll (x => x.PaymentTypeId == (int)SrvcChrgsPaymentTypes.All || x.OrderTypeId == (int)SrvcChrgsOrderTypes.All);
                    if (charges.Count > 0)
                    {
                        float SvcChrgs = 0;
                        foreach (var chrgs in charges)
                        {
                            if (chrgs.PaymentTypeId == (int)SrvcChrgsPaymentTypes.Card && chrgs.OrderTypeId == (int)SrvcChrgsOrderTypes.All)
                                if ((int)sOrder.PaymentMethodId == (int)PaymentMethods.Card)
                                    SvcChrgs += (float)chrgs.Percentage;
                            if (chrgs.OrderTypeId == (int)SrvcChrgsOrderTypes.DineIn && chrgs.PaymentTypeId == (int)SrvcChrgsPaymentTypes.All)
                                if ((int)sOrder.OrderTypeId == (int)OrderTypes.DineIn)
                                    SvcChrgs += (float)chrgs.Percentage;
                        }
                        foreach (Window window in Application.Current.Windows)
                        {
                            if (window.GetType () == typeof (POS))
                            {
                                POS pos = (POS)window;
                                pos.order.Service = SvcChrgs;
                                pos.SrvcCharges.Text = pos.order.Service.ToString ();
                                pos.getNetTotal ();
                                sOrder.Service = pos.order.Service;
                                sOrder.NetTotal = pos.NetPayable;
                                break;
                            }
                        }
                    }
                }
                //sOrder.Service = (float)serviceChargesList.FirstOrDefault ().Percentage;
                DeliveryButton.IsEnabled = false;
                TakeAwayButton.IsEnabled = false;
                DineInButton.IsEnabled = false;
                SaleOrderDE response = new SaleOrderDE ();
                if (EditMode == true)
                    response = await saleService.Update (sOrder);
                else
                    response = await saleService.Save (sOrder);
                if (response.Id > 0)
                {
                    foreach (var oLine in response.SaleOrderLines)
                    {
                        oLine.DBoperation = 0;
                    }
                    foreach (Window win in Application.Current.Windows)
                    {
                        if (win.GetType () == typeof (POS))
                        {
                            POS po = (POS)win;
                            await po.getOrders ();
                            po.OrderName.Text = sOrder.BillTitle;
                            po.EditMode = true;
                            po.UpdateMode = true;
                            po.TenderButton.Content = "CashTender";
                            po.TenderButton.FontSize = 20;
                            po.SelectedOrder = response;
                            po.order = response;
                            po.soLineList = po.order.SaleOrderLines;
                            po.SOLineGrid.ItemsSource = po.soLineList;
                            CollectionViewSource.GetDefaultView (po.SOLineGrid.ItemsSource).Refresh ();
                            po.Show ();
                            saleService.GeneratePDF (response, "NewOrder", (int)ReportSubCategories.NewReport);
                            break;
                        }
                    }
                    //POS pos = new POS ();
                    //pos.Show ();
                    this.Close ();

                    DeliveryButton.IsEnabled = true;
                    TakeAwayButton.IsEnabled = true;
                    DineInButton.IsEnabled = true;
                    EditMode = false;
                }
                else
                {
                    DeliveryButton.IsEnabled = true;
                    TakeAwayButton.IsEnabled = true;
                    DineInButton.IsEnabled = true;
                    MessageBox.Show ("        Error Occurred ,Please Try Again       ", "Error");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show (ex.Message.ToString (), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
        private void ClearTexBoxes ( )
        {
            CustomerId.Text = "";
            ResId.Text = "";
            PhoneNo.Text = "";
            Name.Text = "";
            Note.Text = "";
            Address.Text = "";
            TableNo.Text = "";
            Guest.Text = "";

        }
        public void TopArea ( object sender, RoutedEventArgs e )
        {
            // ClearTexBoxes();
            Button? btn = sender as Button;
            if (btn != null)
            {
                if (btn.Name == "Delivery_btn" || (String)btn.CommandParameter == "Delivery_btn")
                {
                    btn.Background = (Brush)this.FindResource ("MahApps.Brushes.Accent2");
                    DineIn_btn.Background = (Brush)this.FindResource ("MahApps.Brushes.Highlight");
                    TakeAway_btn.Background = (Brush)this.FindResource ("MahApps.Brushes.Highlight");
                    Delivery.Visibility = Visibility.Visible;
                    DineIn.Visibility = Visibility.Hidden;
                    TakeAway.Visibility = Visibility.Hidden;
                }
                else if (btn.Name == "DineIn_btn" || (String)btn.CommandParameter == "DineIn_btn")
                {
                    btn.Background = (Brush)this.FindResource ("MahApps.Brushes.Accent2");
                    Delivery_btn.Background = (Brush)this.FindResource ("MahApps.Brushes.Highlight");
                    TakeAway_btn.Background = (Brush)this.FindResource ("MahApps.Brushes.Highlight");
                    Delivery.Visibility = Visibility.Hidden;
                    DineIn.Visibility = Visibility.Visible;
                    TakeAway.Visibility = Visibility.Hidden;
                }
                else if (btn.Name == "TakeAway_btn" || (String)btn.CommandParameter == "TakeAway_btn")
                {
                    btn.Background = (Brush)this.FindResource ("MahApps.Brushes.Accent2");
                    DineIn_btn.Background = (Brush)this.FindResource ("MahApps.Brushes.Highlight");
                    Delivery_btn.Background = (Brush)this.FindResource ("MahApps.Brushes.Highlight");
                    Delivery.Visibility = Visibility.Hidden;
                    DineIn.Visibility = Visibility.Hidden;
                    TakeAway.Visibility = Visibility.Visible;
                }
            }
        }
        #endregion
        #endregion
    }
}

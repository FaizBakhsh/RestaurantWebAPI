using DocumentFormat.OpenXml.Bibliography;
using DocumentFormat.OpenXml.ExtendedProperties;
using DocumentFormat.OpenXml.Office2010.ExcelAc;
using DocumentFormat.OpenXml.Vml;
using Example;
using Newtonsoft.Json;
using Prism.Regions;
using Restaurant.Core.Entities;
using Restaurant.Core.Enums;
using Restaurant.WPF.Entities;
using Restaurant.WPF.Entities.Enums;
using Restaurant.WPF.Services;
using Restaurant.WPF.Views.UserControls;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Net.NetworkInformation;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using static Xamarin.Essentials.Permissions;

namespace Restaurant.WPF.Views
{
    public partial class POS
    {
        #region Properties
        public int DealId { get; set; }
        public float Service { get; set; }
        public int ItemQty { get; set; }
        public string? PaymentMethod { get; set; }
        public float LineTotalCost { get; set; }
        public bool UpdateMode { get; set; }
        public bool EditMode { get; set; }
        public bool ShldDecBy1 { get; set; }
        public int StageId { get; set; }
        public float NetPayable { get; set; }
        public int OrderCount { get; set; }
        public EnumLineDE Terminal { get; set; }
        HttpClient client;
        public List<MenuGroupDE> Group;
        public List<SizeDE> sizeList;
        public List<ItemDE> itemList;
        public List<SaleOrderLineDE> soLineList;
        public List<SaleOrderDE> saleList;
        public List<SaleOrderDE> orders;
        public SaleOrderDE order;
        public SaleOrderDE SelectedOrder;
        public List<ShiftDE> shiftList;
        public List<GSTDE> gstList;
        public List<RuntimeModifierDE> rmList;
        public SaleOrderService saleService;
        public CategoryService categoryService;
        public ShiftService shiftService;
        public EnumLineService enumLineService;
        public ItemService itemSvc;
        public GSTService gSTSvc;
        public GroupService groupSvc;
        public RuntimeModifierService rmSvc;
        List<EnumLineDE> paymentMethods;
        public List<SaleOrderDE> closedOrderList;
        public List<ItemDE> groupItems;
        ItemDE dealItem;
        ItemDE searchedItem;
        public SaleDayService dayService;

        #endregion
        #region Constructor
        public POS ( )
        {
            InitializeComponent ();
            searchedItem = new ItemDE ();
            this.StageId = 0;
            this.DealId = 0;
            this.ItemQty = 0;
            gstList = new List<GSTDE> ();
            groupItems = new List<ItemDE> ();
            gSTSvc = new GSTService ();
            paymentMethods = new List<EnumLineDE> ();
            rmList = new List<RuntimeModifierDE> ();
            saleList = new List<SaleOrderDE> ();
            orders = new List<SaleOrderDE> ();
            closedOrderList = new List<SaleOrderDE> ();
            order = new SaleOrderDE ();
            client = new HttpClient ();
            Group = new List<MenuGroupDE> ();
            sizeList = new List<SizeDE> ();
            itemList = new List<ItemDE> ();
            soLineList = new List<SaleOrderLineDE> ();
            SelectedOrder = new SaleOrderDE ();
            shiftList = new List<ShiftDE> ();
            saleService = new SaleOrderService ();
            categoryService = new CategoryService ();
            shiftService = new ShiftService ();
            enumLineService = new EnumLineService ();
            itemSvc = new ItemService ();
            rmSvc = new RuntimeModifierService ();
            dayService = new SaleDayService ();
            groupSvc = new GroupService ();
            Terminal = new EnumLineDE ();
            this.LineTotalCost = 0;
            dealItem = new ItemDE ();
            UpdateMode = false;
            EditMode = true;
            GetGroups ();
            getOrders ();
            //GetTerminalByAddress ();
            IsDayStarted ();
            //IsShiftStarted ();
            //saleDate.Text = Properties.Settings.Default.CurrentDate.ToShortDateString ();
            terminalName.Text = "";
            //GetPaymentMethods();
            GST ();
            InitializeComponent ();
        }
        #endregion
        #region Methods

        #region Http Call 
        public async void IsDayStarted ( )
        {
            try
            {
                await GetTerminalByAddress ();
                if (Properties.Settings.Default.TerminalId == 0) { }
                else
                {
                    var saleDay = new SaleDayDE ();
                    saleDay.DayStatusId = (int)DayStatuses.Open;
                    saleDay.ClientId = Properties.Settings.Default.ClientId;
                    //saleDay.Terminal = Environment.MachineName;
                    saleDay.TerminalId = Properties.Settings.Default.TerminalId;
                    //saleDay.Date = Properties.Settings.Default.CurrentDate;
                    var days = await dayService.SearchSaleDay (saleDay);
                    if (days != null)
                    {
                        var day = days.FirstOrDefault ();
                        if (day != null)
                        {
                            Properties.Settings.Default.IsDayStarted = true;
                            Properties.Settings.Default.DayId = day.Id;
                            Properties.Settings.Default.CurrentDate = day.Date;
                            saleDate.Text = Properties.Settings.Default.CurrentDate.ToShortDateString ();
                            await IsShiftStarted ();
                            ;
                        }
                        else
                        {
                            Properties.Settings.Default.IsDayStarted = false;
                            Properties.Settings.Default.DayId = 0;
                            saleDate.Text = "";
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show (ex.Message.ToString (), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
        public async Task IsShiftStarted ( )
        {
            try
            {
                ShiftDE shift = new ShiftDE ();

                shift.TerminalId = Properties.Settings.Default.TerminalId;
                shift.SaleDate = Properties.Settings.Default.CurrentDate;
                shift.ClientId = Properties.Settings.Default.ClientId;
                shiftList = await shiftService.SearchShift (shift);
                if (shiftList != null)
                    if (shiftList.Count > 0)
                    {
                        shiftList = shiftList.Where (x => x.EndTime == null).ToList ();
                        if (shiftList != null)
                            if (shiftList.Count > 0)
                            {
                                ShiftDE _shift = shiftList.FirstOrDefault ();
                                Properties.Settings.Default.IsShiftStarted = true;
                                Properties.Settings.Default.ShiftId = _shift.Id;
                            }
                            else
                                Properties.Settings.Default.IsShiftStarted = false;
                    }
                    else
                        Properties.Settings.Default.IsShiftStarted = false;
            }
            catch (Exception ex)
            {
                MessageBox.Show (ex.Message.ToString (), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
        public async Task<EnumLineDE> GetTerminalByAddress ( )
        {
            Terminal = new EnumLineDE ();
            try
            {
                EnumLineDE line = new EnumLineDE ();
                line.EnumTypeId = (int)EnumType.Terminals;
                line.ClientId = Properties.Settings.Default.ClientId;
                line.KeyCode = GetMacAddress ();
                var terminals = await enumLineService.SearchEnumLine (line);
                if (terminals != null)
                    if (terminals.Count > 0)
                    {
                        Terminal = terminals[0];
                        Properties.Settings.Default.TerminalId = Terminal.Id;
                        terminalName.Text = terminals[0].Name.ToString ();
                        Properties.Settings.Default.MachineName = terminals[0].Name.ToString ();
                    }
                    else
                    {
                        var terminal = new EnumLineDE ();
                        terminal.EnumTypeId = (int)EnumType.Terminals;
                        terminal.KeyCode = GetMacAddress ();
                        terminal.Name = Environment.MachineName;
                        terminal.Value = Environment.MachineName;
                        terminal.ClientId = Properties.Settings.Default.ClientId;
                        var response = await enumLineService.SaveEnumLine (terminal);
                        var res = response.StatusCode.ToString ();
                        if (res == "OK")
                        {
                            Terminal = new EnumLineDE ();
                            EnumLineDE eLine = new EnumLineDE ();
                            eLine.EnumTypeId = (int)EnumType.Terminals;
                            eLine.ClientId = Properties.Settings.Default.ClientId;
                            eLine.KeyCode = GetMacAddress ();
                            var _terminals = await enumLineService.SearchEnumLine (eLine);
                            if (_terminals != null)
                                if (_terminals.Count > 0)
                                {
                                    Terminal = _terminals[0];
                                    Properties.Settings.Default.TerminalId = Terminal.Id;
                                    terminalName.Text = _terminals[0].Name.ToString ();
                                    Properties.Settings.Default.MachineName = _terminals[0].Name.ToString ();
                                }
                                else
                                {
                                    Properties.Settings.Default.IsDayStarted = false;
                                    Properties.Settings.Default.IsShiftStarted = false;
                                    Properties.Settings.Default.DayId = 0;
                                    saleDate.Text = "";
                                    terminalName.Text = "";
                                    Properties.Settings.Default.TerminalId = 0;
                                }
                        }

                    }
                return Terminal;
            }
            catch (Exception ex)
            {
                MessageBox.Show (ex.Message.ToString (), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
                return Terminal;
            }
        }
        public async void GetPaymentMethods ( )
        {
            try
            {
                EnumLineDE line = new EnumLineDE ();
                line.EnumTypeId = (int)EnumType.MOP;
                paymentMethods = await enumLineService.SearchEnumLine (line);
                if (paymentMethods.Count > 0)
                {
                    for (int i = 0; i < paymentMethods.Count; i++)
                    {
                        RadioButton rb = new RadioButton
                        {
                            Content = paymentMethods[i].Name,
                            Margin = new Thickness (20, 0, 0, 0),
                            IsChecked = i == 0,
                            Background = new SolidColorBrush (Colors.Transparent),
                            Name = paymentMethods[i].Name,
                            Height = 28,
                            CommandParameter = paymentMethods[i]
                        };
                        rb.Click += new RoutedEventHandler (GetGSTtTax);

                        MOP.Children.Add (rb);
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show (ex.Message.ToString (), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
        public async void GetGSTtTax ( object sender, RoutedEventArgs e )
        {
            try
            {
                RadioButton? btn = sender as RadioButton;
                EnumLineDE value = (EnumLineDE)btn.CommandParameter;
                GSTDE gst = new GSTDE ();
                gst.PaymentType = value.Name;
                gstList = await gSTSvc.SearchGST (gst);
                if (gstList.Count != 0)
                {
                    var list = gstList.FirstOrDefault ();
                    if (SelectedOrder != null)
                        SelectedOrder.PaymentMethodId = list.PaymentTypeId;
                    this.order.PaymentMethodId = list.PaymentTypeId;
                    if (SumofLineTotal.Text != 0.ToString ())
                    {
                        if (!UpdateMode)
                            GSTPercentage.Text = list.GST.ToString ();
                    }

                    if (GSTPercentage.Text != "" && SumofLineTotal.Text != "")
                    {
                        var gstPercantage = float.Parse (GSTPercentage.Text);
                        var totalValue = float.Parse (SumofLineTotal.Text);
                        var gstValue = (float)Math.Round ((gstPercantage * totalValue) / 100, 2);
                        GSTValue.Text = gstValue.ToString ();
                    }
                    if (GSTPercentage.Text == "") { GSTValue.Text = ""; };
                    getNetTotal ();
                }
                else
                    MessageBox.Show ("Please Define Some GST  ");
                if (UpdateMode == true)
                {
                    if (EditMode == true)
                    {
                        TenderButton.Content = "UpdateOrder";
                        TenderButton.FontSize = 20;
                    }
                }
                //var paymentMethod = "";
                //if (CardBtn.IsChecked == true)
                //{
                //    paymentMethod = (string)CardBtn.Content;
                //}
                //if (CashBtn.IsChecked == true)
                //{
                //    paymentMethod = (string)CashBtn.Content;
                //}
            }
            catch (Exception ex)
            {
                MessageBox.Show (ex.Message.ToString (), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }

        }
        public async void GetGroups ( )
        {
            groupSp.Children.Clear ();
            sizes.Children.Clear ();
            itemSP.Children.Clear ();
            runtimeModifier.Children.Clear ();
            MenuGroupDE line = new MenuGroupDE ();
            Group = await groupSvc.SearchGroup (line);
            if (Group.Count > 0)
            {
                for (int i = 0; i < Group.Count; i++)
                {
                    // this.index = i;
                    Button button = new Button
                    {
                        Content = Group[i].Name,
                        Padding = new Thickness (10, 10, 10, 10),
                        CommandParameter = Group[i]
                    };
                    button.Click += new RoutedEventHandler (MenuItems);
                    //  button.Click += SubCategories(Category[i]);
                    groupSp.Children.Add (button);
                }
            }
        }
        public async void MenuItems ( object sender, RoutedEventArgs e )
        {
            try
            {
                if (Properties.Settings.Default.IsShiftStarted == true)
                {
                    runtimeModifier.Children.Clear ();
                    itemSP.Children.Clear ();
                    sizes.Children.Clear ();
                    Button? btn = sender as Button;
                    if (btn != null)
                    {
                        MenuGroupDE value = (MenuGroupDE)btn.CommandParameter;
                        ItemDE line = new ItemDE ();
                        line.GroupId = value.Id;
                        itemList = await itemSvc.SearchItem (line);
                        groupItems = itemList;
                        if (itemList.Count > 0)
                        {
                            for (int i = 0; i < itemList.Count; i++)
                            {
                                Button button = new Button
                                {
                                    Content = itemList[i].ItemName,
                                    Padding = new Thickness (20, 10, 20, 10),
                                    Margin = new Thickness (5, 5, 5, 5),
                                    CommandParameter = itemList[i],
                                    FontSize = 14,
                                    MinWidth = 120
                                };
                                button.Click += new RoutedEventHandler (SearchNext);
                                itemSP.Children.Add (button);
                            }
                        }
                    }
                }
                else
                    MessageBox.Show ("Please start the Shift");
            }
            catch (Exception ex)
            {
                MessageBox.Show (ex.Message.ToString (), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
        public async void SearchNext ( object sender, RoutedEventArgs e )
        {
            try
            {
                this.StageId = 0;
                this.ItemQty = 0;
                DealId = 0;
                if (Properties.Settings.Default.IsShiftStarted == true)
                {
                    sizes.Children.Clear ();
                    runtimeModifier.Children.Clear ();
                    Button? btn = sender as Button;
                    if (btn != null)
                    {
                        ItemDE value = (ItemDE)btn.CommandParameter;
                        #region SearchModifier
                        RuntimeModifierDE rmodifier = new RuntimeModifierDE ();
                        rmodifier.MenuItemId = value.Id;
                        rmList = await rmSvc.SearchRuntimeModifier (rmodifier);
                        if (rmList.Count != 0)
                        {
                            value.IsDealItem = true;
                            var lines = (List<SaleOrderLineDE>)SOLineGrid.ItemsSource;
                            if (lines != null)
                            {
                                var retVal = lines.Where (x => x.IsDealItem == true);
                                if (retVal.Count () > 0)
                                    DealId = retVal.Count () + 1;
                                else
                                    DealId = 1;
                            }
                            else
                                DealId = 1;
                            this.SearchNextRuntimeModifier ();
                        }
                        #endregion
                        #region SearchSizes
                        if (rmList.Count == 0)
                        {
                            SizeDE size = new SizeDE ();
                            size.ItemId = value.Id;
                            sizeList = await itemSvc.SearchSize (size);
                            if (sizeList.Count != 0)
                            {
                                for (int i = 0; i < sizeList.Count; i++)
                                {
                                    Button button = new Button
                                    {
                                        Content = sizeList[i].AttributeValue,
                                        // button.Name = value.Items[i]?.ItemName?.ToString();
                                        // Padding = new Thickness (20, 10, 20, 10),
                                        //Margin = new Thickness (5, 5, 5, 5),
                                        MinWidth = 95,
                                        Height = 32,
                                        Background = new SolidColorBrush (Colors.Gray),
                                        Foreground = new SolidColorBrush (Colors.White),
                                        CommandParameter = sizeList[i]
                                    };
                                    button.Click += new RoutedEventHandler (AddItemSizeToGrid);
                                    sizes.Children.Add (button);
                                }
                            }
                        }
                        #endregion
                        if ((rmList.Count == 0 && sizeList.Count == 0) || (rmList.Count != 0))
                        {
                            Button _btn = new Button ();
                            _btn.CommandParameter = value;
                            AddItemToGrid (_btn, e);
                        }
                    }
                }
                else
                    MessageBox.Show ("Please start the Shift");
            }
            catch (Exception ex)
            {
                MessageBox.Show (ex.Message.ToString (), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
        public async void ItemSizes ( object sender, RoutedEventArgs e )
        {
            try
            {
                if (Properties.Settings.Default.IsShiftStarted == true)
                {
                    sizes.Children.Clear ();
                    Button? btn = sender as Button;
                    if (btn != null)
                    {
                        ItemDE value = (ItemDE)btn.CommandParameter;
                        SizeDE size = new SizeDE ();
                        size.ItemId = value.Id;
                        sizeList = await itemSvc.SearchSize (size);
                        if (sizeList.Count != 0)
                        {
                            for (int i = 0; i < sizeList.Count; i++)
                            {
                                Button button = new Button
                                {
                                    Content = sizeList[i].SizeName,
                                    // button.Name = value.Items[i]?.ItemName?.ToString();
                                    Padding = new Thickness (20, 10, 20, 10),
                                    Margin = new Thickness (5, 5, 5, 5),
                                    Background = new SolidColorBrush (Colors.Gray),
                                    Foreground = new SolidColorBrush (Colors.White),
                                    CommandParameter = sizeList[i]
                                };
                                button.Click += new RoutedEventHandler (AddItemSizeToGrid);
                                sizes.Children.Add (button);
                            }
                        }
                    }
                }
                else
                    MessageBox.Show ("Please start the Shift");
            }
            catch (Exception ex)
            {
                MessageBox.Show (ex.Message.ToString (), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
        public async Task getOrders ( )
        {
            try
            {
                var order = new SaleOrderDE { BillStatusId = (int)BillStatuses.Paid };
                closedOrderList = await saleService.SearchSaleOrder (order);
                closedOrderList = closedOrderList.Where (x => x.CreatedOn.Value.Date >= Properties.Settings.Default.CurrentDate.Date).ToList ();
                if (closedOrderList != null)
                    OrderCount = closedOrderList.Count;
                var _order = new SaleOrderDE { BillStatusId = (int)BillStatuses.Pending };
                saleList = await saleService.SearchSaleOrder (_order);
                if (saleList != null)
                {
                    PendingOrders.Children.Clear ();
                    //saleList = saleList.Where (x => x.BillStatusId != (int)BillStatuses.Paid).ToList ();
                    if (saleList.Count > 0)
                        for (int i = 0; i < saleList.Count; i++)
                        {
                            Button button = new Button ();
                            if (saleList[i].OrderTypeId == (int)OrderTypes.TakeAway)
                            {
                                button.Background = new SolidColorBrush (Colors.CadetBlue);
                                // button.Foreground = new SolidColorBrush(Colors.White);
                            }
                            else if (saleList[i].OrderTypeId == (int)OrderTypes.DineIn)
                            {
                                button.Background = new SolidColorBrush (Colors.DimGray);
                                //  button.Foreground = new SolidColorBrush(Colors.White);
                            }
                            else if (saleList[i].OrderTypeId == (int)OrderTypes.Delivery)
                            {
                                button.Background = new SolidColorBrush (Colors.DarkKhaki);
                                // button.Foreground = new SolidColorBrush(Colors.White);
                            }
                            button.MinWidth = 95;
                            button.Height = 32;
                            button.Content = saleList[i].BillTitle;
                            button.CommandParameter = saleList[i];
                            button.Click += new RoutedEventHandler (ShowSelectedOrder);
                            PendingOrders.Children.Add (button);
                        }
                    // OrderCount = saleList.Count;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show (ex.Message.ToString (), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
        public async void UpdateOrder ( object sender, RoutedEventArgs e )
        {
            try
            {
                SelectedOrder.Total = float.Parse (SumofLineTotal.Text);
                SelectedOrder.Discount = float.Parse (DiscountPercentage.Text);
                SelectedOrder.GST = float.Parse (GSTPercentage.Text);
                SelectedOrder.GSTValue = float.Parse (GSTValue.Text);
                SelectedOrder.DiscountValue = float.Parse (DiscountValue.Text);
                if (SrvcCharges.Text != "")
                    SelectedOrder.Service = float.Parse (SrvcCharges.Text);
                else SelectedOrder.Service = 0;
                if (DeliveryCharges.Text != "")
                    SelectedOrder.DeliveryCharges = float.Parse (DeliveryCharges.Text);
                else SelectedOrder.DeliveryCharges = 0;
                if (POSFee.Text != "")
                    SelectedOrder.POSFee = float.Parse (POSFee.Text);
                else SelectedOrder.POSFee = 0;
                SelectedOrder.NetTotal = NetPayable;
                //if (CardBtn.IsChecked == true)
                //{
                //    PaymentMethod = (string)CardBtn.Content;
                //}
                //if (CashBtn.IsChecked == true)
                //{
                //    PaymentMethod = (string)CashBtn.Content;
                //}
                SelectedOrder.PaymentMethod = PaymentMethod;
                var _order = await saleService.Update (SelectedOrder);
                if (_order.Id > 0)
                {
                    MessageBox.Show ("Successfully Updated");
                    foreach (var value in SelectedOrder.SaleOrderLines)
                    {
                        value.DBoperation = 0;
                    }
                    SelectedOrder = _order;
                    order = SelectedOrder;
                    soLineList = order.SaleOrderLines;
                    SOLineGrid.ItemsSource = soLineList;
                    CollectionViewSource.GetDefaultView (SOLineGrid.ItemsSource).Refresh ();
                    await getOrders ();
                    Reset ();
                }
                else
                {
                    var btn = new Button ();
                    var order = new SaleOrderDE
                    {
                        Id = SelectedOrder.Id
                    };
                    var _saleOrder = await saleService.SearchSaleOrder (order);
                    if (_saleOrder != null)
                    {
                        if (_saleOrder.Count > 0)
                            SelectedOrder = _saleOrder.FirstOrDefault ();
                        btn.CommandParameter = SelectedOrder;
                        ShowSelectedOrder (btn, e);
                    }
                    MessageBox.Show ("Error Occurred");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show (ex.Message.ToString (), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
        public async Task CloseOrder ( object sender, RoutedEventArgs e )
        {
            try
            {
                bool hasInProgressLine = SelectedOrder.SaleOrderLines.Any (x => x.StatusId == (int)Statuses.InProgress);
                if (hasInProgressLine)
                    SelectedOrder.StatusId = (int)Statuses.InProgress;
                else
                    SelectedOrder.StatusId = (int)Statuses.Close;
                SelectedOrder.BillStatusId = (int)BillStatuses.Paid;
                var response = await saleService.Update (SelectedOrder);
                if (response.Id > 0)
                {
                    await saleService.SaleInvoice (response, InvoiceTypes.SaleInvoice, (int)ReportSubCategories.SaleInvoice);
                    foreach (var value in SelectedOrder.SaleOrderLines)
                    {
                        value.DBoperation = 0;
                    }
                    await getOrders ();
                    //ViewMode ();
                }
                else
                    MessageBox.Show ("Error Occurred");
            }
            catch (Exception ex)
            {
                MessageBox.Show (ex.Message.ToString (), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
        #endregion
        #region Form Calculation
        public void SearchNextRuntimeModifier ( )
        {
            try
            {
                this.StageId++;
                this.ItemQty = 0;
                var list = rmList.Where (x => x.StageId == StageId).ToList ();
                if (list.Count != 0)
                    for (int i = 0; i < list.Count; i++)
                    {
                        Button button = new Button
                        {
                            Content = list[i].ModifierName,
                            // button.Name = value.Items[i]?.ItemName?.ToString();
                            Padding = new Thickness (20, 10, 20, 10),
                            Margin = new Thickness (5, 5, 5, 5),
                            Background = new SolidColorBrush (Colors.Gray),
                            Foreground = new SolidColorBrush (Colors.White),
                            CommandParameter = list[i]
                        };
                        button.Click += new RoutedEventHandler (AddRuntimeModifiertoGrid);
                        runtimeModifier.Children.Add (button);
                    }
                else
                {
                    MessageBox.Show ("No More Item Available for this deal");
                    runtimeModifier.Children.Clear ();
                    this.StageId = 0;
                    this.ItemQty = 0;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show (ex.Message.ToString (), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
        public void AddRuntimeModifiertoGrid ( object sender, RoutedEventArgs e )
        {
            try
            {
                Button? btn = sender as Button;
                if (btn != null)
                {
                    this.ItemQty++;
                    RuntimeModifierDE value = (RuntimeModifierDE)btn.CommandParameter;
                    if (this.ItemQty <= value.StageQtyAllowed)
                    {
                        var item = new ItemDE ();
                        if (value.KDSId != default)
                            item.KDSId = value.KDSId.ToString ();
                        item.Qty = 1;
                        item.ActualPrice = value.Price;
                        item.ItemName = value.ModifierName;
                        item.Id = value.MenuItemId;
                        item.RModId = value.Id;
                        item.OptionalModifier = value.OptionalModifier;
                        item.IsRMod = true;
                        item.DealId = DealId;
                        var _btn = new Button ();
                        _btn.CommandParameter = item;
                        this.AddItemToGrid (_btn, e);
                        //SaleOrderLineDE soline = new SaleOrderLineDE();
                        //soline.QTY = 1;
                        //if (value.ModifierName != default)
                        //    soline.ItemName = value.ModifierName;
                        //if (value.Price != default)
                        //    soline.Price = (float)value.Price;
                        //if (View == true)
                        //    soline.DBoperation = (int)DBoperations.Insert;
                        //soLineList.Add(soline);
                        //SOLineGrid.ItemsSource = soLineList;
                        //CollectionViewSource.GetDefaultView(SOLineGrid.ItemsSource).Refresh();
                        if (this.ItemQty == value.StageQtyAllowed)
                        {
                            runtimeModifier.Children.Clear ();
                            this.SearchNextRuntimeModifier ();
                        }
                    }
                    else
                    {
                        MessageBox.Show ("  You Can't add more than " + value.StageQtyAllowed + " Items/Modifier  ");
                        runtimeModifier.Children.Clear ();
                        this.SearchNextRuntimeModifier ();
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show (ex.Message.ToString (), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
        public void AddItemToGrid ( object sender, RoutedEventArgs e )
        {
            try
            {
                if (sizeList.Count == 0)
                    sizes.Children.Clear ();
                if (UpdateMode == true)
                {
                    if (EditMode == true)
                    {
                        TenderButton.Content = "UpdateOrder";
                        TenderButton.FontSize = 20;
                    }
                }
                if (EditMode == true)
                {
                    Button? btn = sender as Button;
                    if (btn != null)
                    {
                        ItemDE value = (ItemDE)btn.CommandParameter;

                        SaleOrderLineDE soline = new SaleOrderLineDE ();
                        if (value.KDSId != default)
                            soline.KDSId = int.Parse (value.KDSId.Split (',').ToList ().FirstOrDefault ());
                        if (value.Qty != default)
                            soline.QTY = value.Qty;
                        if (value.ActualPrice != default)
                            soline.Price = (float)value.ActualPrice;
                        if (value.ItemName != default)
                            soline.ItemName = value.ItemName;
                        soline.ItemId = value.Id;
                        if (value.RModId != default)
                            soline.RModId = value.RModId;
                        if (value.ActualPrice != default && value.Qty != default)
                            soline.LineTotal = value.Qty * (float)value.ActualPrice;
                        soline.DealId = DealId;
                        soline.OptionalModifier = value.OptionalModifier;
                        soline.ItemParentId = value.ParentId;
                        soline.IsDealItem = value.IsDealItem;
                        soline.IsRMod = value.IsRMod;

                        if (UpdateMode == true)
                            soline.DBoperation = (int)DBoperations.Insert;
                        soLineList.Add (soline);
                        SOLineGrid.ItemsSource = soLineList;
                        CollectionViewSource.GetDefaultView (SOLineGrid.ItemsSource).Refresh ();
                        getTotal ();
                        //SOLineGrid.LoadingRow += ( sender, e ) =>
                        //{
                        //    if (e.Row.Item is SaleOrderLineDE rowView)
                        //    {
                        //        if (rowView.IsDealItem ==true)
                        //        {
                        //            e.Row.Background = Brushes.DarkGray;
                        //        }
                        //    }
                        //};
                    }
                    if (order.DiscountTypeId == (int)DiscountTypes.DiscountVoucher || SelectedOrder.DiscountTypeId == (int)DiscountTypes.DiscountVoucher)
                        this.calculateDiscountByValue ();
                    else
                        this.CalculateDiscount (sender, e);
                    this.CalculateGST (sender, e);
                    getNetTotal ();
                }
                else if (this.SelectedOrder.BillStatusId == (int)BillStatuses.Paid)
                    MessageBox.Show ("Please Reopen this order to change");
            }
            catch (Exception ex)
            {
                MessageBox.Show (ex.Message.ToString (), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
        public void AddItemSizeToGrid ( object sender, RoutedEventArgs e )
        {
            try
            {
                if (UpdateMode == true)
                {
                    if (EditMode == true)
                    {
                        TenderButton.Content = "UpdateOrder";
                        TenderButton.FontSize = 20;
                    }
                }
                if (EditMode == true)
                {
                    Button? btn = sender as Button;
                    if (btn != null)
                    {
                        SizeDE value = (SizeDE)btn.CommandParameter;
                        if (value.ActualPrice == null)
                            value.ActualPrice = 0;
                        if (value.ItemActualPrice == null)
                            value.ItemActualPrice = 0;

                        SaleOrderLineDE soline = new SaleOrderLineDE
                        {
                            QTY = value.Qty,
                            Price = (float)value.ActualPrice + (float)value.ItemActualPrice,
                            ItemName = value.AttributeValue + " " + value.Item,
                            ItemId = value.ItemId,
                            OptionalModifier = value.OptionalModifier,
                            SizeId = value.Id,
                            LineTotal = value.Qty * ((float)value.ActualPrice + (float)value.ItemActualPrice),
                        };
                        if (value.KDSId != default)
                            soline.KDSId = int.Parse (value.KDSId.Split (',').ToList ().FirstOrDefault ());
                        if (UpdateMode == true)
                            soline.DBoperation = (int)DBoperations.Insert;
                        soLineList.Add (soline);
                        SOLineGrid.ItemsSource = soLineList;
                        CollectionViewSource.GetDefaultView (SOLineGrid.ItemsSource).Refresh ();
                        getTotal ();
                    }
                    if (order.DiscountTypeId == (int)DiscountTypes.DiscountVoucher)
                        this.calculateDiscountByValue ();
                    else
                        this.CalculateDiscount (sender, e);
                    this.CalculateGST (sender, e);
                    getNetTotal ();
                }
                else if (this.SelectedOrder.BillStatusId == (int)BillStatuses.Paid)
                    MessageBox.Show ("Please Reopen this order to change");
            }
            catch (Exception ex)
            {
                MessageBox.Show (ex.Message.ToString (), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
        public void IncreaseQty ( object sender, RoutedEventArgs e )
        {
            try
            {
                SaleOrderLineDE item = (SaleOrderLineDE)SOLineGrid.SelectedItem;
                if (item != null)
                {
                    if (UpdateMode == true)
                    {
                        if (EditMode == true)
                        {
                            TenderButton.Content = "UpdateOrder";
                            TenderButton.FontSize = 20;
                            if (item.Id > 0)
                                item.DBoperation = (int)DBoperations.Update;
                            else
                                item.DBoperation = (int)DBoperations.Insert;
                        }
                    }
                    if (EditMode == true)
                    {
                        if (!item.IsRMod)
                        {
                            item.QTY = item.QTY + 1;
                            item.LineTotal = item.QTY * item.Price;
                            if (item.DealId > 0)
                            {
                                var items = (List<SaleOrderLineDE>)SOLineGrid.ItemsSource;
                                items = items.FindAll (x => x.DealId == item.DealId && x.IsRMod == true);
                                foreach (var dealItem in items)
                                {
                                    if (dealItem.Id > 0)
                                        dealItem.DBoperation = (int)DBoperations.Update;
                                    dealItem.QTY = dealItem.QTY + 1;
                                    dealItem.LineTotal = dealItem.QTY * dealItem.Price;
                                }
                            }
                            CollectionViewSource.GetDefaultView (SOLineGrid.ItemsSource).Refresh ();
                            getTotal ();
                        }
                        else
                            MessageBox.Show ("Can't change quantity of a deal item");
                        if (order.DiscountTypeId == (int)DiscountTypes.DiscountVoucher)
                            this.calculateDiscountByValue ();
                        else
                            this.CalculateDiscount (sender, e);
                        this.CalculateGST (sender, e);
                        getNetTotal ();
                    }
                    else if (this.SelectedOrder.BillStatusId == (int)BillStatuses.Paid)
                        MessageBox.Show ("Please Reopen this order to change");
                }
                else
                    MessageBox.Show ("No Item Selected");
            }
            catch (Exception ex)
            {
                MessageBox.Show (ex.Message.ToString (), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
        public void DecreaseQty ( object sender, RoutedEventArgs e )
        {
            try
            {
                SaleOrderLineDE item = (SaleOrderLineDE)SOLineGrid.SelectedItem;
                if (item != null)
                {
                    if (item.QTY > 1)
                    {
                        if (UpdateMode == true)
                        {
                            if (EditMode == true)
                            {
                                TenderButton.Content = "UpdateOrder";
                                TenderButton.FontSize = 20;
                                if (item.Id > 0)
                                    item.DBoperation = (int)DBoperations.Update;
                                else
                                    item.DBoperation = (int)DBoperations.Insert;
                            }
                        }
                        if (EditMode == true)
                        {
                            if (!item.IsRMod)
                            {
                                if (item.Id > 0)
                                {
                                    ShldDecBy1 = true;
                                    Authentication auth = new Authentication ();
                                    auth.ShowAuthWindows ("Delete");
                                }
                                else
                                {
                                    item.QTY = item.QTY - 1;
                                    item.LineTotal = item.QTY * item.Price;
                                    if (item.DealId > 0)
                                    {
                                        var items = (List<SaleOrderLineDE>)SOLineGrid.ItemsSource;
                                        items = items.FindAll (x => x.DealId == item.DealId && x.IsRMod == true);
                                        foreach (var dealItem in items)
                                        {
                                            dealItem.QTY = dealItem.QTY - 1;
                                            dealItem.LineTotal = dealItem.QTY * dealItem.Price;
                                        }
                                    }
                                    CollectionViewSource.GetDefaultView (SOLineGrid.ItemsSource).Refresh ();
                                    getTotal ();
                                }
                                if (order.DiscountTypeId == (int)DiscountTypes.DiscountVoucher)
                                    this.calculateDiscountByValue ();
                                else
                                    this.CalculateDiscount (sender, e);
                                this.CalculateGST (sender, e);
                                getNetTotal ();
                            }
                            else
                                MessageBox.Show ("Can't change quantity of a deal item");
                        }
                        else if (this.SelectedOrder.BillStatusId == (int)BillStatuses.Paid)
                            MessageBox.Show ("Please Reopen this order to change");
                    }
                    else
                        MessageBox.Show ("Item Quantity Can't be null");
                }
                else
                    MessageBox.Show ("No Item Selected");
            }
            catch (Exception ex)
            {
                MessageBox.Show (ex.Message.ToString (), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
        public void CalculateDiscount ( object sender, RoutedEventArgs e )
        {
            try
            {
                if (UpdateMode == true)
                {
                    if (EditMode == true)
                    {
                        TenderButton.Content = "UpdateOrder";
                        TenderButton.FontSize = 20;
                    }
                }
                this.calculateDiscount ();
            }
            catch (Exception ex)
            {
                MessageBox.Show (ex.Message.ToString (), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
        public void calculateDiscount ( )
        {
            try
            {
                if (DiscountPercentage.Text != "" && SumofLineTotal.Text != "")
                {
                    var discountinPercantage = float.Parse (DiscountPercentage.Text);
                    var totalValue = float.Parse (SumofLineTotal.Text);
                    var discount = (float)(discountinPercantage * totalValue) / 100;
                    DiscountValue.Text = discount.ToString ();
                }
                if (DiscountPercentage.Text == "") { DiscountValue.Text = ""; };

                getNetTotal ();
            }
            catch (Exception ex)
            {
                MessageBox.Show (ex.Message.ToString (), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
        public void calculateDiscountByValue ( )
        {
            try
            {
                if (DiscountValue.Text != "" && SumofLineTotal.Text != "")
                {
                    var discountinValue = float.Parse (DiscountValue.Text);
                    var totalValue = float.Parse (SumofLineTotal.Text);
                    double value = (100 * discountinValue) / totalValue;
                    var discount = (float)value;
                    DiscountPercentage.Text = discount.ToString ();
                }
                if (DiscountValue.Text == "") { DiscountPercentage.Text = ""; };

                getNetTotal ();
            }
            catch (Exception ex)
            {
                MessageBox.Show (ex.Message.ToString (), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
        public void calculateGSTByValue ( )
        {
            try
            {
                if (DiscountValue.Text != "" && SumofLineTotal.Text != "")
                {
                    var value = float.Parse (GSTValue.Text);
                    var totalValue = float.Parse (SumofLineTotal.Text);
                    var gst = (float)Math.Round ((100 * value) / totalValue, 2);
                    GSTPercentage.Text = gst.ToString ();
                }
                if (GSTValue.Text == "") { GSTPercentage.Text = ""; };

                getNetTotal ();
            }
            catch (Exception ex)
            {
                MessageBox.Show (ex.Message.ToString (), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
        public async Task GST ( )
        {
            try
            {
                GSTDE gst = new GSTDE ();
                if (CardBtn.IsChecked == true)
                    gst.PaymentType = (string)CardBtn.Content;
                if (CashBtn.IsChecked == true)
                    gst.PaymentType = (string)CashBtn.Content;
                gstList = await gSTSvc.SearchGST (gst);
                if (gstList.Count != 0)
                {
                    var list = gstList.FirstOrDefault ();
                    if (SelectedOrder != null)
                        SelectedOrder.PaymentMethodId = list.PaymentTypeId;
                    this.order.PaymentMethodId = list.PaymentTypeId;
                    if (SumofLineTotal.Text != 0.ToString ())
                    {
                        if (EditMode)
                            //{
                            GSTPercentage.Text = list.GST.ToString ();
                        //}
                    }
                    if (GSTPercentage.Text != "" && SumofLineTotal.Text != "")
                    {
                        var gstPercantage = float.Parse (GSTPercentage.Text);
                        var totalValue = float.Parse (SumofLineTotal.Text);
                        var gstValue = (float)(gstPercantage * totalValue) / 100;
                        GSTValue.Text = gstValue.ToString ();
                    }
                    if (GSTPercentage.Text == "") { GSTValue.Text = ""; };
                    getNetTotal ();
                }
                else
                    MessageBox.Show ("Please Define Some GST  ");
                if (UpdateMode == true)
                {
                    if (EditMode == true)
                    {
                        TenderButton.Content = "UpdateOrder";
                        TenderButton.FontSize = 20;
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show (ex.Message.ToString (), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
        public void CalculateGST ( object sender, RoutedEventArgs e )
        {
            GST ();
        }
        public void RefreshNetTotal ( object sender, RoutedEventArgs e )
        {
            if (UpdateMode == true)
            {
                if (EditMode == true)
                {
                    TenderButton.Content = "UpdateOrder";
                    TenderButton.FontSize = 20;
                }
            }
            if (SumofLineTotal.Text != "")
                getNetTotal ();
        }
        public void getTotal ( )
        {
            LineTotalCost = 0;
            if (SOLineGrid.ItemsSource != null)
            {
                foreach (SaleOrderLineDE item in SOLineGrid.ItemsSource)
                {
                    LineTotalCost += item.LineTotal;
                }
                SumofLineTotal.Text = LineTotalCost.ToString ();
            }
        }
        public void ClearGST ( object sender, RoutedEventArgs e )
        {
            if (UpdateMode == true)
            {
                if (EditMode == true)
                {
                    TenderButton.Content = "UpdateOrder";
                    TenderButton.FontSize = 20;
                }
            }
            GSTValue.Clear ();
            GSTPercentage.Text = "0";
            getNetTotal ();
        }
        public void ClearSrvc ( object sender, RoutedEventArgs e )
        {
            if (UpdateMode == true)
            {
                if (EditMode == true)
                {
                    TenderButton.Content = "UpdateOrder";
                    TenderButton.FontSize = 20;
                }
            }
            SrvcCharges.Text = "0";
            getNetTotal ();

        }
        public void ClearDisc ( object sender, RoutedEventArgs e )
        {
            if (UpdateMode == true)
            {
                if (EditMode == true)
                {
                    TenderButton.Content = "UpdateOrder";
                    TenderButton.FontSize = 20;
                }
            }
            DiscountPercentage.Text = "0";
            DiscountValue.Text = "0";
            getNetTotal ();
        }
        public void getNetTotal ( )
        {
            try
            {
                if (SumofLineTotal.Text == "") SumofLineTotal.Text = "0";
                if (DiscountValue.Text == "") DiscountValue.Text = "0";
                if (DiscountPercentage.Text == "") DiscountPercentage.Text = "0";
                if (GSTValue.Text == "") GSTValue.Text = "0";
                if (SrvcCharges.Text == "") Service = 0; else Service = float.Parse (SrvcCharges.Text);

                var total = float.Parse (SumofLineTotal.Text);
                var discount = float.Parse (DiscountValue.Text);
                float posFee;
                if (POSFee.Text == "") posFee = 0; else posFee = float.Parse (POSFee.Text);
                float deliveryChrgs;
                if (DeliveryCharges.Text == "") deliveryChrgs = 0; else deliveryChrgs = float.Parse (DeliveryCharges.Text);
                var gst = float.Parse (GSTValue.Text);
                var srvc = Service;

                NetPayable = (total - discount) + gst + srvc + posFee + deliveryChrgs;
                NetTotalValue.Text = NetPayable.ToString ();
            }
            catch (Exception ex)
            {
                MessageBox.Show (ex.Message.ToString (), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
        #endregion
        #region Bottom Buttons
        public void PreviousBill ( object sender, RoutedEventArgs e )
        {
            if (Properties.Settings.Default.IsShiftStarted == true)
            {
                if (closedOrderList.Count > 0)
                {
                    OrderCount--;
                    if (OrderCount < 0)
                        OrderCount = closedOrderList.Count - 1;
                    if (OrderCount >= 0)
                    {
                        Button? btn = sender as Button;
                        if (btn != null)
                        {
                            btn.CommandParameter = closedOrderList[OrderCount];
                            ShowSelectedOrder (btn, e);
                            this.EditMode = false;
                        }
                    }
                }
                else
                    MessageBox.Show ("No Order in Queue");
            }
            else
                MessageBox.Show ("Please Start Shift");
        }
        public void Complimentary ( object sender, RoutedEventArgs e )
        {
            if (Properties.Settings.Default.IsShiftStarted == true)
            {
                if (EditMode == true)
                {
                    if (SOLineGrid.ItemsSource != null)
                    {
                        Authentication auth = new Authentication ();
                        auth.ShowAuthWindows ("Complimentary");
                    }
                    else
                        MessageBox.Show ("  Please select order to continue...  ");
                }
                else if (this.SelectedOrder.BillStatusId == (int)BillStatuses.Paid)
                    MessageBox.Show ("Please Reopen this order to change");
            }
            else
                MessageBox.Show ("Please Start Shift");
        }
        public void DiscountIndividual ( object sender, RoutedEventArgs e )
        {
            if (Properties.Settings.Default.IsShiftStarted == true)
            {

                if (EditMode == true)
                {
                    if (SOLineGrid.ItemsSource != null)
                    {
                        Authentication auth = new Authentication ();
                        auth.ShowAuthWindows ("DiscountIndividual");
                    }
                    else
                        MessageBox.Show ("  Please select order to continue...  ");
                }
                else if (this.SelectedOrder.BillStatusId == (int)BillStatuses.Paid)
                    MessageBox.Show ("Please Reopen this order to change");
            }
            else
                MessageBox.Show ("Please Start Shift");
        }
        public void EmployeeFuctions ( object sender, RoutedEventArgs e )
        {
            Authentication auth = new Authentication ();
            auth.ShowAuthWindows ("EmployeeFunctions");
        }
        public void LoyalityCard ( object sender, RoutedEventArgs e )
        {
            if (Properties.Settings.Default.IsShiftStarted == true)
            {
                if (SOLineGrid.ItemsSource != null)
                {
                    if (EditMode == true)
                    {
                        LoyaltyCard window = new LoyaltyCard ();
                        window.Show ();
                    }
                    else if (this.SelectedOrder.BillStatusId == (int)BillStatuses.Paid)
                        MessageBox.Show ("Please Reopen this order to change");
                }
                else
                    MessageBox.Show ("Please select  Item to  use LoyaltyCard");
            }
            else
                MessageBox.Show ("Please Start Shift");
        }
        public void ChangeBill ( object sender, RoutedEventArgs e )
        {
            if (Properties.Settings.Default.IsShiftStarted == true)
            {
                ChangeBill window = new ChangeBill ();
                window.Show ();
            }
            else
            {
                MessageBox.Show ("Please Start Shift");
            }
        }
        public void BillRecall ( object sender, RoutedEventArgs e )
        {
            if (Properties.Settings.Default.IsShiftStarted == true)
            {
                BillRecall window = new BillRecall ();
                window.Show ();
                this.Close ();
            }
            else
            {
                MessageBox.Show ("Please Start Shift");
            }
        }
        public void CopyBill ( object sender, RoutedEventArgs e )
        {
            if (Properties.Settings.Default.IsShiftStarted == true)
            {
                CopyBill window = new CopyBill ();
                window.Show ();
                this.Close ();
            }
            else
            {
                MessageBox.Show ("Please Start Shift");
            }
        }
        public void SplitBill ( object sender, RoutedEventArgs e )
        {
            if (Properties.Settings.Default.IsShiftStarted == true)
            {
                Authentication auth = new Authentication ();
                auth.ShowAuthWindows ("SplitBill");
            }
            else
            {
                MessageBox.Show ("Please Start Shift");
            }
        }
        public void Discount ( object sender, RoutedEventArgs e )
        {
            if (Properties.Settings.Default.IsShiftStarted == true)
            {
                if (SOLineGrid.ItemsSource != null)
                {
                    if (EditMode == true)
                    {
                        Authentication auth = new Authentication ();
                        auth.ShowAuthWindows ("Discount");
                    }
                    else if (this.SelectedOrder.BillStatusId == (int)BillStatuses.Paid)
                        MessageBox.Show ("Please Reopen this order to change");
                }
                else
                {
                    MessageBox.Show ("Please select an Order to Discount");
                }
            }
            else
                MessageBox.Show ("Please Start Shift");
        }
        public void Comment ( object sender, RoutedEventArgs e )
        {
            if (Properties.Settings.Default.IsShiftStarted == true)
            {
                if (SOLineGrid.SelectedItem != null)
                {
                    if (EditMode == true)
                    {
                        Comment window = new Comment ();
                        window.Show ();
                    }
                    else if (this.SelectedOrder.BillStatusId == (int)BillStatuses.Paid)
                        MessageBox.Show ("Please Reopen this order to change");
                }
                else
                    MessageBox.Show ("Please select an Item to add comment");
            }
            else
                MessageBox.Show ("Please Start Shift");
        }
        public async void Delete ( object sender, RoutedEventArgs e )
        {
            if (Properties.Settings.Default.IsShiftStarted == true)
            {
                if (TenderButton.Content == "UpdateOrder")
                    MessageBox.Show ("Please Save changings to continue");
                else
                if (SOLineGrid.SelectedItem != null)
                {
                    SaleOrderLineDE line = (SaleOrderLineDE)SOLineGrid.SelectedItem;
                    if (!line.IsRMod)
                    {
                        if (this.SelectedOrder.BillStatusId == (int)BillStatuses.Paid)
                            MessageBox.Show ("Please Reopen this order to change");
                        else
                        {
                            if (line.Id > 0)
                            {
                                Authentication auth = new Authentication ();
                                auth.ShowAuthWindows ("Delete");
                            }
                            else
                            {
                                //if (line.QTY > 1)
                                //    DecreaseQty (sender, e);
                                //else
                                if (line.DealId > 0)
                                {
                                    var lines = (List<SaleOrderLineDE>)SOLineGrid.ItemsSource;
                                    lines = lines.FindAll (x => x.DealId == line.DealId && x.IsRMod == true);
                                    foreach (var dealItem in lines)
                                    {
                                        soLineList.Remove (dealItem);
                                    }
                                }
                                soLineList.Remove ((SaleOrderLineDE)SOLineGrid.SelectedItem);
                                CollectionViewSource.GetDefaultView (SOLineGrid.ItemsSource).Refresh ();
                                await UpdateSelectedOrder ();
                            }
                        }
                    }
                    else
                        MessageBox.Show ("Can't Delete an Deal Item");
                }
                else
                    MessageBox.Show ("Please select an Item to Delete");
            }
            else
                MessageBox.Show ("Please Start Shift");
        }
        public void Tender ( object sender, RoutedEventArgs e )
        {
            if (Properties.Settings.Default.IsShiftStarted == true)
            {
                var content = TenderButton.Content.ToString ();
                if (content == "Tender")
                {
                    if (soLineList.Count != 0)
                    {
                        Tender window = new Tender ();
                        window.Show ();
                        this.Hide ();
                    }
                    else
                    {
                        MessageBox.Show ("        Please Select Items to Tender        ", "Error");
                    }
                }
                else if (content == "CashTender")
                {
                    CashTender window = new CashTender ();
                    if (this.SelectedOrder.PaymentMethodId == (int)PaymentMethods.Cash)
                        window.CardBtn.IsEnabled = false;
                    else if (this.SelectedOrder.PaymentMethodId == (int)PaymentMethods.Card)
                        window.CashBtn.IsEnabled = false;
                    window.TotalBill.Text = NetPayable.ToString ();
                    window.Show ();
                    //this.Close ();
                }
                else if (content == "UpdateOrder")
                    UpdateOrder (sender, e);
            }
            else
                MessageBox.Show ("Please Start Shift");
        }
        public void clearBtn ( object sender, RoutedEventArgs e )
        {
            this.Clear (sender, e);
        }
        public async Task Clear ( object sender, RoutedEventArgs e )
        {
            //if (Properties.Settings.Default.IsShiftStarted == true)
            //{
            ClearSvc_btn.IsEnabled = true;
            ClearGST_btn.IsEnabled = true;
            SrvcCharges.IsReadOnly = false;
            DiscountPercentage.IsReadOnly = false;
            DeliveryCharges.IsReadOnly = false;
            POSFee.IsReadOnly = false;
            CashBtn.IsEnabled = true;
            CardBtn.IsEnabled = true;
            IncreaseQty_btn.IsEnabled = true;
            DecreaseQty_btn.IsEnabled = true;
            this.UpdateMode = false;
            EditMode = true;
            TenderButton.Content = "Tender";
            TenderButton.FontSize = 25;
            DiscountValue.Clear ();
            DiscountPercentage.Text = "0";
            GSTPercentage.Text = "0";
            GSTValue.Clear ();
            SumofLineTotal.Text = "0";
            SrvcCharges.Text = "0";
            DeliveryCharges.Text = "0";
            POSFee.Text = "0";
            soLineList.Clear ();
            NetTotalValue.Text = "";
            OrderName.Text = "";
            CashBtn.IsChecked = true;
            SOLineGrid.ItemsSource = null;
            await getOrders ();
            order = new SaleOrderDE ();
            SelectedOrder = new SaleOrderDE ();
            this.StageId = 0;
            this.ItemQty = 0;
            GetGroups ();
            await getOrders ();
            //}
            //else
            //    MessageBox.Show ("Please Start Shift");
        }
        public void Rename ( object sender, RoutedEventArgs e )
        {
            if (Properties.Settings.Default.IsShiftStarted == true)
            {
                if (UpdateMode == true)
                {
                    Tender tender = new Tender ();
                    if (order.OrderTypeId == (int)OrderTypes.Delivery)
                        MessageBox.Show ("You Cann't Change a Delivery Order ");
                    else if (order.OrderTypeId == (int)OrderTypes.TakeAway)
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
                        this.Hide ();
                        tender.Show ();
                    }
                    else if (order.OrderTypeId == (int)OrderTypes.DineIn)
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
                        this.Hide ();
                        tender.Show ();
                    }
                    else
                        MessageBox.Show ("  Please tender order to rename  ");
                }
                else
                    MessageBox.Show ("  Please select order to rename  ");
            }
            else
                MessageBox.Show ("Please Start Shift");
        }
        public void ReOpen ( object sender, RoutedEventArgs e )
        {
            if (Properties.Settings.Default.IsShiftStarted == true)
            {
                if (UpdateMode == true && this.EditMode == false)
                {
                    Authentication auth = new Authentication ();
                    auth.ShowAuthWindows ("ReOpen");
                }
                else
                    MessageBox.Show ("Please Select an closed order to ReOpen");
            }
            else
                MessageBox.Show ("Please Start Shift");
        }
        public void Exit ( object sender, RoutedEventArgs e )
        {
            Login logWindow = new Login ();
            logWindow.Show ();
            this.Close ();
        }
        public void CashTender ( object sender, RoutedEventArgs e )
        {
            var o = SelectedOrder;
            if (Properties.Settings.Default.IsShiftStarted == true)
            {
                CashTender window = new CashTender ();
                window.TotalBill.Text = NetPayable.ToString ();
                window.Show ();
                //this.Hide ();
            }
            else
            {
                MessageBox.Show ("Please Start Shift");
            }
        }
        public void Kitchen_Inventry ( object sender, RoutedEventArgs e )
        {
            if (Properties.Settings.Default.IsShiftStarted == true)
            {
                KitchenInventry window = new KitchenInventry ();
                window.Show ();
                this.Close ();
            }
            else
            {
                MessageBox.Show ("Please Start Shift");
            }
        }
        public async void PrintBtn ( object sender, RoutedEventArgs e )
        {
            try
            {
                if (this.SelectedOrder.Id > 0)
                    await saleService.SaleInvoice (this.SelectedOrder, InvoiceTypes.PreSaleInvoice, (int)ReportSubCategories.PrintBill);
                else
                    MessageBox.Show ("Please select an order to print");
            }
            catch (Exception)
            {
                MessageBox.Show ("Error Occurred Please try again");
            }
        }

        #endregion
        #region Others
        private string GetMacAddress ( )
        {
            string macAddresses = string.Empty;

            foreach (NetworkInterface nic in NetworkInterface.GetAllNetworkInterfaces ())
            {
                if (nic.OperationalStatus == OperationalStatus.Up)
                {
                    macAddresses += nic.GetPhysicalAddress ().ToString ();
                    break;
                }
            }
            return macAddresses;
        }
        private void chnageInSearchBox ( object sender, RoutedEventArgs e )
        {
            itemSP.Children.Clear ();
            if (searchBoxText.Text != "")
            {
                var list = groupItems.Where (p => p.ItemName.ToLower ().Contains (searchBoxText.Text.ToLower ())).ToList ();
                if (list.Count > 0)
                    for (int i = 0; i < list.Count; i++)
                    {
                        Button button = new Button
                        {
                            Content = list[i].ItemName,
                            Padding = new Thickness (20, 10, 20, 10),
                            Margin = new Thickness (5, 5, 5, 5),
                            CommandParameter = list[i],
                            FontSize = 14,
                            MinWidth = 120
                        };
                        button.Click += new RoutedEventHandler (SearchNext);
                        itemSP.Children.Add (button);
                    }
            }
            else
            {
                for (int i = 0; i < groupItems.Count; i++)
                {
                    Button button = new Button
                    {
                        Content = groupItems[i].ItemName,
                        Padding = new Thickness (20, 10, 20, 10),
                        Margin = new Thickness (5, 5, 5, 5),
                        CommandParameter = groupItems[i],
                        FontSize = 14,
                        MinWidth = 120
                    };
                    button.Click += new RoutedEventHandler (SearchNext);
                    itemSP.Children.Add (button);
                }
            }
        }
        private void Modify_Click ( object sender, RoutedEventArgs e )
        {
            if (Properties.Settings.Default.IsShiftStarted == true)
            {
                if (SOLineGrid.SelectedItem != null)
                {
                    //if (EditMode == true)
                    //{
                    SaleOrderLineDE item = (SaleOrderLineDE)SOLineGrid.SelectedItem;
                    if (item != null)
                    {
                        //    if (item.OptionalModifier)
                        //    {
                        Modify window = new Modify ();
                        window.Show ();
                        this.Hide ();
                        //    }
                        //    else
                        //        MessageBox.Show ("You Can't Modify this Item");
                    }
                    //}
                    //else
                    //    MessageBox.Show ("Please Reopen this order to change");
                }
                else
                    MessageBox.Show ("Please select  Item to  Modify");
            }
            else
                MessageBox.Show ("Please Start Shift");
        }
        private void ChangeTheme_Click ( object sender, RoutedEventArgs e )
        {
            Theme theme = new Theme ();
            theme.Show ();
        }
        private void Bottom_Button_Visibility ( object sender, RoutedEventArgs e )
        {
            if (BottomRegion.Visibility == Visibility.Visible)
            {
                BottomRegion.Visibility = Visibility.Hidden;
                //DynamicGrid.RowDefinitions[1].Height = new GridLength (550);
                DynamicGrid.RowDefinitions[2].Height = new GridLength (1);
            }
            else if (BottomRegion.Visibility == Visibility.Hidden)
            {
                BottomRegion.Visibility = Visibility.Visible;
                //DynamicGrid.RowDefinitions[1].Height = new GridLength (480);
                DynamicGrid.RowDefinitions[2].Height = new GridLength (70);
                //DynamicGrid.RowDefinitions[3].MinHeight = 45;
            }
        }
        private void Categories_Visibility ( object sender, RoutedEventArgs e )
        {

            if (GroupPanel.Visibility == Visibility.Visible)
            {
                searchBoxText.Text = "";
                groupItems.Clear ();
                runtimeModifier.Children.Clear ();
                itemSP.Children.Clear ();
                sizes.Children.Clear ();
                SaleForm.Width = 1100;
                DataTable.Height = 450;
                FormField.Margin = new Thickness (0, 100, 0, 0);
                SaleForm.HorizontalAlignment = HorizontalAlignment.Center;
                GroupPanel.Visibility = Visibility.Hidden;
                ItemPanel.Visibility = GroupPanel.Visibility;
                itemSearchBox.Visibility = GroupPanel.Visibility;
                //searchPlaceHolder.Visibility = GroupPanel.Visibility;
            }
            else if (GroupPanel.Visibility == Visibility.Hidden)
            {
                groupItems.Clear ();
                searchBoxText.Text = "";
                SaleForm.Width = 470;
                FormField.Margin = new Thickness (0, 0, 0, 0);
                DataTable.Height = 200;
                if (GroupPanel.HorizontalAlignment == HorizontalAlignment.Left)
                {
                    SaleForm.HorizontalAlignment = HorizontalAlignment.Right;
                }
                else
                {
                    SaleForm.HorizontalAlignment = HorizontalAlignment.Left;
                }

                GroupPanel.Visibility = Visibility.Visible;
                ItemPanel.Visibility = GroupPanel.Visibility;
                itemSearchBox.Visibility = GroupPanel.Visibility;
                //searchPlaceHolder.Visibility = GroupPanel.Visibility;
            }
            //
        }
        private void ChangeOrientaion ( object sender, RoutedEventArgs e )
        {
            if (SaleForm.HorizontalAlignment != HorizontalAlignment.Center)
            {
                if (SaleForm.HorizontalAlignment == HorizontalAlignment.Left)
                {
                    SaleForm.HorizontalAlignment = HorizontalAlignment.Right;
                    GroupPanel.HorizontalAlignment = HorizontalAlignment.Left;
                    DynamicGrid.ColumnDefinitions[1].Width = new GridLength (200);
                    DynamicGrid.ColumnDefinitions[3].Width = new GridLength (470);
                    CategoryButtonBoder.HorizontalAlignment = HorizontalAlignment.Left;
                    BottomButtonBorder.HorizontalAlignment = HorizontalAlignment.Right;
                }
                else
                {
                    SaleForm.HorizontalAlignment = HorizontalAlignment.Left;
                    GroupPanel.HorizontalAlignment = HorizontalAlignment.Right;
                    DynamicGrid.ColumnDefinitions[1].Width = new GridLength (470);
                    DynamicGrid.ColumnDefinitions[3].Width = new GridLength (200);
                    CategoryButtonBoder.HorizontalAlignment = HorizontalAlignment.Right;
                    BottomButtonBorder.HorizontalAlignment = HorizontalAlignment.Left;
                }
            }


        }
        public new void PreviewTextInput ( object sender, TextCompositionEventArgs e )
        {
            Regex regex = new Regex ("[^0-9]+");
            e.Handled = regex.IsMatch (e.Text);
        }
        public void SaveOrder ( )
        {
            try
            {
                if (SumofLineTotal.Text != "")
                    this.order.Total = float.Parse (SumofLineTotal.Text);
                if (DiscountPercentage.Text != "")
                    this.order.Discount = float.Parse (DiscountPercentage.Text);
                if (GSTPercentage.Text != "")
                    this.order.GST = float.Parse (GSTPercentage.Text);
                if (SrvcCharges.Text != "")
                    this.order.Service = float.Parse (SrvcCharges.Text);
                if (DeliveryCharges.Text != "")
                    this.order.DeliveryCharges = float.Parse (DeliveryCharges.Text);
                if (POSFee.Text != "")
                    this.order.POSFee = float.Parse (POSFee.Text);
                if (GSTValue.Text != "")
                    this.order.GSTValue = float.Parse (GSTValue.Text);
                if (DiscountValue.Text != "")
                    this.order.DiscountValue = float.Parse (DiscountValue.Text);
                if (GSTValue.Text != "")
                    this.order.NetTotal = NetPayable;
                this.order.StatusId = (int)Statuses.InProgress;
                this.order.TerminalId = Properties.Settings.Default.TerminalId;
                this.order.BillStatusId = (int)BillStatuses.Pending;
                this.order.SaleOrderLines = soLineList;
                this.order.ShiftId = Properties.Settings.Default.ShiftId;
                this.order.Date = Properties.Settings.Default.CurrentDate;
                order.UserId = Properties.Settings.Default.UserId;
                order.CustTypeId = (int)CustTypes.CashCustomer;
                this.order.Time = DateTime.Now.ToShortTimeString ();
            }
            catch (Exception ex)
            {
                MessageBox.Show (ex.Message.ToString (), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
        public void CloseAllWindows ( )
        {
            for (int i = App.Current.Windows.Count - 1; i > 0; i--)
            {
                App.Current.Windows[i].Close ();
            }
        }
        public async void ShowSelectedOrder ( object sender, RoutedEventArgs e )
        {
            try
            {
                Button? btn = sender as Button;
                if (btn != null)
                {
                    this.EditMode = false;
                    this.UpdateMode = true;
                    TenderButton.Content = "CashTender";
                    TenderButton.FontSize = 20;
                    SelectedOrder = (SaleOrderDE)btn.CommandParameter;
                    order = SelectedOrder;
                    soLineList = order.SaleOrderLines;
                    SOLineGrid.ItemsSource = soLineList;
                    CollectionViewSource.GetDefaultView (SOLineGrid.ItemsSource).Refresh ();
                    //SOLineGrid.LoadingRow += ( sender, e ) =>
                    //{
                    //    if (e.Row.Item is SaleOrderLineDE rowView)
                    //    {
                    //        if (rowView.IsDealItem == true)
                    //            e.Row.Background = Brushes.DarkGray;
                    //    }
                    //};
                    DiscountPercentage.Text = SelectedOrder.Discount.ToString ();
                    GSTPercentage.Text = SelectedOrder.GST.ToString ();
                    SumofLineTotal.Text = SelectedOrder.Total.ToString ();
                    SrvcCharges.Text = SelectedOrder.Service.ToString ();
                    DeliveryCharges.Text = SelectedOrder.DeliveryCharges.ToString ();
                    POSFee.Text = SelectedOrder.POSFee.ToString ();
                    if (SelectedOrder.PaymentMethodId == (int)PaymentMethods.Cash) CashBtn.IsChecked = true; else CardBtn.IsChecked = true;

                    //CashBtn.IsEnabled = false;
                    //CardBtn.IsEnabled = false;
                    //ClearSvc_btn.IsEnabled = false;
                    //ClearGST_btn.IsEnabled = false;
                    //SrvcCharges.IsReadOnly = true;
                    //IncreaseQty_btn.IsEnabled = false;
                    //DecreaseQty_btn.IsEnabled = false;

                    calculateDiscount ();
                    await GST ();
                    GSTPercentage.Text = SelectedOrder.GST.ToString ();
                    DiscountPercentage.Text = SelectedOrder.Discount.ToString ();
                    GSTValue.Text = SelectedOrder.GSTValue.ToString ();
                    DiscountValue.Text = SelectedOrder.DiscountValue.ToString ();
                    NetTotalValue.Text = SelectedOrder.NetTotal.ToString ();
                    OrderName.Text = SelectedOrder.BillTitle;
                    if (SelectedOrder.BillStatusId == (int)BillStatuses.Paid)
                    {
                        this.EditMode = false;
                        ViewMode ();
                    }
                    else
                    {
                        Reset ();
                        this.EditMode = true;
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show (ex.Message.ToString (), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
        public async Task UpdateSelectedOrder ( )
        {
            try
            {
                getTotal ();
                if (order.DiscountTypeId == (int)DiscountTypes.DiscountKey || SelectedOrder.DiscountTypeId == (int)DiscountTypes.DiscountKey)
                    calculateDiscount ();
                else if (order.DiscountTypeId == (int)DiscountTypes.DiscountVoucher || SelectedOrder.DiscountTypeId == (int)DiscountTypes.DiscountVoucher)
                    calculateDiscountByValue ();
                else calculateDiscount ();
                await GST ();
                getNetTotal ();
                SelectedOrder.Total = float.Parse (SumofLineTotal.Text);
                SelectedOrder.Discount = float.Parse (DiscountPercentage.Text);
                SelectedOrder.DiscountValue = float.Parse (DiscountValue.Text);
                SelectedOrder.GSTValue = float.Parse (GSTValue.Text);
                SelectedOrder.GST = float.Parse (GSTPercentage.Text);
                if (SrvcCharges.Text != "")
                    SelectedOrder.Service = float.Parse (SrvcCharges.Text);
                if (DeliveryCharges.Text != "")
                    SelectedOrder.DeliveryCharges = float.Parse (DeliveryCharges.Text);
                if (POSFee.Text != "")
                    SelectedOrder.POSFee = float.Parse (POSFee.Text);
                SelectedOrder.NetTotal = NetPayable;
            }
            catch (Exception ex)
            {
                MessageBox.Show (ex.Message.ToString (), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
        public void Reset ( )
        {
            EditMode = true;
            this.UpdateMode = true;
            TenderButton.Content = "CashTender";
            TenderButton.FontSize = 20;
            CashBtn.IsEnabled = true;
            CardBtn.IsEnabled = true;
            ClearSvc_btn.IsEnabled = true;
            ClearGST_btn.IsEnabled = true;
            SrvcCharges.IsReadOnly = false;
            DiscountPercentage.IsReadOnly = false;
            DeliveryCharges.IsReadOnly = false;
            POSFee.IsReadOnly = false;
            IncreaseQty_btn.IsEnabled = true;
            DecreaseQty_btn.IsEnabled = true;
        }
        public void ViewMode ( )
        {
            EditMode = false;
            this.UpdateMode = true;
            TenderButton.Content = "CashTender";
            TenderButton.FontSize = 20;
            CashBtn.IsEnabled = false;
            CardBtn.IsEnabled = false;
            ClearSvc_btn.IsEnabled = false;
            ClearGST_btn.IsEnabled = false;
            SrvcCharges.IsReadOnly = true;
            DeliveryCharges.IsReadOnly = true;
            DiscountPercentage.IsReadOnly = true;
            POSFee.IsReadOnly = true;
            IncreaseQty_btn.IsEnabled = false;
            DecreaseQty_btn.IsEnabled = false;
        }

        #endregion

        #endregion
    }
}
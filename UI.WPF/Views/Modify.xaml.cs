using Restaurant.Core.Entities;
using Restaurant.Core.Enums;
using Restaurant.WPF.Entities.Enums;
using Restaurant.WPF.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http.Headers;
using System.Net.Http;
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
using Restaurant.WPF.Entities;
using DocumentFormat.OpenXml.Presentation;

namespace Restaurant.WPF.Views
{
    public partial class Modify
    {
        #region Properties

        public SaleOrderService saleSvc;
        public ModifierService modSvc;
        HttpClient client;
        List<ModifierDE> Modifier;
        SaleOrderDE order;
        public List<SaleOrderLineDE> saleList;
        public SaleOrderLineDE selectedLine;

        #endregion
        #region Constructor
        public Modify ( )
        {
            saleSvc = new SaleOrderService ();
            modSvc = new ModifierService ();
            Modifier = new List<ModifierDE> ();
            client = new HttpClient ();
            order = new SaleOrderDE ();
            saleList = new List<SaleOrderLineDE> ();
            selectedLine = new SaleOrderLineDE ();
            InitializeComponent ();
            ItemList ();
            GetModifiers ();
            foreach (Window window in Application.Current.Windows)
            {
                if (window.GetType () == typeof (POS))
                {
                    POS pos = (POS)window;
                    pos.Hide ();
                    break;
                }
            }
        }
        #endregion
        #region Methods
        public async void GetModifiers ( )
        {
            Modifier = await modSvc.GetModifiers ();
            if (Modifier != null)
            {
                for (int i = 0; i < Modifier.Count; i++)
                {
                    Button button = new Button ();
                    button.Content = Modifier[i].ModifierName;
                    button.Padding = new Thickness (30, 10, 30, 10);
                    button.CommandParameter = Modifier[i];
                    button.Background = new SolidColorBrush (Colors.DarkGray);
                    button.Foreground = new SolidColorBrush (Colors.White);
                    button.Click += new RoutedEventHandler (ModifierButton);
                    ModifierWP.Children.Add (button);
                }
            }
        }
        public void ItemList ( )
        {
            foreach (Window window in Application.Current.Windows)
            {
                if (window.GetType () == typeof (POS))
                {
                    POS pos = (POS)window;
                    if (pos.SOLineGrid.SelectedItem != null)
                    {
                        this.selectedLine = (SaleOrderLineDE)pos.SOLineGrid.SelectedItem;
                        saleList.Add ((SaleOrderLineDE)pos.SOLineGrid.SelectedItem);
                        SOLineGrid.ItemsSource = saleList;
                    }
                    break;
                }
            }
        }
        private void ModifierButton ( object sender, RoutedEventArgs e )
        {
            try
            {
                Button? btn = sender as Button;
                if (btn != null)
                {
                    ModifierDE value = (ModifierDE)btn.CommandParameter;
                    SaleOrderLineDE soline = new SaleOrderLineDE ();
                    if (value.Qty != default)
                        soline.QTY = value.Qty;
                    if (value.Price != default)
                        soline.Price = (float)value.Price;
                    if (value.ModifierName != default)
                        soline.ItemName = value.ModifierName;
                    soline.OptionalModifier = false;
                    if (value.Price != default && value.Qty != default)
                        soline.LineTotal = value.Qty * (float)value.Price;
                    saleList.Add (soline);
                    SOLineGrid.ItemsSource = saleList;
                    CollectionViewSource.GetDefaultView (SOLineGrid.ItemsSource).Refresh ();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show (ex.Message.ToString (), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
        public void Update ( object sender, RoutedEventArgs e )
        {
            foreach (Window window in Application.Current.Windows)
            {
                if (window.GetType () == typeof (POS))
                {
                    POS pos = (POS)window;
                    foreach (var line in saleList)
                    {
                        if (line != this.selectedLine)
                        {
                            ItemDE item = new ItemDE ();
                            item.Qty = line.QTY;
                            item.ActualPrice = line.Price;
                            item.ItemName = line.ItemName;
                            item.OptionalModifier = false;
                            item.IsDealItem = false;
                            item.ParentId = 0;
                            var btn = new Button ();
                            btn.CommandParameter = item;
                            pos.AddItemToGrid (btn, e);
                        }
                    }
                    this.Close ();
                    pos.Show ();
                    break;
                }
            }
        }
        public void Delete ( object sender, RoutedEventArgs e )
        {
            if (this.selectedLine != SOLineGrid.SelectedItem)
            {
                saleList.Remove ((SaleOrderLineDE)SOLineGrid.SelectedItem);
                CollectionViewSource.GetDefaultView (SOLineGrid.ItemsSource).Refresh ();
            }
        }
        private void Back ( object sender, RoutedEventArgs e )
        {
            foreach (Window window in Application.Current.Windows)
            {
                if (window.GetType () == typeof (POS))
                {
                    POS pos = (POS)window;
                    pos.Show ();
                    this.Close ();
                    break;
                }
            }
        }
        #endregion
    }
}


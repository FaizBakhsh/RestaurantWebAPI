using Restaurant.Core.Entities;
using Restaurant.Core.Enums;
using Restaurant.WPF.Entities;
using Restaurant.WPF.Entities.Enums;
using Restaurant.WPF.Services;
using System;
using System.Collections.Generic;
using System.Linq;
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

namespace Restaurant.WPF.Views
{
    /// <summary>
    /// Interaction logic for Visa.xaml
    /// </summary>
    public partial class Visa
    {
        #region Properties
        public EnumLineService enumSvc;
        public SaleOrderService saleSvc;
        public int Service { get; set; }
        SaleOrderDE order;
        HttpClient client = new HttpClient ();
        List<EnumLineDE> Banks = new List<EnumLineDE> ();
        #endregion
        #region Constructor
        public Visa ( )
        {
            saleSvc = new SaleOrderService ();
            enumSvc = new EnumLineService ();
            order = new SaleOrderDE ();
            WindowStartupLocation = System.Windows.WindowStartupLocation.CenterScreen;
            InitializeComponent ();
            GetBanks ();
        }
        #endregion
        #region Methods
        public async void GetBanks ( )
        {
            var line = new EnumLineDE ();
            line.EnumTypeId = (int)EnumType.Banks;
            line.ClientId = Properties.Settings.Default.ClientId;
            Banks = await enumSvc.SearchEnumLine (line);
            if (Banks != null)
            {
                for (int i = 0; i < Banks.Count; i++)
                {
                    Button button = new Button ();
                    button.Content = Banks[i].Name;
                    button.Padding = new Thickness (10, 10, 10, 10);
                    button.CommandParameter = Banks[i];
                    button.Background = (Brush)this.FindResource ("MahApps.Brushes.Accent2");
                    button.Click += new RoutedEventHandler (Update);
                    bank.Children.Add (button);
                }
            }
        }
        public async void Update ( object sender, RoutedEventArgs e )
        {
            Button? btn = sender as Button;
            if (btn != null)
            {
                EnumLineDE value = (EnumLineDE)btn.CommandParameter;
                foreach (Window window in Application.Current.Windows)
                {
                    if (window.GetType () == typeof (POS))
                    {
                        POS pos = (POS)window;
                        pos.SelectedOrder.BankId = value.Id;
                        await pos.CloseOrder (sender, e);
                        await pos.Clear (sender, e);
                        this.Close ();
                        break;
                    }
                }
            }
        }
        public void Exit ( object sender, RoutedEventArgs e )
        {
            this.Close ();
        }
        #endregion
    }
}

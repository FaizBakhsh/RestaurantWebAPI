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
    /// Interaction logic for CopyBill.xaml
    /// </summary>
    public partial class CopyBill
    {
        #region Properties & Class Members
        List<SaleOrderDE> saleList;
        SaleOrderDE selectedOrder;
        HttpClient client;
        SaleOrderService saleService;
        public LogEventDE log;
        private LogEventService logService;
        #endregion
        #region Constructor
        public CopyBill ( )
        {
            client = new HttpClient ();
            selectedOrder = new SaleOrderDE ();
            saleList = new List<SaleOrderDE> ();
            saleService = new SaleOrderService ();
            logService = new LogEventService ();
            log = new LogEventDE ();
            InitializeComponent ();
            getOrders ();
        }
        #endregion
        #region Methods
        public async void getOrders ( )
        {
            saleList = await saleService.GetOrders ();
            if (saleList != null)
            {
                saleList = saleList.Where (x => x.BillStatusId == (int)BillStatuses.Paid && x.CreatedOn.Value.Date >= Properties.Settings.Default.CurrentDate.Date).ToList ();
                OrderList.ItemsSource = saleList;
                CollectionViewSource.GetDefaultView (OrderList.ItemsSource).Refresh ();
            }
        }
        private async void Duplicate ( object sender, RoutedEventArgs e )
        {
            try
            {
                if (this.selectedOrder.Id > 0)
                {
                    await saleService.SaleInvoice (selectedOrder, InvoiceTypes.DuplicateBill, (int)ReportSubCategories.DuplicateBil);
                    log = new LogEventDE
                    {
                        UserId = Properties.Settings.Default.UserId,
                        Message = "Bill Recalled",
                        DBoperation = (int)DBoperations.Insert,
                        ActionId = (int)LogActions.DuplicateBill,
                        Date = DateTime.Now,
                        Time = DateTime.Now.ToShortTimeString ()
                    };
                    var retVal = await logService.Save (log);
                    if (retVal)
                    {
                    }
                    else
                    {
                        MessageBox.Show ("        Error Occurred, Please Try Again       ", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
                    }
                }
                else
                    MessageBox.Show ("Please Double click to an order to continue");
            }
            catch (Exception ex)
            {
                MessageBox.Show (ex.Message.ToString (), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
        private void SearchButton_OnClick ( object sender, RoutedEventArgs e )
        {
            var list = saleList.Where (x => x.Id.ToString ().Contains (SearchBox.Text)).ToList ();
            OrderList.ItemsSource = list;
            OrderList.Items.Refresh ();
        }
        public void ViewAll ( object sender, RoutedEventArgs e )
        {
            this.getOrders ();
        }
        public void Exit ( object sender, RoutedEventArgs e )
        {
            POS pos = new POS ();
            pos.Show ();
            this.Close ();
        }
        public void Row_DoubleClick ( object sender, MouseButtonEventArgs e )
        {
            DataGridRow row = (DataGridRow)sender;
            selectedOrder = (SaleOrderDE)row.Item;
            LineTable.ItemsSource = selectedOrder.SaleOrderLines;
            CollectionViewSource.GetDefaultView (LineTable.ItemsSource).Refresh ();
        }
        #endregion
    }
}

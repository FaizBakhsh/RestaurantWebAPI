using DocumentFormat.OpenXml.Drawing.Charts;
using Restaurant.Core.Entities;
using Restaurant.Core.Enums;
using Restaurant.WPF.Entities.Enums;
using Restaurant.WPF.Services;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Reflection;
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
    /// Interaction logic for OrderMakeStatus.xaml
    /// </summary>
    public partial class OrderMakeStatus
    {
        private SaleDetailRefundService refundService;
        private SaleOrderService orderService;
        public SaleOrderDE order { get; set; }
        public SaleDetailRefundDE SaleRefund { get; set; }
        public OrderMakeStatus ( )
        {
            refundService = new SaleDetailRefundService ();
            orderService = new SaleOrderService ();
            SaleRefund = new SaleDetailRefundDE ();
            order = new SaleOrderDE ();
            WindowStartupLocation = WindowStartupLocation.CenterScreen;
            InitializeComponent ();
        }
        public async void BeforeMaking ( object sender, RoutedEventArgs e )
        {
            SaleRefund.MakeStatusId = (int)MakeStatuses.Before;
            BeforeBtn.IsEnabled = false;
            AfterBtn.IsEnabled = false;
            await DeleteSaleLine (sender, e);
            BeforeBtn.IsEnabled = true;
            AfterBtn.IsEnabled = true;
        }
        public async void AfterMaking ( object sender, RoutedEventArgs e )
        {
            SaleRefund.MakeStatusId = (int)MakeStatuses.After;
            BeforeBtn.IsEnabled = false;
            AfterBtn.IsEnabled = false;
            await DeleteSaleLine (sender, e);
            BeforeBtn.IsEnabled = true;
            AfterBtn.IsEnabled = true;
        }
        public async Task DeleteSaleLine ( object sender, RoutedEventArgs e )
        {
            try
            {
                var lines = new List<SaleOrderLineDE> ();
                foreach (Window window in Application.Current.Windows)
                {
                    if (window.GetType () == typeof (POS))
                    {
                        POS pos = (POS)window;
                        if (pos.SOLineGrid.SelectedItem != null)
                        {
                            MessageBoxResult result = MessageBox.Show ("             Are You Sure you want to Delete it?          ", "Delete Confirmation", MessageBoxButton.YesNo, MessageBoxImage.Warning);
                            if (result == MessageBoxResult.Yes)
                            {
                                SaleOrderLineDE line = (SaleOrderLineDE)pos.SOLineGrid.SelectedItem;
                                if (line.QTY > 1 && pos.ShldDecBy1)
                                {
                                    SaleRefund.QTY = 1;
                                    line.QTY = line.QTY - 1;
                                    line.LineTotal = line.QTY * line.Price;
                                    pos.getTotal ();
                                    line.DBoperation = (int)DBoperations.Update;
                                    pos.ShldDecBy1 = false;
                                    if (line.DealId > 0)
                                    {
                                        lines = (List<SaleOrderLineDE>)pos.SOLineGrid.ItemsSource;
                                        lines = lines.FindAll (x => x.DealId == line.DealId && x.IsRMod == true);
                                        foreach (var dealItem in lines)
                                        {
                                            dealItem.QTY = dealItem.QTY - 1;
                                            dealItem.LineTotal = dealItem.QTY * dealItem.Price;
                                            dealItem.DBoperation = (int)DBoperations.Update;
                                        }
                                    }
                                    //line.QTY -= 1;
                                }
                                else
                                {
                                    if (line.DealId > 0)
                                    {
                                        lines = (List<SaleOrderLineDE>)pos.SOLineGrid.ItemsSource;
                                        lines = lines.FindAll (x => x.DealId == line.DealId && x.IsRMod == true);
                                        if (pos.SOLineGrid.Items is IEditableCollectionView editableCollectionView)
                                        {
                                            // Check if the collection is in an edit transaction
                                            if (editableCollectionView.IsEditingItem)
                                            {
                                                // Commit or cancel the edit transaction before modifying the source collection
                                                editableCollectionView.CommitEdit ();
                                                // OR editableCollectionView.CancelEdit();
                                            }
                                        }
                                        foreach (var dealItem in lines)
                                        {
                                            dealItem.IsDeleted = true;
                                            pos.soLineList.Remove (dealItem);
                                            dealItem.DBoperation = (int)DBoperations.Update;
                                        }
                                    }
                                    SaleRefund.QTY = line.QTY;
                                    line.DBoperation = (int)DBoperations.Update;
                                    line.IsDeleted = true;
                                    //line.DBoperation = (int)DBoperations.Delete;
                                    pos.soLineList.Remove ((SaleOrderLineDE)pos.SOLineGrid.SelectedItem);
                                }
                                CollectionViewSource.GetDefaultView (pos.SOLineGrid.ItemsSource).Refresh ();
                                await pos.UpdateSelectedOrder ();
                                if (pos.UpdateMode == true)
                                {
                                    if (pos.EditMode == true)
                                    {
                                        order = pos.SelectedOrder;
                                        SaleOrderDE saleOrder = new SaleOrderDE
                                        {
                                            Id = order.Id,
                                            Total = float.Parse (pos.SumofLineTotal.Text),
                                            Discount = float.Parse (pos.DiscountPercentage.Text),
                                            GST = float.Parse (pos.GSTPercentage.Text),
                                            DiscountValue = float.Parse (pos.DiscountValue.Text),
                                            GSTValue = float.Parse (pos.GSTValue.Text),
                                            Service = float.Parse (pos.SrvcCharges.Text),
                                            POSFee = float.Parse (pos.POSFee.Text),
                                            DeliveryCharges = float.Parse (pos.DeliveryCharges.Text),
                                            NetTotal = pos.NetPayable,
                                            IsActive = order.IsActive,
                                            CreatedOn = order.CreatedOn,
                                            CustomerId = order.CustomerId,
                                            TableNo = order.TableNo,
                                            SourceId = order.SourceId,
                                            Guest = order.Guest,
                                            WaiterId = order.WaiterId,
                                            RestaurantId = order.RestaurantId,
                                            OrderTypeId = order.OrderTypeId,
                                            DiscountTypeId = order.DiscountTypeId,
                                            PhoneNo = order.PhoneNo,
                                            Address = order.Address,
                                            Name = order.Name,
                                            Note = order.Note,
                                            BillTitle = order.BillTitle,
                                            ShiftId = order.ShiftId,
                                            StatusId = order.StatusId,
                                            BillStatusId = order.BillStatusId,
                                            PaymentMethodId = order.PaymentMethodId,
                                            TerminalId = Properties.Settings.Default.TerminalId,
                                            Date = Properties.Settings.Default.CurrentDate,
                                            Time = DateTime.Now.ToShortTimeString (),
                                            SaleOrderLines = new List<SaleOrderLineDE> { line }
                                        };
                                        foreach (var item in lines)
                                        {
                                            saleOrder.SaleOrderLines.Add (item);
                                        }
                                        // if (SaleRefund.MakeStatusId == (int)MakeStatuses.After)
                                        if (pos.SelectedOrder.StatusId ==
                                        (int)Statuses.ReOpen && pos.SelectedOrder.BillStatusId == (int)BillStatuses.Pending)
                                            SaleRefund.TypeId = (int)RefundTypes.Refund;
                                        else
                                            SaleRefund.TypeId = (int)RefundTypes.Void;
                                        SaleRefund.Price = line.Price * SaleRefund.QTY;
                                        if (line.DealId > 0)
                                        {
                                            foreach (var dealItem in lines)
                                            {
                                                SaleRefund.Price += dealItem.Price * dealItem.QTY;
                                            }
                                        }
                                        var SLines = (List<SaleOrderLineDE>)pos.SOLineGrid.ItemsSource;
                                        if (SLines.Count == 0)
                                        {
                                            if (pos.POSFee.Text != "")
                                                SaleRefund.POSFee = float.Parse (pos.POSFee.Text);
                                            if (pos.SrvcCharges.Text != "")
                                                SaleRefund.SvcChrgs = float.Parse (pos.SrvcCharges.Text);
                                            if (pos.DeliveryCharges.Text != "")
                                                SaleRefund.DC = float.Parse (pos.DeliveryCharges.Text);

                                        }
                                        if (pos.GSTPercentage.Text != "" && pos.GSTPercentage.Text != null)
                                            SaleRefund.GST = SaleRefund.Price * float.Parse (pos.GSTPercentage.Text) / 100;
                                        if (pos.DiscountPercentage.Text != "" && pos.DiscountPercentage.Text != null)
                                            SaleRefund.Discount = SaleRefund.Price * float.Parse (pos.DiscountPercentage.Text) / 100;

                                        SaleRefund.Gross = SaleRefund.Price + SaleRefund.GST + SaleRefund.Discount +
                                            SaleRefund.POSFee + SaleRefund.SvcChrgs + SaleRefund.DC;
                                        //SaleRefund.QTY = 1;
                                        SaleRefund.ItemName = line.ItemName;
                                        SaleRefund.DBoperation = (int)DBoperations.Insert;
                                        SaleRefund.Date = Properties.Settings.Default.CurrentDate;
                                        SaleRefund.Time = DateTime.Now.ToLongTimeString ();
                                        SaleRefund.ClientId = Properties.Settings.Default.ClientId;
                                        saleOrder.SaleDetailRefund = SaleRefund;
                                        var response = await orderService.Update (saleOrder);

                                        if (response.Id > 0)
                                        {
                                            #region Generate Report
                                            var _order = new SaleOrderDE ();
                                            foreach (PropertyInfo propertyInfo in typeof (SaleOrderDE).GetProperties ())
                                            {
                                                if (propertyInfo.Name != "SaleOrderLines")
                                                    propertyInfo.SetValue (_order, propertyInfo.GetValue (pos.SelectedOrder));
                                            }
                                            line.QTY = SaleRefund.QTY;
                                            _order.SaleOrderLines.Add (line);
                                            orderService.GeneratePDF (_order, "VoidOrder", (int)ReportSubCategories.Void);
                                            #endregion
                                            MessageBox.Show ("      Successfully Updated      ", "Success");
                                            foreach (var item in pos.SelectedOrder.SaleOrderLines)
                                            {
                                                item.DBoperation = 0;
                                            }
                                            await pos.getOrders ();
                                            pos.Reset ();
                                            var btn = new Button ();
                                            btn.CommandParameter = response;
                                            pos.ShowSelectedOrder (btn, e);
                                            this.Close ();
                                        }
                                        else
                                        {
                                            var btn = new Button ();
                                            var order = new SaleOrderDE
                                            {
                                                Id = pos.SelectedOrder.Id
                                            };
                                            var _saleOrder = await orderService.SearchSaleOrder (order);
                                            if (_saleOrder != null)
                                            {
                                                if (_saleOrder.Count > 0)
                                                    pos.SelectedOrder = _saleOrder.FirstOrDefault ();
                                                btn.CommandParameter = pos.SelectedOrder;
                                                pos.ShowSelectedOrder (btn, e);
                                            }
                                            this.Close ();
                                            // MessageBox.Show ("      Error Occurred , Please try Again      ", "Error");
                                        }
                                    }
                                }
                                else
                                    this.Close ();
                            }
                        }
                        else
                        {
                            MessageBox.Show ("      Please Select an Item to Delete      ", "Info");
                            this.Close ();
                        }
                        break;
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show (ex.Message.ToString (), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
    }
}

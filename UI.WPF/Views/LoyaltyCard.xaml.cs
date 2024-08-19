using Newtonsoft.Json;
using Restaurant.Core.Entities;
using Restaurant.WPF.Entities;
using Restaurant.WPF.Entities.Enums;
using Restaurant.WPF.Services;
using System;
using System.Collections.Generic;
using System.Linq;
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
    public partial class LoyaltyCard
    {
        public LoyaltyCardService cardService;
        public List<LoyaltyCardDE> loyaltyCards;
        public SaleOrderService orderService;
        public LoyaltyCardDE card;
        public SaleOrderDE saleOrder;
        public LoyaltyCard ( )
        {
            loyaltyCards = new List<LoyaltyCardDE> ();
            cardService = new LoyaltyCardService ();
            orderService = new SaleOrderService ();
            saleOrder = new SaleOrderDE ();
            card = new LoyaltyCardDE ();
            WindowStartupLocation = System.Windows.WindowStartupLocation.CenterScreen;
            InitializeComponent ();
        }
        public void Exit ( object sender, RoutedEventArgs e )
        {
            this.Close ();
        }
        public void changeEvent ( object sender, TextChangedEventArgs args )
        {
            CardNoValidation.Visibility = Visibility.Hidden;
            if (cardNo.Text == "")
                CardNoValidation.Visibility = Visibility.Visible;
        }
        public async void Submit ( object sender, RoutedEventArgs e )
        {
            try
            {
                if (cardNo.Text != "")
                {
                    LoyaltyCardDE card = new LoyaltyCardDE ()
                    {
                        CardNo = cardNo.Text,
                        ClientId = Properties.Settings.Default.ClientId,
                    };
                    loyaltyCards = await cardService.SearchLoyaltyCard (card);
                    if (loyaltyCards.Count > 0)
                    {
                        card = loyaltyCards.FirstOrDefault ();
                        if (card != null)
                            foreach (Window window in Application.Current.Windows)
                            {
                                if (window.GetType () == typeof (POS))
                                {
                                    POS pos = (POS)window;
                                    pos.DiscountPercentage.Text = card.DiscountPercentage.ToString ();
                                    pos.calculateDiscount ();
                                    await pos.UpdateSelectedOrder ();
                                    saleOrder = pos.SelectedOrder;
                                    pos.order.DiscountTypeId = (int)DiscountTypes.DiscountKey;
                                    saleOrder.DiscountTypeId = (int)DiscountTypes.DiscountKey;
                                    if (pos.UpdateMode == true)
                                    {
                                        UpdateOrder ();
                                    }
                                    break;
                                }
                            }
                        this.Close ();
                    }
                    else
                        MessageBox.Show ("No Card Found for this number");
                }
                else
                    CardNoValidation.Visibility = Visibility.Visible;
            }
            catch (Exception ex)
            {
                MessageBox.Show (ex.Message.ToString (), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
        public async void UpdateOrder ( )
        {
            try
            {
                var response = await orderService.UpdateOrder (saleOrder);
                var res = response.StatusCode.ToString ();
                if (res == "OK")
                {
                    foreach (Window window in Application.Current.Windows)
                    {
                        if (window.GetType () == typeof (POS))
                        {
                            POS pos = (POS)window;
                            foreach (var value in pos.SelectedOrder.SaleOrderLines)
                            {
                                value.DBoperation = 0;
                            }
                            await pos.getOrders ();
                            pos.Reset ();
                            break;
                        }
                    }
                    this.Close ();
                }
                else
                    MessageBox.Show ("      Error Occurred , Please try Again      ", "Error");
            }
            catch (Exception ex)
            {
                MessageBox.Show (ex.Message.ToString (), "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
        private void OnKeyDown ( object sender, KeyEventArgs e )
        {
            if (e.Key == Key.Enter)
                Submit (sender, e);
        }
    }
}

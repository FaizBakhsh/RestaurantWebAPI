


using ControlzEx.Theming;
using DocumentFormat.OpenXml.Math;
using Hanssens.Net;
using MahApps.Metro;
using MahApps.Metro.Controls;
using Restaurant.WPF.Entities;
using Restaurant.WPF.Views;
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
using Xamarin.Essentials;

namespace Restaurant.WPF
{

    public partial class Theme
    {
        List<String> _themeData;
        HttpClient client;
        public Theme ( )
        {
            client = new HttpClient ();
            _themeData = new List<String> ();
            WindowStartupLocation = System.Windows.WindowStartupLocation.CenterScreen;
            InitializeComponent ();
        }
        private void SetAppTheme_click ( object sender, RoutedEventArgs e )
        {
            String accent = ComboAccent.Text;
            String theme = ComboTheme.Text;
            if (accent == "")
                accent = "Crimson";
            if (theme == "")
                theme = "Light";


            if (CustomTheme.IsChecked == true)
            {
                Application.Current.Resources.MergedDictionaries.Clear ();
                var ss = Application.Current.Resources.MergedDictionaries;
                Application.Current.Resources.MergedDictionaries.Add (new ResourceDictionary
                {
                    Source = new Uri ("Dictionaries/ControlStyles.xaml", UriKind.RelativeOrAbsolute)
                });
                Application.Current.Resources.MergedDictionaries.Add (new ResourceDictionary
                {
                    Source = new Uri ("Dictionaries/DifferentColorsStyle.xaml", UriKind.RelativeOrAbsolute)
                });
                Application.Current.Resources.MergedDictionaries.Add (new ResourceDictionary
                {

                    Source = new Uri ("pack://application:,,,/MahApps.Metro;component/Styles/Themes/" + theme + "." + accent + ".xaml", UriKind.RelativeOrAbsolute)
                });
                var s = Application.Current.Resources.MergedDictionaries;
            }
            else if (CustomTheme.IsChecked == false)
            {
                Application.Current.Resources.MergedDictionaries.Clear ();
                var ss = Application.Current.Resources.MergedDictionaries;
                Application.Current.Resources.MergedDictionaries.Add (new ResourceDictionary
                {
                    Source = new Uri ("Dictionaries/ControlStyles.xaml", UriKind.RelativeOrAbsolute)
                });
                Application.Current.Resources.MergedDictionaries.Add (new ResourceDictionary
                {
                    Source = new Uri ("Dictionaries/DefaultColorsStyle.xaml", UriKind.RelativeOrAbsolute)
                });

                Application.Current.Resources.MergedDictionaries.Add (new ResourceDictionary
                {
                    Source = new Uri ("pack://application:,,,/MahApps.Metro;component/Styles/Themes/" + theme + "." + accent + ".xaml", UriKind.RelativeOrAbsolute)
                });

                var s = Application.Current.Resources.MergedDictionaries;
            }
            #region
            //if (accent != "")
            //{
            //    var sm = Application.Current.Resources.MergedDictionaries;
            //    _ = ThemeManager.Current.ChangeThemeColorScheme(Application.Current, accent);
            //    var smj = Application.Current.Resources.MergedDictionaries;
            //    //Preferences.Set("Accent", accent);
            //}
            //if (theme != "")
            //{
            //    var s = Application.Current.Resources.MergedDictionaries;
            //    ThemeManager.Current.ChangeThemeBaseColor(Application.Current, theme);
            //    // Preferences.Set("Theme", theme);
            //    var sm = Application.Current.Resources.MergedDictionaries;
            //}
            #endregion
            Update ();
        }
        public async void SaveTheme ( )
        {
            try
            {
                List<ThemeDataDE> themeData = new List<ThemeDataDE> ();
                var resources = Application.Current.Resources.MergedDictionaries;
                if (resources != null)
                {
                    foreach (var resource in Application.Current.Resources.MergedDictionaries)
                    {
                        if (resource.Source != null)
                        {
                            themeData.Add (new ThemeDataDE
                            {
                                ClientId = Properties.Settings.Default.ClientId,
                                Source = resource.Source.ToString ()
                            });
                        }
                    }
                }
                client.DefaultRequestHeaders.Accept.Add (new MediaTypeWithQualityHeaderValue ("application/json"));
                var response = await client.PostAsJsonAsync (Globals.BASE_API_URL + "ThemeData", themeData);
            }
            catch (Exception ex)
            {
                MessageBox.Show (ex.Message.ToString ());
            }
        }
        public async void Update ( )
        {
            try
            {
                foreach (Window win in Application.Current.Windows)
                {
                    if (win.GetType () == typeof (KitchenInventry))
                    {
                        KitchenInventry kit = (KitchenInventry)win;
                        kit.Close ();
                        KitchenInventry kds = new KitchenInventry ();
                        kds.Show ();
                    }
                }
                var response = await client.DeleteAsync (Globals.BASE_API_URL + "ThemeData?cltId=" + Properties.Settings.Default.ClientId.ToString ());
                var res = response.StatusCode.ToString ();
                if (res == "OK")
                    SaveTheme ();
            }
            catch (Exception ex)
            {
                MessageBox.Show (ex.Message.ToString ());
            }
        }
        private void Back_click ( object sender, RoutedEventArgs e )
        {
            this.Close ();
        }
    }
}

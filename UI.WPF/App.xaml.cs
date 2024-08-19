using ControlzEx.Theming;
using Newtonsoft.Json;
using Restaurant.WPF.Entities;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;
using System.Windows;
using Xamarin.Essentials;

namespace Restaurant.WPF
{
    /// <summary>
    /// Interaction logic for App.xaml
    /// </summary>
    public partial class App : Application
    {
        //protected override void OnStartup(StartupEventArgs e)
        //{
        //    base.OnStartup(e);
        //    var bootstrapper = new Bootstrapper();
        //    bootstrapper.Run();
        //}
        public String? ThemeBase { get; set; }
        public String? ColorScheme { get; set; }
        List<String> _themeData;
        List<ThemeDataDE> themeData;
        HttpClient client;
        public App ( )
        {
            _themeData = new List<String> ();
            themeData = new List<ThemeDataDE> ();
            client = new HttpClient ();
            InitializeComponent ();
            SetTheme ();
        }
        public async void SetTheme ( )
        {
            try
            {
                if (_themeData.Count == 0)
                {
                    _themeData.Add ("Dictionaries/ControlStyles.xaml");
                    _themeData.Add ("Dictionaries/DefaultColorsStyle.xaml");
                    _themeData.Add ("pack://application:,,,/MahApps.Metro;component/Styles/Themes/Light.Cyan.xaml");
                }
                for (int i = 0; i < _themeData.Count; i++)
                {
                    Application.Current.Resources.MergedDictionaries.Add (new ResourceDictionary
                    {
                        Source = new Uri (_themeData[i], UriKind.RelativeOrAbsolute)
                    });
                }

                //var response = await client.GetStringAsync (Globals.BASE_API_URL + "ThemeData");
                //themeData = JsonConvert.DeserializeObject<List<ThemeDataDE>> (response);
                //if (themeData?.Count != 0)
                //{
                //    // Application.Current.Resources.MergedDictionaries.Clear();
                //    for (int i = 0; i < themeData?.Count; i++)
                //    {
                //        Application.Current.Resources.MergedDictionaries.Add (new ResourceDictionary
                //        {
                //            Source = new Uri (themeData[i].Source, UriKind.RelativeOrAbsolute)
                //        });
                //    }
                //}
            }
            catch (Exception ex)
            {
                MessageBox.Show (ex.Message.ToString ());
            }
        }
    }
}

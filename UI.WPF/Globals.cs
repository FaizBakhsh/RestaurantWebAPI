using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static System.Net.WebRequestMethods;

namespace Restaurant.WPF
{
    public class Globals
    {
        public static string? BASE_API_URL = Properties.Settings.Default.BASE_API_URL;
        public static string? SpringBoot_API_URL = Properties.Settings.Default.SpringBoot_API_URL;
        public Globals()
        {
            BASE_API_URL = Properties.Settings.Default.BASE_API_URL;
            SpringBoot_API_URL = Properties.Settings.Default.SpringBoot_API_URL;
    }
    }
}

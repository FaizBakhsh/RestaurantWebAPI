using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Core.Extenstions
{
    public static class TimeExtension
    {
        public static string ToDateTimeString ( this DateTime date )
        {
            return date.ToString ("dd-MM-yyyy h:mm tt");
        }
        public static string ToDateString ( this DateTime date )
        {
            return date.ToString ("dd-MM-yyyy");
        }

        public static string GetCurrentDateTime(this DateTime dateTime)
        {
            return DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
        }
    }
}

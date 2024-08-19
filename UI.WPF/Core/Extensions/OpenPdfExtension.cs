using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.WPF.Core.Extensions
{
    public static class OpenPdfExtension
    {
        public static void OpenPdf (this string path )
        {
            Process.Start (new ProcessStartInfo
            {
                FileName = path,
                UseShellExecute = true
            });
        }
    }
}

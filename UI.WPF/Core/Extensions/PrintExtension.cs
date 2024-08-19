using PdfiumViewer;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Printing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace Restaurant.WPF.Core.Extensions
{
    public static class PrintExtension
    {
        public static void Printing ( this string printer, string filePath )
        {
            try
            {
                using (var document = PdfDocument.Load (filePath))
                {
                    var printDocument = document.CreatePrintDocument ();
                    printDocument.PrinterSettings.PrinterName = printer;

                    if (printDocument.PrinterSettings.IsValid)
                    {
                        printDocument.Print ();
                    }
                    else
                    {
                        MessageBox.Show ("Printer is invalid.");
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show (ex.Message);
            }
        }
        public static bool PrinterIsInstalled (this string printerName )
        {
            return PrinterSettings.InstalledPrinters.Cast<string> ().Any (p => p.Equals (printerName, StringComparison.OrdinalIgnoreCase));
        }

    }
}

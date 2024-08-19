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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Restaurant.WPF.Views.UserControls
{
    public partial class POS_TopButtonsUserControl : UserControl
    {
        public POS_TopButtonsUserControl()
        {
            InitializeComponent();
        }
        private void ChangeTheme_Click(object sender, RoutedEventArgs e)
        {

            Theme theme = new Theme();
            theme.Show();
        }
    }
}

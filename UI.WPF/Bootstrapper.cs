using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using Prism.Ioc;
using Prism.Unity;
using Restaurant.WPF.Views;

namespace Restaurant.WPF
{
    class Bootstrapper : PrismBootstrapper
    {
        protected override DependencyObject CreateShell()
        {
            return Container.Resolve<Login>();
        }

        protected override void RegisterTypes(IContainerRegistry containerRegistry)
        {
            
        }
        //protected override void OnInitialized()
        //{
        //    App.Current.MainWindow = POS;

        //}
        public Bootstrapper()
        {

        }

    }
}

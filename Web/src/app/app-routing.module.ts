import { CatalogModule } from './views/catalog/catalog.module';
import { EmployeeManagementModule } from './views/employee-management/employee-management.module';
import { ItemsModule } from './views/items/items.module';

import { SecurityModule } from './views/security/security.module';
import { ItemComponent } from './views/restaurant/ManageItem/item/item.component';
import { RestaurantModule } from './views/restaurant/restaurant.module';
import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { DefaultLayoutComponent } from './containers';
import { Page404Component } from './views/pages/page404/page404.component';
import { Page500Component } from './views/pages/page500/page500.component';
//import { LoginComponent } from './views/pages/login/login.component';
import { RegisterComponent } from './views/pages/register/register.component';
import { LoginComponent } from './views/restaurant/Security/login/login.component';
import { TokenCheck } from './views/security/TokenCheck';

const routes: Routes = [
  // {
  //   path: '',
  //   redirectTo: 'securitylogin',
  //   pathMatch: 'full'
  // },
  {
    path: '',
    redirectTo: 'login',
    pathMatch: 'full'
  },
  {
    path: 'secLogin',
    redirectTo: 'secLogin',
    pathMatch: 'full'
  },
  {
    path: '',
    component: DefaultLayoutComponent,
    data: {
      title: 'Home'
    },
    children: [
     /*  {
        path: 'account',
        loadChildren: () =>
          import('./views/account/account.module').then((m) => m.AccountModule),
        pathMatch: 'prefix'
      }, */
      {
        path: 'unAuth',
        loadChildren: () =>
          import('./views/pages/pages.module').then((m) => m.PagesModule)
      },
      {
        path: 'account',
        loadChildren: () =>
          import('./views/account/account.module').then((m) => m.AccountModule)
      },
      {
        path: 'items',
        loadChildren: () =>
          import('./views/items/items.module').then((m) => m.ItemsModule)
      },
      {
        path: 'reports',
        loadChildren: () =>
          import('./views/reports/reports.module').then((m) => m.ReportsModule)
      },
      {
        path: 'catalog',
        loadChildren: () =>
          import('./views/catalog/catalog.module').then((m) => m.CatalogModule)
      },
      {
        path: 'client',
        loadChildren: () =>
          import('./views/catalog/catalog.module').then((m) => m.CatalogModule)
      },
      {
        path: 'notification',
        loadChildren: () =>
          import('./views/catalog/catalog.module').then((m) => m.CatalogModule)
      },
      {
        path: 'inventory',
        loadChildren: () =>
          import('./views/inventory/inventory.module').then((m) => m.InventoryModule)
      },
      {
        path: 'empManagement',
        loadChildren: () =>
          import('./views/employee-management/employee-management.module').then((m) => m.EmployeeManagementModule)
      },
      {
        path: 'securitylogin',
        loadChildren: () =>
          import('./views/restaurant/restaurant.module').then((m) => m.RestaurantModule)
      },
      {
        path: 'security/security',
        loadChildren: () =>
          import('./views/security/security.module').then((m) => m.SecurityModule)
      },
      {
        path: 'security/catalog',
        loadChildren: () =>
          import('./views/catalog/catalog.module').then((m) => m.CatalogModule)
      },
      {
        path: 'test/login',
        loadChildren: () =>
          import('./views/security/security.module').then((m) => m.SecurityModule)
      },
      {
        path: 'restaurant',
        loadChildren: () =>
          import('./views/restaurant/restaurant.module').then((m) => m.RestaurantModule)
      },
      {
        path: 'restaurant/sale',
        loadChildren: () =>
          import('./views/restaurant/restaurant.module').then((m) => m.RestaurantModule)
      },
      {
        path: 'restaurant/other',
        loadChildren: () =>
          import('./views/restaurant/restaurant.module').then((m) => m.RestaurantModule)
      },
      {
        path: 'stakeholder',
        loadChildren: () =>
          import('./views/restaurant/restaurant.module').then((m) => m.RestaurantModule)
      },
      {
        path: 'restaurant/report',
        loadChildren: () =>
          import('./views/restaurant/restaurant.module').then((m) => m.RestaurantModule)
      },
      {
        path: 'restaurant/empManagement',
        loadChildren: () =>
          import('./views/employee-management/employee-management.module').then((m) => m.EmployeeManagementModule)
      },
      {
        path: 'restaurant/empManagement/sec',
        loadChildren: () =>
          import('./views/security/security.module').then((m) => m.SecurityModule)
      },
      {
        path: 'restaurant/product',
        loadChildren: () =>
          import('./views/restaurant/restaurant.module').then((m) => m.RestaurantModule)
      },
      {
        path: 'restaurant/product/catalog',
        loadChildren: () =>
          import('./views/catalog/catalog.module').then((m) => m.CatalogModule)
      },
      {
        path: 'restaurant/sale/catalog',
        loadChildren: () =>
          import('./views/catalog/catalog.module').then((m) => m.CatalogModule)
      },
      {
        path: 'restaurant/stakeholder',
        loadChildren: () =>
          import('./views/restaurant/restaurant.module').then((m) => m.RestaurantModule)
      },
      {
        path: 'restaurant/comProfile',
        loadChildren: () =>
          import('./views/restaurant/restaurant.module').then((m) => m.RestaurantModule)
      },
      {
        path: 'dashboard',
        loadChildren: () =>
          import('./views/dashboard/dashboard.module').then((m) => m.DashboardModule)
      },
      {
        path: 'theme',
        loadChildren: () =>
          import('./views/theme/theme.module').then((m) => m.ThemeModule)
      },
      {
        path: 'base',
        loadChildren: () =>
          import('./views/base/base.module').then((m) => m.BaseModule)
      },
      {
        path: 'buttons',
        loadChildren: () =>
          import('./views/buttons/buttons.module').then((m) => m.ButtonsModule)
      }
      ,
      {
        path: 'my',
        loadChildren: () =>
          import('./views/buttons/buttons.module').then((m) => m.ButtonsModule)
      },
      {
        path: 'forms',
        loadChildren: () =>
          import('./views/forms/forms.module').then((m) => m.CoreUIFormsModule)
      },
      {
        path: 'charts',
        loadChildren: () =>
          import('./views/charts/charts.module').then((m) => m.ChartsModule)
      },
      {
        path: 'icons',
        loadChildren: () =>
          import('./views/icons/icons.module').then((m) => m.IconsModule)
      },
      {
        path: 'notifications',
        loadChildren: () =>
          import('./views/notifications/notifications.module').then((m) => m.NotificationsModule)
      },
      {
        path: 'widgets',
        loadChildren: () =>
          import('./views/widgets/widgets.module').then((m) => m.WidgetsModule)
      },
      {
        path: 'pages',
        loadChildren: () =>
          import('./views/pages/pages.module').then((m) => m.PagesModule)
      },
    ]
  },
  {
    path: '404',
    component: Page404Component,
    data: {
      title: 'Page 404'
    }
  },
  {
    path: '500',
    component: Page500Component,
    data: {
      title: 'Page 500'
    }
  },
  {
    path: 'login',
    component: LoginComponent,
    canActivate: [TokenCheck],
    data: {
      title: 'Login Page'
    }
  },
  {
    path: 'secLogin',
    component: LoginComponent,
    canActivate: [TokenCheck],
    data: {
      title: 'Login Page',
      Route: 'secLogin'
    }
  },
  {
    path: 'restaurant',
    component: RestaurantModule,
    data: {
      title: 'Restaurant'
    }
  },
  {
    path: 'register',
    component: RegisterComponent,
    data: {
      title: 'Register Page'
    }
  },
  { path: '**', redirectTo: ' ' }
];

@NgModule({
  imports: [
    RouterModule.forRoot(routes, {
      scrollPositionRestoration: 'top',
      anchorScrolling: 'enabled',
      initialNavigation: 'enabledBlocking'
      // relativeLinkResolution: 'legacy'
    })
  ],
  exports: [RouterModule]
})
export class AppRoutingModule {
}

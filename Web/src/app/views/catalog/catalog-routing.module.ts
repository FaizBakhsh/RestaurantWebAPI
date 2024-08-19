import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { ManageSettingsTypeComponent } from './manage-settings-type/manage-settings-type.component';
import { ManageSettingsComponent } from './manage-settings/manage-settings.component';
import { NotificationTemplateComponent } from './notification-template/notification-template.component';
import { HomeComponent } from './home/home.component';
import { ClientListComponent } from './Client/client-list/client-list.component';
import { ManageClientsComponent } from './Client/manage-clients/manage-clients.component';
import { ManageEnumLineComponent } from './manage-enum-line/manage-enum-line.component';
import { AuthorizationCheck } from '../security/AuthorizationCheck';
import { RouteIds } from './Models/Enums/RouteIds';
import { RouteIdResolver } from './routeId-resolver';
const routes: Routes = [
  {
    path: '',
    data: {
      title: 'Items'
    },
    children: [
      {
        path: '',
        pathMatch: 'full',
        redirectTo: 'manageSettingType'
      },
      {
        path: "manageSetting",
        component: ManageSettingsComponent,
        canActivate: [AuthorizationCheck],
        data: { RouteId: [RouteIds.Settings, ''] },
        pathMatch: "full"
      },
      {
        path: "enumLine",
        component: ManageEnumLineComponent,
        canActivate: [AuthorizationCheck],
        pathMatch: "full"
      },
      {
        path: "home",
        component: HomeComponent,
        canActivate: [AuthorizationCheck],
        pathMatch: "full"
      },
      {
        path: "cltList",
        component: ClientListComponent,
        canActivate: [AuthorizationCheck],
        data: { RouteId: [RouteIds.Clients, ''] },
        pathMatch: "full"
      },
      {
        path: "manageClient",
        component: ManageClientsComponent,
        canActivate: [AuthorizationCheck],
        pathMatch: "full"
      },
      {
        path: "manageSettingType",
        component: ManageSettingsTypeComponent,
        canActivate: [AuthorizationCheck],
        pathMatch: "full"
      },
      {
        path: "nTem",
        component: NotificationTemplateComponent,
        canActivate: [AuthorizationCheck],
        data: { RouteId: [RouteIds.NotificationTemplate, ''] },
        pathMatch: "full"
      },
    ]
  },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class CatalogRoutingModule { }

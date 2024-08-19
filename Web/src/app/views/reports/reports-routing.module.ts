import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { ReportComponent } from './report/report.component';
import { AuthorizationCheck } from '../security/AuthorizationCheck';
import { RouteIds } from '../catalog/Models/Enums/RouteIds';

const routes: Routes = [

  {
    path: 'logEvent',
    component: ReportComponent,
    canActivate: [AuthorizationCheck],
    //data: { RouteId: [RouteIds.LogEvents, ''] },
    pathMatch: "full"
  },
  {
    path: 'menuItemWise',
    component: ReportComponent,
    canActivate: [AuthorizationCheck],
    //data: { RouteId: [RouteIds.LogEvents, ''] },
    pathMatch: "full"
  },
  {
    path: 'menuGroupWise',
    component: ReportComponent,
    canActivate: [AuthorizationCheck],
    //data: { RouteId: [RouteIds.LogEvents, ''] },
    pathMatch: "full"
  },
  {
    path: 'hourlySales',
    component: ReportComponent,
    canActivate: [AuthorizationCheck],
    //data: { RouteId: [RouteIds.LogEvents, ''] },
    pathMatch: "full"
  },
  {
    path: 'invoice',
    component: ReportComponent,
    canActivate: [AuthorizationCheck],
    //data: { RouteId: [RouteIds.LogEvents, ''] },
    pathMatch: "full"
  },
  {
    path: 'rawItem',
    component: ReportComponent,
    canActivate: [AuthorizationCheck],
    //data: { RouteId: [RouteIds.LogEvents, ''] },
    pathMatch: "full"
  },
  {
    path: 'menuItemWiseSale',
    component: ReportComponent,
    canActivate: [AuthorizationCheck],
    //data: { RouteId: [RouteIds.LogEvents, ''] },
    pathMatch: "full"
  },
  {
    path: 'complimentary',
    component: ReportComponent,
    canActivate: [AuthorizationCheck],
    //data: { RouteId: [RouteIds.LogEvents, ''] },
    pathMatch: "full"
  },
  {
    path: 'discountSale',
    component: ReportComponent,
    canActivate: [AuthorizationCheck],
    //data: { RouteId: [RouteIds.LogEvents, ''] },
    pathMatch: "full"
  },
  {
    path: 'paymentWiseSale',
    component: ReportComponent,
    canActivate: [AuthorizationCheck],
    //data: { RouteId: [RouteIds.LogEvents, ''] },
    pathMatch: "full"
  },
  {
    path: 'refundVoid',
    component: ReportComponent,
    canActivate: [AuthorizationCheck],
    //data: { RouteId: [RouteIds.LogEvents, ''] },
    pathMatch: "full"
  },
  {
    path: 'dailySale',
    component: ReportComponent,
    canActivate: [AuthorizationCheck],
    //data: { RouteId: [RouteIds.LogEvents, ''] },
    pathMatch: "full"
  },
  {
    path: 'shiftWise',
    component: ReportComponent,
    canActivate: [AuthorizationCheck],
    //data: { RouteId: [RouteIds.LogEvents, ''] },
    pathMatch: "full"
  },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class ReportsRoutingModule { }

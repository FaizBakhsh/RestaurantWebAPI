import { PurchaseReturnListComponent } from './Purchase Return/purchase-return-list/purchase-return-list.component';
import { PurchaseReturnComponent } from './Purchase Return/purchase-return/purchase-return.component';
import { ManageKitchenIssuanceComponent } from './manage-kitchen-issuance/manage-kitchen-issuance.component';
import { KitchenDemandComponent } from './kitchen-demand/kitchen-demand.component';
import { StockEstimationComponent } from './stock-estimation/stock-estimation.component';
import { CompleteWasteComponent } from './complete-waste/complete-waste.component';
import { ManageDemandComponent } from './manage-demand/manage-demand.component';
import { InventoryTransferComponent } from './inventory-transfer/inventory-transfer.component';
import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { PurchaseorderComponent } from './purchaseorder/purchaseorder.component';
import { IssuestockComponent } from './issuestock/issuestock.component';
import { PurchaseitemComponent } from './purchaseitem/purchaseitem.component';
import { PurchaseitemlistComponent } from './purchaseitemlist/purchaseitemlist.component';
import { ManageRawItemComponent } from './RawItem/manage-raw-item/manage-raw-item.component';
import { RawItemListComponent } from './RawItem/raw-item-list/raw-item-list.component';
import { AuthorizationCheck } from '../security/AuthorizationCheck';
import { RouteIds } from '../catalog/Models/Enums/RouteIds';
import { RnComponent } from './RN/rn/rn.component';
import { RnListComponent } from './RN/rn-list/rn-list.component';
import { RfqComponent } from './RFQ/rfq/rfq.component';
import { RfqListComponent } from './RFQ/rfq-list/rfq-list.component';



const routes: Routes = [
  {
    path: 'demand',
    component: ManageDemandComponent,
    canActivate: [AuthorizationCheck],
    pathMatch: "full"
  },
  {
    path: 'kitchenIssuance',
    component: ManageKitchenIssuanceComponent,
    canActivate: [AuthorizationCheck],
    pathMatch: "full"
  },
  {
    path: 'inventoryTransfer',
    component: InventoryTransferComponent,
    canActivate: [AuthorizationCheck],
    pathMatch: "full"
  },

  {
    path: 'issuestock',
    component: IssuestockComponent,
    canActivate: [AuthorizationCheck],
    pathMatch: "full"
  },
  {
    path: 'stockEstimation',
    component: StockEstimationComponent,
    canActivate: [AuthorizationCheck],
    pathMatch: "full"
  },
  {
    path: 'kitchenDemand',
    component: KitchenDemandComponent,
    canActivate: [AuthorizationCheck],
    pathMatch: "full"
  },
  {
    path: 'purchaseReturn',
    component: PurchaseReturnComponent,
    canActivate: [AuthorizationCheck],
    pathMatch: "full"
  },
  {
    path: 'completeWaste',
    component: CompleteWasteComponent,
    canActivate: [AuthorizationCheck],
    pathMatch: "full"
  },
  {
    path: 'purchaseOrder',
    component: PurchaseorderComponent,
    canActivate: [AuthorizationCheck],
    pathMatch: "full"
  },
  {
    path: 'purchaseitem',
    component: PurchaseitemComponent,
    canActivate: [AuthorizationCheck],
    pathMatch: "full"
  },
  {
    path: 'purchaseitemlist',
    component: PurchaseitemlistComponent,
    canActivate: [AuthorizationCheck],
    pathMatch: "full"
  },

  {
    path: 'purchaseReturnList',
    component: PurchaseReturnListComponent,
    canActivate: [AuthorizationCheck],
    pathMatch: "full"
  },
  {
    path: 'RNList',
    component: RnListComponent,
    canActivate: [AuthorizationCheck],
    pathMatch: "full"
  },
  {
    path: 'RN',
    component: RnComponent,
    canActivate: [AuthorizationCheck],
    pathMatch: "full"
  },
  {
    path: 'RFQList',
    component: RfqListComponent,
    canActivate: [AuthorizationCheck],
    pathMatch: "full"
  },
  {
    path: 'RFQ',
    component: RfqComponent,
    canActivate: [AuthorizationCheck],
    pathMatch: "full"
  },
  {
    path: 'rawItem',
    component: ManageRawItemComponent,
    canActivate: [AuthorizationCheck],
    data: { RouteId: [RouteIds.RawItem, ''] },
    pathMatch: "full"
  },
  {
    path: 'rawItemList',
    component: RawItemListComponent,
    canActivate: [AuthorizationCheck],
    data: { RouteId: [RouteIds.RawItem, ''] },
    pathMatch: "full"
  },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class InventoryRoutingModule { }

import { PurchaseorderlistComponent } from './purchaseorderlist/purchaseorderlist.component';
import { RawItemListComponent } from './RawItem/raw-item-list/raw-item-list.component';
import { ManageRawItemComponent } from './RawItem/manage-raw-item/manage-raw-item.component';
import { NO_ERRORS_SCHEMA, NgModule } from '@angular/core';
import { CommonModule, DatePipe } from '@angular/common';

import { InventoryRoutingModule } from './inventory-routing.module';
import { ManageDemandComponent } from './manage-demand/manage-demand.component';
import { InventoryTransferComponent } from './inventory-transfer/inventory-transfer.component';
import { PurchaseReturnComponent } from './Purchase Return/purchase-return/purchase-return.component';
import { CompleteWasteComponent } from './complete-waste/complete-waste.component';
import {
  NgxMatDatetimePickerModule,
  NgxMatNativeDateModule
} from '@angular-material-components/datetime-picker';
import { MatMomentDateModule } from '@angular/material-moment-adapter';
import { NgxMatTimepickerModule } from 'ngx-mat-timepicker';
import { NgxMaterialTimepickerModule } from 'ngx-material-timepicker';
import { MatDatepickerModule } from '@angular/material/datepicker';
import { MatNativeDateModule } from '@angular/material/core';
import { MatInputModule } from '@angular/material/input';
import { MatListModule } from '@angular/material/list';
import { MatCardModule } from '@angular/material/card';
import { MatStepperModule } from '@angular/material/stepper';
import { MatIconModule } from '@angular/material/icon';
import { MatSelectModule } from '@angular/material/select';
import { MatButtonModule } from '@angular/material/button';
import { MatRadioModule } from '@angular/material/radio';
import { MatProgressBarModule } from '@angular/material/progress-bar';
import { MatCheckboxModule } from '@angular/material/checkbox';
import { MatTreeModule } from '@angular/material/tree';
import { MatTableModule } from '@angular/material/table';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { MatSortHeader, MatSortHeaderIntl, MatSortModule } from '@angular/material/sort';
import { MatSnackBar, MatSnackBarModule } from '@angular/material/snack-bar';
import { MatPaginatorModule } from '@angular/material/paginator';
import {
  AccordionModule,
  BadgeModule,
  BreadcrumbModule,
  ButtonModule,
  CardModule,
  CarouselModule,
  CollapseModule,
  DropdownModule,
  FormModule,
  GridModule,
  ListGroupModule,
  ModalModule,
  NavModule,
  PaginationModule,
  PlaceholderModule,
  PopoverModule,
  ProgressModule,
  SharedModule,
  SpinnerModule,
  TableModule,
  TabsModule,
  TooltipModule,
  UtilitiesModule,


} from '@coreui/angular';
import { IconModule } from '@coreui/icons-angular';
import { MatTooltip, MatTooltipModule } from '@angular/material/tooltip';
import { FlexLayoutModule } from '@angular/flex-layout';
import { HttpClientModule } from '@angular/common/http';
import { CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { MatToolbarModule } from '@angular/material/toolbar';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatDialogModule } from '@angular/material/dialog';
import { MatAutocompleteModule } from '@angular/material/autocomplete';
import { MatProgressSpinnerModule } from '@angular/material/progress-spinner';
import { KitchenDemandComponent } from './kitchen-demand/kitchen-demand.component';
import { StockEstimationComponent } from './stock-estimation/stock-estimation.component';
import { ManageKitchenIssuanceComponent } from './manage-kitchen-issuance/manage-kitchen-issuance.component';
import { PurchaseorderComponent } from './purchaseorder/purchaseorder.component';
import { IssuestockComponent } from './issuestock/issuestock.component';
import { PurchaseitemComponent } from './purchaseitem/purchaseitem.component';
import { PurchaseitemlistComponent } from './purchaseitemlist/purchaseitemlist.component';

import { PurchaseReturnListComponent } from './Purchase Return/purchase-return-list/purchase-return-list.component';
import { AuthorizationCheck } from '../security/AuthorizationCheck';
import { RfqListComponent } from './RFQ/rfq-list/rfq-list.component';
import { RfqComponent } from './RFQ/rfq/rfq.component';
import { RnListComponent } from './RN/rn-list/rn-list.component';
import { RnComponent } from './RN/rn/rn.component';
@NgModule({
  declarations: [
    ManageRawItemComponent,
    RawItemListComponent,
    ManageDemandComponent,
    InventoryTransferComponent,
    PurchaseReturnComponent,
    CompleteWasteComponent,
    KitchenDemandComponent,
    StockEstimationComponent,
    ManageKitchenIssuanceComponent,
    PurchaseorderComponent,
    IssuestockComponent,
    PurchaseitemComponent,
    PurchaseitemlistComponent,
    PurchaseorderlistComponent,
    ManageKitchenIssuanceComponent,
    PurchaseReturnListComponent,
    RfqListComponent,
    RfqComponent,
    RnListComponent,
    RnComponent
  ],
  imports: [
    CommonModule,
    InventoryRoutingModule,
    NgxMatDatetimePickerModule,
    MatDatepickerModule,
    NgxMatTimepickerModule,
    NgxMaterialTimepickerModule,
    NgxMatNativeDateModule,
    FlexLayoutModule,
    FormsModule,
    MatDialogModule,
    MatDatepickerModule,
    MatNativeDateModule,
    MatMomentDateModule,
    MatTableModule,
    MatDialogModule,
    MatAutocompleteModule,
    MatFormFieldModule,
    MatSortModule,
    MatInputModule,
    MatButtonModule,
    MatInputModule,
    MatSnackBarModule,
    HttpClientModule,
    FlexLayoutModule,
    FormsModule,
    MatTooltipModule,
    MatInputModule,
    MatListModule,
    MatCardModule,
    MatDatepickerModule,
    MatNativeDateModule,
    MatProgressBarModule,
    MatRadioModule,
    MatSelectModule,
    MatCheckboxModule,
    MatButtonModule,
    MatIconModule,
    MatStepperModule,
    MatTableModule,
    MatSortModule,
    MatPaginatorModule,
    ReactiveFormsModule,
    AccordionModule,
    BadgeModule,
    BreadcrumbModule,
    ButtonModule,
    CardModule,
    CollapseModule,
    GridModule,
    UtilitiesModule,
    SharedModule,
    ListGroupModule,
    IconModule,
    ListGroupModule,
    PlaceholderModule,
    ProgressModule,
    SpinnerModule,
    TabsModule,
    NavModule,
    TooltipModule,
    CarouselModule,
    FormModule,
    DropdownModule,
    PaginationModule,
    PopoverModule,
    ModalModule,
    TableModule,
    MatToolbarModule,
    MatProgressSpinnerModule
  ],
  providers: [DatePipe, AuthorizationCheck],
  schemas: [CUSTOM_ELEMENTS_SCHEMA, NO_ERRORS_SCHEMA]

})
export class InventoryModule { }

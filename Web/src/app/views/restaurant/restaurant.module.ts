import { ManageOnlineDBSettingComponent } from './manage-online-dbsetting/manage-online-dbsetting.component';
import { EnumLineFieldsComponent } from './enum-line-fields/enum-line-fields.component';
import { AttachSubItemComponent } from './Deal/attach-sub-item/attach-sub-item.component';
import { ManageExpensesComponent } from './manage-expenses/manage-expenses.component';
import { ManageStoreComponent } from './manage-store/manage-store.component';
import { ManageSubItemsComponent } from './manage-sub-items/manage-sub-items.component';
import { ManageUOMConversionComponent } from './manage-uomconversion/manage-uomconversion.component';
import { SupplierListComponent } from './Supplier/supplier-list/supplier-list.component';
import { ManageSupplierComponent } from './Supplier/manage-supplier/manage-supplier.component';
import { MatToolbarModule } from '@angular/material/toolbar';
import { ManageSubCategoryComponent } from './manage-sub-category/manage-sub-category.component';
import { ManageCategoryComponent } from './manage-category/manage-category.component';
import { ItemComponent } from './ManageItem/item/item.component';
import { RestaurantRoutingModule } from './restaurant-routing.module';
import { CUSTOM_ELEMENTS_SCHEMA, NO_ERRORS_SCHEMA, NgModule } from '@angular/core';
import { CommonModule, DatePipe } from '@angular/common';
import { ItemListComponent } from './ManageItem/item-list/item-list.component';

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
import { SaleReportComponent } from './SaleOrder/sale-report/sale-report.component';
import { ManageDiscountKeyComponent } from './manage-discount-key/manage-discount-key.component';
import { ManageBranchComponent } from './Branch/manage-branch/manage-branch.component';
import { ManageCustomerComponent } from './Customer/manage-customer/manage-customer.component';
import { CustomerListComponent } from './Customer/customer-list/customer-list.component';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatDialogModule } from '@angular/material/dialog';
import { LoginComponent } from './Security/login/login.component';
import { ManageVouchersDiscountComponent } from './manage-vouchers-discount/manage-vouchers-discount.component';
import { ManageTableComponent } from './manage-table/manage-table.component';
import { ManageFloorComponent } from './manage-floor/manage-floor.component';
import { ManageRiderComponent } from './Rider/manage-rider/manage-rider.component';
import { ManageLoyaltyCardComponent } from './LoyaltyCard/manage-loyalty-card/manage-loyalty-card.component';
import { CommingSoonComponent } from './comming-soon/comming-soon.component';
import { ManageVendorComponent } from './Vendor/manage-vendor/manage-vendor.component';
import { VendorListComponent } from './Vendor/vendor-list/vendor-list.component';
import { ManageGSTComponent } from './manage-gst/manage-gst.component';
import { ManageOrderSourceComponent } from './manage-order-source/manage-order-source.component';
import { ManageMemberPointsComponent } from './manage-member-points/manage-member-points.component';
import { MatProgressSpinnerModule } from '@angular/material/progress-spinner';
import { ManagePrintTypeComponent } from './manage-print-type/manage-print-type.component';
import { ManagePrinterSettingComponent } from './manage-printer-setting/manage-printer-setting.component';
import { ManageDeviceSettingComponent } from './manage-device-setting/manage-device-setting.component';
import { ManageKOTSettingComponent } from './manage-kotsetting/manage-kotsetting.component';
import { ManageRecipeComponent } from './ManageItem/Recipe/manage-recipe/manage-recipe.component';
import { RecipeListComponent } from './ManageItem/Recipe/recipe-list/recipe-list.component';
import { ManageSubRecipeComponent } from './ManageItem/Recipe/manage-sub-recipe/manage-sub-recipe.component';
import { ManageDealsComponent } from './Deal/manage-deals/manage-deals.component';
import { MatAutocompleteModule } from '@angular/material/autocomplete';
import { ManageDiscountCampaignComponent } from './DiscountCampaign/manage-discount-campaign/manage-discount-campaign.component';
import { DiscountCampaignListComponent } from './DiscountCampaign/discount-campaign-list/discount-campaign-list.component';
import {
  NgxMatDatetimePickerModule,
  NgxMatNativeDateModule
} from '@angular-material-components/datetime-picker';
import { MatMomentDateModule } from '@angular/material-moment-adapter';
import { NgxMatTimepickerModule } from 'ngx-mat-timepicker';
import { NgxMaterialTimepickerModule } from 'ngx-material-timepicker';
import { ManageModifierComponent } from './manage-modifier/manage-modifier.component';
import { ManageCompanyInfoComponent } from './CompanyInfo/manage-company-info/manage-company-info.component';
import { CompanyInfoListComponent } from './CompanyInfo/company-info-list/company-info-list.component';
import { NgxMatSelectSearchModule } from 'ngx-mat-select-search';
import { ManageServiceChargesComponent } from './manage-service-charges/manage-service-charges.component';
import { ManageAttributesComponent } from './ManageItem/manage-attributes/manage-attributes.component';
import { ManageAttributeValuesComponent } from './ManageItem/manage-attribute-values/manage-attribute-values.component';
//import { MatSelectSearchModule } from 'mat-select-search';
import { MatTabsModule } from '@angular/material/tabs';
import { AttachMenuComponent } from './attach-menu/attach-menu.component';
import { SubItemRecipeComponent } from './sub-item-recipe/sub-item-recipe.component';
import { ManageSizeComponent } from './ManageItem/Size/manage-size/manage-size.component';
import { SizeListComponent } from './ManageItem/Size/size-list/size-list.component';
import { ManageMenuGroupComponent } from './manage-menu-group/manage-menu-group.component';
import { AuthorizationCheck } from '../security/AuthorizationCheck';
@NgModule({
  declarations: [
    ManageSubItemsComponent,
    EnumLineFieldsComponent,
    ManageExpensesComponent,
    ManageUOMConversionComponent,
    ItemComponent,
    ManageStoreComponent,
    ItemListComponent,
    ManageModifierComponent,
    ManageCategoryComponent,
    ManageSubCategoryComponent,
    SaleReportComponent,
    ManageDiscountKeyComponent,
    ManageBranchComponent,
    ManageCustomerComponent,
    CustomerListComponent,
    ManageSupplierComponent,
    SupplierListComponent,
    LoginComponent,
    ManageVouchersDiscountComponent,
    ManageTableComponent,
    ManageFloorComponent,
    ManageRiderComponent,
    ManageLoyaltyCardComponent,
    CommingSoonComponent,
    ManageVendorComponent,
    VendorListComponent,
    ManageGSTComponent,
    ManageOrderSourceComponent,
    ManageMemberPointsComponent,
    ManagePrintTypeComponent,
    ManagePrinterSettingComponent,
    ManageDeviceSettingComponent,
    ManageKOTSettingComponent,
    ManageRecipeComponent,
    RecipeListComponent,
    ManageSizeComponent,
    SizeListComponent,
    ManageSubRecipeComponent,
    ManageDealsComponent,
    ManageDiscountCampaignComponent,
    DiscountCampaignListComponent,
    AttachSubItemComponent,
    ManageCompanyInfoComponent,
    CompanyInfoListComponent,
    ManageOnlineDBSettingComponent,
    ManageServiceChargesComponent,
    ManageAttributesComponent,
    ManageAttributeValuesComponent,
    AttachMenuComponent,
    SubItemRecipeComponent,
    ManageMenuGroupComponent,
  ],
  imports: [
    MatTabsModule,
    //MatSelectSearchModule,
    NgxMatSelectSearchModule,
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
    CommonModule,
    RestaurantRoutingModule,

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
export class RestaurantModule { }

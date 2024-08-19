import { AttachSubItemComponent } from './Deal/attach-sub-item/attach-sub-item.component';
import { ManageDiscountCampaignComponent } from './DiscountCampaign/manage-discount-campaign/manage-discount-campaign.component';
import { DiscountCampaignListComponent } from './DiscountCampaign/discount-campaign-list/discount-campaign-list.component';
import { ManageDealsComponent } from './Deal/manage-deals/manage-deals.component';
import { ManageSubRecipeComponent } from './ManageItem/Recipe/manage-sub-recipe/manage-sub-recipe.component';
import { SizeListComponent } from './ManageItem/Size/size-list/size-list.component';
import { ManageSizeComponent } from './ManageItem/Size/manage-size/manage-size.component';
import { RecipeListComponent } from './ManageItem/Recipe/recipe-list/recipe-list.component';
import { ManageRecipeComponent } from './ManageItem/Recipe/manage-recipe/manage-recipe.component';
import { ManageKOTSettingComponent } from './manage-kotsetting/manage-kotsetting.component';
import { ManageDeviceSettingComponent } from './manage-device-setting/manage-device-setting.component';
import { ManagePrinterSettingComponent } from './manage-printer-setting/manage-printer-setting.component';
import { ManagePrintTypeComponent } from './manage-print-type/manage-print-type.component';
import { ManageOrderSourceComponent } from './manage-order-source/manage-order-source.component';
import { ManageGSTComponent } from './manage-gst/manage-gst.component';
import { ManageMemberPointsComponent } from './manage-member-points/manage-member-points.component';
import { VendorListComponent } from './Vendor/vendor-list/vendor-list.component';
import { ManageLoyaltyCardComponent } from './LoyaltyCard/manage-loyalty-card/manage-loyalty-card.component';
import { ManageRiderComponent } from './Rider/manage-rider/manage-rider.component';
import { SupplierListComponent } from './Supplier/supplier-list/supplier-list.component';
import { ManageFloorComponent } from './manage-floor/manage-floor.component';
import { ManageTableComponent } from './manage-table/manage-table.component';
import { ManageVouchersDiscountComponent } from './manage-vouchers-discount/manage-vouchers-discount.component';
import { ManageStoreComponent } from './manage-store/manage-store.component';
import { CustomerListComponent } from './Customer/customer-list/customer-list.component';
import { ManageCustomerComponent } from './Customer/manage-customer/manage-customer.component';
import { ManageDiscountKeyComponent } from './manage-discount-key/manage-discount-key.component';
import { SaleReportComponent } from './SaleOrder/sale-report/sale-report.component';
import { ItemListComponent } from './ManageItem/item-list/item-list.component';
import { ItemComponent } from './ManageItem/item/item.component';
import { NgModule } from "@angular/core";
import { RouterModule, Routes } from '@angular/router';
import { ManageBranchComponent } from './Branch/manage-branch/manage-branch.component';
import { LoginComponent } from './Security/login/login.component';
import { ManageSupplierComponent } from './Supplier/manage-supplier/manage-supplier.component';
import { CommingSoonComponent } from './comming-soon/comming-soon.component';
import { ManageModifierComponent } from './manage-modifier/manage-modifier.component';
import { ManageUOMConversionComponent } from './manage-uomconversion/manage-uomconversion.component';
import { ManageCompanyInfoComponent } from './CompanyInfo/manage-company-info/manage-company-info.component';
import { CompanyInfoListComponent } from './CompanyInfo/company-info-list/company-info-list.component';
import { ManageExpensesComponent } from './manage-expenses/manage-expenses.component';
import { EnumLineFieldsComponent } from './enum-line-fields/enum-line-fields.component';
import { ManageOnlineDBSettingComponent } from './manage-online-dbsetting/manage-online-dbsetting.component';
import { ManageServiceChargesComponent } from './manage-service-charges/manage-service-charges.component';
import { ManageAttributeValuesComponent } from './ManageItem/manage-attribute-values/manage-attribute-values.component';
import { ManageAttributesComponent } from './ManageItem/manage-attributes/manage-attributes.component';
import { SubItemRecipeComponent } from './sub-item-recipe/sub-item-recipe.component';
import { AttachMenuComponent } from './attach-menu/attach-menu.component';
import { ManageSubItemsComponent } from './manage-sub-items/manage-sub-items.component';
import { ManageCategoryComponent } from './manage-category/manage-category.component';
import { ManageSubCategoryComponent } from './manage-sub-category/manage-sub-category.component';
import { ManageMenuGroupComponent } from './manage-menu-group/manage-menu-group.component';
import { AuthorizationCheck } from '../security/AuthorizationCheck';
import { RouteIds } from '../catalog/Models/Enums/RouteIds';


const routes: Routes = [
  {
    path: '',
    data: {
      title: 'Restaurant'
    },
    children: [
      {
        path: '',
        pathMatch: 'full',
        redirectTo: 'restaurantlogin'
      },

      {
        path: 'manageItem',
        component: ItemComponent,
        canActivate: [AuthorizationCheck],
        pathMatch: "full",
        data: {
          title: 'Manage Item'
        }
      },
      {
        path: 'menuGroup',
        component: ManageMenuGroupComponent,
        canActivate: [AuthorizationCheck],
        pathMatch: "full",
        data: { RouteId: [RouteIds.MenuGroup, ''] },
      },
      {
        path: 'discountCampaign',
        component: ManageDiscountCampaignComponent,
        canActivate: [AuthorizationCheck],
        data: { RouteId: [RouteIds.DiscountCompaign, ''] },
        pathMatch: "full"
      },
      {
        path: 'campaignList',
        component: DiscountCampaignListComponent,
        canActivate: [AuthorizationCheck],
        data: { RouteId: [RouteIds.DiscountCompaign, ''] },
        pathMatch: "full"
      },
      {
        path: 'attachSubItem',
        component: AttachSubItemComponent,
        canActivate: [AuthorizationCheck],
        pathMatch: "full"
      },
      {
        path: 'recipe',
        component: ManageRecipeComponent,
        canActivate: [AuthorizationCheck],
        pathMatch: "full"
      },
      {
        path: 'recipeList',
        component: RecipeListComponent,
        canActivate: [AuthorizationCheck],
        pathMatch: "full"
      },
      {
        path: 'modifier',
        component: ManageModifierComponent,
        canActivate: [AuthorizationCheck],
        data: { RouteId: [RouteIds.Modifier, ''] },
        pathMatch: "full"
      },
      {
        path: 'subRecipe',
        component: ManageSubRecipeComponent,
        canActivate: [AuthorizationCheck],
        pathMatch: "full"
      },
      {
        path: 'deals',
        component: ManageDealsComponent,
        canActivate: [AuthorizationCheck],
        pathMatch: "full"
      },
      {
        path: 'Size',
        component: ManageSizeComponent,
        canActivate: [AuthorizationCheck],
        pathMatch: "full"
      },
      {
        path: 'SizeList',
        component: SizeListComponent,
        canActivate: [AuthorizationCheck],
        pathMatch: "full"
      },
      {
        path: 'commingSoon',
        component: CommingSoonComponent,
        canActivate: [AuthorizationCheck],
        pathMatch: "full"
      },
      {
        path: 'table',
        component: ManageTableComponent,
        canActivate: [AuthorizationCheck],
        pathMatch: "full",
        data: {
          title: 'Manage Table'
        }
      },
      {
        path: 'floor',
        component: ManageFloorComponent,
        canActivate: [AuthorizationCheck],
        pathMatch: "full",
        data: {
          title: 'Manage Floor'
        }
      },
      {
        path: 'restaurantlogin',
        component: LoginComponent,
        canActivate: [AuthorizationCheck],
        pathMatch: "full"

      },
      {
        path: 'manageCustomer',
        component: ManageCustomerComponent,
        canActivate: [AuthorizationCheck],
        pathMatch: "full",
        data: { RouteId: [RouteIds.CustomerInfo, ''] },
      },
      {
        path: 'custList',
        component: CustomerListComponent,
        canActivate: [AuthorizationCheck],
        pathMatch: "full",
        data: { RouteId: [RouteIds.CustomerInfo, ''] },
      },
      {
        path: 'manageBranch',
        component: ManageBranchComponent,
        canActivate: [AuthorizationCheck],
        pathMatch: "full",
        data: { RouteId: [RouteIds.Branch, ''] },
      },
      {
        path: 'discountKey',
        component: ManageDiscountKeyComponent,
        canActivate: [AuthorizationCheck],
        pathMatch: "full",
        data: { RouteId: [RouteIds.DiscountKeys, ''] },
      },
      {
        path: 'vouchersDiscount',
        component: ManageVouchersDiscountComponent,
        canActivate: [AuthorizationCheck],
        pathMatch: "full",
        data: { RouteId: [RouteIds.DiscVoucher, ''] },
      },
      {
        path: 'itemList',
        component: ItemListComponent,
        canActivate: [AuthorizationCheck],
        pathMatch: "full",
        data: {
          title: 'Item List'
        }

      },
      {
        path: 'category',
        component: ManageCategoryComponent,
        canActivate: [AuthorizationCheck],
        pathMatch: "full",
        data: { RouteId: [RouteIds.Category, ''] },

      },
      {
        path: 'subCategory',
        component: ManageSubCategoryComponent,
        canActivate: [AuthorizationCheck],
        pathMatch: "full",
        data: { RouteId: [RouteIds.SubCategory, ''] },

      },

      {
        path: 'saleReport',
        component: SaleReportComponent,
        canActivate: [AuthorizationCheck],
        pathMatch: "full",
        data: {
          title: 'Sale Report'
        }

      },

      {
        path: 'manageSupplier',
        component: ManageSupplierComponent,
        canActivate: [AuthorizationCheck],
        pathMatch: "full",
        data: { RouteId: [RouteIds.Supplier, ''] },
      },
      {
        path: 'supplierList',
        component: SupplierListComponent,
        canActivate: [AuthorizationCheck],
        pathMatch: "full",
        data: { RouteId: [RouteIds.Supplier, ''] },
      },
      {
        path: 'manageRider',
        component: ManageRiderComponent,
        canActivate: [AuthorizationCheck],
        pathMatch: "full",
        data: {
          title: 'Manage Rider'
        }
      },
      {
        path: 'manageLoyaltyCard',
        component: ManageLoyaltyCardComponent,
        canActivate: [AuthorizationCheck],
        pathMatch: "full",
        data: { RouteId: [RouteIds.LoyaltyCard, ''] },
      },
      {
        path: 'manageSource',
        component: ManageOrderSourceComponent,
        canActivate: [AuthorizationCheck],
        pathMatch: "full"
      },
      {
        path: 'manageGST',
        component: ManageGSTComponent,
        canActivate: [AuthorizationCheck],
        pathMatch: "full",
        data: { RouteId: [RouteIds.GST, ''] },
      },
      {
        path: 'managePoints',
        component: ManageMemberPointsComponent,
        canActivate: [AuthorizationCheck],
        pathMatch: "full",
        data: { RouteId: [RouteIds.MemberPoints, ''] },
      },
      {
        path: 'mngPrintType',
        component: ManagePrintTypeComponent,
        canActivate: [AuthorizationCheck],
        pathMatch: "full",
      },
      {
        path: 'mngPrinterSetting',
        component: ManagePrinterSettingComponent,
        canActivate: [AuthorizationCheck],
        data: { RouteId: [RouteIds.PrinterSetting, ''] },
        pathMatch: "full"
      },
      {
        path: 'mngDeviceSetting',
        component: ManageDeviceSettingComponent,
        canActivate: [AuthorizationCheck],
        data: { RouteId: [RouteIds.DeviceSettings, ''] },
        pathMatch: "full"
      },
      {
        path: 'mngKOTSetting',
        component: ManageKOTSettingComponent,
        canActivate: [AuthorizationCheck],
        pathMatch: "full"
      },
      {
        path: "manageStore",
        component: ManageStoreComponent,
        canActivate: [AuthorizationCheck],
        data: { RouteId: [RouteIds.Store, ''] },
        pathMatch: "full"
      },
      {
        path: "manageUOMConvrsn",
        component: ManageUOMConversionComponent,
        canActivate: [AuthorizationCheck],
        data: { RouteId: [RouteIds.UOMConverison, ''] },
        pathMatch: "full"
      },
      {
        path: "mngCInfo",
        component: ManageCompanyInfoComponent,
        canActivate: [AuthorizationCheck],
        data: { RouteId: [RouteIds.CompanyInfo, ''] },
        pathMatch: "full"
      },
      {
        path: "cInfoList",
        component: CompanyInfoListComponent,
        canActivate: [AuthorizationCheck],
        data: { RouteId: [RouteIds.CompanyInfo, ''] },
        pathMatch: "full"
      },
      {
        path: "manageExpenses",
        component: ManageExpensesComponent,
        canActivate: [AuthorizationCheck],
        data: { RouteId: [RouteIds.Expanses, ''] },
        pathMatch: "full"
      },
      {
        path: "enumLineFields",
        component: EnumLineFieldsComponent,
        canActivate: [AuthorizationCheck],
        pathMatch: "full"
      },
      {
        path: "onlineDB",
        component: ManageOnlineDBSettingComponent,
        canActivate: [AuthorizationCheck],
        data: { RouteId: [RouteIds.OnlineDBSetting, ''] },
        pathMatch: "full"
      },
      {
        path: "svcCharges",
        component: ManageServiceChargesComponent,
        canActivate: [AuthorizationCheck],
        data: { RouteId: [RouteIds.ServiceCharges, ''] },
        pathMatch: "full"
      },
      {
        path: "attValues",
        component: ManageAttributeValuesComponent,
        canActivate: [AuthorizationCheck],
        pathMatch: "full"
      },
      {
        path: "attrib",
        component: ManageAttributesComponent,
        pathMatch: "full"
      },
      {
        path: "sbItemRecipe",
        component: SubItemRecipeComponent,
        canActivate: [AuthorizationCheck],
        pathMatch: "full"
      },
      {
        path: "attachMenu",
        component: AttachMenuComponent,
        canActivate: [AuthorizationCheck],
        pathMatch: "full"
      },
      {
        path: "mngSubItem",
        component: ManageSubItemsComponent,
        canActivate: [AuthorizationCheck],
        data: { RouteId: [RouteIds.SubItems, ''] },
        pathMatch: "full"
      },
      {
        path: "mngCategory",
        component: ManageCategoryComponent,
        canActivate: [AuthorizationCheck],
        data: { RouteId: [RouteIds.Category, ''] },
        pathMatch: "full"
      },
      {
        path: "mngSubCategory",
        component: ManageSubCategoryComponent,
        canActivate: [AuthorizationCheck],
        data: { RouteId: [RouteIds.SubCategory, ''] },
        pathMatch: "full"
      },
    ]
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class RestaurantRoutingModule {
}



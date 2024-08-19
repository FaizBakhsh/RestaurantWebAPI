import { AttributeValuesVm } from './Models/AttributesValuesVm';
import { AttributesVm } from './Models/AttributesVm';
import { MenuGroupVM } from './Models/MenuGroupVM';
import { ServiceChargesVM } from './Models/ServiceChargesVM';
import { EnumLineField } from './Models/EnumLineField';
import { Globals } from './../../globals';
import { SubItemsVM } from './Models/SubItemsVM';
import { RuntimeModifierVM } from './Models/RuntimeModifierVM';
import { AttachSubItemVM } from './Models/AttachSubItemVM';
import { SubRecipeVM } from './Models/SubRecipeVM';
import { SizeVM } from './Models/SizeVM';
import { RecipeVM } from './Models/RecipeVM';
import { KOTSettingVM } from './Models/KOTSettingVM';
import { DeviceSettingVM } from './Models/DeviceSettingVM';
import { PrinterSettingVM } from './Models/PrinterSettingVM';
import { PrintTypeVM } from './Models/PrintTypeVM';
import { environment } from './../../../environments/environment';
import { GSTVM } from './Models/GSTVM';
import { MemberPointsVM } from './Models/MemberPointsVM';
import { OrderSourceVM } from './Models/OrderSourceVM';
import { VendorVM } from './Models/VendorVM';
import { SettingsVM } from '../catalog/Models/SettingsVM';
import { SettingsTypeVM } from '../catalog/Models/SettingsTypeVM';
import { RiderVM } from './Models/RiderVM';
import { LoyaltyCardVM } from './Models/LoyaltyCardVM';
import { SaleOrderVM } from './Models/SaleOrderVM';

import { TableVM } from './Models/TableVM';
import { ShiftVM } from './Models/ShiftVM';
import { FloorVM } from './Models/FloorVM';
import { LoginVM } from './Models/LoginVM';
import { BranchVM } from './Models/BranchVM';
import { CustomerVM } from './Models/CustomerVM';
import { SupplierVM } from './Models/SupplierVM';
import { DiscountKeyVM } from './Models/DiscountKeyVM';
import { VouchersDiscountVM } from './Models/VouchersDiscountVM';
import { HttpClient, HttpHeaders, HttpParams } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { map, Observable } from 'rxjs';
import { CategoryVM } from './Models/CategoryVM';
import { DiscountCampaignVM } from './Models/DiscountCampaignVM';
import { ItemVM, ProductAttribVm } from './Models/ItemVM';
import { EnumValueVM } from './Models/Enums/EnumValueVM';
import { SubCategoryVM } from './Models/SubCategoryVM';
import { ModifierVM } from './Models/ModifierVM';
import { UOMConversionVM } from './Models/UOMConversionVM';
import { StoreVM } from './Models/StoreVM';
import { CompanyInfoVM } from './Models/CompanyInfoVM';
import { ExpensesVM } from './Models/ExpensesVM';
import { OnlineDBSettingVM } from './Models/OnlineDBSettingVM';
@Injectable({
  providedIn: 'root'
})
export class RestaurantService {
  constructor(private http: HttpClient,
  ) {

  }
  selectedCompanyInfo: CompanyInfoVM = new CompanyInfoVM;
  selectedExpenses: ExpensesVM = new ExpensesVM;
  selectedRecipe: RecipeVM = new RecipeVM;
  selectedSize: SizeVM = new SizeVM;
  selectedPrintType: PrintTypeVM = new PrintTypeVM;
  selectedPrinterSetting: PrinterSettingVM = new PrinterSettingVM;
  selectedDeviceSetting: DeviceSettingVM = new DeviceSettingVM;
  selectedKOTSetting: KOTSettingVM = new KOTSettingVM;
  selectedItem: ItemVM = new ItemVM;
  selectedCategory: CategoryVM = new CategoryVM;
  selectedVendor: VendorVM = new VendorVM;
  selectedDiscountKey: DiscountKeyVM = new DiscountKeyVM;
  selectedVouchersDiscount: VouchersDiscountVM = new VouchersDiscountVM;
  selectedSubCategory: SubCategoryVM = new SubCategoryVM;
  selectedBranch: BranchVM = new BranchVM;
  selectedCustomer: CustomerVM = new CustomerVM;
  selectedSupplier: SupplierVM = new SupplierVM;
  selectedRider: RiderVM = new RiderVM;
  selectedLoyaltyCard: LoyaltyCardVM = new LoyaltyCardVM;
  selectedFloor: FloorVM = new FloorVM;
  selectedTable: TableVM = new TableVM;
  login: LoginVM = new LoginVM;
  selectedSource: OrderSourceVM = new OrderSourceVM;
  selectedPoints: MemberPointsVM = new MemberPointsVM;
  selectedGST: GSTVM = new GSTVM;
  selectedSettings: SettingsVM = new SettingsVM;
  selectedStore: StoreVM = new StoreVM;
  selectedUOMConversion: UOMConversionVM = new UOMConversionVM;
  selectedSettingsType: SettingsTypeVM = new SettingsTypeVM;
  selectedSubRecipe: SubRecipeVM = new SubRecipeVM;
  Login(User: LoginVM) {
    return this.http.post(Globals.BASE_API_URL + 'Account', User).pipe();
  }

  UpdateAttributes(Attributes: AttributesVm) {
    return this.http.put(Globals.BASE_API_URL + 'Attributes', Attributes);
  }
  GetAttributesById(id: number): Observable<AttributesVm> {

    return this.http.get<AttributesVm>(Globals.BASE_API_URL + 'Attributes/' + id).pipe()
  }
  SearchAttributes(Attributes: AttributesVm): Observable<AttributesVm[]> {
    return this.http.post<AttributesVm[]>(Globals.BASE_API_URL + 'Attributes/Search', Attributes).pipe();
  }
  GetAttributes(): Observable<AttributesVm[]> {
    return this.http.get<AttributesVm[]>(Globals.BASE_API_URL + 'Attributes').pipe();
  }
  SaveAttributes(Attributes: AttributesVm): Observable<any> {
    return this.http.post(Globals.BASE_API_URL + 'Attributes', Attributes);
  }
  DeleteAttributes(id: number) {
    return this.http.delete(Globals.BASE_API_URL + 'Attributes/' + id);
  }



  UpdateProductAttrib(value: ProductAttribVm): Observable<ProductAttribVm> {
    return this.http.put<ProductAttribVm>(Globals.BASE_API_URL + 'Size', value);
  }
  SearchProductAttrib(value: ProductAttribVm): Observable<ProductAttribVm[]> {
    return this.http.post<ProductAttribVm[]>(Globals.BASE_API_URL + 'Size/Search', value).pipe();
  }
  GetProductAttrib(): Observable<ProductAttribVm[]> {
    return this.http.get<ProductAttribVm[]>(Globals.BASE_API_URL + 'Size').pipe();
  }
  SaveProductAttrib(value: ProductAttribVm): Observable<ProductAttribVm> {
    return this.http.post<ProductAttribVm>(Globals.BASE_API_URL + 'Size', value);
  }
  deleteProductAttrib(value: ProductAttribVm): Observable<ProductAttribVm> {
    return this.http.post<ProductAttribVm>(Globals.BASE_API_URL + 'Size/Delete', value);
  }
  DeleteProductAttrib(id: number) {
    return this.http.delete(Globals.BASE_API_URL + 'Size/' + id);
  }


  UpdateAttributeValues(AttributeValues: AttributeValuesVm) {
    return this.http.put(Globals.BASE_API_URL + 'AttributeValues', AttributeValues);
  }
  GetAttributeValuesById(id: number): Observable<AttributeValuesVm> {

    return this.http.get<AttributeValuesVm>(Globals.BASE_API_URL + 'AttributeValues/' + id).pipe()
  }
  SearchAttributeValues(AttributeValues: AttributeValuesVm): Observable<AttributeValuesVm[]> {
    return this.http.post<AttributeValuesVm[]>(Globals.BASE_API_URL + 'AttributeValues/Search', AttributeValues).pipe();
  }
  GetAttributeValues(): Observable<AttributeValuesVm[]> {
    return this.http.get<AttributeValuesVm[]>(Globals.BASE_API_URL + 'AttributeValues').pipe();
  }
  SaveAttributeValues(AttributeValues: AttributeValuesVm): Observable<any> {
    return this.http.post(Globals.BASE_API_URL + 'AttributeValues', AttributeValues);
  }
  DeleteAttributeValues(id: number) {
    return this.http.delete(Globals.BASE_API_URL + 'AttributeValues/' + id);
  }



  UpdateExpenses(Expenses: ExpensesVM) {
    return this.http.put(Globals.BASE_API_URL + 'Expenses', Expenses);
  }
  GetExpensesById(id: number): Observable<ExpensesVM> {

    return this.http.get<ExpensesVM>(Globals.BASE_API_URL + 'Expenses/' + id).pipe()
  }
  SearchExpenses(Expenses: ExpensesVM): Observable<ExpensesVM[]> {
    return this.http.post<ExpensesVM[]>(Globals.BASE_API_URL + 'Expenses/Search', Expenses).pipe();
  }
  GetExpenses(): Observable<ExpensesVM[]> {
    return this.http.get<ExpensesVM[]>(Globals.BASE_API_URL + 'Expenses').pipe();
  }
  SaveExpenses(Expenses: ExpensesVM): Observable<any> {
    return this.http.post(Globals.BASE_API_URL + 'Expenses', Expenses);
  }
  DeleteExpenses(id: number) {
    return this.http.delete(Globals.BASE_API_URL + 'Expenses/' + id);
  }


  UpdateCompanyInfo(CompanyInfo: CompanyInfoVM) {
    return this.http.put(Globals.BASE_API_URL + 'CompanyInfo', CompanyInfo);
  }
  GetCompanyInfoById(id: number): Observable<CompanyInfoVM[]> {

    return this.http.get<CompanyInfoVM[]>(Globals.BASE_API_URL + 'CompanyInfo/' + id).pipe()
  }
  SearchCompanyInfo(CompanyInfo: CompanyInfoVM): Observable<CompanyInfoVM[]> {
    return this.http.post<CompanyInfoVM[]>(Globals.BASE_API_URL + 'CompanyInfo/Search', CompanyInfo).pipe();
  }
  GetCompanyInfo(): Observable<CompanyInfoVM[]> {
    return this.http.get<CompanyInfoVM[]>(Globals.BASE_API_URL + 'CompanyInfo').pipe();
  }
  SaveCompanyInfo(CompanyInfo: CompanyInfoVM): Observable<any> {
    return this.http.post(Globals.BASE_API_URL + 'CompanyInfo', CompanyInfo);
  }
  DeleteCompanyInfo(id: number) {
    return this.http.delete(Globals.BASE_API_URL + 'CompanyInfo/' + id);
  }



  UpdateStore(value: StoreVM) {
    return this.http.put(Globals.BASE_API_URL + 'Store', value);
  }
  GetStoreById(id: number): Observable<StoreVM> {
    return this.http.get<StoreVM>(Globals.BASE_API_URL + 'Store/' + id).pipe()
  }
  SearchStore(value: StoreVM): Observable<StoreVM[]> {
    return this.http.post<StoreVM[]>(Globals.BASE_API_URL + 'Store/Search', value).pipe();
  }
  GetStore(): Observable<StoreVM[]> {
    return this.http.get<StoreVM[]>(Globals.BASE_API_URL + 'Store').pipe();
  }
  SaveStore(value: StoreVM): Observable<any> {
    return this.http.post(Globals.BASE_API_URL + 'Store', value);
  }
  DeleteStore(id: number) {
    return this.http.delete(Globals.BASE_API_URL + 'Store/' + id);
  }


  UpdateUOMConversion(value: UOMConversionVM) {
    return this.http.put(Globals.BASE_API_URL + 'UOMConversion', value);
  }
  GetUOMConversionById(id: number): Observable<UOMConversionVM> {
    return this.http.get<UOMConversionVM>(Globals.BASE_API_URL + 'UOMConversion/' + id).pipe()
  }
  SearchUOMConversion(value: UOMConversionVM): Observable<UOMConversionVM[]> {
    return this.http.post<UOMConversionVM[]>(Globals.BASE_API_URL + 'UOMConversion/Search', value).pipe();
  }
  GetUOMConversion(): Observable<UOMConversionVM[]> {
    return this.http.get<UOMConversionVM[]>(Globals.BASE_API_URL + 'UOMConversion').pipe();
  }
  SaveUOMConversion(value: UOMConversionVM): Observable<any> {
    return this.http.post(Globals.BASE_API_URL + 'UOMConversion', value);
  }
  DeleteUOMConversion(id: number) {
    return this.http.delete(Globals.BASE_API_URL + 'UOMConversion/' + id);
  }


  UpdateModifier(value: ModifierVM) {
    return this.http.put(Globals.BASE_API_URL + 'Modifier', value);
  }
  GetModifierById(id: number): Observable<ModifierVM> {
    return this.http.get<ModifierVM>(Globals.BASE_API_URL + 'Modifier/' + id).pipe()
  }
  SearchModifier(value: ModifierVM): Observable<ModifierVM[]> {
    return this.http.post<ModifierVM[]>(Globals.BASE_API_URL + 'Modifier/Search', value).pipe();
  }
  GetModifier(): Observable<ModifierVM[]> {
    return this.http.get<ModifierVM[]>(Globals.BASE_API_URL + 'Modifier').pipe();
  }
  SaveModifier(value: ModifierVM) {
    return this.http.post(Globals.BASE_API_URL + 'Modifier', value);
  }
  DeleteModifier(id: number) {
    return this.http.delete(Globals.BASE_API_URL + 'Modifier/' + id);
  }


  SearchSettings(search: SettingsVM): Observable<SettingsVM[]> {
    return this.http.post<SettingsVM[]>(Globals.BASE_API_URL + 'Settings/Search', search).pipe();
  }
  SearchSettingsType(search: SettingsTypeVM): Observable<SettingsTypeVM[]> {
    return this.http.post<SettingsTypeVM[]>(Globals.BASE_API_URL + 'SettingsType/Search', search).pipe();
  }
  SearchStng(Id: number, KeyCode: string): Observable<SettingsVM[]> {
    return this.http.get<SettingsVM[]>(Globals.BASE_API_URL + 'Settings/' + Id + "/" + KeyCode).pipe();
  }


  UpdateVouchersDiscount(value: VouchersDiscountVM) {
    return this.http.put(Globals.BASE_API_URL + 'DiscountVouchers', value);
  }
  GetVouchersDiscountById(id: number): Observable<VouchersDiscountVM> {

    return this.http.get<VouchersDiscountVM>(Globals.BASE_API_URL + 'DiscountVouchers/' + id).pipe()
  }
  SearchVouchersDiscount(value: VouchersDiscountVM): Observable<VouchersDiscountVM[]> {
    return this.http.post<VouchersDiscountVM[]>(Globals.BASE_API_URL + 'DiscountVouchers/Search', value).pipe();
  }
  GetVouchersDiscount(): Observable<VouchersDiscountVM[]> {
    return this.http.get<VouchersDiscountVM[]>(Globals.BASE_API_URL + 'DiscountVouchers').pipe();
  }
  SaveVouchersDiscount(value: VouchersDiscountVM): Observable<any> {
    return this.http.post(Globals.BASE_API_URL + 'DiscountVouchers', value);
  }
  DeleteVouchersDiscount(id: number) {
    return this.http.delete(Globals.BASE_API_URL + 'DiscountVouchers/' + id);
  }


  UpdateDiscountKey(discountKey: DiscountKeyVM) {
    return this.http.put(Globals.BASE_API_URL + 'DiscountKey', discountKey);
  }
  GetDiscountKeyById(id: number): Observable<DiscountKeyVM> {

    return this.http.get<DiscountKeyVM>(Globals.BASE_API_URL + 'DiscountKey/' + id).pipe()
  }
  SearchDiscountKey(discountKey: DiscountKeyVM): Observable<DiscountKeyVM[]> {
    return this.http.post<DiscountKeyVM[]>(Globals.BASE_API_URL + 'DiscountKey/Search', discountKey).pipe();
  }
  GetDiscountKeys(): Observable<DiscountKeyVM[]> {
    return this.http.get<DiscountKeyVM[]>(Globals.BASE_API_URL + 'DiscountKey').pipe();
  }
  SaveDiscountKey(discountKey: DiscountKeyVM): Observable<any> {
    return this.http.post(Globals.BASE_API_URL + 'DiscountKey', discountKey);
  }
  DeleteDiscountKey(id: number) {
    return this.http.delete(Globals.BASE_API_URL + 'DiscountKey/' + id);
  }


  UpdateCategory(Category: CategoryVM) {
    return this.http.put(Globals.BASE_API_URL + 'Category', Category);
  }
  GetCategoryById(id: number): Observable<CategoryVM> {

    return this.http.get<CategoryVM>(Globals.BASE_API_URL + 'Category/' + id).pipe()
  }
  SearchCategory(Category: CategoryVM): Observable<CategoryVM[]> {
    return this.http.post<CategoryVM[]>(Globals.BASE_API_URL + 'Category/Search', Category).pipe();
  }
  GetCategory(): Observable<CategoryVM[]> {
    return this.http.get<CategoryVM[]>(Globals.BASE_API_URL + 'Category').pipe();
  }
  SaveCategory(Category: CategoryVM): Observable<any> {
    return this.http.post(Globals.BASE_API_URL + 'Category', Category);
  }
  DeleteCategory(id: number) {
    return this.http.delete(Globals.BASE_API_URL + 'Category/' + id);
  }


  UpdateSubCategory(SubCategory: SubCategoryVM) {
    return this.http.put(Globals.BASE_API_URL + 'SubCategory', SubCategory);
  }
  GetSubCategoryById(id: number): Observable<SubCategoryVM> {
    return this.http.get<SubCategoryVM>(Globals.BASE_API_URL + 'SubCategory/' + id).pipe();
  }
  SearchSubCategory(SubCategory: SubCategoryVM): Observable<SubCategoryVM[]> {
    return this.http.post<SubCategoryVM[]>(Globals.BASE_API_URL + 'SubCategory/Search', SubCategory).pipe();
  }
  SaveSubCategory(tem: SubCategoryVM): Observable<SubCategoryVM> {
    return this.http.post<SubCategoryVM>(Globals.BASE_API_URL + 'SubCategory', tem).pipe();
  }
  DeleteSubCategory(id: number) {
    return this.http.delete(Globals.BASE_API_URL + 'SubCategory/' + id);
  }


  GetItem(): Observable<ItemVM[]> {
    return this.http.get<ItemVM[]>(Globals.BASE_API_URL + 'Item').pipe();
  }
  UpdateItem(Item: ItemVM): Observable<ItemVM> {
    return this.http.put<ItemVM>(Globals.BASE_API_URL + 'Item', Item).pipe();
  }
  GetItemById(id: number): Observable<ItemVM> {
    return this.http.get<ItemVM>(Globals.BASE_API_URL + 'Item/' + id).pipe();
  }
  SearchItem(Item: ItemVM): Observable<ItemVM[]> {
    return this.http.post<ItemVM[]>(Globals.BASE_API_URL + 'Item/Search', Item).pipe();
  }
  SaveItem(tem: ItemVM): Observable<ItemVM> {
    return this.http.post<ItemVM>(Globals.BASE_API_URL + 'Item', tem).pipe();
  }
  DeleteItem(id: number) {
    return this.http.delete(Globals.BASE_API_URL + 'Item/' + id);
  }


  GetSaleOrder(): Observable<SaleOrderVM[]> {
    return this.http.get<SaleOrderVM[]>(Globals.BASE_API_URL + 'SaleOrder').pipe();
  }
  SearchSaleOrder(data): Observable<SaleOrderVM[]> {
    return this.http.post<SaleOrderVM[]>(Globals.BASE_API_URL + 'SaleOrder/Search', data).pipe();
  }


  UpdateBranch(Branch: BranchVM) {
    return this.http.put(Globals.BASE_API_URL + 'Branch', Branch);
  }
  GetBranchById(id: number): Observable<BranchVM> {

    return this.http.get<BranchVM>(Globals.BASE_API_URL + 'Branch/' + id).pipe()
  }
  SearchBranch(Branch: BranchVM): Observable<BranchVM[]> {
    return this.http.post<BranchVM[]>(Globals.BASE_API_URL + 'Branch/Search', Branch).pipe();
  }
  GetBranch(): Observable<BranchVM[]> {
    return this.http.get<BranchVM[]>(Globals.BASE_API_URL + 'Branch').pipe();
  }
  SaveBranch(Branch: BranchVM): Observable<any> {
    return this.http.post(Globals.BASE_API_URL + 'Branch', Branch);
  }
  DeleteBranch(id: number) {
    return this.http.delete(Globals.BASE_API_URL + 'Branch/' + id);
  }


  UpdateMenuGroup(MenuGroup: MenuGroupVM) {
    return this.http.put(Globals.BASE_API_URL + 'MenuGroup', MenuGroup);
  }
  GetMenuGroupById(id: number): Observable<MenuGroupVM> {

    return this.http.get<MenuGroupVM>(Globals.BASE_API_URL + 'MenuGroup/' + id).pipe()
  }
  SearchMenuGroup(MenuGroup: MenuGroupVM): Observable<MenuGroupVM[]> {
    return this.http.post<MenuGroupVM[]>(Globals.BASE_API_URL + 'MenuGroup/Search', MenuGroup).pipe();
  }
  GetMenuGroup(): Observable<MenuGroupVM[]> {
    return this.http.get<MenuGroupVM[]>(Globals.BASE_API_URL + 'MenuGroup').pipe();
  }
  SaveMenuGroup(MenuGroup: MenuGroupVM): Observable<any> {
    return this.http.post(Globals.BASE_API_URL + 'MenuGroup', MenuGroup);
  }
  DeleteMenuGroup(id: number) {
    return this.http.delete(Globals.BASE_API_URL + 'MenuGroup/' + id);
  }


  UpdateCustomer(Customer: CustomerVM) {
    return this.http.put(Globals.BASE_API_URL + 'Customer', Customer);
  }
  GetCustomerById(id: number): Observable<CustomerVM[]> {

    return this.http.get<CustomerVM[]>(Globals.BASE_API_URL + 'Customer/' + id).pipe()
  }
  SearchCustomer(Customer: CustomerVM): Observable<CustomerVM[]> {
    return this.http.post<CustomerVM[]>(Globals.BASE_API_URL + 'Customer/Search', Customer).pipe();
  }
  GetCustomer(): Observable<CustomerVM[]> {
    return this.http.get<CustomerVM[]>(environment.apiKey + 'Customer').pipe();
  }
  SaveCustomer(Customer: CustomerVM): Observable<any> {
    return this.http.post(Globals.BASE_API_URL + 'Customer', Customer);
  }
  DeleteCustomer(id: number) {
    return this.http.delete(Globals.BASE_API_URL + 'Customer/' + id);
  }


  UpdateSupplier(Supplier: SupplierVM) {
    return this.http.put(Globals.BASE_API_URL + 'Supplier', Supplier);
  }
  GetSupplierById(id: number): Observable<SupplierVM[]> {

    return this.http.get<SupplierVM[]>(Globals.BASE_API_URL + 'Supplier/' + id).pipe()
  }
  SearchSupplier(Supplier: SupplierVM): Observable<SupplierVM[]> {
    return this.http.post<SupplierVM[]>(Globals.BASE_API_URL + 'Supplier/Search', Supplier).pipe();
  }
  GetSupplier(): Observable<SupplierVM[]> {
    return this.http.get<SupplierVM[]>(Globals.BASE_API_URL + 'Supplier').pipe();
  }
  SaveSupplier(Supplier: SupplierVM): Observable<any> {
    return this.http.post(Globals.BASE_API_URL + 'Supplier', Supplier);
  }
  DeleteSupplier(id: number) {
    return this.http.delete(Globals.BASE_API_URL + 'Supplier/' + id);
  }


  UpdateVendor(Vendor: VendorVM) {
    return this.http.put(Globals.BASE_API_URL + 'Vendor', Vendor);
  }
  GetVendorById(id: number): Observable<VendorVM[]> {

    return this.http.get<VendorVM[]>(Globals.BASE_API_URL + 'Vendor/' + id).pipe()
  }
  SearchVendor(Vendor: VendorVM): Observable<VendorVM[]> {
    return this.http.post<VendorVM[]>(Globals.BASE_API_URL + 'Vendor/Search', Vendor).pipe();
  }
  GetVendor(): Observable<VendorVM[]> {
    return this.http.get<VendorVM[]>(Globals.BASE_API_URL + 'Vendor').pipe();
  }
  SaveVendor(Vendor: VendorVM): Observable<any> {
    return this.http.post(Globals.BASE_API_URL + 'Vendor', Vendor);
  }
  DeleteVendor(id: number) {
    return this.http.delete(Globals.BASE_API_URL + 'Vendor/' + id);
  }


  UpdateFloor(data: FloorVM) {
    return this.http.put(Globals.BASE_API_URL + 'Floor', data);
  }
  GetFloorById(id: number): Observable<FloorVM[]> {

    return this.http.get<FloorVM[]>(Globals.BASE_API_URL + 'Floor/' + id).pipe()
  }
  SearchFloor(data: FloorVM): Observable<FloorVM[]> {
    return this.http.post<FloorVM[]>(Globals.BASE_API_URL + 'Floor/Search', data).pipe();
  }
  GetFloor(): Observable<FloorVM[]> {
    return this.http.get<FloorVM[]>(Globals.BASE_API_URL + 'Floor').pipe();
  }
  SaveFloor(data: FloorVM): Observable<any> {
    return this.http.post(Globals.BASE_API_URL + 'Floor', data);
  }
  DeleteFloor(id: number) {
    return this.http.delete(Globals.BASE_API_URL + 'Floor/' + id);
  }


  UpdateTable(data: TableVM) {
    return this.http.put(Globals.BASE_API_URL + 'Table', data);
  }
  GetTableById(id: number): Observable<TableVM[]> {

    return this.http.get<TableVM[]>(Globals.BASE_API_URL + 'Table/' + id).pipe()
  }
  SearchTable(data: TableVM): Observable<TableVM[]> {
    return this.http.post<TableVM[]>(Globals.BASE_API_URL + 'Table/Search', data).pipe();
  }
  GetTable(): Observable<TableVM[]> {
    return this.http.get<TableVM[]>(Globals.BASE_API_URL + 'Table').pipe();
  }
  SaveTable(data: TableVM): Observable<any> {
    return this.http.post(Globals.BASE_API_URL + 'Table', data);
  }
  DeleteTable(id: number) {
    return this.http.delete(Globals.BASE_API_URL + 'Table/' + id);
  }


  UpdateRider(data: RiderVM) {
    return this.http.put(Globals.BASE_API_URL + 'Rider', data);
  }
  GetRiderById(id: number): Observable<RiderVM[]> {

    return this.http.get<RiderVM[]>(Globals.BASE_API_URL + 'Rider/' + id).pipe()
  }
  SearchRider(data: RiderVM): Observable<RiderVM[]> {
    return this.http.post<RiderVM[]>(Globals.BASE_API_URL + 'Rider/Search', data).pipe();
  }
  GetRider(): Observable<RiderVM[]> {
    return this.http.get<RiderVM[]>(Globals.BASE_API_URL + 'Rider').pipe();
  }
  SaveRider(data: RiderVM): Observable<any> {
    return this.http.post(Globals.BASE_API_URL + 'Rider', data);
  }
  DeleteRider(id: number) {
    return this.http.delete(Globals.BASE_API_URL + 'Rider/' + id);
  }


  UpdateLoyaltyCard(data: LoyaltyCardVM) {
    return this.http.put(Globals.BASE_API_URL + 'LoyaltyCard', data);
  }
  GetLoyaltyCardById(id: number): Observable<LoyaltyCardVM[]> {

    return this.http.get<LoyaltyCardVM[]>(Globals.BASE_API_URL + 'LoyaltyCard/' + id).pipe()
  }
  SearchLoyaltyCard(data: LoyaltyCardVM): Observable<LoyaltyCardVM[]> {
    return this.http.post<LoyaltyCardVM[]>(Globals.BASE_API_URL + 'LoyaltyCard/Search', data).pipe();
  }
  GetLoyaltyCard(): Observable<LoyaltyCardVM[]> {
    return this.http.get<LoyaltyCardVM[]>(Globals.BASE_API_URL + 'LoyaltyCard').pipe();
  }
  SaveLoyaltyCard(data: LoyaltyCardVM): Observable<any> {
    return this.http.post(Globals.BASE_API_URL + 'LoyaltyCard', data);
  }
  DeleteLoyaltyCard(id: number) {
    return this.http.delete(Globals.BASE_API_URL + 'LoyaltyCard/' + id);
  }


  UpdateMemberPoints(data: MemberPointsVM) {
    return this.http.put(Globals.BASE_API_URL + 'MemberPoints', data);
  }
  GetMemberPointsById(id: number): Observable<MemberPointsVM[]> {

    return this.http.get<MemberPointsVM[]>(Globals.BASE_API_URL + 'MemberPoints/' + id).pipe()
  }
  SearchMemberPoints(data: MemberPointsVM): Observable<MemberPointsVM[]> {
    return this.http.post<MemberPointsVM[]>(Globals.BASE_API_URL + 'MemberPoints/Search', data).pipe();
  }
  GetMemberPoints(): Observable<MemberPointsVM[]> {
    return this.http.get<MemberPointsVM[]>(Globals.BASE_API_URL + 'MemberPoints').pipe();
  }
  SaveMemberPoints(data: MemberPointsVM): Observable<any> {
    return this.http.post(Globals.BASE_API_URL + 'MemberPoints', data);
  }
  DeleteMemberPoints(id: number) {
    return this.http.delete(Globals.BASE_API_URL + 'MemberPoints/' + id);
  }


  UpdateOrderSource(data: OrderSourceVM) {
    return this.http.put(Globals.BASE_API_URL + 'OrderSource', data);
  }
  GetOrderSourceById(id: number): Observable<OrderSourceVM[]> {

    return this.http.get<OrderSourceVM[]>(Globals.BASE_API_URL + 'OrderSource/' + id).pipe()
  }
  SearchOrderSource(data: OrderSourceVM): Observable<OrderSourceVM[]> {
    return this.http.post<OrderSourceVM[]>(Globals.BASE_API_URL + 'OrderSource/Search', data).pipe();
  }
  GetOrderSource(): Observable<OrderSourceVM[]> {
    return this.http.get<OrderSourceVM[]>(Globals.BASE_API_URL + 'OrderSource').pipe();
  }
  SaveOrderSource(data: OrderSourceVM): Observable<any> {
    return this.http.post(Globals.BASE_API_URL + 'OrderSource', data);
  }
  DeleteOrderSource(id: number) {
    return this.http.delete(Globals.BASE_API_URL + 'OrderSource/' + id);
  }


  UpdateGST(data: GSTVM) {
    return this.http.put(Globals.BASE_API_URL + 'GST', data);
  }
  GetGSTById(id: number): Observable<GSTVM[]> {

    return this.http.get<GSTVM[]>(Globals.BASE_API_URL + 'GST/' + id).pipe()
  }
  SearchGST(data: GSTVM): Observable<GSTVM[]> {
    return this.http.post<GSTVM[]>(Globals.BASE_API_URL + 'GST/Search', data).pipe();
  }
  GetGST(): Observable<GSTVM[]> {
    return this.http.get<GSTVM[]>(Globals.BASE_API_URL + 'GST').pipe();
  }
  SaveGST(data: GSTVM): Observable<any> {
    return this.http.post(Globals.BASE_API_URL + 'GST', data);
  }
  DeleteGST(id: number) {
    return this.http.delete(Globals.BASE_API_URL + 'GST/' + id);
  }


  UpdatePrintType(data: PrintTypeVM) {
    return this.http.put(Globals.BASE_API_URL + 'PrintType', data);
  }
  GetPrintTypeById(id: number): Observable<PrintTypeVM[]> {

    return this.http.get<PrintTypeVM[]>(Globals.BASE_API_URL + 'PrintType/' + id).pipe()
  }
  SearchPrintType(data: PrintTypeVM): Observable<PrintTypeVM[]> {
    return this.http.post<PrintTypeVM[]>(Globals.BASE_API_URL + 'PrintType/Search', data).pipe();
  }
  GetPrintType(): Observable<PrintTypeVM[]> {
    return this.http.get<PrintTypeVM[]>(Globals.BASE_API_URL + 'PrintType').pipe();
  }
  SavePrintType(data: PrintTypeVM): Observable<any> {
    return this.http.post(Globals.BASE_API_URL + 'PrintType', data);
  }
  DeletePrintType(id: number) {
    return this.http.delete(Globals.BASE_API_URL + 'PrintType/' + id);
  }


  UpdatePrinterSetting(data: PrinterSettingVM) {
    return this.http.put(Globals.BASE_API_URL + 'PrinterSetting', data);
  }
  GetPrinterSettingById(id: number): Observable<PrinterSettingVM[]> {

    return this.http.get<PrinterSettingVM[]>(Globals.BASE_API_URL + 'PrinterSetting/' + id).pipe()
  }
  SearchPrinterSetting(data: PrinterSettingVM): Observable<PrinterSettingVM[]> {
    return this.http.post<PrinterSettingVM[]>(Globals.BASE_API_URL + 'PrinterSetting/Search', data).pipe();
  }
  GetPrinterSetting(): Observable<PrinterSettingVM[]> {
    return this.http.get<PrinterSettingVM[]>(Globals.BASE_API_URL + 'PrinterSetting').pipe();
  }
  SavePrinterSetting(data: PrinterSettingVM): Observable<any> {
    return this.http.post(Globals.BASE_API_URL + 'PrinterSetting', data);
  }
  DeletePrinterSetting(id: number) {
    return this.http.delete(Globals.BASE_API_URL + 'PrinterSetting/' + id);
  }


  UpdateDeviceSetting(data: DeviceSettingVM) {
    return this.http.put(Globals.BASE_API_URL + 'DeviceSetting', data);
  }
  GetDeviceSettingById(id: number): Observable<DeviceSettingVM[]> {

    return this.http.get<DeviceSettingVM[]>(Globals.BASE_API_URL + 'DeviceSetting/' + id).pipe()
  }
  SearchDeviceSetting(data: DeviceSettingVM): Observable<DeviceSettingVM[]> {
    return this.http.post<DeviceSettingVM[]>(Globals.BASE_API_URL + 'DeviceSetting/Search', data).pipe();
  }
  GetDeviceSetting(): Observable<DeviceSettingVM[]> {
    return this.http.get<DeviceSettingVM[]>(Globals.BASE_API_URL + 'DeviceSetting').pipe();
  }
  SaveDeviceSetting(data: DeviceSettingVM): Observable<any> {
    return this.http.post(Globals.BASE_API_URL + 'DeviceSetting', data);
  }
  DeleteDeviceSetting(id: number) {
    return this.http.delete(Globals.BASE_API_URL + 'DeviceSetting/' + id);
  }


  UpdateKOTSetting(data: KOTSettingVM) {
    return this.http.put(Globals.BASE_API_URL + 'KOTSetting', data);
  }
  GetKOTSettingById(id: number): Observable<KOTSettingVM[]> {

    return this.http.get<KOTSettingVM[]>(Globals.BASE_API_URL + 'KOTSetting/' + id).pipe()
  }
  SearchKOTSetting(data: KOTSettingVM): Observable<KOTSettingVM[]> {
    return this.http.post<KOTSettingVM[]>(Globals.BASE_API_URL + 'KOTSetting/Search', data).pipe();
  }
  GetKOTSetting(): Observable<KOTSettingVM[]> {
    return this.http.get<KOTSettingVM[]>(Globals.BASE_API_URL + 'KOTSetting').pipe();
  }
  SaveKOTSetting(data: KOTSettingVM): Observable<any> {
    return this.http.post(Globals.BASE_API_URL + 'KOTSetting', data);
  }
  DeleteKOTSetting(id: number) {
    return this.http.delete(Globals.BASE_API_URL + 'KOTSetting/' + id);
  }


  UpdateSize(data: SizeVM) {
    return this.http.put(Globals.BASE_API_URL + 'Size', data);
  }
  GetSizeById(id: number): Observable<SizeVM[]> {

    return this.http.get<SizeVM[]>(Globals.BASE_API_URL + 'Size/' + id).pipe()
  }
  SearchSize(data: SizeVM): Observable<SizeVM[]> {
    return this.http.post<SizeVM[]>(Globals.BASE_API_URL + 'Size/Search', data).pipe();
  }
  GetSize(): Observable<SizeVM[]> {
    return this.http.get<SizeVM[]>(Globals.BASE_API_URL + 'Size').pipe();
  }
  SaveSize(data: SizeVM): Observable<any> {
    return this.http.post(Globals.BASE_API_URL + 'Size', data);
  }
  DeleteSize(id: number) {
    return this.http.delete(Globals.BASE_API_URL + 'Size/' + id);
  }


  UpdateRecipe(data: RecipeVM) {
    return this.http.put(Globals.BASE_API_URL + 'Recipe', data);
  }
  GetRecipeById(id: number): Observable<RecipeVM[]> {

    return this.http.get<RecipeVM[]>(Globals.BASE_API_URL + 'Recipe/' + id).pipe()
  }
  SearchRecipe(data: RecipeVM): Observable<RecipeVM[]> {
    return this.http.post<RecipeVM[]>(Globals.BASE_API_URL + 'Recipe/Search', data).pipe();
  }
  GetRecipe(): Observable<RecipeVM[]> {
    return this.http.get<RecipeVM[]>(Globals.BASE_API_URL + 'Recipe').pipe();
  }
  SaveRecipe(data: RecipeVM): Observable<any> {
    return this.http.post(Globals.BASE_API_URL + 'Recipe', data);
  }
  DeleteRecipe(data: RecipeVM) {
    console.warn("higy")
    return this.http.post(Globals.BASE_API_URL + 'Recipe/Delete/recipe', data);
  }


  UpdateSubRecipe(data: SubRecipeVM) {
    return this.http.put(Globals.BASE_API_URL + 'SubRecipe', data);
  }
  GetSubRecipeById(id: number): Observable<SubRecipeVM[]> {

    return this.http.get<SubRecipeVM[]>(Globals.BASE_API_URL + 'SubRecipe/' + id).pipe()
  }
  SearchSubRecipe(data: SubRecipeVM): Observable<SubRecipeVM[]> {
    return this.http.post<SubRecipeVM[]>(Globals.BASE_API_URL + 'SubRecipe/Search', data).pipe();
  }
  GetSubRecipe(): Observable<SubRecipeVM[]> {
    return this.http.get<SubRecipeVM[]>(Globals.BASE_API_URL + 'SubRecipe').pipe();
  }
  SaveSubRecipe(data: SubRecipeVM): Observable<any> {
    return this.http.post(Globals.BASE_API_URL + 'SubRecipe', data);
  }
  DeleteSubRecipe(id: number) {
    return this.http.delete(Globals.BASE_API_URL + 'SubRecipe/' + id);
  }


  UpdateDiscountCampaign(value: DiscountCampaignVM) {
    return this.http.put(Globals.BASE_API_URL + 'DiscountCampaign', value);
  }
  GetDiscountCampaignById(id: number): Observable<DiscountCampaignVM[]> {

    return this.http.get<DiscountCampaignVM[]>(Globals.BASE_API_URL + 'DiscountCampaign/' + id).pipe()
  }
  SearchDiscountCampaign(value: DiscountCampaignVM): Observable<DiscountCampaignVM[]> {
    return this.http.post<DiscountCampaignVM[]>(Globals.BASE_API_URL + 'DiscountCampaign/Search', value).pipe();
  }
  GetDiscountCampaign(): Observable<DiscountCampaignVM[]> {
    return this.http.get<DiscountCampaignVM[]>(Globals.BASE_API_URL + 'DiscountCampaign').pipe();
  }
  SaveDiscountCampaign(value: DiscountCampaignVM): Observable<any> {
    return this.http.post(Globals.BASE_API_URL + 'DiscountCampaign', value);
  }
  DeleteDiscountCampaign(id: number) {
    return this.http.delete(Globals.BASE_API_URL + 'DiscountCampaign/' + id);
  }


  UpdateAttachSubItem(AttachSubItem: AttachSubItemVM) {
    return this.http.put(Globals.BASE_API_URL + 'AttachSubItem', AttachSubItem);
  }
  GetAttachSubItemById(id: number): Observable<AttachSubItemVM> {

    return this.http.get<AttachSubItemVM>(Globals.BASE_API_URL + 'AttachSubItem/' + id).pipe()
  }
  SearchAttachSubItem(AttachSubItem: AttachSubItemVM): Observable<AttachSubItemVM[]> {
    return this.http.post<AttachSubItemVM[]>(Globals.BASE_API_URL + 'AttachSubItem/Search', AttachSubItem).pipe();
  }
  GetAttachSubItem(): Observable<AttachSubItemVM[]> {
    return this.http.get<AttachSubItemVM[]>(Globals.BASE_API_URL + 'AttachSubItem').pipe();
  }
  SaveAttachSubItem(AttachSubItem: AttachSubItemVM): Observable<any> {
    return this.http.post(Globals.BASE_API_URL + 'AttachSubItem', AttachSubItem);
  }
  DeleteAttachSubItem(id: number) {
    return this.http.delete(Globals.BASE_API_URL + 'AttachSubItem/' + id);
  }


  UpdateRuntimeModifier(RuntimeModifier: RuntimeModifierVM) {
    return this.http.put(Globals.BASE_API_URL + 'RuntimeModifier', RuntimeModifier);
  }
  SearchRuntimeModifier(RuntimeModifier: RuntimeModifierVM): Observable<RuntimeModifierVM[]> {
    return this.http.post<RuntimeModifierVM[]>(Globals.BASE_API_URL + 'RuntimeModifier/Search', RuntimeModifier).pipe();
  }
  GetRuntimeModifier(): Observable<RuntimeModifierVM[]> {
    return this.http.get<RuntimeModifierVM[]>(Globals.BASE_API_URL + 'RuntimeModifier').pipe();
  }
  SaveRuntimeModifier(RuntimeModifier: RuntimeModifierVM): Observable<any> {
    return this.http.post(Globals.BASE_API_URL + 'RuntimeModifier', RuntimeModifier);
  }
  DeleteRuntimeModifier(id: number) {
    return this.http.delete(Globals.BASE_API_URL + 'RuntimeModifier/' + id);
  }


  UpdateEnumLineField(EnumLineField: EnumLineField) {
    return this.http.put(Globals.BASE_API_URL + 'ExtraFieldData', EnumLineField);
  }
  GetEnumLineFieldById(id: number): Observable<EnumLineField> {

    return this.http.get<EnumLineField>(Globals.BASE_API_URL + 'ExtraFieldData/' + id).pipe()
  }
  SearchEnumLineField(EnumLineField: EnumLineField): Observable<EnumLineField[]> {
    return this.http.post<EnumLineField[]>(Globals.BASE_API_URL + 'ExtraFieldData/Search', EnumLineField).pipe();
  }
  GetEnumLineField(): Observable<EnumLineField[]> {
    return this.http.get<EnumLineField[]>(Globals.BASE_API_URL + 'ExtraFieldData').pipe();
  }
  SaveEnumLineField(EnumLineField: EnumLineField): Observable<any> {
    return this.http.post(Globals.BASE_API_URL + 'ExtraFieldData', EnumLineField);
  }
  DeleteEnumLineField(id: number) {
    return this.http.delete(Globals.BASE_API_URL + 'ExtraFieldData/' + id);
  }


  UpdateOnlineDBSetting(data: OnlineDBSettingVM) {
    return this.http.put(Globals.BASE_API_URL + 'OnlineDBSetting', data);
  }
  GetOnlineDBSettingById(id: number): Observable<OnlineDBSettingVM[]> {

    return this.http.get<OnlineDBSettingVM[]>(Globals.BASE_API_URL + 'OnlineDBSetting/' + id).pipe()
  }
  SearchOnlineDBSetting(data: OnlineDBSettingVM): Observable<OnlineDBSettingVM[]> {
    return this.http.post<OnlineDBSettingVM[]>(Globals.BASE_API_URL + 'OnlineDBSetting/Search', data).pipe();
  }
  GetOnlineDBSetting(): Observable<OnlineDBSettingVM[]> {
    return this.http.get<OnlineDBSettingVM[]>(Globals.BASE_API_URL + 'OnlineDBSetting').pipe();
  }
  SaveOnlineDBSetting(data: OnlineDBSettingVM): Observable<any> {
    return this.http.post(Globals.BASE_API_URL + 'OnlineDBSetting', data);
  }
  DeleteOnlineDBSetting(id: number) {
    return this.http.delete(Globals.BASE_API_URL + 'OnlineDBSetting/' + id);
  }



  UpdateServiceCharges(ServiceCharges: ServiceChargesVM) {
    return this.http.put(Globals.BASE_API_URL + 'ServiceCharges', ServiceCharges);
  }
  GetServiceChargesById(id: number): Observable<ServiceChargesVM> {

    return this.http.get<ServiceChargesVM>(Globals.BASE_API_URL + 'ServiceCharges/' + id).pipe()
  }
  SearchServiceCharges(ServiceCharges: ServiceChargesVM): Observable<ServiceChargesVM[]> {
    return this.http.post<ServiceChargesVM[]>(Globals.BASE_API_URL + 'ServiceCharges/Search', ServiceCharges).pipe();
  }
  GetServiceCharges(): Observable<ServiceChargesVM[]> {
    return this.http.get<ServiceChargesVM[]>(Globals.BASE_API_URL + 'ServiceCharges').pipe();
  }
  SaveServiceCharges(ServiceCharges: ServiceChargesVM): Observable<any> {
    return this.http.post(Globals.BASE_API_URL + 'ServiceCharges', ServiceCharges);
  }
  DeleteServiceCharges(id: number) {
    return this.http.delete(Globals.BASE_API_URL + 'ServiceCharges/' + id);
  }


  UpdateSubItems(value: SubItemsVM) {
    return this.http.put(Globals.BASE_API_URL + 'SubItem', value);
  }
  GetSubItemsById(id: number): Observable<SubItemsVM> {

    return this.http.get<SubItemsVM>(Globals.BASE_API_URL + 'SubItem/' + id).pipe()
  }
  SearchSubItems(value: SubItemsVM): Observable<SubItemsVM[]> {
    return this.http.post<SubItemsVM[]>(Globals.BASE_API_URL + 'SubItem/Search', value).pipe();
  }
  GetSubItems(): Observable<SubItemsVM[]> {
    return this.http.get<SubItemsVM[]>(Globals.BASE_API_URL + 'SubItem').pipe();
  }
  SaveSubItems(value: SubItemsVM): Observable<any> {
    return this.http.post(Globals.BASE_API_URL + 'SubItem', value);
  }
  DeleteSubItems(id: number) {
    return this.http.delete(Globals.BASE_API_URL + 'SubItem/' + id);
  }

  SearchShifts(value: ShiftVM): Observable<ShiftVM[]> {
    return this.http.post<ShiftVM[]>(Globals.BASE_API_URL + 'Shift/Search', value).pipe();
  }
}

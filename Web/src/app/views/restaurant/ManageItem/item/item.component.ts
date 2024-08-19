import { SizeVM } from '../../Models/SizeVM';
import { CatalogService } from './../../../catalog/catalog.service';
import { PaymentMethods } from './../../Models/Enums/PaymentMethod';
import { ItemsService } from './../../../items/items.service';
import { StoreVM } from '../../Models/StoreVM';
import { SettingsTypeVM } from '../../../catalog/Models/SettingsTypeVM';
import { BranchVM } from './../../Models/BranchVM';
import { SupplierVM } from './../../Models/SupplierVM';
import { EnumValueVM } from './../../../security/models/EnumValueVM';
import { SettingsVM } from '../../../catalog/Models/SettingsVM';
import { Component, Inject, OnInit, ViewChild } from '@angular/core';
import { NgForm } from '@angular/forms';
import { MatDialogRef, MAT_DIALOG_DATA, MatDialog } from '@angular/material/dialog';
import { MatSnackBar } from '@angular/material/snack-bar';
import { MatTableDataSource } from '@angular/material/table';
import Swal from 'sweetalert2';
import { ItemVM, ProductAttribVm } from '../../Models/ItemVM';
import { EnumTypeVM } from '../../Models/Enums/EnumTypeVM';
import { SubCategoryVM } from '../../Models/SubCategoryVM';
import { RestaurantService } from '../../restaurant.service';
import { ActivatedRoute } from '@angular/router';
import { GSTVM } from '../../Models/GSTVM';
import { ViewEncapsulation } from '@angular/compiler';
import * as moment from 'moment';
import { ItemTypes } from '../../Models/Enums/ItemType';
import { Location } from '@angular/common';
import { AttributeValuesVm } from '../../Models/AttributesValuesVm';
import { AttributesVm } from '../../Models/AttributesVm';
import { ManageSizeComponent } from '../Size/manage-size/manage-size.component';
import { ManageAttributesComponent } from '../manage-attributes/manage-attributes.component';
import { ManageAttributeValuesComponent } from '../manage-attribute-values/manage-attribute-values.component';
import { Observable, Subject } from 'rxjs';
import { ManageEnumLineComponent } from 'src/app/views/catalog/manage-enum-line/manage-enum-line.component';
import { MenuGroupVM } from '../../Models/MenuGroupVM';
import { RouteIds } from 'src/app/views/catalog/Models/Enums/RouteIds';
@Component({
  selector: 'app-item',
  templateUrl: './item.component.html',
  styleUrls: ['./item.component.css'],

})
export class ItemComponent implements OnInit {
  lineAddMode: boolean = true
  lineEditMode: boolean = false
  @ViewChild('proAttr', { static: true }) proAttribForm!: NgForm;
  TabIndex: number = 0
  selectedProductAttrib: ProductAttribVm
  Edit: boolean = false;
  Add: boolean = true;
  taxVal: number = 0
  items!: ItemVM[];
  itemId!: number;
  filteredData: any;
  searchValue?: any
  subCategoryName!: string;
  previewImage = false;
  validFields: boolean = false;
  subCategoryId!: number;
  durationInSeconds = 3;
  Category?: SettingsVM[];
  SubCategory?: SettingsVM[];
  Brands?: SettingsVM[];
  Stores?: StoreVM[];
  Sizes?: SettingsVM[];
  Branch?: BranchVM[];
  ItemTypes?: SettingsVM[];
  Groups?: MenuGroupVM[];
  Colors?: SettingsVM[];
  FontColors?: SettingsVM[];
  KDSs?: SettingsVM[];
  UOMs?: SettingsVM[];
  currentLightBoxImage: any
  SettingsType?: SettingsTypeVM[];
  Suppliers?: SupplierVM[];
  displayedColumns: string[] = ['itemName', 'itemCode', 'price', 'actions'];;
  dataSource: any;
  subCategory!: SubCategoryVM[]
  Attributes: SettingsVM[]
  AttribValues: SettingsVM[]
  ProductAttribs: ProductAttribVm[] = []
  DisplayedColumns: string[] = ['attrib', 'attribValues', 'actions'];
  DataSource: any;
  @ViewChild('userForm', { static: true }) userForm!: NgForm;
  hide = true;
  isReadOnly: boolean = false
  selectedItem: ItemVM

  constructor(
    private route: ActivatedRoute,
    public resSvc: RestaurantService,
    private catSvc: CatalogService,
    private location: Location,
    public dialog: MatDialog,
  ) {
    this.selectedItem = new ItemVM();
    this.selectedItem.isActive = true
    this.selectedProductAttrib = new ProductAttribVm
  }

  ngOnInit(): void {
    this.isReadOnly = this.catSvc.getPermission(RouteIds.MenuItem)
    this.route.queryParams.subscribe(params => {
      this.itemId = params['id'];
    });
    if (this.itemId > 0) {
      this.Edit = true;
      this.Add = false;
      this.GetItemForEdit(this.itemId);
    }
    else {
      this.Edit = false;
      this.Add = true;
    }
    // this.GetItems();
    //this.GetSupplier();
    //this.GetBranch();
    //this.GetStore();
    //this.GetSettings(EnumTypeVM.Brand)
    //this.GetSettings(EnumTypeVM.UOM)
    this.GetAttributes()
    this.GetAttributeValues();
    this.GetSettingsType();
    this.getGroups()
    this.GetSettings(EnumTypeVM.KDS)
  }
  //#region Get Methods
  GetAttributes() {
    var attrib = new SettingsVM
    attrib.isActive = true
    attrib.enumTypeId = EnumTypeVM.Attributes
    this.catSvc.SearchSettings(attrib).subscribe({
      next: (res: SettingsVM[]) => {
        this.Attributes = res;
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  GetAttributeValues() {
    var attrib = new SettingsVM
    attrib.isActive = true
    attrib.clientId = +localStorage.getItem("RMSClientId")
    attrib.enumTypeId = EnumTypeVM.AttributeValues
    this.catSvc.SearchSettings(attrib).subscribe({
      next: (res: SettingsVM[]) => {
        this.AttribValues = res;
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  GetById() {
    // this.resSvc.selectedSubCategory = new SubCategoryVM;
    this.resSvc.selectedSubCategory.id = this.subCategoryId
    this.resSvc.SearchSubCategory(this.resSvc.selectedSubCategory).subscribe({
      next: (res: SubCategoryVM[]) => {
        this.subCategory = res;
        this.subCategoryName = this.subCategory[0].subCategoryName
        this.resSvc.selectedSubCategory.categoryName = this.subCategory[0].categoryName
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
      }
    })
  }
  GetSupplier() {
    var sup = new SupplierVM
    sup.isActive = true
    this.resSvc.SearchSupplier(sup).subscribe({
      next: (res: SupplierVM[]) => {
        this.Suppliers = res
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
      }
    })
  }
  GetStore() {
    var store = new StoreVM
    store.isActive = true
    this.resSvc.SearchStore(store).subscribe({
      next: (res: StoreVM[]) => {
        this.Stores = res
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
      }
    })
  }
  GetSettingsType() {
    var type = new SettingsTypeVM();
    this.resSvc.SearchSettingsType(type).subscribe({
      next: (res: SettingsTypeVM[]) => {
        this.SettingsType = res
        this.GetValues();
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
      }
    })
  }
  async GetValues() {
    var itemType = this.SettingsType?.find(x => x.id == EnumTypeVM.ItemType)
    if (itemType != undefined)
      await this.SetValues(itemType.id, itemType.keyCode)

  }
  getGroups() {
    var group = new MenuGroupVM
    group.clientId = +localStorage.getItem("RMSClientId")
    this.resSvc.SearchMenuGroup(group).subscribe({
      next: (res: MenuGroupVM[]) => {
        this.Groups = res
        this.filteredData = this.Groups
      }, error: () => { this.catSvc.ErrorMsgBar("Error Occurred", 5000) }
    })
  }
  SetValues(type: number, keyCode: string) {
    this.resSvc.SearchStng(type, keyCode).subscribe({
      next: (res: SettingsVM[]) => {
        if (type == EnumTypeVM.MenuCategory)
          this.Category = res;
        else if (type == EnumTypeVM.Size)
          this.Sizes = res;
        else if (type == EnumTypeVM.ItemType)
          this.ItemTypes = res;
        else if (type == EnumTypeVM.Color)
          this.Colors = res;
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
      }
    })
  }
  GetSettings(enumType: EnumTypeVM) {
    var stng = new SettingsVM
    stng.isActive = true;
    stng.enumTypeId = enumType
    stng.clientId = +localStorage.getItem("RMSClientId")
    this.catSvc.SearchSettings(stng).subscribe({
      next: (res: SettingsVM[]) => {
        if (enumType == EnumTypeVM.Brand)
          this.Brands = res
        else if (enumType == EnumTypeVM.UOM)
          this.UOMs = res
        else if (enumType == EnumTypeVM.KDS)
          this.KDSs = res
      }, error: (err) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
      },
    })
  }
  GetBranch() {
    var branch = new BranchVM
    branch.isActive = true
    this.resSvc.SearchBranch(branch).subscribe({
      next: (res: BranchVM[]) => {
        this.Branch = res
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
      }
    })
  }
  GetItems() {
    this.resSvc.SearchItem(this.selectedItem).subscribe({
      next: (res: ItemVM[]) => {
        this.items = res;
        if (res.length !== 0)
          this.dataSource = new MatTableDataSource(this.items);
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
      }
    })
  }
  GetItemForEdit(id: any) {
    this.selectedItem = new ItemVM;
    this.selectedItem.id = id
    this.selectedItem.clientId = +localStorage.getItem("RMSClientId")
    this.resSvc.SearchItem(this.selectedItem).subscribe({
      next: (res: ItemVM[]) => {
        console.warn(res)
        this.items = res;
        this.selectedItem = this.items[0]
        this.ProductAttribs = []
        this.selectedItem.productAttribs?.forEach(element => {
          this.ProductAttribs.push(element)
        });
        this.DataSource = new MatTableDataSource(this.ProductAttribs);
        this.Edit = true;
        this.Add = false;
        this.selectedItem.inclusiveTax = true
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
      }
    })
  }
  OpenKDSDialog() {
    let dialogRef = this.dialog.open(ManageEnumLineComponent, {
      disableClose: true, panelClass: 'calendar-form-dialog', width: '750px', height: '500px'
      , data: {
        enumTypeId: EnumTypeVM.KDS, isDialog: true,
        clientId: +localStorage.getItem("RMSClientId"),
      }
    });
    dialogRef.afterClosed().subscribe({
      next: (res) => {
        this.GetSettings(EnumTypeVM.KDS)
      }
    })
  }
  GetItemSettings(etype: EnumTypeVM) {
    var settings = new SettingsVM();
    settings.enumTypeId = etype
    settings.isActive = true
    this.resSvc.SearchSettings(settings).subscribe({
      next: (res: SettingsVM[]) => {
        if (etype == EnumTypeVM.MenuCategory)
          this.Category = res;
        else if (etype == EnumTypeVM.Size)
          this.Sizes = res;
        else if (etype == EnumTypeVM.ItemType)
          this.ItemTypes = res;
        else if (etype == EnumTypeVM.Brand)
          this.Brands = res;
        else if (etype == EnumTypeVM.UOM)
          this.UOMs = res;
        else if (etype == EnumTypeVM.Color)
          this.Colors = res;
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
      }
    })
  }
  //#endregion
  //#region Crud Operations
  DeleteItems(id: any) {
    Swal.fire({
      title: 'Are you sure?',
      text: "You won't be able to revert this!",
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Yes, delete it!'
    }).then((result) => {
      if (result.value) {
        this.resSvc.DeleteItem(id).subscribe({
          next: (data) => {
            Swal.fire(
              'Deleted!',
              'Item has been deleted.',
              'success'
            )
            this.GetItems();
          }, error: (e) => {
            this.catSvc.ErrorMsgBar("Error Occurred", 5000)
          }
        })
      }
    })
  }
  DeleteProductAttrib(id: number) {
    debugger
    Swal.fire({
      title: 'Are you sure?',
      text: "You won't be able to revert this!",
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Yes, delete it!'
    }).then((result) => {
      if (result.value) {
        var proAttrib = new ProductAttribVm
        proAttrib.id = id
        proAttrib.clientId = +localStorage.getItem("RMSClientId")
        this.resSvc.deleteProductAttrib(proAttrib).subscribe({
          next: (data) => {
            Swal.fire(
              'Deleted!',
              'Successfully deleted.',
              'success'
            )
            this.GetItemForEdit(this.selectedItem.id);
          }, error: (e) => {
            this.catSvc.ErrorMsgBar("Error Occurred", 5000)
            console.warn(e);
          }
        })
      }
    })
  }
  SaveItem() {
    this.SetDates();
    if (this.selectedItem.groupId == 0 || this.selectedItem.groupId == undefined)
      this.userForm.form.controls['groupId'].setErrors({ 'incorrect': true })
    if (!this.userForm.invalid) {
      var item = new ItemVM
      item.itemTypeId = ItemTypes.MenuItem
      item.itemName = this.selectedItem.itemName
      item.groupId = this.selectedItem.groupId
      item.clientId = +localStorage.getItem("RMSClientId")
      this.resSvc.SearchItem(item).subscribe({
        next: (res: ItemVM[]) => {
          if (this.Edit)
            res = res.filter(x => x.id != this.selectedItem.id)
          var find = res.find(x => x.itemName.trim().toLocaleLowerCase() == this.selectedItem.itemName.trim().toLocaleLowerCase())
          if (find == undefined) {
            this.selectedItem.clientId = +localStorage.getItem("RMSClientId")
            if (this.Edit == true) {
              this.PutItem();
            } else {
              this.selectedItem.itemTypeId = ItemTypes.MenuItem
              this.resSvc.SaveItem(this.selectedItem).subscribe({
                next: (res: ItemVM) => {
                  // this.ngOnInit();
                  this.selectedItem = res
                  this.selectedItem.itemName = null;
                  this.selectedItem.itemCode = null;
                  this.selectedItem.description = null;
                  this.selectedItem.totalItemsAllowed = undefined;
                  this.selectedItem.makingTime = null;
                  this.selectedItem.alarmTime = null;
                  // this.Edit = true;
                  // this.Add = false
                  // this.ProductAttribs = []
                  // this.selectedItem.productAttribs?.forEach(element => {
                  //   this.ProductAttribs.push(element)
                  // });
                  // this.DataSource = new MatTableDataSource(this.ProductAttribs);
                  this.refreshLine()
                  this.catSvc.SuccessMsgBar("Item Added", 6000)
                }, error: (e) => {
                  this.catSvc.ErrorMsgBar("Error Occurred", 5000)
                }
              })
            }
          } else {
            this.catSvc.ErrorMsgBar(this.selectedItem.itemName + " Already exist in the Items", 5000)
            //this.TabIndex = 1
          }
        },
        error: (err) => {
          this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        },
      })
    } else
      this.catSvc.ErrorMsgBar("Please fill all required fields", 5000)
  }
  PutItem() {
    this.resSvc.UpdateItem(this.selectedItem).subscribe({
      next: (res: ItemVM) => {
        this.selectedItem = res
        this.ProductAttribs = []
        this.selectedItem.productAttribs?.forEach(element => {
          this.ProductAttribs.push(element)
        });
        this.DataSource = new MatTableDataSource(this.ProductAttribs);
        this.refreshLine()
        this.catSvc.SuccessMsgBar("Item successfully Updated", 6000)
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  //#endregion
  //#region Search
  ByGroupSearch() {
    debugger
    var item = new ItemVM();
    this.selectedItem.subCategoryId = 0
    item.groupId = this.selectedItem.groupId;
    this.resSvc.SearchItem(item).subscribe((res: ItemVM[]) => {
      this.dataSource = new MatTableDataSource(res);
    });
  }
  BySubCategorySearch() {
    debugger
    var item = new ItemVM();
    item.subCategoryId = this.selectedItem.subCategoryId;
    this.resSvc.SearchItem(item).subscribe((res: ItemVM[]) => {
      this.dataSource = new MatTableDataSource(res);
    });
  }
  SearchSubCategory() {
    var setting = new SettingsVM();
    setting.parentId = this.selectedItem.categoryId
    this.resSvc.SearchSettings(setting).subscribe((res: SettingsVM[]) => {
      this.SubCategory = res;
    },
      (err: any) => {
        alert('Error')
      });
  }
  SearchCategory() {
    // this.selectedItem.categoryId = 0
    var setting = new SettingsVM();
    setting.parentId = this.selectedItem.groupId
    this.resSvc.SearchSettings(setting).subscribe((res: SettingsVM[]) => {
      this.Category = res;
    },
      (err: any) => {
        alert('Error')
      });
  }
  ByCategorySearch() {
    debugger
    var item = new ItemVM();
    this.selectedItem.subCategoryId = 0
    item.categoryId = this.selectedItem.categoryId;
    this.resSvc.SearchItem(item).subscribe((res: ItemVM[]) => {
      // if (res.length !== 0)
      this.dataSource = new MatTableDataSource(res);
    });
  }
  AutoCompleteSearch(evt: any) {
    evt = evt + "";
    if (!evt) this.filteredData = this.Groups;
    else {
      /** uses both id and text fields for extensive filtering (case insensitive) . can be tailored for custom needs */
      this.filteredData = this.Groups.filter(item => (item.id + "") === evt || item.name.toLocaleLowerCase().indexOf(evt.toLocaleLowerCase()) >= 0);
    }
  }
  //#endregion
  //#region Open Dialog Methods
  ConfigureProduct(id: number) {
    let dialogRef = this.dialog.open(ManageSizeComponent, {
      disableClose: true, panelClass: 'calendar-form-dialog', width: '700px', height: '560px'
      , data: { id: id }
    });
    dialogRef.afterClosed().subscribe((res) => {
      this.GetItemForEdit(this.selectedItem.id);
    })
  }
  AttribValDialog() {
    var dialogRef = this.dialog.open(ManageAttributeValuesComponent, {
      width: '1200px', height: '590px'
      , data: { isDialog: true, attribId: this.selectedProductAttrib.attribId }
    });
    dialogRef.afterClosed()
      .subscribe((res) => {
        this.GetAttributeValues()
      });
  }
  AttributeDialog() {
    var dialogRef = this.dialog.open(ManageAttributesComponent, {
      width: '1200px', height: '590px'
      , data: { isDialog: true }
    });
    dialogRef.afterClosed()
      .subscribe((res) => {
        this.GetAttributes()
      });
  }
  //#endregion
  //#region Others
  TextChangeEvent(event: any) {
    this.selectedItem.itemCode = event.target.value
    this.selectedItem.itemCode = this.selectedItem.itemCode?.replaceAll(' ', '_')
  }
  PriceChange(event: any) {
    var gst = new GSTVM();
    gst.paymentTypeId = PaymentMethods.Cash;
    gst.clientId = +localStorage.getItem("RMSClientId")
    this.resSvc.SearchGST(gst).subscribe({
      next: (res: GSTVM[]) => {
        if (res.length == 0)
          this.catSvc.ErrorMsgBar("Please define some GST", 5000)
        this.taxVal = res[0].gst;
        if (this.selectedItem.inclusiveTax) {
          //  this.selectedItem.tax = (this.selectedItem.price * this.taxVal) / 100
          this.selectedItem.actualPrice = (this.selectedItem.price * 100) / (100 + this.taxVal)
          this.selectedItem.tax = this.selectedItem.price - this.selectedItem.actualPrice
        } else {
          // this.selectedItem.tax = (this.selectedItem.actualPrice * this.taxVal) / 100
          this.selectedItem.price = +this.selectedItem.actualPrice + ((this.taxVal * this.selectedItem.actualPrice) / 100)
          this.selectedItem.tax = this.selectedItem.price - this.selectedItem.actualPrice
        }
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  handleFileInput(e: any) {
    debugger
    for (let index = 0; index < e.target.files.length; index++) {
      var reader = new FileReader();
      reader.readAsDataURL(e.target.files[index]);
      this.selectedItem.imageName = e.target.files[index];
      this.selectedItem.imageSize = e.target.files[index];
      reader.onload = (event: any) => {
        this.selectedItem.base64FilePath = event.target.result
        this.selectedItem.imageSize = e.target.files[index].size.toString(),
          this.selectedItem.imageName = e.target.files[index].name.toString()
      };
    }
  }
  onPreviewImage(): void {
    this.previewImage = true
    this.currentLightBoxImage = this.selectedItem.base64FilePath
  }
  onClosePreview() {
    this.previewImage = false;
  }
  SetDates() {
    if (this.selectedItem.startDate != null && this.selectedItem.startDate != undefined) {
      this.selectedItem.startDate = moment(this.selectedItem.startDate).toDate()
      this.selectedItem.startDate = new Date(Date.UTC(this.selectedItem.startDate.getFullYear(), this.selectedItem.startDate.getMonth(), this.selectedItem.startDate.getDate()))
    }
    if (this.selectedItem.endDate != null && this.selectedItem.endDate != undefined) {
      this.selectedItem.endDate = moment(this.selectedItem.endDate).toDate()
      this.selectedItem.endDate = new Date(Date.UTC(this.selectedItem.endDate.getFullYear(), this.selectedItem.endDate.getMonth(), this.selectedItem.endDate.getDate()))
    }
  }
  Back() {
    this.location.back();
  }
  refreshLine() {
    this.selectedProductAttrib = new ProductAttribVm
    this.GetAttributeValues()
  }
  isDisable(val: SettingsVM): boolean {
    var find = this.ProductAttribs.find(x => x.attribValId == val.id)
    if (find == undefined)
      return false
    else
      return true
  }
  CheckValidation() {
    if (this.selectedItem.groupId == 0 || this.selectedItem.groupId == undefined)
      this.userForm.form.controls['groupId'].setErrors({ 'incorrect': true })
    if (this.selectedProductAttrib.attribId == 0 || this.selectedProductAttrib.attribId == undefined)
      this.proAttribForm.form.controls['attribId'].setErrors({ 'incorrect': true })
    if (this.selectedProductAttrib.attribValues == undefined)
      this.proAttribForm.form.controls['attribValues'].setErrors({ 'incorrect': true })
  }
  async AddLine() {
    this.SetDates();
    this.CheckValidation()
    if (!this.userForm.invalid) {
      var item = new ItemVM
      item.itemTypeId = ItemTypes.MenuItem
      item.itemName = this.selectedItem.itemName
      item.groupId = this.selectedItem.groupId
      item.clientId = +localStorage.getItem("RMSClientId")
      this.resSvc.SearchItem(item).subscribe({
        next: (res: ItemVM[]) => {
          if (this.Edit)
            res = res.filter(x => x.id != this.selectedItem.id)
          var find = res.find(x => x.itemName == this.selectedItem.itemName)
          if (find == undefined) {
            if (!this.proAttribForm.invalid) {
              this.selectedProductAttrib.clientId = +localStorage.getItem("RMSClientId")
              if (this.lineEditMode)
                this.selectedProductAttrib.dBoperation = 2
              else
                this.selectedProductAttrib.dBoperation = 1
              if (this.selectedProductAttrib.dBoperation == 1) {
                this.lineAddMode = true
              }
              if (this.selectedProductAttrib.id > 0)
                this.ProductAttribs = this.ProductAttribs.filter(x => x.id != this.selectedProductAttrib.id)
              this.ProductAttribs.push(this.selectedProductAttrib)
              this.selectedItem.productAttribs = []
              this.selectedItem.productAttribs?.push(this.selectedProductAttrib)

              var item = new ItemVM
              item.itemTypeId = ItemTypes.MenuItem
              item.itemName = this.selectedItem.itemName
              item.groupId = this.selectedItem.groupId
              item.clientId = +localStorage.getItem("RMSClientId")
              this.resSvc.SearchItem(item).subscribe({
                next: (res: ItemVM[]) => {
                  if (this.Edit)
                    res = res.filter(x => x.id != this.selectedItem.id)
                  var find = res.find(x => x.itemName.trim().toLocaleLowerCase() == this.selectedItem.itemName.trim().toLocaleLowerCase())
                  if (find == undefined) {
                    this.selectedItem.clientId = +localStorage.getItem("RMSClientId")
                    if (this.Edit == true) {
                      this.PutItem();
                    } else {
                      this.selectedItem.itemTypeId = ItemTypes.MenuItem
                      this.resSvc.SaveItem(this.selectedItem).subscribe({
                        next: (res: ItemVM) => {
                          this.selectedItem = res
                          this.Edit = true;
                          this.Add = false
                          this.ProductAttribs = []
                          this.selectedItem.productAttribs?.forEach(element => {
                            this.ProductAttribs.push(element)
                          });
                          this.DataSource = new MatTableDataSource(this.ProductAttribs);
                          this.refreshLine()
                          this.catSvc.SuccessMsgBar("Item Added", 6000)
                        }, error: (e) => {
                          this.catSvc.ErrorMsgBar("Error Occurred", 5000)
                        }
                      })
                    }
                  } else {
                    this.catSvc.ErrorMsgBar(this.selectedItem.itemName + " Already exist in the Items", 5000)
                    //this.TabIndex = 1
                  }
                },
                error: (err) => {
                  this.catSvc.ErrorMsgBar("Error Occurred", 5000)
                },
              })
            }
            else {
              this.catSvc.ErrorMsgBar("Please fill all required fields of line", 5000)
            }
          } else this.catSvc.ErrorMsgBar(this.selectedItem.itemName + " Already exist in the Items", 5000)
        },
        error: (err) => {
          this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        },
      })
    } else {
      this.catSvc.ErrorMsgBar("Please fill all required fields of Product", 5000)
      this.TabIndex = 0
    }
    // this.ProductAttribs.push(this.selectedProductAttrib)
    //this.DataSource = new MatTableDataSource(this.ProductAttribs)
  }
  //#endregion 
}
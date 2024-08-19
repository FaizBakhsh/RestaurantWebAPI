import { CatalogService } from './../../../catalog/catalog.service';
import { ItemsService } from './../../../items/items.service';
import { SettingsTypeVM } from '../../../catalog/Models/SettingsTypeVM';
import { SettingsVM } from '../../../catalog/Models/SettingsVM';
import { Component, Inject, OnInit, ViewChild } from '@angular/core';
import { NgForm } from '@angular/forms';
import { MatTableDataSource } from '@angular/material/table';

import { ActivatedRoute } from '@angular/router';
import { ItemVM } from 'src/app/views/restaurant/Models/ItemVM';
import { SupplierVM } from 'src/app/views/restaurant/Models/SupplierVM';
import { RestaurantService } from 'src/app/views/restaurant/restaurant.service';
import { SubCategoryVM } from 'src/app/views/restaurant/Models/SubCategoryVM';
import { EnumTypeVM } from 'src/app/views/restaurant/Models/Enums/EnumTypeVM';
import { Location } from '@angular/common';
import { ItemTypes } from 'src/app/views/restaurant/Models/Enums/ItemType';
import { RouteIds } from 'src/app/views/catalog/Models/Enums/RouteIds';
@Component({
  selector: 'app-manage-raw-item',
  templateUrl: './manage-raw-item.component.html',
  styleUrls: ['./manage-raw-item.component.css']
})
export class ManageRawItemComponent implements OnInit {
  Edit: boolean = false;
  Add: boolean = true;
  item!: ItemVM[];
  itemId!: number;
  subCategoryName!: string;
  validFields: boolean = false;
  subCategoryId!: number;
  durationInSeconds = 3;
  Category?: SettingsVM[];
  SubCategory?: SettingsVM[];
  ItemTypes?: SettingsVM[];
  Groups?: SettingsVM[];
  UOMs?: SettingsVM[];
  SettingsType?: SettingsTypeVM[];
  Vendors?: SupplierVM[];
  displayedColumns: string[] = ['itemName', 'itemCode', 'price', 'actions'];;
  dataSource: any;
  subCategory!: SubCategoryVM[]
  @ViewChild('userForm', { static: true }) userForm!: NgForm;
  hide = true;
  selectedItem: ItemVM
  isReadOnly: boolean = false
  constructor(
    private route: ActivatedRoute,
    public resSvc: RestaurantService,
    public itemSvc: ItemsService,
    private catSvc: CatalogService,
    private location: Location
  ) {
    this.selectedItem = new ItemVM();
  }
  ngOnInit(): void {
    this.isReadOnly = this.catSvc.getPermission(RouteIds.RawItem)
    this.selectedItem.isActive = true
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
    //this.GetItems();
    this.getSettings(EnumTypeVM.ItemGroup);
    this.getSettings(EnumTypeVM.ItemCategory);
    this.getSettings(EnumTypeVM.ItemSubCategory);
    this.getSettings(EnumTypeVM.ItemType);
    this.getSettings(EnumTypeVM.UOM);
    this.GetVendors();
  }
  // GetById() {
  //   // this.resSvc.selectedSubCategory = new SubCategoryVM;
  //   this.resSvc.selectedSubCategory.id = this.subCategoryId
  //   this.resSvc.selectedSubCategory.clientId=+localStorage.getItem("RMSClientId")
  //   this.resSvc.SearchSubCategory(this.resSvc.selectedSubCategory).subscribe({
  //     next: (res: SubCategoryVM[]) => {
  //       this.subCategory = res;
  //       this.subCategoryName = this.subCategory[0].subCategoryName
  //       this.resSvc.selectedSubCategory.categoryName = this.subCategory[0].categoryName
  //     }, error: (e) => {
  //       this.catSvc.ErrorMsgBar("Error Occurred", 5000)
  //     }
  //   })
  // }
  GetVendors() {
    var sup = new SupplierVM
    sup.isActive = true
    sup.clientId = +localStorage.getItem("RMSClientId")
    this.resSvc.SearchSupplier(sup).subscribe({
      next: (res: SupplierVM[]) => {
        this.Vendors = res
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
      }
    })
  }
  getSettings(type: number) {
    var stng = new SettingsVM
    stng.enumTypeId = type
    stng.isActive = true
    stng.clientId = +localStorage.getItem("RMSClientId")
    this.catSvc.SearchSettings(stng).subscribe({
      next: (res: SettingsVM[]) => {
        if (type == EnumTypeVM.ItemCategory)
          this.Category = res;
        else if (type == EnumTypeVM.ItemSubCategory)
          this.SubCategory = res;
        else if (type == EnumTypeVM.ItemType)
          this.ItemTypes = res;
        else if (type == EnumTypeVM.UOM)
          this.UOMs = res;
        else if (type == EnumTypeVM.ItemGroup)
          this.Groups = res;
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
      }
    })
  }
  GetItems() {
    this.selectedItem = new ItemVM
    this.selectedItem.isActive = true
    this.resSvc.SearchItem(this.selectedItem).subscribe({
      next: (res: ItemVM[]) => {
        this.item = res;
        if (res.length !== 0)
          this.dataSource = new MatTableDataSource(this.item);
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
      }
    })
  }
  SaveItems() {
    if (this.selectedItem.groupId == 0 || this.selectedItem.groupId == undefined)
      this.userForm.controls['groupId'].setErrors({ 'incorrect': true })
    if (this.selectedItem.uomId == 0 || this.selectedItem.uomId == undefined)
      this.userForm.controls['uomId'].setErrors({ 'incorrect': true })
    if (this.selectedItem.categoryId == 0 || this.selectedItem.categoryId == undefined)
      this.userForm.controls['categoryId'].setErrors({ 'incorrect': true })
    if (!this.userForm.invalid) {
      this.selectedItem.clientId = +localStorage.getItem("RMSClientId")
      if (this.Edit == true) {
        this.PutItems();
      } else {
        this.selectedItem.itemTypeId = ItemTypes.RawItem
        this.resSvc.SaveItem(this.selectedItem).subscribe({
          next: (res) => {
            this.ngOnInit();
            this.validFields = false;
            window.scrollTo(0, 0)
            this.catSvc.SuccessMsgBar("Item Added!", 7000)
          }, error: (e) => {
            this.catSvc.ErrorMsgBar("Error Occurred", 5000)
          }
        })
      }
    } else
      this.catSvc.ErrorMsgBar("Please fill all required fields", 5000)
  }
  PutItems() {
    this.resSvc.UpdateItem(this.selectedItem).subscribe({
      next: (res) => {
        window.scrollTo(0, 0)
        this.catSvc.SuccessMsgBar("Item Updated Successfully!", 7000)
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  GetItemForEdit(id: any) {
    this.selectedItem = new ItemVM;
    this.selectedItem.id = id
    this.selectedItem.clientId = +localStorage.getItem("RMSClientId")
    this.resSvc.SearchItem(this.selectedItem).subscribe({
      next: (res: ItemVM[]) => {
        this.item = res;
        this.selectedItem = this.item[0]
        this.Edit = true;
        this.Add = false;
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
      }
    })
  }
  ByCategorySearch() {
    debugger
    var item = new ItemVM();
    this.selectedItem.subCategoryId = 0
    item.categoryId = this.selectedItem.categoryId;
    item.clientId = +localStorage.getItem("RMSClientId")
    this.resSvc.SearchItem(item).subscribe({
      next: (res: ItemVM[]) => {
        // if (res.length !== 0)
        this.dataSource = new MatTableDataSource(res);
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  ByGroupSearch() {
    debugger
    var item = new ItemVM();
    this.selectedItem.subCategoryId = 0
    item.groupId = this.selectedItem.groupId;
    item.clientId = +localStorage.getItem("RMSClientId")
    this.resSvc.SearchItem(item).subscribe((res: ItemVM[]) => {
      this.dataSource = new MatTableDataSource(res);
    });
  }
  BySubCategorySearch() {
    debugger
    var item = new ItemVM();
    item.subCategoryId = this.selectedItem.subCategoryId;
    item.clientId = +localStorage.getItem("RMSClientId")
    this.resSvc.SearchItem(item).subscribe((res: ItemVM[]) => {
      this.dataSource = new MatTableDataSource(res);
    });
  }
  SearchSubCategory() {
    var setting = new SettingsVM();
    setting.parentId = this.selectedItem.categoryId
    setting.clientId = +localStorage.getItem("RMSClientId")
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
    setting.clientId = +localStorage.getItem("RMSClientId")
    this.resSvc.SearchSettings(setting).subscribe((res: SettingsVM[]) => {
      this.Category = res;
    },
      (err: any) => {
        alert('Error')
      });
  }
  TextChangeEvent(event: any) {
    this.selectedItem.itemCode = event.target.value
    this.selectedItem.itemCode = this.selectedItem.itemCode?.replaceAll(' ', '_')
  }
  Back() {
    this.location.back()
  }
}
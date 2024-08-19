
import { Component, OnInit, ViewChild } from '@angular/core';
import { NgForm } from '@angular/forms';
import { MatSnackBar } from '@angular/material/snack-bar';
import { MatTableDataSource } from '@angular/material/table';
import { CatalogService } from 'src/app/views/catalog/catalog.service';
import { SettingsVM } from 'src/app/views/catalog/Models/SettingsVM';
import { ItemsService } from 'src/app/views/items/items.service';
import Swal from 'sweetalert2';
import { AttachSubItemVM } from '../../Models/AttachSubItemVM';
import { EnumTypeVM } from '../../Models/Enums/EnumTypeVM';
import { ItemTypes } from '../../Models/Enums/ItemType';
import { ItemVM } from '../../Models/ItemVM';
import { SubItemsVM } from '../../Models/SubItemsVM';
import { RestaurantService } from '../../restaurant.service';
import { Location } from '@angular/common';
import { RuntimeModifierVM } from '../../Models/RuntimeModifierVM';
import { MenuGroupVM } from '../../Models/MenuGroupVM';

@Component({
  selector: 'app-attach-sub-item',
  templateUrl: './attach-sub-item.component.html',
  styleUrls: ['./attach-sub-item.component.css']
})
export class AttachSubItemComponent implements OnInit {
  isRuntimeModifierRequired: boolean = false
  proccessing: boolean = false;
  Edit: boolean = false;
  Add: boolean = true;
  validFields: boolean = false;
  public date = new Date();
  AttachSubItems: AttachSubItemVM[] = [];
  Items?: ItemVM[]
  SubItems?: SubItemsVM[]
  Groups?: MenuGroupVM[];
  RuntimeModifiers?: RuntimeModifierVM[] = []
  selectedAttachSubItem: AttachSubItemVM
  selectedItem: ItemVM
  @ViewChild('userForm', { static: true }) userForm!: NgForm;
  displayedColumns: string[] = ['group', 'item', 'subItem', 'RuntimeModifier', 'qty', 'actions'];
  dataSource: any;
  constructor(
    public resSvc: RestaurantService,
    public itmSvc: ItemsService,
    private snack: MatSnackBar,
    private catSvc: CatalogService,
    private location: Location,
  ) {
    this.selectedAttachSubItem = new AttachSubItemVM();
  }
  ngOnInit(): void {
    this.Add = true;
    this.Edit = false;
    this.AttachSubItems = []
    this.selectedAttachSubItem = new AttachSubItemVM
    //this.GetAttachSubItem();
    this.getGroups()
    this.GetSubItems()
    this.GetItems();
  }
  getGroups() {
    var group = new MenuGroupVM
    group.clientId = +localStorage.getItem("RMSClientId")
    this.resSvc.SearchMenuGroup(group).subscribe({
      next: (res: MenuGroupVM[]) => {
        this.Groups = res
      }, error: () => { this.catSvc.ErrorMsgBar("Error Occurred", 5000) }
    })
  }
  GetItems() {
    var itm = new ItemVM();
    itm.itemTypeId = ItemTypes.MenuItem;
    itm.isActive = true
    itm.clientId = +localStorage.getItem("RMSClientId")
    this.resSvc.SearchItem(itm).subscribe({
      next: (res: ItemVM[]) => {
        this.Items = res
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 4000)
        console.warn(e);
      }
    })
  }
  Search(val: ItemVM) {
    this.selectedItem = val
    this.selectedAttachSubItem.groupId = val.groupId
    this.SearchRuntimeModifiers()
  }
  SearchItem() {
    var itm = new ItemVM();
    itm.isActive = true
    itm.groupId = this.selectedAttachSubItem.groupId
    itm.itemTypeId = ItemTypes.MenuItem
    itm.clientId = +localStorage.getItem("RMSClientId")
    console.warn(itm)
    this.resSvc.SearchItem(itm).subscribe({
      next: (res: ItemVM[]) => {
        console.warn(res)
        this.Items = res
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 4000)
        console.warn(e);
      }
    })
  }
  SearchRuntimeModifiers() {
    var RuntimeModifier = new RuntimeModifierVM();
    RuntimeModifier.menuItemId = this.selectedAttachSubItem.itemId
    RuntimeModifier.isActive = true
    RuntimeModifier.clientId = +localStorage.getItem("RMSClientId")
    this.resSvc.SearchRuntimeModifier(RuntimeModifier).subscribe({
      next: (res: RuntimeModifierVM[]) => {
        debugger
        if (res.length != 0) {
          this.RuntimeModifiers = res
          this.isRuntimeModifierRequired = true
          this.AttachSubItems = []
          this.dataSource = new MatTableDataSource(this.AttachSubItems);
        }
        else {
          this.RuntimeModifiers = []
          this.isRuntimeModifierRequired = false
          this.selectedAttachSubItem.modifierId = 0
        }
        this.GetRecipeByItem();
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 4000)
        console.warn(e);
      }
    })
  }
  GetSubItems() {
    var itm = new SubItemsVM();
    itm.isActive = true
    itm.clientId = +localStorage.getItem("RMSClientId")
    this.resSvc.SearchSubItems(itm).subscribe({
      next: (res: SubItemsVM[]) => {
        this.SubItems = res
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 4000)
        console.warn(e);
      }
    })
  }
  GetAttachSubItem() {
    var attchItem = new AttachSubItemVM
    attchItem.clientId = +localStorage.getItem("RMSClientId")
    this.resSvc.SearchAttachSubItem(attchItem).subscribe({
      next: (res: AttachSubItemVM[]) => {
        this.AttachSubItems = res;
        this.dataSource = new MatTableDataSource(this.AttachSubItems);
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 4000)
        console.warn(e);
      }
    })
  }
  GetRecipeByItem() {
    var itmRecipe = new AttachSubItemVM
    itmRecipe.itemId = this.selectedAttachSubItem.itemId
    this.SearchRecipe(itmRecipe)
  }
  GetRecipeByRuntimeModifier() {
    var itmRecipe = new AttachSubItemVM
    itmRecipe.modifierId = this.selectedAttachSubItem.modifierId
    this.SearchRecipe(itmRecipe)
  }
  SearchRecipe(recipe: AttachSubItemVM) {
    recipe.clientId = +localStorage.getItem("RMSClientId")
    if (this.selectedAttachSubItem.itemId != 0 && this.selectedAttachSubItem.itemId != undefined)
      recipe.itemId = this.selectedAttachSubItem.itemId
    if (this.selectedAttachSubItem.modifierId != 0 && this.selectedAttachSubItem.modifierId != undefined)
      recipe.modifierId = this.selectedAttachSubItem.modifierId
    this.resSvc.SearchAttachSubItem(recipe).subscribe({
      next: (res: AttachSubItemVM[]) => {
        if (res.length != 0)
          this.AttachSubItems = res;
        else
          this.AttachSubItems = []
        console.warn(res)
        this.dataSource = new MatTableDataSource(this.AttachSubItems);
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 4000)
        console.warn(e);
      }
    })
  }
  GetAttachSubItemForEdit(id: number) {
    this.selectedAttachSubItem = new AttachSubItemVM;
    this.selectedAttachSubItem.id = id
    this.selectedAttachSubItem.clientId = +localStorage.getItem("RMSClientId")
    this.resSvc.SearchAttachSubItem(this.selectedAttachSubItem).subscribe({
      next: (res: AttachSubItemVM[]) => {
        this.AttachSubItems = res;
        console.warn(this.AttachSubItems);
        this.selectedAttachSubItem = this.AttachSubItems[0]
        this.Edit = true;
        this.Add = false;
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 4000)
        console.warn(e);
      }
    })
  }
  ValidatesFields() {
    if (this.selectedAttachSubItem.itemId == 0 || this.selectedAttachSubItem.itemId == undefined)
      this.userForm.form.controls['itemId'].setErrors({ 'incorrect': true });
    if (this.selectedAttachSubItem.subItemId == 0 || this.selectedAttachSubItem.subItemId == undefined)
      this.userForm.form.controls['subItemId'].setErrors({ 'incorrect': true });
    if (this.selectedAttachSubItem.groupId == 0 || this.selectedAttachSubItem.groupId == undefined)
      this.userForm.form.controls['groupId'].setErrors({ 'incorrect': true });
    if (this.isRuntimeModifierRequired == true)
      if (this.selectedAttachSubItem.modifierId == 0 || this.selectedAttachSubItem.modifierId == undefined)
        this.userForm.form.controls['modifierId'].setErrors({ 'incorrect': true });
  }
  SaveAttachSubItem() {
    this.ValidatesFields()
    if (!this.userForm.invalid) {
      if (this.selectedItem.productAttribs.length > 0)
        this.catSvc.ErrorMsgBar("Can't continue as this Item have sizes", 7000)
      else {
        var recipe = new AttachSubItemVM
        recipe.itemId = this.selectedAttachSubItem.itemId
        recipe.subItemId = this.selectedAttachSubItem.subItemId
        recipe.clientId = +localStorage.getItem("RMSClientId")
        if (this.selectedAttachSubItem.modifierId != 0 && this.selectedAttachSubItem.modifierId != undefined)
          recipe.modifierId = this.selectedAttachSubItem.modifierId
        this.resSvc.SearchAttachSubItem(recipe).subscribe({
          next: (res: AttachSubItemVM[]) => {
            if (this.Edit)
              res = res.filter(x => x.id != this.selectedAttachSubItem.id)
            if (res.length == 0) {
              this.selectedAttachSubItem.clientId = +localStorage.getItem("RMSClientId")
              this.proccessing = true
              if (this.Edit)
                this.UpdateAttachSubItem()
              else {
                this.resSvc.SaveAttachSubItem(this.selectedAttachSubItem).subscribe({
                  next: (res) => {
                    this.catSvc.SuccessMsgBar(" Successfully Added!", 4000)
                    this.proccessing = false
                    this.Reset();
                  }, error: (e) => {
                    this.catSvc.ErrorMsgBar("Error Occurred", 4000)
                    console.warn(e);
                    this.proccessing = false
                  }
                })
              }
            } else {
              this.catSvc.ErrorMsgBar("This SubItem Already Attached ", 4000)
              var recipe = new AttachSubItemVM
              this.SearchRecipe(recipe)
            }
          }, error: (e) => {
            this.catSvc.ErrorMsgBar("Error Occurred", 4000)
            console.warn(e);
          }
        })
      }
    } else {
      this.catSvc.ErrorMsgBar("Please Fill in all required fields", 7000)
      this.proccessing = false
    }
  }
  UpdateAttachSubItem() {
    this.resSvc.UpdateAttachSubItem(this.selectedAttachSubItem).subscribe({
      next: (res) => {
        this.catSvc.SuccessMsgBar(" Successfully Updated!", 4000)
        this.proccessing = false
        this.Reset();
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 4000)
        console.warn(e);
        this.proccessing = false
      }
    })
  }
  Reset() {
    var recipe = this.selectedAttachSubItem
    this.selectedAttachSubItem = new AttachSubItemVM;
    this.Add = true;
    this.Edit = false;
    this.selectedAttachSubItem.isActive = true
    this.selectedAttachSubItem.groupId = recipe.groupId
    this.selectedAttachSubItem.itemId = recipe.itemId
    this.selectedAttachSubItem.modifierId = recipe.modifierId
    var recipe = new AttachSubItemVM
    this.SearchRecipe(recipe)
  }
  Refresh() {
    this.selectedAttachSubItem = new AttachSubItemVM;
    this.Add = true;
    this.Edit = false;
  }
  DeleteAttachSubItem(id: number) {
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
        this.resSvc.DeleteAttachSubItem(id).subscribe({
          next: (data) => {
            Swal.fire(
              'Deleted!',
              'AttachSubItem has been deleted.',
              'success'
            )
            this.GetRecipeByItem();
          }, error: (e) => {
            this.catSvc.ErrorMsgBar("Error Occurred", 4000)
            console.warn(e);
          }
        })
      }
    })
  }
  Back() {
    this.location.back();
  }
}


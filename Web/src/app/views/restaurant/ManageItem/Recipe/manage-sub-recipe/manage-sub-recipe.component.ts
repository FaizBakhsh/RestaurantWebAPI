import { ItemsService } from './../../../../items/items.service';
import { Component, OnInit, ViewChild } from '@angular/core';
import { NgForm } from '@angular/forms';
import { MatDialog } from '@angular/material/dialog';
import { MatSnackBar } from '@angular/material/snack-bar';
import { MatTableDataSource } from '@angular/material/table';
import { IconSetService } from '@coreui/icons-angular';
import { iconSubset } from 'src/app/icons/icon-subset';
import { SettingsVM } from 'src/app/views/catalog/Models/SettingsVM';
import Swal from 'sweetalert2';
import { EnumTypeVM } from '../../../Models/Enums/EnumTypeVM';
import { ItemTypes } from '../../../Models/Enums/ItemType';
import { SizeVM } from '../../../Models/SizeVM';
import { ItemVM } from '../../../Models/ItemVM';
import { AttachSubItemVM } from '../../../Models/AttachSubItemVM';
import { RestaurantService } from '../../../restaurant.service';
import { CatalogService } from 'src/app/views/catalog/catalog.service';
import { SubItemsVM } from '../../../Models/SubItemsVM';
import { Location } from '@angular/common';
@Component({
  selector: 'app-manage-sub-recipe',
  templateUrl: './manage-sub-recipe.component.html',
  styleUrls: ['./manage-sub-recipe.component.css']
})
export class ManageSubRecipeComponent implements OnInit {
  isSizeRequired: boolean = false
  proccessing: boolean = false;
  Edit: boolean = false;
  Add: boolean = true;
  validFields: boolean = false;
  public date = new Date();
  AttachSubItems: AttachSubItemVM[] = [];
  Items?: ItemVM[]
  SubItems?: SubItemsVM[]
  Groups?: SettingsVM[];
  Sizes?: SizeVM[] = []
  selectedAttachSubItem: AttachSubItemVM
  selectedItem: ItemVM
  @ViewChild('userForm', { static: true }) userForm!: NgForm;
  displayedColumns: string[] = ['group', 'item', 'subItem', 'size', 'qty', 'actions'];
  dataSource: any;
  constructor(
    private iconSetService: IconSetService,
    public resSvc: RestaurantService,
    public itmSvc: ItemsService,
    private snack: MatSnackBar,
    private catSvc: CatalogService,
    private location: Location,
    public dialog: MatDialog,) {
    this.selectedAttachSubItem = new AttachSubItemVM();
    iconSetService.icons = { ...iconSubset };
  }
  ngOnInit(): void {
    this.Add = true;
    this.Edit = false;
    this.AttachSubItems = []
    this.selectedAttachSubItem = new AttachSubItemVM
    //this.GetAttachSubItem();
    this.GetSettings(EnumTypeVM.MenuItemGroup)
    // this.GetSettings(EnumTypeVM.SubItems)
    this.GetItems();
    this.GetSubItems()
  }
  GetItems() {
    var itm = new ItemVM();
    itm.itemTypeId = ItemTypes.MenuItem;
    itm.isActive = true
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
    this.SearchSizes()
  }
  SearchItem() {
    var itm = new ItemVM();
    itm.isActive = true
    itm.groupId = this.selectedAttachSubItem.groupId
    itm.itemTypeId = ItemTypes.MenuItem
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
  SearchSizes() {
    var size = new SizeVM();
    size.itemId = this.selectedAttachSubItem.itemId
    size.isActive = true
    this.resSvc.SearchSize(size).subscribe({
      next: (res: SizeVM[]) => {
        debugger
        if (res.length != 0) {
          this.Sizes = res
          this.isSizeRequired = true
          this.AttachSubItems = []
          this.dataSource = new MatTableDataSource(this.AttachSubItems);
        }
        else {
          this.Sizes = []
          this.isSizeRequired = false
          this.selectedAttachSubItem.sizeId = 0
        }
        this.GetRecipeByItem();
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 4000)
        console.warn(e);
      }
    })
  }
  GetSettings(etype: EnumTypeVM) {
    var setting = new SettingsVM()
    setting.enumTypeId = etype
    setting.isActive = true
    this.itmSvc.SearchSettings(setting).subscribe({
      next: (res: SettingsVM[]) => {
        if (etype == EnumTypeVM.MenuItemGroup)
          this.Groups = res;
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 4000)
        console.warn(e);
      }
    })
  }
  GetSubItems() {
    var itm = new SubItemsVM();
    itm.isActive = true
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
    this.resSvc.GetAttachSubItem().subscribe({
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
  GetRecipeBySize() {
    var itmRecipe = new AttachSubItemVM
    itmRecipe.sizeId = this.selectedAttachSubItem.sizeId
    this.SearchRecipe(itmRecipe)
  }
  SearchRecipe(recipe: AttachSubItemVM) {
    // recipe.recipeTypeId = RecipeTypes.ItemRecipe
    if (this.selectedAttachSubItem.itemId != 0 && this.selectedAttachSubItem.itemId != undefined)
      recipe.itemId = this.selectedAttachSubItem.itemId
    if (this.selectedAttachSubItem.sizeId != 0 && this.selectedAttachSubItem.sizeId != undefined)
      recipe.sizeId = this.selectedAttachSubItem.sizeId
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
    console.warn(this.selectedAttachSubItem);
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
    if (this.isSizeRequired == true)
      if (this.selectedAttachSubItem.sizeId == 0 || this.selectedAttachSubItem.sizeId == undefined)
        this.userForm.form.controls['sizeId'].setErrors({ 'incorrect': true });
  }
  SaveAttachSubItem() {
    this.ValidatesFields()
    if (!this.userForm.invalid) {
      if (this.selectedItem.modifiers.length > 0)
        this.catSvc.ErrorMsgBar("Can't continue as this Item contain RuntimeModifiers", 7000)
      else {
        var recipe = new AttachSubItemVM
        recipe.itemId = this.selectedAttachSubItem.itemId
        recipe.subItemId = this.selectedAttachSubItem.subItemId
        if (this.selectedAttachSubItem.sizeId != 0 && this.selectedAttachSubItem.sizeId != undefined)
          recipe.sizeId = this.selectedAttachSubItem.sizeId
        this.resSvc.SearchAttachSubItem(recipe).subscribe({
          next: (res: AttachSubItemVM[]) => {
            console.warn(res)
            if (this.Edit)
              res = res.filter(x => x.id != this.selectedAttachSubItem.id)
            console.warn(res)
            if (res.length == 0) {
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
              this.catSvc.ErrorMsgBar("This SubItem Already Attached with this Item", 4000)
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
    this.selectedAttachSubItem.sizeId = recipe.sizeId
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


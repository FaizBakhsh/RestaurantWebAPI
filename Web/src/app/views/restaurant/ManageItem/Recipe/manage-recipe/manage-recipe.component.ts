import { Sizes } from './../../../Models/Enums/Sizes';
import { CatalogService } from 'src/app/views/catalog/catalog.service';
import { SizeVM } from '../../../Models/SizeVM';
import { AfterViewInit, Component, OnDestroy, OnInit, ViewChild } from '@angular/core';
import { MatSnackBar } from '@angular/material/snack-bar';
import { ActivatedRoute } from '@angular/router';
import { ItemsService } from 'src/app/views/items/items.service';
import { SettingsVM } from 'src/app/views/catalog/Models/SettingsVM';
import { EnumTypeVM } from '../../../Models/Enums/EnumTypeVM';
import { ItemVM } from '../../../Models/ItemVM';
import { RecipeVM } from '../../../Models/RecipeVM';
import { RestaurantService } from '../../../restaurant.service';
import { ItemTypes } from '../../../Models/Enums/ItemType';
import { FormControl, NgForm } from '@angular/forms';
import { UOMConversionVM } from '../../../Models/UOMConversionVM';
import Swal from 'sweetalert2';
import { MatTableDataSource } from '@angular/material/table';
import { MatSelect } from '@angular/material/select';
import { ReplaySubject, Subject, takeUntil } from 'rxjs';
import { ChangeDetectorRef } from '@angular/core';
import { RecipeTypes } from '../../../Models/Enums/RecipeTypes';
import { MenuGroupVM } from '../../../Models/MenuGroupVM';
import { RouteIds } from 'src/app/views/catalog/Models/Enums/RouteIds';

@Component({
  selector: 'app-manage-recipe',
  templateUrl: './manage-recipe.component.html',
  styleUrls: ['./manage-recipe.component.css']
})
export class ManageRecipeComponent implements OnInit {
  @ViewChild('recipeForm', { static: true }) recipeForm!: NgForm;
  itemInput: boolean = true
  isSizeRequired: boolean = false
  itemDropDown: boolean = true
  proccessing: boolean = false
  recipeId!: number;
  Edit: boolean = false;
  Add: boolean = true;
  View: boolean = false;
  ItemRecipe: RecipeVM[] = [];
  Items?: ItemVM[];
  RawItems?: ItemVM[];
  Groups?: MenuGroupVM[]
  OrderTypes?: SettingsVM[];
  Sizes?: SizeVM[] = []
  uomCnvrsn: UOMConversionVM[] = []
  getRecipeById!: RecipeVM[];
  selectedRecipe: RecipeVM
  displayedColumns: string[] = ['MenuItem', 'Size', 'RawItem', 'UOM', 'QTY', 'Amount', 'OrderType', 'isActive', 'Action'];
  dataSource: any;
  selectedRecipeById?: RecipeVM
  filteredItem: any
  filteredGroup: any
  filterRawItem: any
  data: any
  rawItems: any
  rawItemsData: any
  searchItem?: any
  searchGroup?: any
  searchRawItem?: any
  isReadOnly: boolean = false
  @ViewChild('singleSelect', { static: true }) singleSelect?: MatSelect;
  protected _onDestroy = new Subject<void>();
  constructor(
    private cdref: ChangeDetectorRef,
    private route: ActivatedRoute,
    public resSvc: RestaurantService,
    private snack: MatSnackBar,
    public catSvc: CatalogService
  ) {
    this.selectedRecipe = new RecipeVM
  }
  ngOnInit() {
    this.isReadOnly = this.catSvc.getPermission(RouteIds.MenuItem)
    this.Refresh();
    this.GetGroups()
    this.GetSettings(EnumTypeVM.OrderTypes)
    this.GetItems();
    this.GetRawItems();
    this.selectedRecipe.isActive = true
    // this.GetRecipe()
    //this.SearchSizes()
  }
  GetItems() {
    var itm = new ItemVM();
    itm.itemTypeId = ItemTypes.MenuItem;
    itm.isActive = true
    itm.clientId = +localStorage.getItem("RMSClientId")
    this.resSvc.SearchItem(itm).subscribe({
      next: (res: ItemVM[]) => {
        this.Items = res
        this.filteredItem = this.Items
        this.data = res
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 4000)
        console.warn(e);
      }
    })
  }
  GetRawItems() {
    var itm = new ItemVM();
    itm.isActive = true
    itm.itemTypeId = ItemTypes.RawItem;
    itm.clientId = +localStorage.getItem("RMSClientId")
    this.resSvc.SearchItem(itm).subscribe({
      next: (res: ItemVM[]) => {
        this.RawItems = res
        this.rawItems = this.RawItems
        this.filterRawItem = res
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 4000)
        console.warn(e);
      }
    })
  }
  GetGroups() {
    var group = new MenuGroupVM
    group.isActive = true
    group.clientId = +localStorage.getItem("RMSClientId")
    this.resSvc.SearchMenuGroup(group).subscribe({
      next: (res: MenuGroupVM[]) => {
        this.Groups = res;
        this.filteredGroup = res
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
    this.resSvc.SearchSettings(setting).subscribe({
      next: (res: SettingsVM[]) => {
        if (etype == EnumTypeVM.OrderTypes)
          this.OrderTypes = res;
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 4000)
        console.warn(e);
      }
    })
  }
  ChangeInItemDropDown(value: ItemVM) {
    this.selectedRecipe.groupId = value.groupId
    if (this.selectedRecipe.entityId != 0 && this.selectedRecipe.entityId != undefined) {
      this.SearchItemById(this.selectedRecipe.entityId)
    }
  }
  SearchItemById(id: number) {
    var item = new ItemVM
    item.id = id
    item.clientId = +localStorage.getItem("RMSClientId")
    this.resSvc.SearchItem(item).subscribe({
      next: (res: ItemVM[]) => {
        this.SearchSizes()
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 4000)
        console.warn(e);
      }
    })
  }
  SearchSizes() {
    var size = new SizeVM();
    size.itemId = this.selectedRecipe.entityId
    size.clientId = +localStorage.getItem("RMSClientId")
    size.isActive = true
    this.resSvc.SearchSize(size).subscribe({
      next: (res: SizeVM[]) => {
        debugger
        if (res.length != 0) {
          this.Sizes = res
          this.isSizeRequired = true
          this.ItemRecipe = []
          this.dataSource = new MatTableDataSource(this.ItemRecipe);
        }
        else {
          this.Sizes = []
          this.isSizeRequired = false
          this.selectedRecipe.sizeId = 0
        }
        this.GetRecipeByItem();
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 4000)
        console.warn(e);
      }
    })
  }
  SearchItem() {
    var itm = new ItemVM();
    itm.groupId = this.selectedRecipe.groupId
    itm.isActive = true
    itm.itemTypeId = ItemTypes.MenuItem
    itm.clientId = +localStorage.getItem("RMSClientId")
    this.resSvc.SearchItem(itm).subscribe({
      next: (res: ItemVM[]) => {
        this.Items = res
        this.filteredItem = res
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 4000)
        console.warn(e);
      }
    })
  }


  CheckValidation() {
    if (this.selectedRecipe.entityId == 0 || this.selectedRecipe.entityId == undefined)
      this.recipeForm.form.controls['entityId'].setErrors({ 'incorrect': true });
    if (this.selectedRecipe.groupId == 0 || this.selectedRecipe.groupId == undefined)
      this.recipeForm.form.controls['groupId'].setErrors({ 'incorrect': true });
    if (this.isSizeRequired == true)
      if (this.selectedRecipe.sizeId == 0 || this.selectedRecipe.sizeId == undefined)
        this.recipeForm.form.controls['sizeId'].setErrors({ 'incorrect': true });
    if (this.selectedRecipe.rawItemId == 0 || this.selectedRecipe.rawItemId == undefined)
      this.recipeForm.form.controls['rawItemId'].setErrors({ 'incorrect': true });
    if (this.selectedRecipe.orderTypeId == 0 || this.selectedRecipe.orderTypeId == undefined)
      this.recipeForm.form.controls['orderTypeId'].setErrors({ 'incorrect': true });
  }
  AddRecipetoList() {
    this.CheckValidation();
    if (!this.recipeForm.invalid) {
      this.CalculateAmount()
      var recipe = new RecipeVM
      recipe.entityId = this.selectedRecipe.entityId
      recipe.rawItemId = this.selectedRecipe.rawItemId
      if (this.selectedRecipe.sizeId != 0 && this.selectedRecipe.sizeId != undefined)
        recipe.sizeId = this.selectedRecipe.sizeId
      recipe.recipeTypeId = RecipeTypes.ItemRecipe
      recipe.clientId = +localStorage.getItem("RMSClientId")
      this.resSvc.SearchRecipe(recipe).subscribe({
        next: (res: RecipeVM[]) => {
          if (this.Edit)
            res = res.filter(x => x.id != this.selectedRecipe.id)
          if (res.length == 0) {
            this.selectedRecipe.clientId = +localStorage.getItem("RMSClientId")
            this.selectedRecipe.recipeTypeId = RecipeTypes.ItemRecipe
            if (this.Edit)
              this.UpdateRecipe()
            else
              this.SaveRecipe();
          } else {
            this.catSvc.ErrorMsgBar("This Raw Item Already Added", 4000)
            var recipe = new RecipeVM
            this.SearchRecipe(recipe)
          }
        }, error: (e) => {
          this.catSvc.ErrorMsgBar("Error Occurred", 4000)
          console.warn(e);
        }
      })
    }
    else
      this.catSvc.ErrorMsgBar("Please Fill in all required fields", 7000)
  }
  UpdateRecipe() {
    this.proccessing = true
    this.resSvc.UpdateRecipe(this.selectedRecipe).subscribe({
      next: (res) => {
        this.catSvc.SuccessMsgBar(" Successfully Updated!", 4000)
        this.Reset()
        this.proccessing = false
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 4000)
        this.proccessing = false
      }
    })
  }
  SaveRecipe() {
    this.proccessing = true
    this.resSvc.SaveRecipe(this.selectedRecipe).subscribe({
      next: (res) => {
        this.catSvc.SuccessMsgBar(" Successfully Added!", 4000)
        this.Reset()
        this.proccessing = false
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 4000)
        this.proccessing = false
      }
    })
  }


  GetRecipeByItem() {
    var itmRecipe = new RecipeVM
    itmRecipe.entityId = this.selectedRecipe.entityId
    this.SearchRecipe(itmRecipe)
  }
  GetRecipeBySize() {
    var itmRecipe = new RecipeVM
    itmRecipe.sizeId = this.selectedRecipe.sizeId
    this.SearchRecipe(itmRecipe)
  }
  SearchRecipe(recipe: RecipeVM) {
    recipe.clientId = +localStorage.getItem("RMSClientId")
    recipe.recipeTypeId = RecipeTypes.ItemRecipe
    if (this.selectedRecipe.entityId != 0 && this.selectedRecipe.entityId != undefined)
      recipe.entityId = this.selectedRecipe.entityId
    if (this.selectedRecipe.sizeId != 0 && this.selectedRecipe.sizeId != undefined)
      recipe.sizeId = this.selectedRecipe.sizeId
    this.resSvc.SearchRecipe(recipe).subscribe({
      next: (res: RecipeVM[]) => {
        if (res.length != 0)
          this.ItemRecipe = res;
        else
          this.ItemRecipe = []
        console.warn(res)
        this.dataSource = new MatTableDataSource(this.ItemRecipe);
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 4000)
        console.warn(e);
      }
    })
  }


  ngAfterContentChecked() {
    this.cdref.detectChanges();
  }
  SearchinItem(evt: any) {
    evt = evt + "";
    if (!evt) this.filteredItem = this.Items;
    else {
      this.filteredItem = this.Items.filter(item => (item.id + "") === evt || item.itemName.toLocaleLowerCase().indexOf(evt.toLocaleLowerCase()) >= 0);
    }
  }
  SearchinGroup(evt: any) {
    evt = evt + "";
    if (!evt) this.filteredGroup = this.Groups;
    else {
      this.filteredGroup = this.Groups.filter(item => (item.id + "") === evt || item.name.toLocaleLowerCase().indexOf(evt.toLocaleLowerCase()) >= 0);
    }
  }
  SearchinRawItem(evt: any) {
    evt = evt + "";
    if (!evt) this.filterRawItem = this.RawItems;
    else {
      this.filterRawItem = this.RawItems.filter(val => (val.id + "") === evt || val.itemName.toLocaleLowerCase().indexOf(evt.toLocaleLowerCase()) >= 0);
    }
  }


  Reset() {
    var recipe = this.selectedRecipe
    //this.Refresh()
    this.selectedRecipe = new RecipeVM;
    this.Add = true;
    this.Edit = false;
    this.uomCnvrsn.length = 0
    this.selectedRecipe.isActive = true
    this.selectedRecipe.groupId = recipe.groupId
    this.selectedRecipe.entityId = recipe.entityId
    this.selectedRecipe.orderTypeId = recipe.orderTypeId
    this.selectedRecipe.sizeId = recipe.sizeId
    var recipe = new RecipeVM
    this.SearchRecipe(recipe)
  }
  Refresh() {
    this.selectedRecipe = new RecipeVM;
    this.Sizes = []
    this.Add = true;
    this.Edit = false;
    this.uomCnvrsn.length = 0
    this.ItemRecipe = []
    this.selectedRecipe.isActive = true
  }

  // GetSizes() {
  //   var stng = new SettingsVM
  //   stng.enumTypeId = EnumTypeVM.Size
  //   this.catSvc.SearchSettings(stng).subscribe({
  //     next: (res: SettingsVM[]) => {
  //       this.Sizes = res
  //     }, error: (e) => {
  //       this.catSvc.ErrorMsgBar("Error Occurred", 4000)
  //       console.warn(e);
  //     }
  //   })
  // }

  GetRecipeById() {
    var recipe = new RecipeVM
    recipe.id = this.recipeId
    recipe.clientId = +localStorage.getItem("RMSClientId")
    this.resSvc.SearchRecipe(recipe).subscribe({
      next: (res: RecipeVM[]) => {
        this.getRecipeById = res;
        this.selectedRecipe = this.getRecipeById[0]
        this.SearchSelectedRawItem(this.selectedRecipe.rawItemId)
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 4000)
        console.warn(e);
      }
    })
  }
  EditRecipe(recipe: RecipeVM) {
    window.scrollTo(0, 0)
    this.selectedRecipe = recipe
    this.Add = false;
    this.Edit = true
    this.selectedRecipeById = recipe
    this.SearchSelectedRawItem(this.selectedRecipeById.rawItemId)
    // this.SearchSizes()
  }

  SearchSelectedRawItem(id: number) {
    this.uomCnvrsn.length = 0
    var itm = new ItemVM();
    itm.itemTypeId = ItemTypes.RawItem;
    itm.id = id
    itm.clientId = +localStorage.getItem("RMSClientId")
    this.resSvc.SearchItem(itm).subscribe({
      next: (item: ItemVM[]) => {
        debugger
        this.selectedRecipe.rawItem = item[0].itemName
        var uomCnvrsn = new UOMConversionVM
        uomCnvrsn.uomId = item[0].uomId
        this.resSvc.SearchUOMConversion(uomCnvrsn).subscribe({
          next: (res: UOMConversionVM[]) => {
            debugger
            if (res.length != 0) {
              this.selectedRecipe.uom = res[0].convertedUOM
              this.uomCnvrsn = res
            }
            else
              this.selectedRecipe.uom = item[0].uom;
            this.selectedRecipe.price = item[0].price
            // if (this.Edit || this.lineEditMode) {
            this.CalculateAmount()
            //this.RawItems = res
            // }
          }, error: (e) => {
            this.catSvc.ErrorMsgBar("Error Occurred", 4000)
            console.warn(e);
          }
        })
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 4000)
        console.warn(e);
      }
    })
  }
  CalculateAmount() {
    if (this.selectedRecipe.uom != undefined && this.selectedRecipe.uom != null) {
      //   await this.SearchSelectedRawItem(this.selectedRecipe.rawItemId)
      if (this.uomCnvrsn.length != 0 && this.uomCnvrsn != undefined) {
        this.selectedRecipe.amount = (this.selectedRecipe.price / +this.uomCnvrsn[0].conversionRate) * this.selectedRecipe.qty
      } else
        this.selectedRecipe.amount = this.selectedRecipe.price * this.selectedRecipe.qty
    }
  }
  DeleteRecipe(recipe: RecipeVM) {
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

        this.resSvc.DeleteRecipe(recipe).subscribe({
          next: (data) => {
            debugger
            this.ItemRecipe = this.ItemRecipe.filter(x => x != recipe)
            this.dataSource = new MatTableDataSource(this.ItemRecipe);
            Swal.fire(
              'Deleted!',
              'Recipe has been deleted.',
              'success'
            )
            // this.GetRecipe();
          }, error: (e) => {
            this.catSvc.ErrorMsgBar("Error Occurred", 4000)
            console.warn(e);
          }
        })
      }
    })
  }
  ResetDBOperation() {
    this.ItemRecipe.forEach(element => {
      element.dBoperation = 0
    });
  }
}




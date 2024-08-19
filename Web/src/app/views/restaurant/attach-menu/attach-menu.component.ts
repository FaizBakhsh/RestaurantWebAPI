import { ChangeDetectorRef, Component, OnInit, ViewChild } from '@angular/core';
import { NgForm } from '@angular/forms';
import { MatTableDataSource } from '@angular/material/table';
import { CatalogService } from '../../catalog/catalog.service';
import { SettingsVM } from '../../catalog/Models/SettingsVM';
import { EnumTypeVM } from '../Models/Enums/EnumTypeVM';
import { ItemTypes } from '../Models/Enums/ItemType';
import { RecipeTypes } from '../Models/Enums/RecipeTypes';
import { SizeVM } from '../Models/SizeVM';
import { ItemVM } from '../Models/ItemVM';
import { RecipeVM } from '../Models/RecipeVM';
import { RuntimeModifierVM } from '../Models/RuntimeModifierVM';
import { UOMConversionVM } from '../Models/UOMConversionVM';
import { RestaurantService } from '../restaurant.service';
import { MenuGroupVM } from '../Models/MenuGroupVM';
import { RouteIds } from '../../catalog/Models/Enums/RouteIds';

@Component({
  selector: 'app-attach-menu',
  templateUrl: './attach-menu.component.html',
  styleUrls: ['./attach-menu.component.css']
})
export class AttachMenuComponent implements OnInit {
  isReadOnly: boolean = false
  isSizeRequired: boolean = false
  isModifierRequired: boolean = false
  selectedRecipe: RecipeVM
  AddMode: boolean = true
  EditMode: boolean = false
  proccessing: boolean = false
  dataSource: any
  recipes: RecipeVM[] = []
  rawItems: ItemVM[]
  uomCnvrsn: UOMConversionVM[] = []
  Groups: MenuGroupVM[]
  OrderTypes: SettingsVM[]
  Items: ItemVM[]
  attachItems: ItemVM[]
  runtimeModifiers: RuntimeModifierVM[] = []
  Sizes: SizeVM[] = []
  searchItem?: any
  searchGroup?: any
  searchEntity?: any
  filteredItem: any
  filteredGroup: any
  filteredEntity: any
  @ViewChild('recipeForm', { static: true }) recipeForm!: NgForm;
  displayedColumns: string[] = ['Entity', 'Item', 'RecipeModifier', 'Size', 'QTY', 'attachRecipe', 'printKitchen', 'isActive', 'Action'];
  constructor(
    private cdref: ChangeDetectorRef,
    public resSvc: RestaurantService,
    public catSvc: CatalogService
  ) {
    this.selectedRecipe = new RecipeVM
  }
  ngOnInit() {
    this.isReadOnly = this.catSvc.getPermission(RouteIds.AttachMenu)
    this.Sizes = []
    this.runtimeModifiers = []
    this.recipes = []
    this.Refresh();
    this.GetItems();
    this.GetAttachItems()
    this.GetRawItems();
    //this.GetRecipes()
    this.getGroups()
    this.GetSettings(EnumTypeVM.OrderTypes)
    this.selectedRecipe.isActive = true
  }
  getGroups() {
    var group = new MenuGroupVM
    group.clientId = +localStorage.getItem("RMSClientId")
    this.resSvc.SearchMenuGroup(group).subscribe({
      next: (res: MenuGroupVM[]) => {
        this.Groups = res
        this.filteredGroup = res
      }, error: () => { this.catSvc.ErrorMsgBar("Error Occurred", 5000) }
    })
  }
  Refresh() {
    this.selectedRecipe = new RecipeVM;
    this.GetItems();
    this.AddMode = true;
    this.EditMode = false;
    this.uomCnvrsn.length = 0
    this.selectedRecipe.isActive = true
  }
  GetItems() {
    var itm = new ItemVM();
    itm.itemTypeId = ItemTypes.MenuItem;
    itm.isActive = true
    itm.clientId = +localStorage.getItem("RMSClientId")
    this.resSvc.SearchItem(itm).subscribe({
      next: (res: ItemVM[]) => {
        this.Items = res
        this.filteredEntity = res
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 4000)
        console.warn(e);
      }
    })
  }
  GetAttachItems() {
    var itm = new ItemVM();
    itm.itemTypeId = ItemTypes.MenuItem;
    itm.isActive = true
    itm.clientId = +localStorage.getItem("RMSClientId")
    this.resSvc.SearchItem(itm).subscribe({
      next: (res: ItemVM[]) => {
        this.attachItems = res
        this.filteredItem = res
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
        this.rawItems = res
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
  GetRecipes() {
    var itmRecipe = new RecipeVM
    itmRecipe.recipeTypeId = RecipeTypes.DealRecipe
    itmRecipe.clientId = +localStorage.getItem("RMSClientId")
    this.resSvc.SearchRecipe(itmRecipe).subscribe({
      next: (res: RecipeVM[]) => {
        this.recipes = res
        //  if (res.length != 0)
        this.dataSource = new MatTableDataSource(this.recipes);
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 4000)
        console.warn(e);
      }
    })
  }


  SearchRuntimeModifiers(val: ItemVM) {
    this.selectedRecipe.groupId = val.groupId
    var modifier = new RuntimeModifierVM
    modifier.menuItemId = this.selectedRecipe.entityId
    modifier.clientId = +localStorage.getItem("RMSClientId")
    this.resSvc.SearchRuntimeModifier(modifier).subscribe({
      next: (res: RuntimeModifierVM[]) => {
        this.runtimeModifiers = res;
        if (res.length == 0) {
          this.selectedRecipe.recipeModifierId = 0
          this.isModifierRequired = false
        } else
          this.isModifierRequired = true
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred !", 6000)
        console.warn(e);
      }
    })

  }
  SearchSizes() {
    var size = new SizeVM();
    size.itemId = this.selectedRecipe.itemId
    size.isActive = true
    size.clientId = +localStorage.getItem("RMSClientId")
    this.resSvc.SearchSize(size).subscribe({
      next: (res: SizeVM[]) => {
        debugger
        if (res.length != 0) {
          this.Sizes = res
          this.isSizeRequired = true
        }
        else {
          this.Sizes = []
          this.isSizeRequired = false
          this.selectedRecipe.sizeId = 0
        }
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
    console.warn(this.selectedRecipe)
    this.resSvc.SearchItem(itm).subscribe({
      next: (res: ItemVM[]) => {
        this.Items = res
        this.filteredEntity = res
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 4000)
        console.warn(e);
      }
    })
  }
  ChangeInItemDropDown(value: ItemVM) {
    if (this.selectedRecipe.itemId != 0 && this.selectedRecipe.itemId != undefined) {
      this.SearchItemById(this.selectedRecipe.itemId)
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


  CheckValidation() {
    if (this.selectedRecipe.itemId == 0 || this.selectedRecipe.itemId == undefined)
      this.recipeForm.form.controls['itemId'].setErrors({ 'incorrect': true });
    if (this.selectedRecipe.entityId == 0 || this.selectedRecipe.entityId == undefined)
      this.recipeForm.form.controls['entityId'].setErrors({ 'incorrect': true });
    if (this.selectedRecipe.groupId == 0 || this.selectedRecipe.groupId == undefined)
      this.recipeForm.form.controls['groupId'].setErrors({ 'incorrect': true });
    if (this.isSizeRequired == true)
      if (this.selectedRecipe.sizeId == 0 || this.selectedRecipe.sizeId == undefined)
        this.recipeForm.form.controls['sizeId'].setErrors({ 'incorrect': true });
    if (this.isModifierRequired == true)
      if (this.selectedRecipe.recipeModifierId == 0 || this.selectedRecipe.recipeModifierId == undefined)
        this.recipeForm.form.controls['recipeModifierId'].setErrors({ 'incorrect': true });
  }
  AddRecipetoList() {
    this.CheckValidation()
    if (!this.recipeForm.invalid) {
      var recipe = new RecipeVM
      recipe.entityId = this.selectedRecipe.entityId
      if (this.selectedRecipe.recipeModifierId != 0 && this.selectedRecipe.recipeModifierId != undefined)
        recipe.recipeModifierId = this.selectedRecipe.recipeModifierId
      recipe.itemId = this.selectedRecipe.itemId
      recipe.recipeTypeId = RecipeTypes.DealRecipe
      recipe.clientId = +localStorage.getItem("RMSClientId")
      this.resSvc.SearchRecipe(recipe).subscribe({
        next: (res: RecipeVM[]) => {
          if (this.EditMode)
            res = res.filter(x => x.id != this.selectedRecipe.id)
          if (res.length == 0) {
            this.selectedRecipe.clientId = +localStorage.getItem("RMSClientId")
            this.selectedRecipe.recipeTypeId = RecipeTypes.DealRecipe
            if (this.EditMode)
              this.UpdateRecipe()
            else
              this.SaveRecipe();
          } else
            this.catSvc.ErrorMsgBar("This Item Already Attached", 4000)
        }, error: (e) => {
          this.catSvc.ErrorMsgBar("Error Occurred", 4000)
          console.warn(e);
        }
      })
    }
    else
      this.catSvc.ErrorMsgBar("Please Fill in all required fields", 7000)

  }
  EditRecipe(recipe: RecipeVM) {
    this.selectedRecipe = recipe
    this.EditMode = true
    this.AddMode = false
    this.SearchSizes()
    window.scrollTo(0, 0)
  }
  DeleteRecipe(recipe: RecipeVM) {

  }
  UpdateRecipe() {
    this.proccessing = true
    this.resSvc.UpdateRecipe(this.selectedRecipe).subscribe({
      next: (res) => {
        this.catSvc.SuccessMsgBar(" Successfully Updated!", 4000)
        this.SearchRecipeByRModifierandEntity()
        this.Reset()
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
        this.SearchRecipeByRModifierandEntity()
        this.Reset()
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 4000)
        this.proccessing = false
      }
    })
  }
  Reset() {
    this.selectedRecipe.itemId = 0
    this.selectedRecipe.sizeId = 0
    this.selectedRecipe.qty = undefined
    this.EditMode = false
    this.AddMode = true
    this.proccessing = false
    this.selectedRecipe.isActive = true
  }

  SearchRecipe(recipe: RecipeVM) {
    recipe.recipeTypeId = RecipeTypes.DealRecipe
    recipe.clientId = +localStorage.getItem("RMSClientId")
    this.resSvc.SearchRecipe(recipe).subscribe({
      next: (res: RecipeVM[]) => {
        if (res.length != 0)
          this.recipes = res;
        else
          this.recipes = []
        console.warn(res)
        this.dataSource = new MatTableDataSource(this.recipes);
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 4000)
        console.warn(e);
      }
    })
  }
  SearchRecipeByEntity() {
    var recipe = new RecipeVM
    recipe.entityId = this.selectedRecipe.entityId
    this.SearchRecipe(recipe)
  }
  SearchRecipeByRModifierandEntity() {
    var recipe = new RecipeVM
    if (this.selectedRecipe.entityId != 0 && this.selectedRecipe.entityId != undefined)
      recipe.entityId = this.selectedRecipe.entityId
    if (this.selectedRecipe.recipeModifierId != 0 && this.selectedRecipe.recipeModifierId != undefined)
      recipe.recipeModifierId = this.selectedRecipe.recipeModifierId
    this.SearchRecipe(recipe)
  }


  CalculateAmount() {
    debugger
    if (this.selectedRecipe.uom != undefined && this.selectedRecipe.uom != null) {
      //   await this.SearchSelectedRawItem(this.selectedRecipe.rawItemId)
      if (this.uomCnvrsn.length != 0 && this.uomCnvrsn != undefined) {
        this.selectedRecipe.amount = (this.selectedRecipe.price / +this.uomCnvrsn[0].conversionRate) * this.selectedRecipe.qty
      } else
        this.selectedRecipe.amount = this.selectedRecipe.price * this.selectedRecipe.qty
    }
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
        uomCnvrsn.clientId = +localStorage.getItem("RMSClientId")
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
  GetRecipeBySize() {
    var itmRecipe = new RecipeVM
    itmRecipe.sizeId = this.selectedRecipe.sizeId
    itmRecipe.clientId = +localStorage.getItem("RMSClientId")
    this.resSvc.SearchRecipe(itmRecipe).subscribe({
      next: (res: RecipeVM[]) => {
        if (res.length != 0)
          this.recipes = res;
        else
          this.recipes = []
        this.dataSource = new MatTableDataSource(this.recipes);
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
    if (!evt) this.filteredItem = this.attachItems;
    else {
      this.filteredItem = this.attachItems.filter(item => (item.id + "") === evt || item.itemName.toLocaleLowerCase().indexOf(evt.toLocaleLowerCase()) >= 0);
    }
  }
  SearchinGroup(evt: any) {
    debugger
    evt = evt + "";
    if (!evt) this.filteredGroup = this.Groups;
    else {
      this.filteredGroup = this.Groups.filter(item => (item.id + "") === evt || item.name.toLocaleLowerCase().indexOf(evt.toLocaleLowerCase()) >= 0);
    }
  }
  SearchinEntity(evt: any) {
    evt = evt + "";
    if (!evt) this.filteredEntity = this.Items;
    else {
      this.filteredEntity = this.Items.filter(val => (val.id + "") === evt || val.itemName.toLocaleLowerCase().indexOf(evt.toLocaleLowerCase()) >= 0);
    }
  }
}

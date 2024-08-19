import { ChangeDetectorRef, Component, OnInit, ViewChild } from '@angular/core';
import { NgForm } from '@angular/forms';
import { MatTableDataSource } from '@angular/material/table';
import { CatalogService } from '../../catalog/catalog.service';
import { SettingsVM } from '../../catalog/Models/SettingsVM';
import { EnumTypeVM } from '../Models/Enums/EnumTypeVM';
import { ItemTypes } from '../Models/Enums/ItemType';
import { RecipeTypes } from '../Models/Enums/RecipeTypes';
import { ItemVM } from '../Models/ItemVM';
import { RecipeVM } from '../Models/RecipeVM';
import { SubItemsVM } from '../Models/SubItemsVM';
import { UOMConversionVM } from '../Models/UOMConversionVM';
import { RestaurantService } from '../restaurant.service';
import { RouteIds } from '../../catalog/Models/Enums/RouteIds';

@Component({
  selector: 'app-sub-item-recipe',
  templateUrl: './sub-item-recipe.component.html',
  styleUrls: ['./sub-item-recipe.component.css']
})
export class SubItemRecipeComponent implements OnInit {
  selectedRecipe: RecipeVM
  AddMode: boolean = true
  EditMode: boolean = false
  proccessing: boolean = false
  dataSource: any
  recipes: RecipeVM[] = []
  rawItems: ItemVM[]
  orderTypes: SettingsVM[]
  subItems: SubItemsVM[]
  uomCnvrsn: UOMConversionVM[] = []
  @ViewChild('recipeForm', { static: true }) recipeForm!: NgForm;
  isReadOnly: boolean = false
  displayedColumns: string[] = ['RawItem', 'UOM', 'QTY', 'Amount', 'orderType', 'isActive', 'Action'];
  constructor(
    private cdref: ChangeDetectorRef,
    public resSvc: RestaurantService,
    public catSvc: CatalogService
  ) {
    this.selectedRecipe = new RecipeVM
  }
  ngOnInit() {
    this.isReadOnly = this.catSvc.getPermission(RouteIds.SubItems)
    this.recipes = []
    this.Refresh();
    this.GetSubItems();
    this.GetRawItems();
    this.GetSettings(EnumTypeVM.OrderTypes)
  }
  Refresh() {
    this.selectedRecipe = new RecipeVM;
    this.AddMode = true;
    this.EditMode = false;
    this.uomCnvrsn.length = 0
    this.selectedRecipe.isActive = true
  }
  GetSettings(etype: EnumTypeVM) {
    var setting = new SettingsVM()
    setting.enumTypeId = etype
    setting.isActive = true
    this.resSvc.SearchSettings(setting).subscribe({
      next: (res: SettingsVM[]) => {
        if (etype == EnumTypeVM.OrderTypes)
          this.orderTypes = res;
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
  GetRecipes() {
    var recipe = new RecipeVM
    recipe.entityId = this.selectedRecipe.entityId
    this.SearchRecipes(recipe)
  }
  GetRecipeById(id: number) {
    var recipe = new RecipeVM
    recipe.id = id
    recipe.recipeTypeId = RecipeTypes.SubItemRecipe
    recipe.clientId = +localStorage.getItem("RMSClientId")
    this.resSvc.SearchRecipe(recipe).subscribe({
      next: (res: RecipeVM[]) => {
        this.selectedRecipe = res[0]
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 4000)
        console.warn(e);
      }
    })
  }
  SearchRecipes(recipe: RecipeVM) {
    recipe.recipeTypeId = RecipeTypes.SubItemRecipe
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
  GetSubItems() {
    var itm = new SubItemsVM();
    itm.isActive = true
    itm.clientId = +localStorage.getItem("RMSClientId")
    this.resSvc.SearchSubItems(itm).subscribe({
      next: (res: SubItemsVM[]) => {
        this.subItems = res
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 4000)
        console.warn(e);
      }
    })
  }
  CheckValidation() {
    if (this.selectedRecipe.rawItemId == 0 || this.selectedRecipe.rawItemId == undefined)
      this.recipeForm.form.controls['rawItemId'].setErrors({ 'incorrect': true });
    if (this.selectedRecipe.orderTypeId == 0 || this.selectedRecipe.orderTypeId == undefined)
      this.recipeForm.form.controls['orderTypeId'].setErrors({ 'incorrect': true });
    if (this.selectedRecipe.entityId == 0 || this.selectedRecipe.entityId == undefined)
      this.recipeForm.form.controls['entityId'].setErrors({ 'incorrect': true });
  }
  AddRecipetoList() {
    this.CheckValidation();
    if (!this.recipeForm.invalid) {
      this.CalculateAmount()
      var recipe = new RecipeVM
      recipe.entityId = this.selectedRecipe.entityId
      recipe.rawItemId = this.selectedRecipe.rawItemId
      recipe.clientId = +localStorage.getItem("RMSClientId")
      recipe.recipeTypeId = RecipeTypes.SubItemRecipe
      this.resSvc.SearchRecipe(recipe).subscribe({
        next: (res: RecipeVM[]) => {
          if (this.EditMode)
            res = res.filter(x => x.id != this.selectedRecipe.id)
          if (res.length == 0) {
            this.selectedRecipe.clientId = +localStorage.getItem("RMSClientId")
            this.selectedRecipe.recipeTypeId = RecipeTypes.SubItemRecipe
            if (this.EditMode)
              this.UpdateRecipe()
            else
              this.SaveRecipe();
          } else {
            this.catSvc.ErrorMsgBar("This Raw Item Already Added", 4000)
            var recipe = new RecipeVM
            recipe.entityId = this.selectedRecipe.entityId
            this.SearchRecipes(recipe)
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
        var recipe = new RecipeVM
        recipe.entityId = this.selectedRecipe.entityId
        this.SearchRecipes(recipe)
        var subItemId = this.selectedRecipe.entityId
        this.Refresh();
        this.selectedRecipe.entityId = subItemId
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
        var recipe = new RecipeVM
        recipe.entityId = this.selectedRecipe.entityId
        this.SearchRecipes(recipe)
        var subItemId = this.selectedRecipe.entityId
        this.Refresh();
        this.selectedRecipe.entityId = subItemId
        this.proccessing = false
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 4000)
        this.proccessing = false
      }
    })
  }
  EditRecipe(recipe: RecipeVM) {
    this.GetRecipeById(recipe.id)
    this.selectedRecipe = recipe
    this.AddMode = false
    this.EditMode = true
    window.scrollTo(0, 0)
    this.SearchSelectedRawItem(this.selectedRecipe.rawItemId)
  }
  DeleteRecipe(recipe: RecipeVM) {

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
}

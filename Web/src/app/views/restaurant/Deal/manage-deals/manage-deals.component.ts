import { CatalogService } from '../../../catalog/catalog.service';
import { ItemTypes } from '../../Models/Enums/ItemType';
import { SettingsVM } from 'src/app/views/catalog/Models/SettingsVM';
import { Component, OnInit, ViewChild } from '@angular/core';
import { NgForm } from '@angular/forms';
import { MatDialog } from '@angular/material/dialog';
import { MatSnackBar } from '@angular/material/snack-bar';
import { MatTableDataSource } from '@angular/material/table';
import Swal from 'sweetalert2';
import { ItemVM } from '../../Models/ItemVM';
import { RestaurantService } from '../../restaurant.service';
import { EnumTypeVM } from '../../Models/Enums/EnumTypeVM';
import { SettingsTypeVM } from '../../../catalog/Models/SettingsTypeVM';
import { RuntimeModifierVM } from '../../Models/RuntimeModifierVM';
import { ManageEnumLineComponent } from 'src/app/views/catalog/manage-enum-line/manage-enum-line.component';
import { RouteIds } from 'src/app/views/catalog/Models/Enums/RouteIds';

@Component({
  selector: 'app-manage-deals',
  templateUrl: './manage-deals.component.html',
  styleUrls: ['./manage-deals.component.css']
})
export class ManageDealsComponent implements OnInit {
  isUniqueName: boolean = true
  selectedMenuItem: number = 0
  proccessing: boolean = false;
  Edit: boolean = false;
  Add: boolean = true;
  public date = new Date();
  menuItems!: ItemVM[]
  rawItems!: ItemVM[]
  modifierTypes?: SettingsVM[]
  deals?: ItemVM[];
  kds?: SettingsVM[]
  stage?: SettingsVM[]
  SettingsType?: SettingsTypeVM[];
  RuntimeModifier: RuntimeModifierVM[] | undefined;
  @ViewChild('userForm', { static: true }) userForm!: NgForm;
  displayedColumns: string[] = ['menuItem', 'modifierName', 'stage', 'stageQtyAllowed', 'rawItem', 'price', 'qty', 'type', 'isActive', 'actions'];
  dataSource: any;
  filteredData: any;
  selectedRuntimeModifier: RuntimeModifierVM
  previewImage = false;
  currentLightBoxImage: any
  isReadOnly: boolean = false
  constructor(
    public resSvc: RestaurantService,
    public dialog: MatDialog,
    public catSvc: CatalogService) {
    this.selectedRuntimeModifier = new RuntimeModifierVM();
  }
  ngOnInit(): void {
    this.isReadOnly = this.catSvc.getPermission(RouteIds.RecipeModifier)
    this.Add = true;
    this.Edit = false;
    this.selectedRuntimeModifier = new RuntimeModifierVM
    this.GetRuntimeModifier();
    this.GetItems();
    this.GetSettingsType();
    this.selectedRuntimeModifier.isActive = true;
    this.GetSettings(EnumTypeVM.KDS)
  }
  GetSettings(enumType: EnumTypeVM) {
    var stng = new SettingsVM
    stng.isActive = true;
    stng.enumTypeId = enumType
    stng.clientId = +localStorage.getItem("RMSClientId")
    this.catSvc.SearchSettings(stng).subscribe({
      next: (res: SettingsVM[]) => {
        if (enumType == EnumTypeVM.KDS)
          this.kds = res
      }, error: (err) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
      },
    })
  }
  GetSettingsType() {
    var type = new SettingsTypeVM();
    type.isActive = true
    this.resSvc.SearchSettingsType(type).subscribe({
      next: (res: SettingsTypeVM[]) => {
        this.SettingsType = res
        this.GetValues();
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred !", 6000)
      }
    })
  }
  async GetValues() {
    var ModifierTypes = this.SettingsType?.find(x => x.id == EnumTypeVM.ModifierTypes)
    if (ModifierTypes != undefined)
      await this.SetValues(ModifierTypes.id, ModifierTypes.keyCode)
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
  SetValues(type: number, keyCode: string) {
    this.resSvc.SearchStng(type, keyCode).subscribe({
      next: (res: SettingsVM[]) => {
        if (type == EnumTypeVM.ModifierTypes)
          this.modifierTypes = res;
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred !", 6000)
      }
    })
  }
  handleFileInput(e: any) {
    debugger
    for (let index = 0; index < e.target.files.length; index++) {
      var reader = new FileReader();
      reader.readAsDataURL(e.target.files[index]);
      reader.onload = (event: any) => {
        this.selectedRuntimeModifier.imageBase64Path = event.target.result
      };
    }
  }
  GetItems() {
    var item = new ItemVM
    item.clientId = +localStorage.getItem("RMSClientId")
    item.isActive = true
    this.resSvc.SearchItem(item).subscribe({
      next: (res: ItemVM[]) => {
        this.rawItems = res.filter(x => x.itemTypeId == ItemTypes.RawItem && x.isActive == true)
        this.menuItems = res.filter(x => x.itemTypeId == ItemTypes.MenuItem && x.price != 0 && x.isActive == true)

      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred !", 6000)
        console.warn(e);
      }
    })
  }
  onPreviewImage(): void {
    this.previewImage = true
    this.currentLightBoxImage = this.selectedRuntimeModifier.imageBase64Path
  }
  onClosePreview() {
    this.previewImage = false;
  }
  GetRuntimeModifier() {
    var runMod = new RuntimeModifierVM
    runMod.clientId = +localStorage.getItem("RMSClientId")
    this.resSvc.SearchRuntimeModifier(runMod).subscribe({
      next: (res: RuntimeModifierVM[]) => {
        this.RuntimeModifier = res;
        this.dataSource = new MatTableDataSource(this.RuntimeModifier);
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred !", 6000)
        console.warn(e);
      }
    })
  }
  SearchRunTimeModier(id: number) {
    var modifier = new RuntimeModifierVM
    modifier.menuItemId = id
    modifier.clientId = +localStorage.getItem("RMSClientId")
    this.resSvc.SearchRuntimeModifier(modifier).subscribe({
      next: (res: RuntimeModifierVM[]) => {
        this.RuntimeModifier = res;
        this.dataSource = new MatTableDataSource(this.RuntimeModifier);
        if (this.selectedRuntimeModifier.modifierName != null)
          this.SearchModifierByName()
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred !", 6000)
        console.warn(e);
      }
    })
  }
  CheckValidation() {
    if (this.selectedRuntimeModifier.menuItemId == 0 || this.selectedRuntimeModifier.menuItemId == undefined)
      this.userForm.form.controls['menuItemId'].setErrors({ "incorrect": true })
    if (this.selectedRuntimeModifier.typeId == 0 || this.selectedRuntimeModifier.typeId == undefined)
      this.userForm.form.controls['typeId'].setErrors({ "incorrect": true })
    if (this.selectedRuntimeModifier.stageId == 0 || this.selectedRuntimeModifier.stageId == undefined)
      this.userForm.form.controls['stageId'].setErrors({ "incorrect": true })
  }
  DeleteRuntimeModifier(value: ItemVM) {
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
        this.resSvc.DeleteRuntimeModifier(value.id).subscribe({
          next: (data) => {
            Swal.fire(
              'Deleted!',
              'RuntimeModifier has been deleted.',
              'success'
            )
            if (value.menuItemId != 0)
              this.ngOnInit()
            this.SearchRunTimeModier(value.menuItemId)
            this.selectedRuntimeModifier.menuItemId = value.menuItemId
          }, error: (e) => {
            this.catSvc.ErrorMsgBar("Error Occurred !", 6000)
            console.warn(e);
          }
        })
      }
    })
  }
  GetRuntimeModifierForEdit(value: RuntimeModifierVM) {
    window.scrollTo(0, 0)
    this.selectedRuntimeModifier = value
    this.Edit = true;
    this.Add = false;
    this.SearchRunTimeModier(this.selectedRuntimeModifier.menuItemId)
  }
  SaveRuntimeModifier() {
    debugger
    this.CheckValidation();
    if (!this.userForm.invalid) {
      debugger
      if (this.isUniqueName == true) {
        this.proccessing = true
        this.selectedRuntimeModifier.clientId = +localStorage.getItem("RMSClientId")
        this.selectedMenuItem = this.selectedRuntimeModifier.menuItemId
        if (this.Edit)
          this.UpdateRuntimeModifier()
        else
          this.resSvc.SaveRuntimeModifier(this.selectedRuntimeModifier).subscribe({
            next: (res) => {
              this.catSvc.SuccessMsgBar("Successfully Added!", 6000)
              this.Add = true;
              this.Edit = false;
              this.proccessing = false
              this.selectedRuntimeModifier = new RuntimeModifierVM
              this.selectedRuntimeModifier.menuItemId = this.selectedMenuItem
              this.SearchRunTimeModier(this.selectedMenuItem)
              this.selectedRuntimeModifier.isActive = true;
            }, error: (e) => {
              this.catSvc.ErrorMsgBar("Error Occurred !", 6000)
              console.warn(e);
              this.proccessing = false
            }
          })
      }
      else
        this.catSvc.ErrorMsgBar("Please Change the Modifier Name as a Modifier with this Name already exist in this Item", 6000)
    } else
      this.catSvc.ErrorMsgBar("Please Fill all required fields!", 6000)
  }
  UpdateRuntimeModifier() {
    this.resSvc.UpdateRuntimeModifier(this.selectedRuntimeModifier).subscribe({
      next: (res) => {
        this.catSvc.SuccessMsgBar(" Successfully Updated!", 6000)
        this.Add = true;
        this.Edit = false;
        this.proccessing = false
        this.selectedRuntimeModifier = new RuntimeModifierVM
        this.selectedRuntimeModifier.menuItemId = this.selectedMenuItem
        this.SearchRunTimeModier(this.selectedMenuItem)
        this.selectedRuntimeModifier.isActive = true;
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred !", 6000)
        console.warn(e);
        this.proccessing = false
      }
    })
  }
  onBlurName() {
    if (this.selectedRuntimeModifier.menuItemId != 0 && this.selectedRuntimeModifier.menuItemId != undefined)
      this.SearchModifierByName();
  }
  async SearchModifierByName() {
    this.isUniqueName = true
    var mod = new RuntimeModifierVM
    mod.menuItemId = this.selectedRuntimeModifier.menuItemId
    mod.modifierName = this.selectedRuntimeModifier.modifierName
    mod.clientId = +localStorage.getItem("RMSClientId")
    await this.resSvc.SearchRuntimeModifier(mod).subscribe({
      next: (value: RuntimeModifierVM[]) => {
        debugger
        if (this.Edit)
          value = value.filter(x => x.id != this.selectedRuntimeModifier.id)
        if (value.length > 0)
          this.isUniqueName = false
        else this.isUniqueName = true
      }, error: (err) => {

      },
    })
  }
  Refresh() {
    this.selectedRuntimeModifier = new RuntimeModifierVM
    this.Add = true;
    this.Edit = false;
    this.selectedRuntimeModifier.isActive = true;
  }
  QtyChange(event: any) {
    this.selectedRuntimeModifier.stageQtyAllowed = this.selectedRuntimeModifier.qty
  }
  filter(event: any) {
    const filterValue = event.target.value.toLowerCase();
    var value = this.menuItems;
    this.menuItems = value.filter(option => option.itemName.toLowerCase() == filterValue);
  }
  AutoCompleteSearch(evt: string) {
    evt = evt + "";
    if (!evt) this.filteredData = this.menuItems;
    else {
      /** uses both id and text fields for extensive filtering (case insensitive) . can be tailored for custom needs */
      this.filteredData = this.menuItems.filter(item => (item.id + "") === evt || item.itemName.toLocaleLowerCase().indexOf(evt.toLocaleLowerCase()) >= 0);
    }
  }
}


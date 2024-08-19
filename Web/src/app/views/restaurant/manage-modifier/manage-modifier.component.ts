import { ItemTypes } from './../Models/Enums/ItemType';
import { SettingsVM } from '../../catalog/Models/SettingsVM';
import { ItemsService } from 'src/app/views/items/items.service';
import { ModifierVM } from './../Models/ModifierVM';
import { CatalogService } from './../../catalog/catalog.service';
import { Component, OnInit, ViewChild } from '@angular/core';
import { NgForm } from '@angular/forms';
import { RestaurantService } from '../restaurant.service';
import { MatTableDataSource } from '@angular/material/table';
import Swal from 'sweetalert2';
import { EnumTypeVM } from '../Models/Enums/EnumTypeVM';
import { ItemVM } from '../Models/ItemVM';
import { ManageEnumLineComponent } from '../../catalog/manage-enum-line/manage-enum-line.component';
import { MatDialog } from '@angular/material/dialog';
import { RouteIds } from '../../catalog/Models/Enums/RouteIds';

@Component({
  selector: 'app-manage-modifier',
  templateUrl: './manage-modifier.component.html',
  styleUrls: ['./manage-modifier.component.css']
})
export class ManageModifierComponent implements OnInit {
  proccessing: boolean = false;
  Edit: boolean = false;
  Add: boolean = true;
  rawItems?: ItemVM[]
  KDSs?: SettingsVM[]
  selectedModifier: ModifierVM = new ModifierVM
  Modifier: ModifierVM[] | undefined;
  Modifieres?: ModifierVM[];
  @ViewChild('userForm', { static: true }) userForm!: NgForm;
  displayedColumns: string[] = ['name', 'price', 'qty', 'rawItem', 'isActive', 'actions'];
  dataSource: any;
  isReadOnly: boolean = false
  constructor(
    public dialog: MatDialog,
    public itemSvc: ItemsService,
    public resSvc: RestaurantService,
    private catSvc: CatalogService,) {
    this.selectedModifier = new ModifierVM();
  }
  ngOnInit(): void {
    this.isReadOnly = this.catSvc.getPermission(RouteIds.Modifier)
    this.Add = true;
    this.Edit = false;
    this.selectedModifier = new ModifierVM
    this.GetModifier();
    this.GetKDS()
    this.GetRawItem()
    this.selectedModifier.isActive = true;
  }
  GetModifier() {
    var modifier = new ModifierVM
    modifier.clientId = +localStorage.getItem("RMSClientId")
    this.resSvc.SearchModifier(modifier).subscribe({
      next: (res: ModifierVM[]) => {
        this.Modifier = res;
        this.dataSource = new MatTableDataSource(this.Modifier);
      }, error: (e) => {
        this.catSvc.ErrorMsgBar('Error Occured!', 4000)
        console.warn(e);
      }
    })
  }
  GetKDS() {
    var stn = new SettingsVM()
    stn.enumTypeId = EnumTypeVM.KDS
    stn.isActive = true
    stn.clientId = +localStorage.getItem("RMSClientId")
    this.itemSvc.SearchSettings(stn).subscribe({
      next: (res: SettingsVM[]) => {
        this.KDSs = res;
      }, error: (e) => {
        this.catSvc.ErrorMsgBar('Error Occured!', 4000)
        console.warn(e);
      }
    })
  }
  GetRawItem() {
    var itm = new ItemVM()
    itm.itemTypeId = ItemTypes.RawItem
    itm.isActive = true
    itm.clientId = +localStorage.getItem("RMSClientId")
    this.resSvc.SearchItem(itm).subscribe({
      next: (res: ItemVM[]) => {
        this.rawItems = res;
      }, error: (e) => {
        this.catSvc.ErrorMsgBar('Error Occured!', 4000)
        console.warn(e);
      }
    })
  }
  DeleteModifier(id: number) {
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
        this.resSvc.DeleteModifier(id).subscribe({
          next: (data) => {
            Swal.fire(
              'Deleted!',
              'Modifier has been deleted.',
              'success'
            )
            this.GetModifier();
          }, error: (e) => {
            this.catSvc.ErrorMsgBar('Error Occured!', 4000)
            console.warn(e);
          }
        })
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
        this.GetKDS()
      }
    })
  }
  GetModifierForEdit(id: number) {
    window.scrollTo(0, 0)
    this.selectedModifier = new ModifierVM;
    this.selectedModifier.id = id
    this.selectedModifier.clientId = +localStorage.getItem("RMSClientId")
    this.resSvc.SearchModifier(this.selectedModifier).subscribe({
      next: (res: ModifierVM[]) => {
        this.Modifier = res;
        this.selectedModifier = this.Modifier[0]
        this.Edit = true;
        this.Add = false;
      }, error: (e) => {
        this.catSvc.ErrorMsgBar('Error Occured!', 4000)
        console.warn(e);
      }
    })
  }
  SaveModifier() {
    if (this.selectedModifier.rawItemId == 0 || this.selectedModifier.rawItemId == undefined)
      this.userForm.controls['rawItemId'].setErrors({ 'incorrect': true })
    if (!this.userForm.invalid) {
      this.selectedModifier.clientId = +localStorage.getItem("RMSClientId")
      this.proccessing = true
      if (this.Edit)
        this.UpdateModifier()
      else {
        this.resSvc.SaveModifier(this.selectedModifier).subscribe({
          next: (res) => {
            this.catSvc.SuccessMsgBar('Succedfully Added', 4000)
            this.Add = true;
            this.Edit = false;
            this.proccessing = false
            this.ngOnInit();
          }, error: (e) => {
            this.catSvc.ErrorMsgBar('Error Occured!', 4000)
            console.warn(e);
            this.proccessing = false
          }
        })
      }
    } else {
      this.catSvc.ErrorMsgBar('Please Fill all required fields!', 4000)
    }
  }
  UpdateModifier() {
    this.proccessing = true
    this.resSvc.UpdateModifier(this.selectedModifier).subscribe({
      next: (res) => {
        this.catSvc.SuccessMsgBar('Succedfully Updated', 4000)
        this.Add = true;
        this.Edit = false;
        this.proccessing = false
        this.ngOnInit();
      }, error: (e) => {
        this.proccessing = false
      }
    })
  }
  Refresh() {
    this.selectedModifier == new ModifierVM
    this.Add = true;
    this.Edit = false;
    this.selectedModifier.isActive = true;
  }
}


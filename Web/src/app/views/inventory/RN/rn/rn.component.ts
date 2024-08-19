import { SupplierVM } from '../../../restaurant/Models/SupplierVM';
import { BranchVM } from '../../../restaurant/Models/BranchVM';
import { RestaurantService } from '../../../restaurant/restaurant.service';
import { InventoryService } from './../../inventory.service';
import { InventoryTransferVM } from '../../Models/InventoryTransfer';
import { Component, OnInit, ViewChild } from '@angular/core';
import { NgForm } from '@angular/forms';
import { MatSnackBar } from '@angular/material/snack-bar';
import Swal from 'sweetalert2';
import { CatalogService } from '../../../catalog/catalog.service';
import { MatTableDataSource } from '@angular/material/table';
import { RNLineVM, RNVM } from '../../Models/RNVM';
import { ItemVM } from 'src/app/views/restaurant/Models/ItemVM';
import { ItemTypes } from 'src/app/views/restaurant/Models/Enums/ItemType';
import { ActivatedRoute } from '@angular/router';
import { Location } from '@angular/common';
import * as moment from 'moment';
import { SettingsVM } from 'src/app/views/catalog/Models/SettingsVM';
import { EnumTypeVM } from 'src/app/views/restaurant/Models/Enums/EnumTypeVM';
import { SettingsTypeVM } from 'src/app/views/catalog/Models/SettingsTypeVM';
import { ManageEnumLineComponent } from 'src/app/views/catalog/manage-enum-line/manage-enum-line.component';
import { MatDialog } from '@angular/material/dialog';
import { RequesterTypes } from '../../Enums/RequesterTypes'
import { UserVM } from 'src/app/views/security/models/user-vm';
import { SecurityService } from 'src/app/views/security/security.service';
@Component({
  selector: 'app-rn',
  templateUrl: './rn.component.html',
  styleUrls: ['./rn.component.css']
})
export class RnComponent implements OnInit {
  lineAddMode: boolean = false
  lineUpdateMode: boolean = false;
  proccessing: boolean = false;
  Edit: boolean = false;
  Add: boolean = true;
  RNId!: number
  public date = new Date();
  Requester?: SettingsVM[] = [];
  Types?: SettingsTypeVM[] = [];
  Categories?: SettingsVM[] = [];
  Entities: SettingsVM[] = [];
  Value?: SettingsVM[] = [];
  Reason?: SettingsVM[] = [];
  Status?: SettingsVM[] = [];
  Items?: ItemVM[] = [];
  RNList: RNLineVM[] = []
  selectedRN: RNVM
  RN: RNVM[] | undefined;
  @ViewChild('userForm', { static: true }) userForm!: NgForm;
  @ViewChild('RNDetailForm') RNDetailForm!: NgForm
  selectedRNLine: RNLineVM
  displayedColumns: string[] = ['item', 'requestedQty', 'uom', 'actions'];
  dataSource: any;
  filteredOptions: SettingsVM[];
  constructor(
    private secSvc: SecurityService,
    private dialog: MatDialog,
    public invtrySvc: InventoryService,
    public resSvc: RestaurantService,
    public catSvc: CatalogService,
    private _location: Location,
    private route: ActivatedRoute,
    private snack: MatSnackBar,) {
    this.selectedRN = new RNVM();
    this.selectedRNLine = new RNLineVM
  }
  ngOnInit(): void {
    this.route.queryParams.subscribe(params => {
      this.RNId = params['id'];
    });
    if (this.RNId > 0) {
      this.Edit = true;
      this.Add = false;
      this.GetRNForEdit();
    }
    this.Add = true;
    this.Edit = false;
    this.selectedRN = new RNVM
    //this.GetRN();
    this.GetItems()
    this.getSettings(EnumTypeVM.POStatuses);
    this.getSettings(EnumTypeVM.RequesterTypes);
    this.getSettings(EnumTypeVM.RNReasons);
    this.getRNTypes()
    this.selectedRN.isActive = true
  }
  OnSelectItem(item: ItemVM) {
    this.selectedRNLine.item = item.itemName
    //this.selectedRNLine.uomId = item.uomId
    this.selectedRNLine.uom = item.uom
  }
  getRequesterName(requesterType) {
    if (requesterType > 0) {
      if (requesterType == RequesterTypes.User) {
        var user = new UserVM
        user.id = localStorage.getItem("RMSUserId")
        this.secSvc.SearchUser(user).subscribe({
          next: (res) => {
            this.selectedRN.requester = res[0].name
          }, error: () => {
            this.catSvc.ErrorMsgBar()
          }
        })
      } else if (requesterType == RequesterTypes.Client)
        this.selectedRN.requester = localStorage.getItem("RMSClient")
    } else this.selectedRN.requester = ""
  }
  getRNTypes() {
    var stngType = new SettingsTypeVM
    stngType.parentId = EnumTypeVM.RNTypes
    this.catSvc.SearchSettingsType(stngType).subscribe({
      next: (res) => {
        this.Types = res
      }, error: () => {
        this.catSvc.ErrorMsgBar()
      }
    })
  }
  getSettings(type: number) {
    const stng = new SettingsVM();
    stng.enumTypeId = type;
    stng.isActive = true;
    if (type == EnumTypeVM.RNReasons)
      stng.clientId = +localStorage.getItem("RMSClientId");
    this.catSvc.SearchSettings(stng).subscribe({
      next: (res: SettingsVM[]) => {
        switch (type) {
          case EnumTypeVM.RNReasons:
            this.Reason = res;
            break;
          case EnumTypeVM.POStatuses:
            this.Status = res;
            break;
          case EnumTypeVM.RequesterTypes:
            this.Requester = res;
            break;
          case EnumTypeVM.RNTypes_Internal:
            this.Categories = res;
            break;
          case EnumTypeVM.RNTypes_Purchase:
            this.Categories = res;
            break;
          case EnumTypeVM.RNTypes_Sales:
            this.Categories = res;
            break;
        }
      },
      error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000);
      }
    });
  }
  onSelectReason(event) {
    this.selectedRN.reason = event.option.value.name;
  }
  onClickReason(stng) {
    this.selectedRN.reason = stng.name
  }
  filterReason() {
    var filterValue;
    if (this.selectedRN.reason !== undefined) {
      filterValue = this.selectedRN.reason.toString().toLowerCase();
      this.filteredOptions = this.Reason.filter(x => x.name.toString().toLowerCase().includes(filterValue))
    } else this.filteredOptions = this.Reason
    //this.filteredOptions = this.options.filter(o => o.toLowerCase().includes(filterValue));
  }
  openReasonDialog() {
    let dialogRef = this.dialog.open(ManageEnumLineComponent, {
      disableClose: true, panelClass: 'calendar-form-dialog', width: '750px', height: '500px'
      , data: { enumTypeId: EnumTypeVM.RNReasons, isDialog: true, clientId: +localStorage.getItem("RMSClientId") }
    });
    dialogRef.afterClosed().subscribe({
      next: (res) => {
        this.getSettings(EnumTypeVM.RNReasons)
      }
    })
  }
  AddLinetoList() {
    debugger
    this.selectedRNLine.clientId = +localStorage.getItem("RMSClientId");
    if (this.selectedRNLine.itemId == undefined || this.selectedRNLine.itemId == 0)
      this.RNDetailForm.form.controls['itemId'].setErrors({ 'incorrect': true })
    if (!this.RNDetailForm.invalid) {
      if (this.lineUpdateMode == true)
        this.RNList = this.RNList.filter(x => x != this.selectedRNLine)
      this.RNList.push(this.selectedRNLine)
      this.dataSource = new MatTableDataSource(this.RNList);
      console.warn(this.RNList)
      this.selectedRNLine = new RNLineVM
      this.lineUpdateMode = false
    }
    else
      this.catSvc.ErrorMsgBar("Please Fill all required fields", 6000)
  }
  RefreshLine() {
    this.selectedRNLine = new RNLineVM
    this.lineUpdateMode = false
  }
  GetItems() {
    var item = new ItemVM
    item.clientId = +localStorage.getItem("RMSClientId");
    item.itemTypeId = ItemTypes.RawItem
    this.resSvc.SearchItem(item).subscribe({
      next: (res: ItemVM[]) => {
        this.Items = res;
        this.selectedRNLine.uom = undefined
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  // GetRN() {
  //   var rn = new RNVM
  //   rn.clientId = +localStorage.getItem("RMSClientId");
  //   this.invtrySvc.SearchRN(rn).subscribe({
  //     next: (res: RNVM[]) => {
  //       this.RN = res;
  //       //  this.dataSource = new MatTableDataSource(this.RN);
  //     }, error: (e) => {
  //       this.catSvc.ErrorMsgBar("Error Occurred", 5000)
  //       console.warn(e);
  //     }
  //   })
  // }
  GetRNForEdit() {
    var pr = new RNVM;
    pr.id = this.RNId
    pr.clientId = +localStorage.getItem("RMSClientId");
    this.invtrySvc.SearchRN(pr).subscribe({
      next: (res: RNVM[]) => {
        console.warn(res)
        this.RN = res;
        this.selectedRN = this.RN[0]
        this.getSettings(this.selectedRN.typeId)
        this.RNList = []
        this.selectedRN.rnLines?.forEach(element => {
          this.RNList.push(element)
        });
        this.dataSource = new MatTableDataSource(this.selectedRN.rnLines)
        this.Edit = true;
        this.Add = false;
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  Refresh() {
    this.selectedRNLine = new RNLineVM
    this.selectedRN = new RNVM;
    this.Add = true;
    this.Edit = false;
    this.RNList = []
    this.lineUpdateMode = false
    this.dataSource = new MatTableDataSource(this.RNList);
  }
  delete(val: RNLineVM) {
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
        if (val.id > 0) {
          var pr = new RNVM
          pr = this.selectedRN
          pr.rnLines = []
          val.dBoperation = 3
          pr.rnLines.push(val)
          this.invtrySvc.UpdateRN(pr).subscribe({
            next: (value) => {
              this.DeleteLine(val);
            }, error: (err) => {
              this.catSvc.ErrorMsgBar("Error Occurred", 3000)
            },
          })
        }
        else
          this.DeleteLine(val);
      }
    })
  }
  DeleteLine(val: RNLineVM) {
    Swal.fire(
      'Deleted!',
      'Successfully Deleted.',
      'success'
    )
    this.RNList = this.RNList.filter(x => x != val)
    this.dataSource = new MatTableDataSource(this.RNList);
  }
  edit(val: RNLineVM) {
    val.clientId = +localStorage.getItem("RMSClientId");
    this.lineUpdateMode = true
    this.selectedRNLine = val
  }
  Submit() {
    debugger
    this.selectedRN.clientId = +localStorage.getItem("RMSClientId");
    this.selectedRNLine.clientId = +localStorage.getItem("RMSClientId");
    if (this.selectedRN.typeId == undefined || this.selectedRN.typeId == 0)
      this.userForm.form.controls['typeId'].setErrors({ 'incorrect': true })
    if (this.selectedRN.statusId == undefined || this.selectedRN.statusId == 0)
      this.userForm.form.controls['statusId'].setErrors({ 'incorrect': true })
    if (this.selectedRN.requesterTypeId == undefined || this.selectedRN.requesterTypeId == 0)
      this.userForm.form.controls['requesterTypeId'].setErrors({ 'incorrect': true })
    if ((this.selectedRN.categoryId == undefined || this.selectedRN.categoryId == 0) && this.selectedRN.typeId > 0)
      this.userForm.form.controls['categoryId'].setErrors({ 'incorrect': true })
    if (!this.userForm.invalid) {
      if (this.RNList.length > 0) {
        this.proccessing = true
        this.selectedRN.rnLines = this.RNList
        this.selectedRN.rnLines.forEach(element => {
          if (element.id > 0)
            element.dBoperation = 2
          else
            element.dBoperation = 1
        });
        this.selectedRN.requiredBefore = moment(this.selectedRN.requiredBefore).toDate()
        this.selectedRN.requiredBefore = new Date(Date.UTC(this.selectedRN.requiredBefore.getFullYear(), this.selectedRN.requiredBefore.getMonth(), this.selectedRN.requiredBefore.getDate()))

        if (this.Edit == true) {
          this.invtrySvc.UpdateRN(this.selectedRN).subscribe({
            next: (res: RNVM) => {
              this.catSvc.SuccessMsgBar(" Successfully Updated!", 5000)
              this.selectedRN = res
              this.RNList = res.rnLines
              this.dataSource = new MatTableDataSource(this.RNList);
              this.proccessing = false
            }, error: (e: any) => {
              this.catSvc.ErrorMsgBar("Error Occurred", 5000)
              console.warn(e);
              this.proccessing = false
            }
          })
        } else {
          this.invtrySvc.SaveRN(this.selectedRN).subscribe({
            next: (res: RNVM) => {
              this.catSvc.SuccessMsgBar(" Successfully Added!", 5000)
              this.Refresh();
              this.proccessing = false
            }, error: (e: any) => {
              this.catSvc.ErrorMsgBar("Error Occurred", 5000)
              console.warn(e);
              this.proccessing = false
            }
          })
        }
      } else {
        this.catSvc.ErrorMsgBar("Please add some  detail to continue...", 5000)
      }
    } else this.catSvc.ErrorMsgBar("Please Fill all required fields!", 5000)
  }
  Back() {
    this._location.back();
  }
}




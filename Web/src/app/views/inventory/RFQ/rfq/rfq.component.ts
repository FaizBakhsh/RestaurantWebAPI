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
import { RFQLineVM, RFQVM } from '../../Models/RfqVM';
import { ItemVM } from 'src/app/views/restaurant/Models/ItemVM';
import { ItemTypes } from 'src/app/views/restaurant/Models/Enums/ItemType';
import { ActivatedRoute } from '@angular/router';
import { Location } from '@angular/common';
import * as moment from 'moment';
import { SettingsVM } from 'src/app/views/catalog/Models/SettingsVM';
import { EnumTypeVM } from 'src/app/views/restaurant/Models/Enums/EnumTypeVM';
@Component({
  selector: 'app-rfq',
  templateUrl: './rfq.component.html',
  styleUrls: ['./rfq.component.css']
})
export class RfqComponent implements OnInit {
  lineAddMode: boolean = false
  lineUpdateMode: boolean = false;
  proccessing: boolean = false;
  Edit: boolean = false;
  Add: boolean = true;
  RFQId!: number
  public date = new Date();
  Statuses?: SettingsVM[] = [];
  Items?: ItemVM[] = [];
  RFQList: RFQLineVM[] = []
  selectedRFQ: RFQVM
  RFQ: RFQVM[] | undefined;
  @ViewChild('userForm', { static: true }) userForm!: NgForm;
  @ViewChild('RFQDetailForm') RFQDetailForm!: NgForm
  selectedRFQLine: RFQLineVM
  displayedColumns: string[] = ['item', 'type', 'group', 'category', 'actions'];;
  dataSource: any;
  constructor(
    public invtrySvc: InventoryService,
    public resSvc: RestaurantService,
    public catSvc: CatalogService,
    private _location: Location,
    private route: ActivatedRoute,
    private snack: MatSnackBar,) {
    this.selectedRFQ = new RFQVM();
    this.selectedRFQLine = new RFQLineVM
  }
  ngOnInit(): void {
    this.route.queryParams.subscribe(params => {
      this.RFQId = params['id'];
    });
    if (this.RFQId > 0) {
      this.Edit = true;
      this.Add = false;
      this.GetRFQForEdit();
    }
    this.Add = true;
    this.Edit = false;
    this.selectedRFQ = new RFQVM
    //this.GetRFQ();
    this.GetItems()
    this.getSettings(EnumTypeVM.POStatuses);
    this.selectedRFQ.isActive = true
  }
  OnSelectItem(item: ItemVM) {
    this.selectedRFQLine.item = item.itemName
    this.selectedRFQLine.type = item.subCategory
    this.selectedRFQLine.category = item.category
    this.selectedRFQLine.group = item.itemGroup

  }
  getSettings(type: number) {
    const stng = new SettingsVM();
    stng.enumTypeId = type;
    stng.isActive = true;
    this.catSvc.SearchSettings(stng).subscribe({
      next: (res: SettingsVM[]) => {
        switch (type) {
          case EnumTypeVM.POStatuses:
            this.Statuses = res;
            break;
        }
      },
      error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000);
      }
    });
  }
  AddLinetoList() {
    debugger
    this.selectedRFQLine.clientId = +localStorage.getItem("RMSClientId");
    if (this.selectedRFQLine.itemId == undefined || this.selectedRFQLine.itemId == 0)
      this.RFQDetailForm.form.controls['itemId'].setErrors({ 'incorrect': true })
    if (!this.RFQDetailForm.invalid) {
      if (this.lineUpdateMode == true)
        this.RFQList = this.RFQList.filter(x => x != this.selectedRFQLine)
      this.RFQList.push(this.selectedRFQLine)
      this.dataSource = new MatTableDataSource(this.RFQList);
      console.warn(this.RFQList)
      this.selectedRFQLine = new RFQLineVM
      this.lineUpdateMode = false
    }
    else
      this.catSvc.ErrorMsgBar("Please Fill all required fields", 6000)
  }
  RefreshLine() {
    this.selectedRFQLine = new RFQLineVM
    this.lineUpdateMode = false
  }
  GetItems() {
    var item = new ItemVM
    item.clientId = +localStorage.getItem("RMSClientId");
    item.itemTypeId = ItemTypes.RawItem
    this.resSvc.SearchItem(item).subscribe({
      next: (res: ItemVM[]) => {
        this.Items = res;
        this.selectedRFQLine.type = undefined
        this.selectedRFQLine.category = undefined
        this.selectedRFQLine.group = undefined
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  // GetRFQ() {
  //   var RFQ = new RFQVM
  //   RFQ.clientId = +localStorage.getItem("RMSClientId");
  //   this.invtrySvc.SearchRFQ(RFQ).subscribe({
  //     next: (res: RFQVM[]) => {
  //       this.RFQ = res;
  //       //  this.dataSource = new MatTableDataSource(this.RFQ);
  //     }, error: (e) => {
  //       this.catSvc.ErrorMsgBar("Error Occurred", 5000)
  //       console.warn(e);
  //     }
  //   })
  // }
  GetRFQForEdit() {
    var pr = new RFQVM;
    pr.id = this.RFQId
    pr.clientId = +localStorage.getItem("RMSClientId");
    this.invtrySvc.SearchRFQ(pr).subscribe({
      next: (res: RFQVM[]) => {
        this.RFQ = res;
        this.selectedRFQ = this.RFQ[0]
        this.RFQList = []
        this.selectedRFQ.rfqLines?.forEach(element => {
          this.RFQList.push(element)
        });
        this.dataSource = new MatTableDataSource(this.selectedRFQ.rfqLines)
        this.Edit = true;
        this.Add = false;
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  Refresh() {
    this.selectedRFQLine = new RFQLineVM
    this.selectedRFQ = new RFQVM;
    this.Add = true;
    this.Edit = false;
    this.RFQList = []
    this.lineUpdateMode = false
    this.dataSource = new MatTableDataSource(this.RFQList);
  }
  delete(val: RFQLineVM) {
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
          var pr = new RFQVM
          pr = this.selectedRFQ
          pr.rfqLines = []
          val.dBoperation = 3
          pr.rfqLines.push(val)
          this.invtrySvc.UpdateRFQ(pr).subscribe({
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
  DeleteLine(val: RFQLineVM) {
    Swal.fire(
      'Deleted!',
      'Successfully Deleted.',
      'success'
    )
    this.RFQList = this.RFQList.filter(x => x != val)
    this.dataSource = new MatTableDataSource(this.RFQList);
  }
  edit(val: RFQLineVM) {
    val.clientId = +localStorage.getItem("RMSClientId");
    this.lineUpdateMode = true
    this.selectedRFQLine = val
  }
  Submit() {
    this.selectedRFQ.clientId = +localStorage.getItem("RMSClientId");
    this.selectedRFQLine.clientId = +localStorage.getItem("RMSClientId");
    if (this.selectedRFQ.statusId == undefined || this.selectedRFQ.statusId == 0)
      this.userForm.form.controls['statusId'].setErrors({ 'incorrect': true })
    if (!this.userForm.invalid) {
      if (this.RFQList.length > 0) {
        this.proccessing = true
        this.selectedRFQ.rfqLines = this.RFQList
        this.selectedRFQ.rfqLines.forEach(element => {
          if (element.id > 0)
            element.dBoperation = 2
          else
            element.dBoperation = 1
        });
        this.selectedRFQ.rfqValidity = moment(this.selectedRFQ.rfqValidity).toDate()
        this.selectedRFQ.rfqValidity = new Date(Date.UTC(this.selectedRFQ.rfqValidity.getFullYear(), this.selectedRFQ.rfqValidity.getMonth(), this.selectedRFQ.rfqValidity.getDate()))

        if (this.Edit == true) {
          this.invtrySvc.UpdateRFQ(this.selectedRFQ).subscribe({
            next: (res: RFQVM) => {
              this.catSvc.SuccessMsgBar(" Successfully Updated!", 5000)
              this.selectedRFQ = res
              this.RFQList = res.rfqLines
              this.dataSource = new MatTableDataSource(this.RFQList);
              this.proccessing = false
            }, error: (e: any) => {
              this.catSvc.ErrorMsgBar("Error Occurred", 5000)
              console.warn(e);
              this.proccessing = false
            }
          })
        } else {
          this.invtrySvc.SaveRFQ(this.selectedRFQ).subscribe({
            next: (res: RFQVM) => {
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
        this.catSvc.ErrorMsgBar("Please add some detail to continue...", 5000)
      }
    } else this.catSvc.ErrorMsgBar("Please Fill all required fields!", 5000)
  }
  Back() {
    this._location.back();
  }
}




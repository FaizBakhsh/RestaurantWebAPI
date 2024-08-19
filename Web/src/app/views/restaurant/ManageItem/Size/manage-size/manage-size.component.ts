import { CatalogService } from '../../../../catalog/catalog.service';
import { ItemTypes } from '../../../Models/Enums/ItemType';
import { GSTVM } from '../../../Models/GSTVM';
import { ItemsService } from '../../../../items/items.service';
import { SettingsVM } from '../../../../catalog/Models/SettingsVM';
import { ItemVM } from '../../../Models/ItemVM';
import { Component, Inject, OnInit, ViewChild } from '@angular/core';
import { MatSnackBar } from '@angular/material/snack-bar';
import { ActivatedRoute } from '@angular/router';
import { SizeVM } from '../../../Models/SizeVM';
import { RestaurantService } from '../../../restaurant.service';
import { EnumTypeVM } from '../../../Models/Enums/EnumTypeVM';
import { NgForm } from '@angular/forms';
import Swal from 'sweetalert2';
import { MatTableDataSource } from '@angular/material/table';
import { Location } from '@angular/common';
import { MAT_DIALOG_DATA, MatDialogRef } from '@angular/material/dialog';
@Component({
  selector: 'app-manage-size',
  templateUrl: './manage-size.component.html',
  styleUrls: ['./manage-size.component.css']
})
export class ManageSizeComponent implements OnInit {
  @ViewChild('userForm', { static: true }) userForm!: NgForm;
  searchedSizes?: SizeVM[]
  proccessing: boolean = false
  sizeId!: number;
  taxVal: number = 0
  Edit: boolean = false;
  Add: boolean = true;
  View: boolean = false;
  Items?: ItemVM[];
  KDS?: SettingsVM[];
  Groups?: SettingsVM[]
  Size!: SizeVM[];
  getSizeById!: SizeVM[];
  dataSource?: any
  selectedSize: SizeVM
  //displayedColumns: string[] = ['SizeName', 'Group', 'Item', 'KDS', 'Price', 'ActualPrice', 'Tax', 'Cost', 'SuggestedPrice', 'CurrentMargin', 'SuggestedMargin', 'Action'];
  constructor(
    private route: ActivatedRoute,
    public resSvc: RestaurantService,
    private catSvc: CatalogService,
    public itmSvc: ItemsService,
    private location: Location,
    public dialogRef: MatDialogRef<ManageSizeComponent>,
    @Inject(MAT_DIALOG_DATA) public data: any,
  ) {
    this.selectedSize = new SizeVM
  }

  ngOnInit(): void {
    this.selectedSize = new SizeVM
    debugger
    if (this.data != null) {
      this.sizeId = this.data.id;
      this.GetSizeById()
    }
    else {
      this.route.queryParams.subscribe(params => {
        this.sizeId = params['id'];
      });
      if (this.sizeId > 0) {
        this.Edit = true;
        this.Add = false;
        this.GetSizeById();
      }
    }
    this.GetSettings(EnumTypeVM.MenuItemGroup)
    this.GetSettings(EnumTypeVM.KDS)
    this.GetItems();
  }
  GetSize() {
    if (this.selectedSize.itemId != 0 && this.selectedSize.itemId != undefined) {
      var size = new SizeVM
      size.itemId = this.selectedSize.itemId
      this.resSvc.SearchSize(size).subscribe({
        next: (res: SizeVM[]) => {
          this.searchedSizes = res;
          //this.dataSource = new MatTableDataSource(this.searchedSizes);
        }, error: (e) => {
          this.catSvc.ErrorMsgBar("Error Occurred", 5000)
          console.warn(e);
        }
      })
    }
  }
  GetItems() {
    var itm = new ItemVM();
    itm.itemTypeId = ItemTypes.MenuItem;
    itm.isActive = true
    this.resSvc.SearchItem(itm).subscribe({
      next: (res: ItemVM[]) => {
        this.Items = res
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
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
        if (etype == EnumTypeVM.KDS)
          this.KDS = res;
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  SaveSize() {
    if (this.selectedSize.groupId == 0 || this.selectedSize.groupId == undefined)
      this.userForm.controls['groupId'].setErrors({ 'incorrect': true })
    if (this.selectedSize.itemId == 0 || this.selectedSize.itemId == undefined)
      this.userForm.controls['itemId'].setErrors({ 'incorrect': true })
    if (!this.userForm.invalid) {
      var size = new SizeVM
      size.itemId = this.selectedSize.itemId
      size.clientId = +localStorage.getItem("RMSClientId")
      this.resSvc.SearchSize(size).subscribe({
        next: (value: SizeVM[]) => {
          if (this.selectedSize.id > 0)
            value = value.filter(x => x.id != this.selectedSize.id)
          var find = value.find(x => x.sizeName?.toLocaleLowerCase() == this.selectedSize.sizeName?.toLocaleLowerCase())
          if (find == undefined) {
            this.selectedSize.clientId = +localStorage.getItem("RMSClientId")
            this.proccessing = true
            if (this.sizeId > 0 || this.Edit) {
              this.PutSize();
            } else {
              this.resSvc.SaveSize(this.selectedSize).subscribe({
                next: (res) => {
                  this.catSvc.SuccessMsgBar("Size Added!", 6000)
                  this.GetSize()
                  this.ngOnInit();
                  this.Refresh();
                  this.proccessing = false
                }, error: (e) => {
                  console.warn(e)
                  this.catSvc.ErrorMsgBar("Error Occurred", 5000)
                  this.proccessing = false
                }
              })
            }
          } else {
            this.catSvc.ErrorMsgBar("This Size Already Exist", 7000)
          }
        }, error: (err) => {

        },
      })
    } else
      this.catSvc.ErrorMsgBar("Please Fill all required fields!", 7000)
  }
  PutSize() {
    if (!this.userForm.invalid) {
      this.selectedSize.clientId = +localStorage.getItem("RMSClientId")
      this.proccessing = true
      this.resSvc.UpdateSize(this.selectedSize).subscribe({
        next: (res) => {
          this.proccessing = false
          this.catSvc.SuccessMsgBar(" Updated Successfully!", 6000)
          //this.GetSize()
          //if (this.sizeId == undefined) {
          //this.Add = true;
          //this.Edit = false
          // this.ngOnInit()
          //}
        }, error: (e) => {
          console.warn(e)
          this.catSvc.ErrorMsgBar("Error Occurred", 5000)
          this.proccessing = false
        }
      })
    } else
      this.catSvc.ErrorMsgBar("Please Fill all required fields!", 7000)
  }
  GetSizeById() {
    var size = new SizeVM
    size.id = this.sizeId
    size.clientId = +localStorage.getItem("RMSClientId")
    this.resSvc.SearchSize(size).subscribe({
      next: (res: SizeVM[]) => {
        debugger
        if (res.length > 0) {
          this.getSizeById = res;
          this.selectedSize = this.getSizeById[0]
          this.selectedSize.inclusiveTax = true
        }
        //this.GetSize()
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  Refresh() {
    this.selectedSize = new SizeVM;
    this.Add = true;
    this.Edit = false;
  }
  SearchItem() {
    var itm = new ItemVM();
    itm.isActive = true
    itm.groupId = this.selectedSize.groupId
    itm.clientId = +localStorage.getItem("RMSClientId")
    itm.itemTypeId = ItemTypes.MenuItem
    this.resSvc.SearchItem(itm).subscribe({
      next: (res: ItemVM[]) => {
        this.Items = res
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  PriceChange(event: any) {
    var gst = new GSTVM();
    gst.clientId = +localStorage.getItem("RMSClientId")
    gst.paymentType = "Cash";
    this.resSvc.SearchGST(gst).subscribe({
      next: (res: GSTVM[]) => {
        this.taxVal = res[0].gst;
        if (this.selectedSize.inclusiveTax) {
          //  this.selectedSize.tax = (this.selectedSize.price * this.taxVal) / 100
          this.selectedSize.actualPrice = (this.selectedSize.price * 100) / (100 + this.taxVal)
          this.selectedSize.tax = this.selectedSize.price - this.selectedSize.actualPrice
        } else {
          // this.selectedSize.tax = (this.selectedSize.actualPrice * this.taxVal) / 100
          this.selectedSize.price = +this.selectedSize.actualPrice + ((this.taxVal * this.selectedSize.actualPrice) / 100)
          this.selectedSize.tax = this.selectedSize.price - this.selectedSize.actualPrice
        }
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  ActualPriceChange(event: any) {
  }
  DeleteSize(value: SizeVM) {
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
        this.selectedSize.itemId = value.itemId
        this.resSvc.DeleteSize(value.id).subscribe({
          next: async (data) => {
            await this.GetSize();
            Swal.fire(
              'Deleted!',
              'Size has been deleted.',
              'success'
            )
          }, error: (e) => {
            this.catSvc.ErrorMsgBar("Error Occurred", 5000)
            console.warn(e);
          }
        })
      }
    })
  }
  EditSize(value: SizeVM) {
    this.selectedSize = value
    this.selectedSize.inclusiveTax = true
    this.Edit = true
    this.Add = false
  }
  Back() {
    //this.location.back()
    this.dialogRef.close()
  }
}



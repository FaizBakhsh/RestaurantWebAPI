
import { UserVM } from './../../../security/models/user-vm';
import { SecurityService } from './../../../security/security.service';
import { ItemsService } from './../../../items/items.service';
import { VoucherVM, VoucherDetailsVM } from './../../Models/VoucherVM';
import { Statuses } from './../../Models/Enums/Statuses';
import { Component, ElementRef, OnInit, ViewChild } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { CatalogService } from 'src/app/views/catalog/catalog.service';
import { MatTableDataSource } from '@angular/material/table';
import { NgForm } from '@angular/forms';
import { Location } from '@angular/common';
import Swal from 'sweetalert2';
import * as moment from 'moment';
import { MatCheckboxChange } from '@angular/material/checkbox';
import { VoucherTypeVM } from '../../Models/VoucherTypeVM';
import { ChangeDetectorRef } from '@angular/core';
import { SettingsVM } from 'src/app/views/catalog/Models/SettingsVM';
import { ItemVM } from 'src/app/views/restaurant/Models/ItemVM';
import { SupplierVM } from 'src/app/views/restaurant/Models/SupplierVM';
import { AccountService } from '../../account.service';
import { EnumTypeVM } from 'src/app/views/restaurant/Models/Enums/EnumTypeVM';
import { AccountLevels } from 'src/app/views/account/Models/Enums/AccountLevels';
import { RestaurantService } from 'src/app/views/restaurant/restaurant.service';
import { ChartOfAccountVM } from '../../Models/ChartOfAccountVM';
import { AppConstants } from 'src/app/app.constants';

@Component({
  selector: 'app-manage-voucher',
  templateUrl: './manage-voucher.component.html',
  styleUrls: ['./manage-voucher.component.css']
})
export class ManageVoucherComponent implements OnInit {
  defVal = "N/A"
  color = "red"
  even = "even"
  vchDetailId = 0
  addButton = true
  isvchDebitAmtRequired: boolean = true
  isvchCreditAmtRequired: boolean = true
  isInvNoRequired: boolean = false
  isLoading: boolean = false;
  lineAddMode: boolean = false
  lineEditMode: boolean = true
  Edit: boolean = false;
  Add: boolean = true;
  Accounts?: ChartOfAccountVM[]
  VoucherTypes?: VoucherTypeVM[]
  vchId!: number
  getVchById!: VoucherVM[];
  selectedVoucher: VoucherVM
  selectedVoucherDetail = new VoucherDetailsVM
  selectedDetail = new VoucherDetailsVM
  voucherDetails: VoucherDetailsVM[] = []
  selectedVoucherType?: VoucherTypeVM
  @ViewChild('voucherForm', { static: true }) voucherForm!: NgForm;
  @ViewChild('voucherDetailForm', { static: true }) voucherDetailForm!: NgForm;
  @ViewChild('saleInvoice') saleInvoice: ElementRef;
  displayedColumns: string[] = ['acName', 'acId', 'vchDebitAmt', 'vchCreditAmt', 'descr', 'actions'];
  dataSource: any
  outputArray = [];
  @ViewChild("vchDebitAmt") vchDebitAmtField?: ElementRef;
  @ViewChild("vchCreditAmt") vchCreditAmtField?: ElementRef;
  public vchStatuses = Statuses;
  constructor(
    private resSvc: RestaurantService,
    private cdref: ChangeDetectorRef,
    public acntSvc: AccountService,
    private route: ActivatedRoute,
    private _location: Location,
    public itmSvc: ItemsService,
    public securitySvc: SecurityService,
    public catSvc: CatalogService,) {
    this.selectedVoucher = new VoucherVM();
    this.selectedVoucherDetail = new VoucherDetailsVM()

  }
  ngOnInit(): void {
    this.vchDetailId = 0
    this.voucherDetails = []
    this.route.queryParams.subscribe(params => {
      this.vchId = params['id'];
    });
    if (this.vchId > 0) {
      this.Edit = true;
      this.Add = false;
      this.GetVoucherById();
    }
    else {
      this.Add = true;
      this.Edit = false;
      this.dataSource = new MatTableDataSource(this.voucherDetails);
    }
    this.lineAddMode = false;
    this.lineEditMode = false;
    this.isInvNoRequired = false;
    this.GetAccounts();
    this.GetVoucherTypes()
    this.selectedVoucher = new VoucherVM();
    this.selectedVoucherDetail = new VoucherDetailsVM()
    this.selectedVoucher.isActive = true
  }
  ngAfterContentChecked() {
    this.cdref.detectChanges();
  }
  GetVoucherTypes() {
    var vchType = new VoucherTypeVM
    vchType.clientId = +localStorage.getItem("RMSClientId")
    this.acntSvc.SearchVoucherType(vchType).subscribe({
      next: (res: VoucherTypeVM[]) => {
        this.VoucherTypes = res;
      }, error: (e) => {
        this.catSvc.ErrorMsgBar()
        console.warn(e);
      }
    })
  }
  GetAccounts() {
    var coa = new ChartOfAccountVM
    coa.coaLevelId = AccountLevels.Level5
    coa.isActive = true
    coa.clientId = +localStorage.getItem("RMSClientId")
    this.acntSvc.SearchChartOfAccount(coa).subscribe({
      next: (res: ChartOfAccountVM[]) => {
        this.Accounts = res;
      }, error: (e) => {
        this.catSvc.ErrorMsgBar()
        console.warn(e);
      }
    })
  }
  GetVoucherById() {
    var vch = new VoucherVM
    vch.id = this.vchId
    vch.clientId = +localStorage.getItem("RMSClientId")
    this.acntSvc.SearchVoucher(vch).subscribe({
      next: (res: VoucherVM[]) => {
        debugger
        this.getVchById = res;
        this.selectedVoucher = this.getVchById[0]
        this.SerachVourcherType(this.selectedVoucher.vchTypeId)
        this.voucherDetails = []
        this.selectedVoucher.voucherDetails?.forEach(element => {
          this.voucherDetails.push(element)
        });
        this.dataSource = new MatTableDataSource(this.voucherDetails);
      }, error: (e) => {
        this.catSvc.ErrorMsgBar()
        console.warn(e);
      }
    })
  }
  SerachVourcherType(vchTypeId: number) {
    var type = new VoucherTypeVM
    type.id = vchTypeId
    type.clientId = +localStorage.getItem("RMSClientId")
    this.acntSvc.SearchVoucherType(type).subscribe({
      next: (value: VoucherTypeVM[]) => {
        this.selectedVoucherType = value[0]
      }, error: (err) => {
        this.catSvc.ErrorMsgBar()
      },
    })
  }
  async Submit() {
    this.SetDates()
    this.selectedVoucher.voucherDetails = this.voucherDetails
    this.isLoading = true
    this.VoucherValidation();
    if (this.selectedVoucher.voucherDetails.length == 0)
      this.catSvc.ErrorMsgBar("Please Add some Voucher Detail!", 5000)
    else {
      debugger
      let sumOfvchDebitAmt: any = 0
      let sumOfvchCreditAmt: any = 0
      this.selectedVoucher.voucherDetails.forEach(element => {
        if (element.vchCreditAmt != undefined)
          sumOfvchCreditAmt += element.vchCreditAmt
      });
      this.selectedVoucher.voucherDetails.forEach(element => {
        if (element.vchDebitAmt != undefined)
          sumOfvchDebitAmt += element.vchDebitAmt
      });
      if (sumOfvchCreditAmt != sumOfvchDebitAmt)
        this.catSvc.ErrorMsgBar("Unable to continue because vchDebitAmt and vchCreditAmt are not equal!", 5000)
      else {
        if (!this.voucherForm.invalid) {
          this.selectedVoucher.clientId = +localStorage.getItem("RMSClientId")
          this.selectedVoucher.statusId = Statuses.UnPosted
          //  if (this.Edit)
          await this.UpdateVoucher();
          // else
          //   this.SaveVoucher()
        } else {
          this.catSvc.ErrorMsgBar("Please Fill all required fields!", 5000)
          this.isLoading = false
        }
      }
    }
    this.isLoading = false
  }
  SaveVoucher() {
    this.selectedVoucher.clientId = +localStorage.getItem("RMSClientId")
    this.acntSvc.SaveVoucher(this.selectedVoucher).subscribe({
      next: (result: VoucherVM) => {
        result.resultMessages.forEach(element => {
          if (element.messageType != AppConstants.ERROR_MESSAGE_TYPE) {
            this.catSvc.SuccessMsgBar(element.message)
            this.ngOnInit();
          }
          else
            this.catSvc.ErrorMsgBar(element.message)
          this.isLoading = false
        });
        this.selectedVoucher = result
        this.voucherDetails = []
        this.selectedVoucher.voucherDetails?.forEach(element => {
          this.voucherDetails.push(element)
        });
        this.dataSource = new MatTableDataSource(result.voucherDetails);

        this.RefreshDetail()
      }, error: (e: any) => {
        this.catSvc.ErrorMsgBar()
        console.warn(e);
        this.voucherDetails = []
        this.isLoading = false
      }
    })
  }
  UpdateVoucher() {
    this.acntSvc.UpdateVoucher(this.selectedVoucher).subscribe({
      next: (res: VoucherVM) => {
        if (this.Edit) {
          if (this.lineEditMode)
            this.catSvc.SuccessMsgBar(" Successfully Updated!", 5000)
          else if (this.lineAddMode)
            this.catSvc.SuccessMsgBar(" Successfully Added!", 5000)
          else
            this.catSvc.SuccessMsgBar(" Successfully Updated!", 5000)
        } else {
          if (this.lineEditMode)
            this.catSvc.SuccessMsgBar(" Successfully Updated!", 5000)
          else
            this.catSvc.SuccessMsgBar(" Successfully Added!", 5000)
        }
        this.selectedVoucher = res
        this.voucherDetails = []
        this.selectedVoucher.voucherDetails?.forEach(element => {
          this.voucherDetails.push(element)
        });
        this.dataSource = new MatTableDataSource(res.voucherDetails);
        this.RefreshDetail()
        this.isLoading = false
        if (!this.Edit && res.statusId == Statuses.UnPosted)
          this.ngOnInit()
      }, error: (e: any) => {
        this.catSvc.ErrorMsgBar()
        console.warn(e);
        this.voucherDetails = []
        this.isLoading = false
      }
    })
  }
  edit(vchDet: VoucherDetailsVM) {
    //document.getElementById("content").scrollIntoView();
    this.lineEditMode = true
    this.lineAddMode = false
    this.addButton = false
    this.selectedVoucherDetail = vchDet
    this.selectedDetail = vchDet
    this.selectedVoucherDetail.editMode = true
    var event: any;
    this.TextChangeEvent(event);
  }
  delete(vchDet: VoucherDetailsVM) {
    if (this.voucherDetails.length == 1) {
      this.catSvc.ErrorMsgBar("You Can't delete it,as this Voucher has only one line ,and the Voucher Detail Can't be Empty", 9000)
    } else {
      if (this.selectedVoucher.statusId == Statuses.Posted) {
        this.catSvc.ErrorMsgBar("Can't Delete a posted Voucher Line", 6000)
      } else {
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
            if (vchDet.id == undefined || vchDet.id == 0) {
              Swal.fire(
                'Deleted!',
                'Successfully Deleted.',
                'success'
              )
            } else {
              var voucher = new VoucherVM
              voucher = this.selectedVoucher
              voucher.voucherDetails = []
              //voucher.voucherDetails.push(this.voucherDetails[0])
              voucher.voucherDetails.push(vchDet)
              vchDet.dBoperation = 3
              this.acntSvc.UpdateVoucher(voucher).subscribe({
                next: (data: VoucherVM) => {
                  Swal.fire(
                    'Deleted!',
                    'Successfully Deleted.',
                    'success'
                  )
                  this.voucherDetails = []
                  data.voucherDetails?.forEach(element => {
                    this.voucherDetails.push(element)
                  });
                  this.dataSource = new MatTableDataSource(data.voucherDetails);
                }, error: (e) => {
                  this.catSvc.ErrorMsgBar()
                  console.warn(e);
                }
              })
            }
            // this.voucherDetails = this.voucherDetails.filter(x => x != vchDet)
            // this.dataSource = new MatTableDataSource(this.voucherDetails);
          }
        })
      }
    }
  }
  onAccountSelect(account: ChartOfAccountVM) {
    debugger
    this.selectedVoucherDetail.coaDesc = account.coaDesc
  }
  async AddVoucherDetailtoList() {
    this.VoucherValidation();
    if (!this.voucherForm.invalid) {
      if (this.selectedVoucherDetail.coaId == 0 || this.selectedVoucherDetail.coaId == undefined)
        this.voucherDetailForm.form.controls['coaId'].setErrors({ 'incorrect': true });
      if (!this.voucherDetailForm.invalid) {
        if (this.selectedVoucherDetail.vchCreditAmt == 0 && this.selectedVoucherDetail.vchDebitAmt == 0)
          this.catSvc.ErrorMsgBar("vchDebitAmt and vchCreditAmt both can't be 0 at a time", 5000)
        else {
          if (this.selectedVoucher.statusId == Statuses.Posted) {
            this.catSvc.ErrorMsgBar("Can't Add and Update posted Voucher Line", 6000)
            this.RefreshDetail()
          }
          else {
            if (this.lineEditMode)
              this.selectedVoucherDetail.dBoperation = 2
            else
              this.selectedVoucherDetail.dBoperation = 1
            if (this.selectedVoucherDetail.dBoperation == 1) {
              this.selectedVoucher.statusId = Statuses.Draft
              this.lineAddMode = true
            }

            this.voucherDetails.push(this.selectedVoucherDetail)
            // this.voucherDetails[0].dBoperation = 2

            this.selectedVoucher.voucherDetails = []
            //this.selectedVoucher.voucherDetails?.push(this.voucherDetails[0])
            this.selectedVoucher.voucherDetails?.push(this.selectedVoucherDetail)


            if (this.selectedVoucher?.id > 0)
              await this.UpdateVoucher();
            else
              await this.SaveVoucher();
          }
        }
      }
      else {
        this.catSvc.ErrorMsgBar("Please fill all required fields of Voucher Line", 5000)
      }
    } else {
      this.catSvc.ErrorMsgBar("Please fill all required fields of Voucher", 5000)
    }
  }
  RefreshDetail() {
    debugger
    this.lineAddMode = false;
    this.addButton = true
    this.lineEditMode = false;
    this.isvchCreditAmtRequired = true
    this.isvchDebitAmtRequired = true
    this.voucherDetailForm.controls['vchDebitAmt'].enable();
    this.voucherDetailForm.controls['vchCreditAmt'].enable();
    this.selectedVoucherDetail = new VoucherDetailsVM
    if (this.vchId > 0)
      this.GetVoucherById()
  }
  TextChangeEvent(event: any) {
    console.warn("text change event")
    if (this.selectedVoucherDetail.vchCreditAmt != 0 && this.selectedVoucherDetail.vchCreditAmt != undefined) {
      this.voucherDetailForm.controls['vchDebitAmt'].disable();
      this.isvchDebitAmtRequired = false
      this.selectedVoucherDetail.vchDebitAmt = undefined
    } else {
      this.voucherDetailForm.controls['vchDebitAmt'].enable();
      this.isvchDebitAmtRequired = true
    }
    if (this.selectedVoucherDetail.vchDebitAmt != 0 && this.selectedVoucherDetail.vchDebitAmt != undefined) {
      this.voucherDetailForm.controls['vchCreditAmt'].disable();
      this.isvchCreditAmtRequired = false
      this.selectedVoucherDetail.vchCreditAmt = undefined
    } else {
      this.voucherDetailForm.controls['vchCreditAmt'].enable();
      this.isvchCreditAmtRequired = true
    }
  }
  onBlurDrCr() {
    console.warn("blur")
    debugger
    // if (this.selectedVoucherType?.defaultDrCrFirst == true) {
    if (this.selectedVoucherDetail.vchCreditAmt != undefined && this.selectedVoucherDetail.vchCreditAmt != 0) {
      this.voucherDetails[0].vchCreditAmt = Math.max(0, this.voucherDetails[0].vchCreditAmt - this.selectedVoucherDetail.vchCreditAmt)

    } else {
      var sumOfvchDebitAmt = this.GetvchDebitAmtTotal()
      if (this.selectedVoucherDetail.vchDebitAmt != undefined) {
        if (this.lineEditMode)
          sumOfvchDebitAmt -= this.selectedDetail.vchDebitAmt
        sumOfvchDebitAmt += this.selectedVoucherDetail.vchDebitAmt
        this.voucherDetails[0].vchCreditAmt = Math.max(0, (sumOfvchDebitAmt - this.GetvchCreditAmtTotal()) + this.voucherDetails[0].vchCreditAmt)
      }
    }
    // } else if (this.selectedVoucherType?.defaultDrCrFirst == false) {
    if (this.selectedVoucherDetail.vchDebitAmt != undefined && this.selectedVoucherDetail.vchDebitAmt != 0) {
      this.voucherDetails[0].vchDebitAmt = Math.max(0, this.voucherDetails[0].vchDebitAmt - this.selectedVoucherDetail.vchDebitAmt)
    } else {
      var sumOfvchCreditAmt = this.GetvchCreditAmtTotal()
      if (this.selectedVoucherDetail.vchCreditAmt != undefined) {
        if (this.lineEditMode)
          sumOfvchCreditAmt -= this.selectedDetail.vchCreditAmt
        sumOfvchCreditAmt += this.selectedVoucherDetail.vchCreditAmt
        this.voucherDetails[0].vchDebitAmt = Math.max(0, (sumOfvchCreditAmt - this.GetvchDebitAmtTotal()) + this.voucherDetails[0].vchDebitAmt)
      }
    }
    // }
  }
  Back() {
    this._location.back();
  }
  VoucherValidation() {
    if (this.selectedVoucher.vchTypeId == 0 || this.selectedVoucher.vchTypeId == undefined)
      this.voucherForm.form.controls['vchTypeId'].setErrors({ 'incorrect': true });
  }
  onBlur() {
    debugger
    console.warn(this.selectedVoucher.id)
    if (this.selectedVoucher.id > 0) {
      this.isLoading = true
      this.VoucherValidation()
      if (!this.voucherForm.invalid) {
        this.SetDates()
        this.selectedVoucher.clientId = +localStorage.getItem("RMSClientId")
        this.acntSvc.UpdateVoucher(this.selectedVoucher).subscribe({
          next: (res: VoucherVM) => {
            this.catSvc.SuccessMsgBar(" Successfully Updated!", 5000)
            this.isLoading = false
          }, error: (e: any) => {
            this.catSvc.ErrorMsgBar("Error Occurred", 5000)
            console.warn(e);
            this.isLoading = false
          }
        })
      } else {
        this.catSvc.ErrorMsgBar("Please fill all required fields", 5000)
      }
    }
  }
  SetDates() {
    this.selectedVoucher.vchDate = moment(this.selectedVoucher.vchDate).toDate()
    this.selectedVoucher.vchDate = new Date(Date.UTC(this.selectedVoucher.vchDate.getFullYear(), this.selectedVoucher.vchDate.getMonth(), this.selectedVoucher.vchDate.getDate()))
  }
  GetvchDebitAmtTotal() {
    this.voucherDetails.forEach(element => {
      if (element.vchDebitAmt == undefined)
        element.vchDebitAmt = 0
    });
    return this.voucherDetails?.map(t => t.vchDebitAmt).reduce((acc, value) => acc + value, 0);
  }
  GetvchCreditAmtTotal() {
    this.voucherDetails.forEach(element => {
      if (element.vchCreditAmt == undefined)
        element.vchCreditAmt = 0
    });
    return this.voucherDetails?.map(t => t.vchCreditAmt).reduce((acc, value) => acc + value, 0);
  }
  // GetQtyTotal() {
  //   return this.voucherDetails?.map(t => t.qty).reduce((acc, value) => acc + value, 0);
  // }
  OnSelectVchType(val: VoucherTypeVM) {
    this.selectedVoucher.vchType = val.vchTypeCode
    this.selectedVoucher.clientId = +localStorage.getItem("RMSClientId")
    this.selectedVoucher.vchYearId = +localStorage.getItem("FiscalYearCodeId")
    this.acntSvc.GetNextVchNo(this.selectedVoucher).subscribe({
      next: (res: VoucherVM) => {
        this.selectedVoucher.vchNo = res.vchNo
        this.selectedVoucher.vchKey = res.vchKey
        this.selectedVoucher.vchMonth = res.vchMonth
        this.selectedVoucher.vchYear = res.vchYear
        this.onBlur()
      }, error: (e) => {
        console.warn(e)
        this.catSvc.ErrorMsgBar("Error Occurred while getting VchNo", 4000)
      }
    })
  }
  IsPostedCheck(event: MatCheckboxChange): void {
    debugger
    Swal.fire({
      title: 'Are you sure?',
      text: "You want to post  this voucher",
      icon: 'info',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Yes, post it!'
    }).then((result) => {
      if (result.value) {
        this.selectedVoucher.isPosted = true
        this.selectedVoucher.statusId = Statuses.Posted
        Swal.fire(
          'Successfully Posted.',
          'success'
        )
        this.onBlur()
      } else {
        this.selectedVoucher.isPosted = false
      }
    })
  }
}

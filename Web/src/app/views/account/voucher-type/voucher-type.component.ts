import { Component, OnInit, ViewChild } from '@angular/core';
import { NgForm } from '@angular/forms';
import { AccountService } from '../account.service';
import { CatalogService } from '../../catalog/catalog.service';
import { VoucherTypeVM } from '../Models/VoucherTypeVM';
import { MatTableDataSource } from '@angular/material/table';
import { SettingsVM } from '../../catalog/Models/SettingsVM';
import { EnumTypeVM } from '../../restaurant/Models/Enums/EnumTypeVM';
import { RestaurantService } from '../../restaurant/restaurant.service';
import { IconSetService } from '@coreui/icons-angular';
import Swal from 'sweetalert2';
import { iconSubset } from 'src/app/icons/icon-subset';
import { AppConstants } from 'src/app/app.constants';

@Component({
  selector: 'app-voucher-type',
  templateUrl: './voucher-type.component.html',
  styleUrls: ['./voucher-type.component.css']
})
export class VoucherTypeComponent implements OnInit {
  isLoading: boolean = false;
  Edit: boolean = false;
  Add: boolean = true;
  validFields: boolean = false;
  @ViewChild('userForm', { static: true }) userForm!: NgForm;
  displayedColumns: string[] = ['vchTypeCode', 'vchTypeDesc', 'vchTypeRemarks', 'isAutoPosted', 'isActive', 'actions'];
  dataSource: any;
  accounts: SettingsVM[]
  VoucherType?: VoucherTypeVM[] | undefined
  selectedVoucherType: VoucherTypeVM
  VoucherTypeId: number;
  getvoucherById: VoucherTypeVM[];
  constructor(private AccSvc: AccountService,
    private catSvc: CatalogService,
    private iconSetService: IconSetService,
    private resSvc: RestaurantService
  ) {
    this.selectedVoucherType = new VoucherTypeVM();
    iconSetService.icons = { ...iconSubset };
  }
  ngOnInit() {
    this.Add = true;
    this.Edit = false;
    this.selectedVoucherType = new VoucherTypeVM
    this.GetVoucherType();
    //this.GetDefaultDrCr();
    this.selectedVoucherType.isActive = true
  }
  Check() {
    this.validFields = true;
  }
  GetVoucherType() {
    var vchTye = new VoucherTypeVM
    vchTye.clientId = +localStorage.getItem("RMSClientId")
    this.AccSvc.SearchVoucherType(vchTye).subscribe({
      next: (value: VoucherTypeVM[]) => {
        this.VoucherType = value;
        this.dataSource = new MatTableDataSource(this.VoucherType)
      }, error: (err) => {
        this.catSvc.ErrorMsgBar()
      },
    })
  }
  GetDefaultDrCr() {
    var stng = new SettingsVM
    stng.levelId = EnumTypeVM.Level5
    stng.isActive = true
    stng.clientId = +localStorage.getItem("RMSClientId")
    this.resSvc.SearchSettings(stng).subscribe({
      next: (res: SettingsVM[]) => {
        this.accounts = res;
      }, error: (e) => {
        this.catSvc.ErrorMsgBar()
        console.warn(e);
      }
    })
  }

  GetVoucherTypeForEdit(id: number) {
    this.isLoading = true
    window.scrollTo(0, 0)
    this.selectedVoucherType = new VoucherTypeVM;
    this.selectedVoucherType.id = id
    this.selectedVoucherType.clientId = +localStorage.getItem("RMSClientId")
    this.AccSvc.SearchVoucherType(this.selectedVoucherType).subscribe({
      next: (res: VoucherTypeVM[]) => {
        this.isLoading = false
        this.VoucherType = res;
        this.selectedVoucherType = this.VoucherType[0]
        this.Edit = true;
        this.Add = false;
      }, error: (e) => {
        this.isLoading = false
        this.catSvc.ErrorMsgBar()
        console.warn(e);
      }
    })
  }
  SaveVoucherType() {
    if (!this.userForm.invalid) {
      this.isLoading = true
      this.selectedVoucherType.clientId = +localStorage.getItem("RMSClientId")
      if (this.Edit)
        this.UpdateVoucherType()
      else
        this.AccSvc.SaveVoucherType(this.selectedVoucherType).subscribe({
          next: (result) => {
            result.resultMessages.forEach(element => {
              if (element.messageType != AppConstants.ERROR_MESSAGE_TYPE) {
                this.catSvc.SuccessMsgBar(element.message)
                this.ngOnInit();
              }
              else
                this.catSvc.ErrorMsgBar(element.message)
              this.isLoading = false
            })
          }, error: (e) => {
            this.isLoading = false
            this.catSvc.ErrorMsgBar()
            console.warn(e);
          }
        })
    } else
      this.catSvc.ErrorMsgBar("Please Fill all required fields!", 5000)
  }
  UpdateVoucherType() {
    this.AccSvc.UpdateVoucherType(this.selectedVoucherType).subscribe({
      next: (result) => {
        result.resultMessages.forEach(element => {
          if (element.messageType != AppConstants.ERROR_MESSAGE_TYPE) {
            this.catSvc.SuccessMsgBar(element.message)
            this.ngOnInit();
          }
          else
            this.catSvc.ErrorMsgBar(element.message)
          this.isLoading = false
        })
      }, error: (e) => {
        this.isLoading = false
        this.catSvc.ErrorMsgBar()
        console.warn(e);
      }
    })
  }
  Refresh() {
    this.selectedVoucherType = new VoucherTypeVM
    this.Add = true;
    this.Edit = false;
    this.selectedVoucherType.isActive = true;
  }
  getKeyCode() {
    this.selectedVoucherType.vchTypeCode = this.catSvc.getCapitalLettersAsString(this.selectedVoucherType.vchTypeDesc)
  }
}


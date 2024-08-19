import { Location } from '@angular/common';
import { CatalogService } from './../../../catalog/catalog.service';
import { Component, ElementRef, OnInit, ViewChild } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { DiscountCampaignVM } from '../../Models/DiscountCampaignVM';
import { RestaurantService } from '../../restaurant.service';
import { NgForm } from '@angular/forms';
import { SettingsTypeVM } from 'src/app/views/catalog/Models/SettingsTypeVM';
import { EnumTypeVM } from '../../Models/Enums/EnumTypeVM';
import { SettingsVM } from 'src/app/views/catalog/Models/SettingsVM';
import * as moment from 'moment';
import { DiscountCampaignTypes } from '../../Models/Enums/DiscountCampaignTypes';
import { MenuGroupVM } from '../../Models/MenuGroupVM';
import { RouteIds } from 'src/app/views/catalog/Models/Enums/RouteIds';

@Component({
  selector: 'app-manage-discount-campaign',
  templateUrl: './manage-discount-campaign.component.html',
  styleUrls: ['./manage-discount-campaign.component.css']
})
export class ManageDiscountCampaignComponent implements OnInit {
  proccessing: boolean = false
  isGroupRequired: boolean = false;
  isEndTimeRequired: boolean = true
  discId!: number;
  startDate?: any
  endTime?: any
  time!: any
  Edit: boolean = false;
  Add: boolean = true;
  View: boolean = false;
  groups?: MenuGroupVM[]
  types?: SettingsVM[]
  days: SettingsVM[]
  getCamapignById!: DiscountCampaignVM[]
  discountCampaign: DiscountCampaignVM
  DiscountCampaign!: DiscountCampaignVM[];
  SettingsType?: SettingsTypeVM[];
  @ViewChild('userForm', { static: true }) userForm: NgForm;
  isReadOnly: boolean = false
  constructor(
    private elementRef: ElementRef,
    private route: ActivatedRoute,
    public resSvc: RestaurantService,
    private catSvc: CatalogService,
    private location: Location
  ) {
    this.discountCampaign = new DiscountCampaignVM
  }
  ngOnInit(): void {
    this.isReadOnly = this.catSvc.getPermission(RouteIds.DiscountCompaign)
    this.discountCampaign.isActive = true
    this.route.queryParams.subscribe(params => {
      this.discId = params['id'];
    });
    console.warn(this.discId)
    if (this.discId > 0) {
      this.Edit = true;
      this.Add = false;
      this.GetDiscountCampaignById();
    }
    this.getGroups()
    this.GetSettingsType();
  }
  GetSettingsType() {
    var type = new SettingsTypeVM();
    this.resSvc.SearchSettingsType(type).subscribe({
      next: (res: SettingsTypeVM[]) => {
        this.SettingsType = res
        this.GetValues();
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred !", 6000)
      }
    })
  }
  getGroups() {
    var group = new MenuGroupVM
    group.clientId = +localStorage.getItem("RMSClientId")
    this.resSvc.SearchMenuGroup(group).subscribe({
      next: (res: MenuGroupVM[]) => {
        this.groups = res
      }, error: () => { this.catSvc.ErrorMsgBar("Error Occurred", 5000) }
    })
  }
  async GetValues() {
    debugger
    // var group = this.SettingsType?.find(x => x.id == EnumTypeVM.MenuItemGroup)
    // if (group != undefined)
    //   await this.SetValues(group.id, group.keyCode)
    var days = this.SettingsType?.find(x => x.id == EnumTypeVM.WeekDays)
    if (days != undefined)
      await this.SetValues(days.id, days.keyCode)
    var type = this.SettingsType?.find(x => x.id == EnumTypeVM.DiscountCamapignTypes)
    if (type != undefined)
      await this.SetValues(type.id, type.keyCode)
  }
  SetValues(type: number, keyCode: string) {
    this.resSvc.SearchStng(type, keyCode).subscribe({
      next: (res: SettingsVM[]) => {
        if (type == EnumTypeVM.DiscountCamapignTypes)
          this.types = res;
        // else if (type == EnumTypeVM.MenuItemGroup)
        //   this.groups = res;
        else if (type == EnumTypeVM.WeekDays)
          this.days = res;
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred !", 6000)
      }
    })
  }
  checkDropDownVailidation() {
    if (this.isGroupRequired) {
      if (this.discountCampaign.menuGroupId == 0 || this.discountCampaign.menuGroupId == undefined)
        this.userForm.controls['menuGroupId'].setErrors({ 'incorrect': true })
    }
    if (this.discountCampaign.typeId == 0 || this.discountCampaign.typeId == undefined)
      this.userForm.controls['typeId'].setErrors({ 'incorrect': true })
  }
  SaveDiscountCampaign() {
    this.SetDates()
    this.checkDropDownVailidation()
    const controls = this.userForm.controls;
    if (this.userForm.invalid) {
      for (const name in controls) {
        if (controls[name].hasError('required')) {
          //   if (controls[name].invalid) {
          this.catSvc.ErrorMsgBar(` ${name} is required field`, 6000)
          break
        } else if (controls[name].hasError('minlength')) {
          this.catSvc.ErrorMsgBar(` ${name} must be at least ${controls[name].errors['minlength'].requiredLength} 
           characters long. `, 6000)
          break
        }
      }
    } else {
      this.discountCampaign.clientId = +localStorage.getItem("RMSClientId")
      this.proccessing = true
      if (this.discId > 0) {
        this.PutDiscountCampaign();
      } else {
        this.resSvc.SaveDiscountCampaign(this.discountCampaign).subscribe({
          next: (res) => {
            this.catSvc.SuccessMsgBar("Successfully Added !", 6000)
            this.ngOnInit();
            this.Refresh();
            window.scrollTo(0, 0)
            this.proccessing = false
          }, error: (e) => {
            console.warn(e)
            this.catSvc.ErrorMsgBar("Error Occurred !", 6000)
            this.proccessing = false
          }
        })
      }
    }
  }
  PutDiscountCampaign() {
    this.proccessing = true
    this.resSvc.UpdateDiscountCampaign(this.discountCampaign).subscribe({
      next: (res) => {
        this.proccessing = false
        window.scrollTo(0, 0)
        this.catSvc.SuccessMsgBar("Successfully Updated !", 6000)
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred !", 6000)
        this.proccessing = false
      }
    })
  }
  GetDiscountCampaignById() {
    var campaign = new DiscountCampaignVM
    campaign.id = this.discId
    campaign.clientId = +localStorage.getItem("RMSClientId")
    this.resSvc.SearchDiscountCampaign(campaign).subscribe({
      next: (res: DiscountCampaignVM[]) => {
        console.warn(res)
        this.getCamapignById = res;
        this.discountCampaign = res[0]
        this.tillDayEndClick()
        this.onSelectType()
        // this.startTime = res[0].startTime
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred !", 6000)
        console.warn(e);
      }
    })
  }
  Refresh() {
    this.discountCampaign = new DiscountCampaignVM;
    this.discountCampaign.isActive = true
    this.Add = true;
    this.Edit = false;
  }
  SetDates() {
    if (this.discountCampaign.startDate != null) {
      this.discountCampaign.startDate = moment(this.discountCampaign.startDate).toDate()
      this.discountCampaign.startDate = new Date(Date.UTC(this.discountCampaign.startDate.getFullYear(), this.discountCampaign.startDate.getMonth(), this.discountCampaign.startDate.getDate()))
    }
    if (this.discountCampaign.endDate != null) {
      this.discountCampaign.endDate = moment(this.discountCampaign.endDate).toDate()
      this.discountCampaign.endDate = new Date(Date.UTC(this.discountCampaign.endDate.getFullYear(), this.discountCampaign.endDate.getMonth(), this.discountCampaign.endDate.getDate()))
    }
  }
  Back() {
    this.location.back()
  }
  tillDayEndClick() {
    if (this.isEndTimeRequired)
      this.isEndTimeRequired = false
    else
      this.isEndTimeRequired = true
  }
  onSelectType() {
    if (this.discountCampaign.typeId == DiscountCampaignTypes.Individual)
      this.isGroupRequired = true
    else
      this.isGroupRequired = false
  }
}


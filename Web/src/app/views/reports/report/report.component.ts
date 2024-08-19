import { ChangeDetectorRef, Component, OnInit } from '@angular/core';
import { UserVM } from '../../security/models/user-vm';
import { SecurityService } from '../../security/security.service';
import { CatalogService } from '../../catalog/catalog.service';
import { BaseSearchCriteria } from '../../catalog/Models/BaseSearchCriteria'
import { ActivatedRoute } from '@angular/router';
import { ReportSearchCriteria } from '../Models/ReportSearchCriteria'
import { Reports } from '../Enums/Reports'
import { ReportService } from '../report.service';
import { RestaurantService } from '../../restaurant/restaurant.service';
import { ShiftVM } from '../../restaurant/Models/ShiftVM';
import { SettingsVM } from '../../catalog/Models/SettingsVM';
import { EnumTypeVM } from '../../restaurant/Models/Enums/EnumTypeVM';
import { DiscountKeyVM } from '../../restaurant/Models/DiscountKeyVM';

@Component({
  selector: 'app-report',
  templateUrl: './report.component.html',
  styleUrls: ['./report.component.css']
})
export class ReportComponent implements OnInit {
  showStartDate: boolean = true
  showEndDate: boolean = true
  showDate: boolean = true
  showUsers: boolean = false
  users: UserVM[] = []
  shifts: SettingsVM[] = []
  pageTitle: string
  isReadOnly: boolean = false
  routeId: number
  searchCriteria: ReportSearchCriteria
  isLoading: boolean = false
  pdfIsBlank: boolean = false
  refundTypes: SettingsVM[] = []
  path: string = ''
  discountKeys: DiscountKeyVM[] = []
  constructor(
    public secSvc: SecurityService
    , public catSvc: CatalogService
    , private aRoute: ActivatedRoute
    , private cdRef: ChangeDetectorRef
    , private rptSvc: ReportService
    , private resSvc: RestaurantService
  ) {
    this.searchCriteria = new ReportSearchCriteria
  }
  ngOnInit(): void {
    this.aRoute.queryParams.subscribe(params => {
      this.routeId = params['routeId'];
      this.isReadOnly = this.catSvc.getPermission(this.routeId)
    });
    this.setReport()
  }
  ngAfterContentChecked() {
    this.cdRef.detectChanges();
    this.cdRef.markForCheck();
  }
  refresh() {
    this.pdfIsBlank = false
    this.searchCriteria = new ReportSearchCriteria
  }
  setDates() {
    if (this.showDate)
      this.searchCriteria.date = this.catSvc.setDate(this.searchCriteria.date)
    if (this.showEndDate)
      this.searchCriteria.endDate = this.catSvc.setDate(this.searchCriteria.endDate)
    if (this.showStartDate)
      this.searchCriteria.startDate = this.catSvc.setDate(this.searchCriteria.startDate)
  }
  setReport() {
    if (this.routeId) {
      if (this.routeId == Reports.LogEvent) {
        this.pageTitle = "Log Events"
        this.path = 'CommonReports/LogEvent'
        this.showUsers = true
        this.showDate = false
      }
      else if (this.routeId == Reports.MenuItemWise) {
        this.pageTitle = "Menu Item Wise Report"
        this.path = 'SaleReports/MenuItemWiseSaleRpt'
        this.showDate = false
        this.showUsers = false
      }
      else if (this.routeId == Reports.Complimentary) {
        this.pageTitle = "Complimentary Sale Report"
        this.path = 'SaleReports/ComplimentaryRpt'
        this.showDate = false
        this.showUsers = false
      }
      else if (this.routeId == Reports.MenuGroupWise) {
        this.pageTitle = "Menu Group Wise Report"
      }
      else if (this.routeId == Reports.HourySales) {
        this.pageTitle = "Hourly Sales Report"
        this.path = 'SaleReports/HourlySaleRpt'
        this.showEndDate = false
        this.showStartDate = false
        this.showDate = true
      }
      else if (this.routeId == Reports.RawItemList) {
        this.pageTitle = "Raw Item List"
        this.path = "SaleReports/RawItemRpt"
        this.showDate = false
        this.showUsers = false
        this.showEndDate = false
        this.showStartDate = false
      }
      else if (this.routeId == Reports.InvoiceWiseReport) {
        this.pageTitle = "Invoice Wise Report"
        this.path = "SaleReports/InvoiceWiseRpt"
        this.showDate = false
        this.showUsers = false
      }
      else if (this.routeId == Reports.DiscountSale) {
        this.pageTitle = "Discount Sale Report"
        this.path = "SaleReports/DiscountSaleRpt"
        this.showDate = false
        this.showUsers = false
        this.getDiscoutnKeys()
      }
      else if (this.routeId == Reports.PaymentWiseSale) {
        this.pageTitle = "Payment Wise Sale Report"
        this.path = "SaleReports/PaymentWiseSaleRpt"
        this.showDate = false
        this.showUsers = false
      }
      else if (this.routeId == Reports.RefundVoid) {
        this.pageTitle = "Refund/Void Report"
        this.path = "SaleReports/RefundVoidRpt"
        this.showDate = false
        this.showUsers = false
        this.getRefundTypes()
      }
      else if (this.routeId == Reports.DailySale) {
        this.pageTitle = "Daily Sale Report"
        this.path = "SaleReports/DailySaleRpt"
        this.showDate = false
        this.showUsers = false
      }
      else if (this.routeId == Reports.ShiftWise) {
        this.pageTitle = "Shift Wise Report"
        this.path = "SaleReports/DailySaleRpt"
        this.showDate = true
        this.showEndDate = false
        this.showStartDate = false
        this.showUsers = false
        this.getShifts()
      }
      if (this.showDate)
        this.searchCriteria.date = new Date
      if (this.showEndDate)
        this.searchCriteria.endDate = new Date
      if (this.showStartDate)
        this.searchCriteria.startDate = new Date
      if (this.showUsers)
        this.getUsers()
    }
  }
  getUsers() {
    var user = new UserVM
    user.isActive = true
    user.clientId = +localStorage.getItem("RMSClientId")
    this.secSvc.SearchUser(user).subscribe({
      next: (res) => {
        this.users = res
      }, error: (err) => {
        this.catSvc.ErrorMsgBar()
        console.warn(err)
      }
    })
  }
  getRecords() {
    this.setDates()
    this.searchCriteria.clientId = +localStorage.getItem("RMSClientId")
    this.isLoading = true
    this.rptSvc.GetReport(this.searchCriteria, this.path).subscribe({
      next: async (res) => {
        this.isLoading = false
        this.displayReport(res)
        // window.open(url);
      }, error: (err) => {
        this.isLoading = false
        this.catSvc.ErrorMsgBar()
        console.warn(err)
      }
    })
  }
  async displayReport(res) {
    this.pdfIsBlank = false
    const _blob = res.body;
    const arrayBuffer = await _blob.slice(0, 5).arrayBuffer();
    const initialText = new TextDecoder().decode(arrayBuffer);
    if (initialText.startsWith('{') || initialText.startsWith('[')) {
      // If it starts with '{' or '[', it's likely JSON
      const text = await _blob.text();
      const jsonData = JSON.parse(text);
      // Check the hasData property
      this.pdfIsBlank = !jsonData.hasData;
    }
    else
      this.pdfIsBlank = false

    if (!this.pdfIsBlank) {
      const blob = new Blob([res.body], { type: 'application/pdf' });
      console.warn(res)
      const url = URL.createObjectURL(blob);
      const iframe = document.getElementById('pdfFrame') as HTMLIFrameElement;
      if (iframe) {
        iframe.src = url;
      }
    }
  }
  getShifts() {
    debugger
    var shift = new SettingsVM
    shift.clientId = +localStorage.getItem("RMSClientId")
    shift.enumTypeId = EnumTypeVM.Shifts
    this.catSvc.SearchSettings(shift).subscribe({
      next: (res) => {
        console.warn(res)
        this.shifts = res
      }, error: () => {
        this.catSvc.ErrorMsgBar()
      }
    })
  }
  getRefundTypes() {
    var stng = new SettingsVM
    stng.isActive = true
    stng.enumTypeId = EnumTypeVM.RefundTypes
    this.catSvc.SearchSettings(stng).subscribe({
      next: (res) => {
        console.warn(res)
        this.refundTypes = res
      }, error: () => {
        this.catSvc.ErrorMsgBar()
      }
    })
  }
  getDiscoutnKeys() {
    var key = new DiscountKeyVM
    key.clientId = +localStorage.getItem("RMSClientId")
    this.resSvc.SearchDiscountKey(key).subscribe({
      next: (res) => {
        this.discountKeys = res
      }, error: () => {
        this.catSvc.ErrorMsgBar()
      }
    })
  }
}

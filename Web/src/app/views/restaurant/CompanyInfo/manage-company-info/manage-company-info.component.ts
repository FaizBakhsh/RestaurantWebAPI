import { RestaurantService } from './../../restaurant.service';

import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { CompanyInfoVM } from '../../Models/CompanyInfoVM';
import { MatSnackBar } from '@angular/material/snack-bar';
import { CatalogService } from 'src/app/views/catalog/catalog.service';
import { Location } from '@angular/common';
import { RouteIds } from 'src/app/views/catalog/Models/Enums/RouteIds';
@Component({
  selector: 'app-manage-company-info',
  templateUrl: './manage-company-info.component.html',
  styleUrls: ['./manage-company-info.component.css']
})
export class ManageCompanyInfoComponent implements OnInit {
  proccessing: boolean = false
  comId!: number;
  Edit: boolean = false;
  Add: boolean = true;
  View: boolean = false;
  CompanyInfo!: CompanyInfoVM[];
  getById!: CompanyInfoVM[];
  selectedCompanyInfo: CompanyInfoVM
  isReadOnly: boolean = false
  previewImage = false;
  currentLightBoxImage: any
  constructor(
    private route: ActivatedRoute,
    public resSvc: RestaurantService,
    private catSvc: CatalogService,
    private location: Location
  ) {
    this.selectedCompanyInfo = new CompanyInfoVM
  }
  ngOnInit(): void {
    this.isReadOnly = this.catSvc.getPermission(RouteIds.CompanyInfo)
    this.route.queryParams.subscribe(params => {
      this.comId = params['id'];
    });
    console.warn(this.comId)
    if (this.comId > 0) {
      this.Edit = true;
      this.Add = false;
      this.GetById();
    }
    this.selectedCompanyInfo.isActive = true;
  }
  SaveCompanyInfo() {
    this.selectedCompanyInfo.clientId = +localStorage.getItem("RMSClientId")
    this.proccessing = true
    if (this.comId > 0) {
      this.PutCompanyInfo();
    } else {
      this.resSvc.SaveCompanyInfo(this.selectedCompanyInfo).subscribe({
        next: (res) => {
          this.catSvc.SuccessMsgBar("CompanyInfo Successfully Added!", 5000)
          this.ngOnInit();
          this.Refresh();
          this.proccessing = false
        }, error: (e) => {
          this.catSvc.ErrorMsgBar("Error Occurred", 5000)
          this.proccessing = false
        }
      })
    }
  }
  PutCompanyInfo() {
    this.proccessing = true
    this.resSvc.UpdateCompanyInfo(this.selectedCompanyInfo).subscribe({
      next: (res) => {
        this.proccessing = false
        this.catSvc.SuccessMsgBar("Company Info Successfully Updated!", 5000)
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        this.proccessing = false
      }
    })
  }
  GetById() {
    var info = new CompanyInfoVM
    info.clientId = +localStorage.getItem("RMSClientId")
    info.id = this.comId
    this.resSvc.SearchCompanyInfo(info).subscribe({
      next: (res: CompanyInfoVM[]) => {
        this.getById = res;
        this.selectedCompanyInfo = this.getById[0]
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  Refresh() {
    this.selectedCompanyInfo = new CompanyInfoVM;
    this.Add = true;
    this.Edit = false;
    this.selectedCompanyInfo.isActive = true;
  }
  Back() {
    this.location.back()
  }
  handleFileInput(e: any) {
    debugger
    for (let index = 0; index < e.target.files.length; index++) {
      var reader = new FileReader();
      reader.readAsDataURL(e.target.files[index]);
      reader.onload = (event: any) => {
        this.selectedCompanyInfo.logoBase64Path = event.target.result
      };
    }
  }
  onPreviewImage(): void {
    this.previewImage = true
    this.currentLightBoxImage = this.selectedCompanyInfo.logoBase64Path
  }
  onClosePreview() {
    this.previewImage = false;
  }
}


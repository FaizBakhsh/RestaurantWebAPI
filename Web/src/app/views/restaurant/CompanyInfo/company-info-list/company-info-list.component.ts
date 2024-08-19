import { RestaurantService } from './../../restaurant.service';
import { Component, OnInit } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { MatSnackBar } from '@angular/material/snack-bar';
import { MatTableDataSource } from '@angular/material/table';
import { Router } from '@angular/router';
import Swal from 'sweetalert2';
import { CompanyInfoVM } from '../../Models/CompanyInfoVM';
import { CatalogService } from 'src/app/views/catalog/catalog.service';
import { RouteIds } from 'src/app/views/catalog/Models/Enums/RouteIds';

@Component({
  selector: 'app-company-info-list',
  templateUrl: './company-info-list.component.html',
  styleUrls: ['./company-info-list.component.css']
})
export class CompanyInfoListComponent implements OnInit {
  getById!: CompanyInfoVM;
  CompanyInfo: CompanyInfoVM[] =  [];;
  Edit: boolean = true;
  displayedColumns: string[] = ['Name', 'PhoneNo', 'Address', 'BillNote', 'Action'];
  dataSource: any;
  isReadOnly: boolean = false
  constructor(
    private route: Router,
    private catSvc: CatalogService,
    public dialog: MatDialog,
    public resSvc: RestaurantService,
  ) {
    this.resSvc.selectedCompanyInfo = new CompanyInfoVM();
  }
  ngOnInit(): void {
    this.isReadOnly = this.catSvc.getPermission(RouteIds.CompanyInfo)
    this.GetCompanyInfo();
  }
  GetCompanyInfo() {
    var info = new CompanyInfoVM
    info.clientId = +localStorage.getItem("RMSClientId")
    this.resSvc.SearchCompanyInfo(info).subscribe({
      next: (res: CompanyInfoVM[]) => {
        this.CompanyInfo = res;
        console.warn(this.CompanyInfo)
        this.dataSource = new MatTableDataSource(this.CompanyInfo);
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  EditCompanyInfo(cust: CompanyInfoVM) {
    this.route.navigate(['/restaurant/comProfile/mngCInfo'], {
      queryParams: {
        id: cust.id
      }
    });
  }
  DeleteCompanyInfo(id: number) {
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
        this.resSvc.DeleteCompanyInfo(id).subscribe({
          next: (data) => {
            Swal.fire(
              'Deleted!',
              'CompanyInfo has been deleted.',
              'success'
            )
            this.GetCompanyInfo();
          }, error: (e) => {
            this.catSvc.ErrorMsgBar("Error Occurred", 5000)
            console.warn(e);
          }
        })
      }
    })
  }
}

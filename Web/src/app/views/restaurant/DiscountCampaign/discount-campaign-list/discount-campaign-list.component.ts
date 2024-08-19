import { Component, OnInit } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { MatTableDataSource } from '@angular/material/table';
import { Router } from '@angular/router';
import { CatalogService } from './../../../catalog/catalog.service';
import Swal from 'sweetalert2';

import { DiscountCampaignVM } from '../../Models/DiscountCampaignVM';
import { RestaurantService } from '../../restaurant.service';
import { RouteIds } from 'src/app/views/catalog/Models/Enums/RouteIds';

@Component({
  selector: 'app-discount-campaign-list',
  templateUrl: './discount-campaign-list.component.html',
  styleUrls: ['./discount-campaign-list.component.css']
})
export class DiscountCampaignListComponent implements OnInit {
  DiscountCampaign: DiscountCampaignVM[] | undefined;
  Edit: boolean = true;
  isReadOnly: boolean = false
  displayedColumns: string[] = ['Name', 'Type', 'Discount', 'Group', 'StartTime', 'EndTime', 'EndDate', 'StartDate',
    'Days', 'isActive', 'Action'];
  dataSource: any;
  constructor(
    private route: Router,
    private catSvc: CatalogService,
    public dialog: MatDialog,
    public resSvc: RestaurantService,
  ) {
  }
  ngOnInit(): void {
    this.isReadOnly = this.catSvc.getPermission(RouteIds.DiscountCompaign)
    this.GetDiscountCampaign();
  }
  GetDiscountCampaign() {
    var camp = new DiscountCampaignVM
    camp.clientId = +localStorage.getItem("RMSClientId")
    this.resSvc.SearchDiscountCampaign(camp).subscribe({
      next: (res: DiscountCampaignVM[]) => {
        this.DiscountCampaign = res;
        console.warn(this.DiscountCampaign)
        this.dataSource = new MatTableDataSource(this.DiscountCampaign);
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred!", 4000)
        console.warn(e);
      }
    })
  }
  EditDiscountCampaign(cust: DiscountCampaignVM) {
    this.route.navigate(['/restaurant/sale/discountCampaign'], {
      queryParams: {
        id: cust.id
      }
    });
  }
  DeleteDiscountCampaign(id: number) {
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
        this.resSvc.DeleteDiscountCampaign(id).subscribe({
          next: (data) => {
            Swal.fire(
              'Deleted!',
              'DiscountCampaign has been deleted.',
              'success'
            )
            this.GetDiscountCampaign();
          }, error: (e) => {
            this.catSvc.ErrorMsgBar("Error Occurred!", 4000)
            console.warn(e);
          }
        })
      }
    })
  }
}


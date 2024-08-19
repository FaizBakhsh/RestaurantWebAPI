import { Component, OnInit } from '@angular/core';
import { MatSnackBar } from '@angular/material/snack-bar';
import { ActivatedRoute } from '@angular/router';
import { VendorVM } from '../../Models/VendorVM';
import { RestaurantService } from '../../restaurant.service';

@Component({
  selector: 'app-manage-vendor',
  templateUrl: './manage-vendor.component.html',
  styleUrls: ['./manage-vendor.component.css']
})
export class ManageVendorComponent implements OnInit {

  CustId!: number;
  Edit: boolean = false;
  Add: boolean = true;
  View: boolean = false;
  Vendor!: VendorVM[];
  getEmpById!: VendorVM[];
  constructor(
    private route: ActivatedRoute,
    public resSvc: RestaurantService,
    private snack: MatSnackBar,
  ) {
    this.resSvc.selectedVendor = new VendorVM
  }
  ngOnInit(): void {
    this.route.queryParams.subscribe(params => {
      this.CustId = params['id'];
    });
    console.warn(this.CustId)
    if (this.CustId > 0) {
      this.Edit = true;
      this.Add = false;
      this.GetVendorById();
    }
    this.resSvc.selectedVendor.isActive=true;
  }
  SaveVendor() {
    if (this.CustId > 0) {
      this.PutVendor();
    } else {
      this.resSvc.SaveVendor(this.resSvc.selectedVendor).subscribe({
        next: (res) => {
          this.snack.open('Vendor Added!', 'OK', { duration: 4000 })
          this.ngOnInit();
          this.Refresh();
        }, error: (e) => {
          this.snack.open('Error Occured!', 'OK', { duration: 4000 })
        }
      })
    }
  }
  PutVendor() {
    this.resSvc.UpdateVendor(this.resSvc.selectedVendor).subscribe({
      next: (res) => {
        this.snack.open('Vendor Updated Successfully!', 'OK', { duration: 4000 })
      }, error: (e) => {
        this.snack.open('Error Occured!', 'OK', { duration: 4000 })
      }
    })
  }
  GetVendorById() {
    this.resSvc.GetVendorById(this.CustId).subscribe((res: VendorVM[]) => {
      this.getEmpById = res;
      this.resSvc.selectedVendor = this.getEmpById[0]
    });
  }
  Refresh() {
    this.resSvc.selectedVendor = new VendorVM;
    this.Add = true;
    this.Edit = false;
    this.resSvc.selectedVendor.isActive=true;
  }
}


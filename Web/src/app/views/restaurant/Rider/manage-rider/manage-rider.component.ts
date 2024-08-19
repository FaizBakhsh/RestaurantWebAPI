import { CatalogService } from 'src/app/views/catalog/catalog.service';
import { RiderVM } from './../../Models/RiderVM';
import { Component, OnInit, ViewChild } from '@angular/core';
import { NgForm } from '@angular/forms';
import { MatDialog } from '@angular/material/dialog';
import { MatSnackBar } from '@angular/material/snack-bar';
import { MatTableDataSource } from '@angular/material/table';
import Swal from 'sweetalert2';
import { RestaurantService } from '../../restaurant.service';

@Component({
  selector: 'app-manage-rider',
  templateUrl: './manage-rider.component.html',
  styleUrls: ['./manage-rider.component.css']
})
export class ManageRiderComponent implements OnInit {
  Edit: boolean = false;
  Add: boolean = true;
  validFields: boolean = false;
  public date = new Date();
  Rider: RiderVM[] | undefined;
  selectedRider: RiderVM
  @ViewChild('userForm', { static: true }) userForm!: NgForm;
  displayedColumns: string[] = ['name', 'email', 'phoneNo', 'actions'];
  dataSource: any;
  constructor(
    public resSvc: RestaurantService,
    private catSvc: CatalogService,
    public dialog: MatDialog,) {
    this.selectedRider = new RiderVM();
  }
  ngOnInit(): void {
    this.GetRider();
    this.selectedRider = new RiderVM;
    this.selectedRider.isActive=true
  }
  Check() {
    this.validFields = true;
  }
  GetRider() {
    this.resSvc.GetRider().subscribe((res: RiderVM[]) => {
      this.Rider = res;
      this.dataSource = new MatTableDataSource(this.Rider);
    });
  }
  DeleteRider(id: number) {
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
        this.resSvc.DeleteRider(id).subscribe((data) => {
          Swal.fire(
            'Deleted!',
            'success'
          )
          this.GetRider();
        })
      }
    })
  }
  GetRiderForEdit(id: number) {
    this.selectedRider = new RiderVM;
    this.selectedRider.id = id
    console.warn(this.selectedRider);
    this.resSvc.SearchRider(this.selectedRider).subscribe((res: RiderVM[]) => {
      this.Rider = res;
      console.warn(this.Rider);
      this.selectedRider = this.Rider[0]
      this.Edit = true;
      this.Add = false;
    })
  }
  SaveRider() {
    this.validFields = true;
    if (!this.userForm.invalid) {
      this.resSvc.SaveRider(this.selectedRider).subscribe({
        next: (res) => {
          console.warn(res);
          this.resSvc.GetRider().subscribe((res: RiderVM[]) => {
            this.Rider = res;
            this.dataSource = new MatTableDataSource(this.Rider);

            this.ngOnInit();
          });
          this.catSvc.SuccessMsgBar("Rider Successfully Added", 5000)
        }, error: (e) => {
          this.catSvc.ErrorMsgBar("Error Occurred", 5000)
          console.warn(e);
        }
      })
    }
  }
  UpdateRider() {
    this.validFields = true;
    if (!this.userForm.invalid) {
      this.resSvc.UpdateRider(this.selectedRider).subscribe({
        next: (res) => {
          this.catSvc.SuccessMsgBar("Rider Successfully Updated", 5000)
          this.Add = true;
          this.Edit = false;

          this.ngOnInit();
        }, error: (e) => {
          this.catSvc.ErrorMsgBar("Error Occurred", 5000)
          console.warn(e);
        }
      })
    }
  }
  Refresh() {
    this.selectedRider = new RiderVM;
    this.Add = true;
    this.Edit = false;
    this.selectedRider.isActive=true
  }
}


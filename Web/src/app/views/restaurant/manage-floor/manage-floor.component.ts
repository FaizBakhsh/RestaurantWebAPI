import { Component, OnInit, ViewChild } from '@angular/core';
import { NgForm } from '@angular/forms';
import { MatDialog } from '@angular/material/dialog';
import { MatSnackBar } from '@angular/material/snack-bar';
import { MatTableDataSource } from '@angular/material/table';
import Swal from 'sweetalert2';
import { ManageTableComponent } from '../manage-table/manage-table.component';
import { FloorVM } from '../Models/FloorVM';
import { RestaurantService } from '../restaurant.service';

@Component({
  selector: 'app-manage-floor',
  templateUrl: './manage-floor.component.html',
  styleUrls: ['./manage-floor.component.css']
})
export class ManageFloorComponent implements OnInit {
  Edit: boolean = false;
  Add: boolean = true;
  validFields: boolean = false;
  public date = new Date();
  Floor: FloorVM[] | undefined;
  @ViewChild('userForm', { static: true }) userForm!: NgForm;
  displayedColumns: string[] = ['FloorName', 'actions'];
  dataSource: any;
  constructor(
    public resSvc: RestaurantService,
    private snack: MatSnackBar,
    public dialog: MatDialog,) {
    this.resSvc.selectedFloor = new FloorVM();
  }
  ngOnInit(): void {
    this.GetFloor();
    this.resSvc.selectedFloor = new FloorVM;
    this.resSvc.selectedFloor.isActive = true;
  }
  Check() {
    this.validFields = true;
  }
  GetFloor() {
    this.resSvc.GetFloor().subscribe((res: FloorVM[]) => {
      this.Floor = res;
      this.dataSource = new MatTableDataSource(this.Floor);
    });
  }
  DeleteFloor(id: number) {
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
        this.resSvc.DeleteFloor(id).subscribe((data) => {
          Swal.fire(
            'Deleted!',
            'Floor has been deleted.',
            'success'
          )
          this.GetFloor();
        })
      }
    })
  }
  GetFloorForEdit(id: number) {
    this.resSvc.selectedFloor = new FloorVM;
    this.resSvc.selectedFloor.id = id
    this.resSvc.SearchFloor(this.resSvc.selectedFloor).subscribe((res: FloorVM[]) => {
      this.Floor = res;
      this.resSvc.selectedFloor = this.Floor[0]
      this.Edit = true;
      this.Add = false;
    })
  }
  SaveFloor() {
    this.validFields = true;
    if (!this.userForm.invalid) {
      this.resSvc.SaveFloor(this.resSvc.selectedFloor).subscribe({
        next: (res) => {
          console.warn(res);
          this.resSvc.GetFloor().subscribe((res: FloorVM[]) => {
            this.Floor = res;
            this.dataSource = new MatTableDataSource(this.Floor);

            this.ngOnInit();
          });
          this.snack.open('Floor  successfully Added!', 'OK', { duration: 4000 })
        }, error: (e) => {
          this.snack.open('Error Occured!', 'OK', { duration: 4000 })
        }
      })
    }
  }
  UpdateFloor() {
    this.validFields = true;
    if (!this.userForm.invalid) {
      this.resSvc.UpdateFloor(this.resSvc.selectedFloor).subscribe({
        next: (res) => {
          this.snack.open('Floor Successfully Updated!', 'OK', { duration: 4000 })
          this.Add = true;
          this.Edit = false;

          this.ngOnInit();
        }, error: (e) => {
          this.snack.open('Error Occured!', 'OK', { duration: 4000 })
          console.warn(e);
        }
      })
    }
  }
  Refresh() {
    this.resSvc.selectedFloor = new FloorVM;
    this.Add = true;
    this.Edit = false;
    this.resSvc.selectedFloor.isActive = true;
  }
  FPValue(fpv: FloorVM) {
    let dialogRef = this.dialog.open(ManageTableComponent, {
      disableClose: true, panelClass: 'calendar-form-dialog', width: '750px', height: '490px'
      , data: { fpvId: fpv.id }
    });
  }
}


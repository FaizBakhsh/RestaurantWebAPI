import { Component, OnInit, ViewChild } from '@angular/core';
import { EmployeeManagementService } from '../employee-management.service';
import { CatalogService } from '../../catalog/catalog.service';
import { StaffVM } from '../Models/StaffVM';
import { MatTableDataSource } from '@angular/material/table';
import { EnumTypeVM } from '../../restaurant/Models/Enums/EnumTypeVM';
import { SettingsVM } from '../../catalog/Models/SettingsVM';
import Swal from 'sweetalert2';
import { __values } from 'tslib';
import { NgForm } from '@angular/forms';
import { RouteIds } from '../../catalog/Models/Enums/RouteIds';

@Component({
  selector: 'app-manage-staff',
  templateUrl: './manage-staff.component.html',
  styleUrls: ['./manage-staff.component.css']
})
export class ManageStaffComponent implements OnInit {
  proccessing?: boolean = false;
  Edit: boolean = false;
  Add: boolean = true;
  dataSource?: any;
  Staff?: StaffVM[];
  Type?: SettingsVM[];
  displayedColumns: string[] = ['name', 'fatherName', 'type', 'isActive', 'actions'];
  selectedStaff: StaffVM
  @ViewChild("userForm") userForm: NgForm
  isReadOnly: boolean = false
  constructor(
    private empMngSVC: EmployeeManagementService,
    private catSVC: CatalogService
  ) {
    this.selectedStaff = new StaffVM
  }
  ngOnInit() {
    this.isReadOnly = this.catSVC.getPermission(RouteIds.Staff)
    this.Add = true;
    this.Edit = false
    this.selectedStaff = new StaffVM
    this.GetStaff()
    this.GetType()
    this.selectedStaff.isActive = true;
  }
  GetStaff() {
    var staff = new StaffVM
    staff.clientId = +localStorage.getItem("RMSClientId")
    this.empMngSVC.SearchStaff(staff).subscribe({
      next: (value: StaffVM[]) => {
        this.Staff = value
        this.dataSource = new MatTableDataSource(this.Staff)
      }, error: (err) => {
        this.catSVC.ErrorMsgBar("Error Occured", 5000)
      },
    })
  }
  GetType() {
    var stng = new SettingsVM
    stng.enumTypeId = EnumTypeVM.StaffTypes
    stng.isActive = true
    this.catSVC.SearchSettings(stng).subscribe({
      next: (value: SettingsVM[]) => {
        this.Type = value
      }, error: (err) => {
        this.catSVC.ErrorMsgBar("Error Occured", 5000)
      },
    })
  }
  SaveStaff() {
    if (this.selectedStaff.typeId == 0 || this.selectedStaff.typeId == undefined)
      this.userForm.controls['typeId'].setErrors({ "incorrect": true })
    if (!this.userForm.invalid) {
      this.selectedStaff.clientId = +localStorage.getItem("RMSClientId")
      if (this.Edit)
        this.UpdateStaff()
      else {
        this.empMngSVC.SaveStaff(this.selectedStaff).subscribe({
          next: (value) => {
            this.catSVC.SuccessMsgBar("Successfully Added", 5000);
            this.ngOnInit()
          }, error: (err) => {
            this.catSVC.ErrorMsgBar("Error Occured", 5000)
          },
        })
      }
    }
    else
      this.catSVC.ErrorMsgBar("Please fill all required fields", 5000)
  }
  EditStaff(value: StaffVM) {
    window.scrollTo(0, 0)
    this.Add = false;
    this.Edit = true;
    this.selectedStaff = value
  }
  DeleteStaff(value: StaffVM) {
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
        this.empMngSVC.DeleteStaff(value.id).subscribe({
          next: (data: any) => {
            Swal.fire(
              'Deleted!',
              'Successfully deleted.',
              'success'
            )
            this.ngOnInit();
          }, error: (e) => {
            this.catSVC.ErrorMsgBar("Error Occurred", 5000)
            console.warn(e);
          }
        })
      }
    })
  }
  UpdateStaff() {
    this.proccessing = true
    this.empMngSVC.UpdateStaff(this.selectedStaff).subscribe({
      next: (value) => {
        this.proccessing = false
        this.catSVC.SuccessMsgBar("Successfully Updated", 5000)
        this.ngOnInit()
      }, error: (err) => {
        this.proccessing = false
        this.catSVC.ErrorMsgBar("Error Occured", 5000)
      },
    })
  }
}

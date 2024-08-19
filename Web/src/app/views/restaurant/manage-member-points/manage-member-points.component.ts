import { RestaurantService } from './../../restaurant/restaurant.service';
import { BranchVM } from './../../restaurant/Models/BranchVM';
import { Component, OnInit, ViewChild } from '@angular/core';
import { NgForm } from '@angular/forms';
import { IconSetService } from '@coreui/icons-angular';
import { MatSnackBar } from '@angular/material/snack-bar';
import { iconSubset } from 'src/app/icons/icon-subset';
import { MatTableDataSource } from '@angular/material/table';
import Swal from 'sweetalert2';
import { MemberPointsVM } from '../Models/MemberPointsVM';
import { CatalogService } from '../../catalog/catalog.service';
import { RouteIds } from '../../catalog/Models/Enums/RouteIds';

@Component({
  selector: 'app-manage-member-points',
  templateUrl: './manage-member-points.component.html',
  styleUrls: ['./manage-member-points.component.css']
})
export class ManageMemberPointsComponent implements OnInit {
  Edit: boolean = false;
  Add: boolean = true;
  validFields: boolean = false;
  public date = new Date();
  points: MemberPointsVM[] | undefined;
  selectedPoints: MemberPointsVM
  @ViewChild('userForm', { static: true }) userForm!: NgForm;
  displayedColumns: string[] = ['minSale', 'maxSale', 'points', 'actions'];
  dataSource: any;
  isReadOnly: boolean = false
  constructor(
    private iconSetService: IconSetService,
    public resSVC: RestaurantService,
    private catSvc: CatalogService,
  ) {
    this.selectedPoints = new MemberPointsVM();
    iconSetService.icons = { ...iconSubset };
  }
  ngOnInit(): void {
    this.isReadOnly = this.catSvc.getPermission(RouteIds.MemberPoints)
    this.Add = true;
    this.Edit = false;
    this.selectedPoints = new MemberPointsVM
    this.GetPoints();
    this.selectedPoints.isActive = true;
  }
  GetPoints() {
    var points = new MemberPointsVM
    points.clientId = +localStorage.getItem("RMSClientId")
    this.resSVC.SearchMemberPoints(points).subscribe({
      next: (res: MemberPointsVM[]) => {
        this.points = res;
        this.dataSource = new MatTableDataSource(this.points);
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  DeletePoints(id: number) {
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
        this.resSVC.DeleteMemberPoints(id).subscribe({
          next: (data) => {
            Swal.fire(
              'Deleted!',
              'MemberPoint has been deleted.',
              'success'
            )
            this.GetPoints();
          }, error: (e) => {
            this.catSvc.ErrorMsgBar("Error Occurred", 5000)
            console.warn(e);
          }
        })
      }
    })
  }
  GetPointsForEdit(id: number) {
    this.selectedPoints = new MemberPointsVM;
    this.selectedPoints.id = id
    this.selectedPoints.clientId = +localStorage.getItem("RMSClientId")
    this.resSVC.SearchMemberPoints(this.selectedPoints).subscribe({
      next: (res: MemberPointsVM[]) => {
        this.points = res;
        console.warn(this.points);
        this.selectedPoints = this.points[0]
        this.Edit = true;
        this.Add = false;
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  SavePoints() {
    debugger
    if (!this.userForm.invalid) {
      this.selectedPoints.clientId = +localStorage.getItem("RMSClientId")
      this.resSVC.SaveMemberPoints(this.selectedPoints).subscribe({
        next: (res) => {
          this.catSvc.SuccessfullyAddMsg()
          this.Add = true;
          this.Edit = false;
          this.ngOnInit();
        }, error: (e) => {
          this.catSvc.ErrorMsgBar("Error Occurred", 5000)
          console.warn(e);
        }
      })
    } else
      this.catSvc.ErrorMsgBar("Please Fill all required fields!", 5000)
  }
  UpdatePoints() {
    this.validFields = true;
    if (!this.userForm.invalid) {
      this.selectedPoints.clientId = +localStorage.getItem("RMSClientId")
      this.resSVC.UpdateMemberPoints(this.selectedPoints).subscribe({
        next: (res) => {
          this.catSvc.SuccessfullyUpdateMsg()
          this.Add = true;
          this.Edit = false;
          this.ngOnInit();
        }, error: (e) => {
          this.catSvc.ErrorMsgBar("Error Occurred", 5000)
          console.warn(e);
        }
      })
    }
    else
      this.catSvc.ErrorMsgBar("Please Fill all required fields!", 5000)
  }
  Refresh() {
    this.selectedPoints = new MemberPointsVM
    this.Add = true;
    this.Edit = false;
    this.selectedPoints.isActive = true;
  }
}

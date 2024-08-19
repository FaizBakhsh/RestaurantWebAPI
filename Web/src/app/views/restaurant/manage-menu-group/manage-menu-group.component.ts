import { Component, OnInit, ViewChild } from '@angular/core';
import { MenuGroupVM } from '../Models/MenuGroupVM';
import { NgForm } from '@angular/forms';
import { RestaurantService } from '../restaurant.service';
import { CatalogService } from '../../catalog/catalog.service';
import { MatDialog } from '@angular/material/dialog';
import { MatTableDataSource } from '@angular/material/table';
import { BranchVM } from '../Models/BranchVM';
import { RouteIds } from '../../catalog/Models/Enums/RouteIds';
@Component({
  selector: 'app-manage-menu-group',
  templateUrl: './manage-menu-group.component.html',
  styleUrls: ['./manage-menu-group.component.css']
})
export class ManageMenuGroupComponent implements OnInit {
  proccessing: boolean = false;
  Edit: boolean = false;
  Add: boolean = true;
  public date = new Date();
  MenuGroups?: MenuGroupVM[];
  selectedMenuGroup: MenuGroupVM
  @ViewChild('userForm', { static: true }) userForm!: NgForm;
  displayedColumns: string[] = ['Name', 'Branch', 'SubGroup', 'Description', 'isActive', 'actions'];
  dataSource: any;
  branches: BranchVM[]
  isReadOnly: boolean = false
  constructor(
    public resSvc: RestaurantService,
    private catSvc: CatalogService,
    public dialog: MatDialog,) {
    this.selectedMenuGroup = new MenuGroupVM();
  }
  ngOnInit(): void {
    this.isReadOnly = this.catSvc.getPermission(RouteIds.MenuGroup)
    this.Add = true;
    this.Edit = false;
    this.selectedMenuGroup = new MenuGroupVM
    this.GetMenuGroup();
    this.SearchBranch()
    this.selectedMenuGroup.isActive = true;
  }

  GetMenuGroup() {
    var MenuGroup = new MenuGroupVM
    MenuGroup.clientId = +localStorage.getItem("RMSClientId")
    this.resSvc.SearchMenuGroup(MenuGroup).subscribe({
      next: (res: MenuGroupVM[]) => {
        this.MenuGroups = res;
        this.dataSource = new MatTableDataSource(this.MenuGroups);
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  SearchBranch() {
    var branch = new BranchVM
    branch.isActive = true
    branch.clientId = +localStorage.getItem("RMSClientId")
    this.resSvc.SearchBranch(branch).subscribe({
      next: (res: BranchVM[]) => {
        this.branches = res;
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  GetMenuGroupForEdit(id: number) {
    window.scrollTo(0, 0)
    this.selectedMenuGroup = new MenuGroupVM;
    this.selectedMenuGroup.id = id
    this.selectedMenuGroup.clientId = +localStorage.getItem("RMSClientId")
    this.resSvc.SearchMenuGroup(this.selectedMenuGroup).subscribe({
      next: (res: MenuGroupVM[]) => {
        this.selectedMenuGroup = res[0]
        this.Edit = true;
        this.Add = false;
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  SaveMenuGroup() {
    this.proccessing = true
    if (!this.userForm.invalid) {
      var group = new MenuGroupVM
      group.name = this.selectedMenuGroup.name
      group.clientId = +localStorage.getItem("RMSClientId")
      this.resSvc.SearchMenuGroup(group).subscribe({
        next: (res: MenuGroupVM[]) => {
          if (this.Edit)
            res = res.filter(x => x.id != this.selectedMenuGroup.id)
          if (res.length > 0) {
            this.proccessing = false
            this.catSvc.ErrorMsgBar("Group with this name already Exist", 5000)
          }
          else {
            this.selectedMenuGroup.clientId = +localStorage.getItem("RMSClientId")
            if (this.Edit)
              this.UpdateMenuGroup()
            else {
              this.resSvc.SaveMenuGroup(this.selectedMenuGroup).subscribe({
                next: (res) => {
                  this.catSvc.SuccessMsgBar("MenuGroup Successfully Added!", 5000)
                  this.Add = true;
                  this.Edit = false;
                  this.proccessing = false
                  this.Refresh();
                }, error: (e) => {
                  this.catSvc.ErrorMsgBar("Error Occurred", 5000)
                  console.warn(e);
                  this.proccessing = false
                }
              })
            }
          }
        }, error: () => {
          this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        }
      })
    } else {
      this.catSvc.ErrorMsgBar("Please Fill all required fields!", 5000)
      this.proccessing = false
    }
  }
  UpdateMenuGroup() {
    this.proccessing = true
    this.resSvc.UpdateMenuGroup(this.selectedMenuGroup).subscribe({
      next: (res) => {
        this.catSvc.SuccessMsgBar(" Successfully Updated!", 5000)
        this.Add = true;
        this.Edit = false;
        this.proccessing = false
        this.Refresh();
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
        this.proccessing = false
      }
    })
  }
  Refresh() {
    this.GetMenuGroup()
    this.selectedMenuGroup.name = "";
    this.Add = true;
    this.Edit = false;
    this.selectedMenuGroup.isActive = true
  }
}


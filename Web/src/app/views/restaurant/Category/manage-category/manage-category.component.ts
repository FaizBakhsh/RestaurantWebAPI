import { RestaurantService } from './../../restaurant.service';
import { Component, OnInit, ViewChild } from '@angular/core';
import { IconSetService } from '@coreui/icons-angular';
import { iconSubset } from 'src/app/icons/icon-subset';
import { CategoryVM } from '../../Models/CategoryVM';
import { SubCategoryVM } from '../../Models/SubCategoryVM';
import { ManageSubCategoryComponent } from '../../SubCategory/manage-sub-category/manage-sub-category.component';
import { MatTableDataSource } from '@angular/material/table';
import { MatDialog } from '@angular/material/dialog';
import Swal from 'sweetalert2';
import { MatSnackBar } from '@angular/material/snack-bar';
import { NgForm } from '@angular/forms';

@Component({
  selector: 'app-manage-category',
  templateUrl: './manage-category.component.html',
  styleUrls: ['./manage-category.component.css']
})
export class ManageCategoryComponent implements OnInit {
  Edit: boolean = false;
  Add: boolean = true;
  validFields: boolean = false;
  public date = new Date();
  category: CategoryVM[] | undefined;
  @ViewChild('userForm', { static: true }) userForm!: NgForm;
  displayedColumns: string[] = ['categoryName', 'actions'];
  dataSource: any;
  constructor(
    private iconSetService: IconSetService,
    public resSvc: RestaurantService,
    private snack: MatSnackBar,
    public dialog: MatDialog,) {
    this.resSvc.selectedCategory = new CategoryVM();
    iconSetService.icons = { ...iconSubset };
  }
  ngOnInit(): void {
    this.GetCategory();
    this.resSvc.selectedCategory = new CategoryVM;
    this.resSvc.selectedCategory.isActive=true
  }
  Check() {
    this.validFields = true;
  }
  GetCategory() {
    this.resSvc.GetCategory().subscribe((res: CategoryVM[]) => {
      this.category = res;
      this.dataSource = new MatTableDataSource(this.category);
    });
  }
  DeleteCategory(id: number) {
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
        this.resSvc.DeleteCategory(id).subscribe((data) => {
          Swal.fire(
            'Deleted!',
            'Category has been deleted.',
            'success'
          )
          this.GetCategory();
        })
      }
    })
  }
  GetCategoryForEdit(id: number) {
    this.resSvc.selectedCategory = new CategoryVM;
    this.resSvc.selectedCategory.id = id
    this.resSvc.SearchCategory(this.resSvc.selectedCategory).subscribe((res: CategoryVM[]) => {
      this.category = res;
      this.resSvc.selectedCategory = this.category[0]
      this.Edit = true;
      this.Add = false;
    })
  }
  SaveCategory() {
    this.validFields = true;
    if (!this.userForm.invalid) {
      this.resSvc.SaveCategory(this.resSvc.selectedCategory).subscribe({
        next: (res) => {
          console.warn(res);
          this.resSvc.GetCategory().subscribe((res: CategoryVM[]) => {
            this.category = res;
            this.dataSource = new MatTableDataSource(this.category);

            this.ngOnInit();
          });
          this.snack.open('Category  successfully Added!', 'OK', { duration: 4000 })
        }, error: (e) => {
          this.snack.open('Error Occured!', 'OK', { duration: 4000 })
        }
      })
    }
  }
  UpdateCategory() {
    this.validFields = true;
    if (!this.userForm.invalid) {

      this.resSvc.UpdateCategory(this.resSvc.selectedCategory).subscribe({
        next: (res) => {
          this.snack.open('Category Successfully Updated!', 'OK', { duration: 4000 })
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
    this.resSvc.selectedCategory = new CategoryVM;
    this.Add = true;
    this.Edit = false;
    this.resSvc.selectedCategory.isActive=true;
  }
  FPValue(fpv: SubCategoryVM) {
    let dialogRef = this.dialog.open(ManageSubCategoryComponent, {
      disableClose: true, panelClass: 'calendar-form-dialog', width: '750px', height: '490px'
      , data: { fpvId: fpv.id }
    });
  }
}


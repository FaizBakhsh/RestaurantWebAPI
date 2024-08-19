import { Component, Inject, OnInit, ViewChild } from '@angular/core';
import { NgForm } from '@angular/forms';
import { MatDialog, MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { MatSnackBar } from '@angular/material/snack-bar';
import { MatTableDataSource } from '@angular/material/table';
import Swal from 'sweetalert2';
import { ItemComponent } from '../../ManageItem/item/item.component';
import { CategoryVM } from '../../Models/CategoryVM';
import { SubCategoryVM } from '../../Models/SubCategoryVM';
import { RestaurantService } from '../../restaurant.service';

@Component({
  selector: 'app-manage-sub-category',
  templateUrl: './manage-sub-category.component.html',
  styleUrls: ['./manage-sub-category.component.scss']
})
export class ManageSubCategoryComponent implements OnInit {
  Edit: boolean = false;
  Add: boolean = true;
  validFields: boolean = false;
  category!: CategoryVM[];
  categoryId!: number;
  categoryName!: string;
  subCategoryId!: number;
  durationInSeconds = 3;
  displayedColumns!: string[];
  dataSource: any;
  subCategory!: SubCategoryVM[]
  @ViewChild('userForm', { static: true }) userForm!: NgForm;
  hide = true;
  constructor(
    @Inject(MAT_DIALOG_DATA) public data: any,
    public dialogRef: MatDialogRef<ManageSubCategoryComponent>,
    private snack: MatSnackBar,
    public dialog: MatDialog,
    public resSvc: RestaurantService,
  ) {
    this.resSvc.selectedSubCategory = new SubCategoryVM();
  }
  ngOnInit(): void {
    this.categoryId = this.data.fpvId;
    this.GetById();
    this.GetSubCategory();
    this.Edit = false;
    this.Add = true;
    this.resSvc.selectedSubCategory.isActive=true
  }
  GetById() {
    //  this.resSvc.selectedCategory = new CategoryVM;
    this.resSvc.selectedCategory.id = this.categoryId
    this.resSvc.SearchCategory(this.resSvc.selectedCategory).subscribe((res: CategoryVM[]) => {
      this.category = res;
      this.categoryName = this.category[0].categoryName
      this.resSvc.selectedSubCategory.categoryName = this.category[0].categoryName
    })
  }
  GetSubCategory() {
    debugger
    this.resSvc.selectedSubCategory = new SubCategoryVM
    this.resSvc.selectedSubCategory.categoryId = this.categoryId
    this.resSvc.SearchSubCategory(this.resSvc.selectedSubCategory).subscribe((res: SubCategoryVM[]) => {
      this.subCategory = res;
      if (res.length !== 0)
        this.displayedColumns = ['SubCategory', 'actions'];
      this.dataSource = new MatTableDataSource(this.subCategory);
    });
  }
  SaveSubCategory() {
    this.validFields = true;
    if (!this.userForm.invalid) {
      if (this.Edit == true) {
        this.PutSubCategory();
      } else {
        this.resSvc.selectedSubCategory.categoryId = this.categoryId
        this.resSvc.SaveSubCategory(this.resSvc.selectedSubCategory).subscribe({
          next: (res) => {
            this.ngOnInit();
            this.snack.open('SubCategory Added!', 'OK', { duration: 4000 })
            this.validFields = false;
            // window.location.reload();  
          }, error: (e) => {
            this.snack.open('Error Occured!', 'OK', { duration: 4000 })
            console.warn(e);
          }
        })
      }
    }
  }
  PutSubCategory() {
    this.resSvc.UpdateSubCategory(this.resSvc.selectedSubCategory).subscribe({
      next: (res) => {
        this.snack.open('SubCategory Updated Successfully!', 'OK', { duration: 4000 })
        this.validFields = false;
        this.Add = true;
        this.Edit = false;
        this.resSvc.selectedSubCategory.subCategoryName = '';
        this.ngOnInit();
      }, error: (e) => {
        this.snack.open('Error Occured!', 'OK', { duration: 4000 })
        console.warn(e);
      }
    })
  }
  GetSubCategoryForEdit(id: any) {
    this.resSvc.selectedSubCategory = new SubCategoryVM;
    //this.ngOnInit();
    this.resSvc.selectedSubCategory.id = id
    this.resSvc.SearchSubCategory(this.resSvc.selectedSubCategory).subscribe((res: SubCategoryVM[]) => {
      this.subCategory = res;
      this.resSvc.selectedSubCategory = this.subCategory[0]
      this.resSvc.selectedSubCategory.categoryName = this.categoryName
      this.Edit = true;
      this.Add = false;
    })
  }
  DeleteSubCategory(id: any) {
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
        this.resSvc.DeleteSubCategory(id).subscribe((data) => {
          Swal.fire(
            'Deleted!',
            'SubCategory has been deleted.',
            'success'
          )
          this.ngOnInit();
        })
      }
    })
  }
  GetItems(subCategory: SubCategoryVM) {
    // let dialogRef = this.dialog.open(ItemComponent, {
    //   disableClose: true, panelClass: 'calendar-form-dialog', width: '800px', height: '500px'
    //   , data: { subCategoryId: subCategory.id }
    // });
  }
}


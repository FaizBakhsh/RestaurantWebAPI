import { Component, OnInit } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { MatSnackBar } from '@angular/material/snack-bar';
import { MatTableDataSource } from '@angular/material/table';
import { Router } from '@angular/router';
import Swal from 'sweetalert2';
import { RecipeVM } from '../../../Models/RecipeVM';
import { RestaurantService } from '../../../restaurant.service';

@Component({
  selector: 'app-recipe-list',
  templateUrl: './recipe-list.component.html',
  styleUrls: ['./recipe-list.component.css']
})
export class RecipeListComponent implements OnInit {
  getById!: RecipeVM;
  Recipe: RecipeVM[] | undefined;;
  Edit: boolean = true;
  displayedColumns: string[] = ['Group', 'MenuItem', 'FlavorSize', 'RawItem', 'UOM', 'QTY', 'Price', 'Amount', 'OrderType', 'Action'];
  dataSource: any;
  constructor(
    private route: Router,
    private snack: MatSnackBar,
    public dialog: MatDialog,
    public resSvc: RestaurantService,
  ) {
    this.resSvc.selectedRecipe = new RecipeVM();
  }
  ngOnInit(): void {
    this.GetRecipe();
  }
  GetRecipe() {
    this.resSvc.GetRecipe().subscribe({
      next: (res: RecipeVM[]) => {
        this.Recipe = res;
        console.warn(this.Recipe)
        this.dataSource = new MatTableDataSource(this.Recipe);
      }, error: (e) => {
        this.snack.open('Error Occured!', 'OK', { duration: 4000 })
        console.warn(e);
      }
    })
  }
  EditRecipe(cust: RecipeVM) {
    this.route.navigate(['/restaurant/recipe'], {
      queryParams: {
        id: cust.id
      }
    });
  }
  DeleteRecipe(id: number) {
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
        // this.resSvc.DeleteRecipe(id).subscribe({
        //   next: (data) => {
        //     Swal.fire(
        //       'Deleted!',
        //       'Recipe has been deleted.',
        //       'success'
        //     )
        //     this.GetRecipe();
        //   }, error: (e) => {
        //     this.snack.open('Error Occured!', 'OK', { duration: 4000 })
        //     console.warn(e);
        //   }
        // })
      }
    })
  }
  applyFilter(event: Event) {
    const filterValue = (event.target as HTMLInputElement).value;
    this.dataSource.filter = filterValue.trim().toLowerCase();
  }
}


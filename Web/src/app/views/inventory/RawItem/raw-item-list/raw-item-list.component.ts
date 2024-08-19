import { CatalogService } from './../../../catalog/catalog.service';
import { Component, OnInit, ViewChild } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { MatSnackBar } from '@angular/material/snack-bar';
import { MatSort } from '@angular/material/sort';
import { MatTableDataSource } from '@angular/material/table';
import { Router } from '@angular/router';
import { RouteIds } from 'src/app/views/catalog/Models/Enums/RouteIds';
import { ItemVM } from 'src/app/views/restaurant/Models/ItemVM';
import { RecipeVM } from 'src/app/views/restaurant/Models/RecipeVM';
import { RestaurantService } from 'src/app/views/restaurant/restaurant.service';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-raw-item-list',
  templateUrl: './raw-item-list.component.html',
  styleUrls: ['./raw-item-list.component.css']
})
export class RawItemListComponent implements OnInit {
  getEmpById!: ItemVM;
  Item: ItemVM[] = [];;
  Edit: boolean = true;
  selectedItem: ItemVM
  // @ViewChild(MatSort) sort?: MatSort;
  displayedColumns: string[] = ['name', 'category', 'subCategory', 'code', 'price', 'uom',
    'vendor', 'packingQty', 'minOrderLevel', 'maxOrderLevel', 'packingName', 'isActive', 'Action'];
  dataSource: any;
  isReadOnly: boolean = false
  constructor(
    private route: Router,
    private catSvc: CatalogService,
    public dialog: MatDialog,
    public resSvc: RestaurantService,
  ) {
    this.selectedItem = new ItemVM();
  }

  ngOnInit(): void {
    this.isReadOnly = this.catSvc.getPermission(RouteIds.RawItem)
    this.GetItem();
  }
  GetItem() {
    this.selectedItem.itemTypeId = 1012001
    this.selectedItem.clientId = +localStorage.getItem("RMSClientId")
    this.resSvc.SearchItem(this.selectedItem).subscribe({
      next: (res: ItemVM[]) => {
        this.Item = res;
        console.warn(this.Item)
        this.dataSource = new MatTableDataSource(this.Item);
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
      }
    })
  }
  EditItem(item: ItemVM) {
    this.route.navigate(['/inventory/rawItem'], {
      queryParams: {
        id: item.id
      }
    });
  }
  DeleteItem(id: number) {
    var recipe = new RecipeVM
    recipe.rawItemId = id
    this.resSvc.SearchRecipe(recipe).subscribe({
      next: (retVal: RecipeVM[]) => {
        if (retVal.length == 1)
          this.catSvc.ErrorMsgBar("Can't delete it as it's used in a recipe", 9000)
        else if (retVal.length > 1)
          this.catSvc.ErrorMsgBar("Can't delete it as it's used in  recipes", 9000)
        else {
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
              this.resSvc.DeleteItem(id).subscribe({
                next: (data) => {
                  Swal.fire(
                    'Deleted!',
                    'Item has been deleted.',
                    'success'
                  )
                  this.GetItem();
                }, error: (e) => {
                  this.catSvc.ErrorMsgBar("Error Occurred", 5000)
                }
              })
            }
          })
        }
      }, error: (err) => {

      },
    })
  }
  applyFilter(event: Event) {
    const filterValue = (event.target as HTMLInputElement).value;
    this.dataSource.filter = filterValue.trim().toLowerCase();
  }
}

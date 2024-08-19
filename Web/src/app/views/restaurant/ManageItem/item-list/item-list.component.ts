import { CatalogService } from './../../../catalog/catalog.service';
import { ItemTypes } from './../../Models/Enums/ItemType';
import { Component, OnInit, ViewChild } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { MatSnackBar } from '@angular/material/snack-bar';
import { MatSort } from '@angular/material/sort';
import { MatTableDataSource } from '@angular/material/table';
import { Router } from '@angular/router';
import Swal from 'sweetalert2';
import { ItemVM } from '../../Models/ItemVM';
import { RestaurantService } from '../../restaurant.service';
import { SizeVM } from '../../Models/SizeVM';
import { RuntimeModifierVM } from '../../Models/RuntimeModifierVM';
import { RouteIds } from 'src/app/views/catalog/Models/Enums/RouteIds';

@Component({
  selector: 'app-item-list',
  templateUrl: './item-list.component.html',
  styleUrls: ['./item-list.component.css']
})
export class ItemListComponent implements OnInit {
  Item: ItemVM[] = [];;
  Edit: boolean = true;
  displayedColumns: string[] = ['name', 'group', 'code', 'price',
    'actualPrice', 'tax',
    'kds', 'totalItemsAllowed', 'startDate', 'endDate', 'target', 'isActive', 'Action'];
  dataSource: any;
  isReadOnly: boolean = false
  constructor(
    private route: Router,
    private catSvc: CatalogService,
    public dialog: MatDialog,
    public resSvc: RestaurantService,
  ) {
  }
  ngOnInit(): void {
    this.GetItem();
  }
  GetItem() {
    this.isReadOnly = this.catSvc.getPermission(RouteIds.MenuItem)
    var item = new ItemVM
    item.itemTypeId = ItemTypes.MenuItem
    item.clientId = +localStorage.getItem("RMSClientId")
    this.resSvc.SearchItem(item).subscribe({
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
    this.route.navigate(['/restaurant/sale/manageItem'], {
      queryParams: {
        id: item.id
      }
    });
  }
  DeleteItem(id: number) {
    var size = new SizeVM()
    size.itemId = id;
    this.resSvc.SearchSize(size).subscribe((res: SizeVM[]) => {
      if (res.length == 0) {
        var modifier = new RuntimeModifierVM()
        modifier.menuItemId = id;
        this.resSvc.SearchRuntimeModifier(modifier).subscribe((res: RuntimeModifierVM[]) => {
          if (res.length == 0) {
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
          else if (res.length == 1)
            this.catSvc.ErrorMsgBar("Unable to delete because it contains a Runtime Modifier!", 5000)
          else
            this.catSvc.ErrorMsgBar("Unable to delete because it contains Runtime Modifiers!", 5000)
        });
      }
      else if (res.length == 1)
        this.catSvc.ErrorMsgBar("Unable to delete because it contains a size!", 5000)
      else
        this.catSvc.ErrorMsgBar("Unable to delete because it contains sizes!", 5000)
    });
  }
  updateFilter(event: any) {
    // const val = event.target.value.toLowerCase();
    // var columns = Object.keys(this.Item[0]);
    // // Removes last "$$index" from "column"
    // columns.splice(columns.length - 1);

    // // console.log(columns);
    // if (!columns.length)
    //   return;
    // const rows = this.Item.filter(function (d) {
    //   for (let i = 0; i <= columns.length; i++) {
    //     let column = columns[i];
    //     // console.log(d[column]);
    //     if (d[column] && d[column].toString().toLowerCase().indexOf(val) > -1) {
    //       return true;
    //     }
    //   }
    // });
    // this.dataSource = new MatTableDataSource(rows);
    // this.length = this.dataSource.filteredData.length;
  }
  applyFilter(event: Event) {
    const filterValue = (event.target as HTMLInputElement).value;
    this.dataSource.filter = filterValue.trim().toLowerCase();
  }
}

import { CatalogService } from '../../../../catalog/catalog.service';
import { Component, OnInit } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { MatSnackBar } from '@angular/material/snack-bar';
import { MatTableDataSource } from '@angular/material/table';
import { Router } from '@angular/router';
import Swal from 'sweetalert2';
import { SizeVM } from '../../../Models/SizeVM';
import { RestaurantService } from '../../../restaurant.service';

@Component({
  selector: 'app-size-list',
  templateUrl: './size-list.component.html',
  styleUrls: ['./size-list.component.css']
})
export class SizeListComponent implements OnInit {
  getEmpById!: SizeVM;
  Size: SizeVM[] | undefined;;
  Edit: boolean = true;
  displayedColumns: string[] = ['SizeName', 'Group', 'Item', 'KDS', 'Price', 'ActualPrice', 'Tax', 'Cost', 'SuggestedPrice', 'CurrentMargin', 'SuggestedMargin', 'isActive', 'Action'];
  dataSource: any;
  constructor(
    private route: Router,
    private catSvc: CatalogService,
    public dialog: MatDialog,
    public resSvc: RestaurantService,
  ) {
    this.resSvc.selectedSize = new SizeVM();
  }
  ngOnInit(): void {
    this.GetSize();
  }
  GetSize() {
    this.resSvc.GetSize().subscribe({
      next: (res: SizeVM[]) => {
        this.Size = res;
        console.warn(this.Size)
        this.dataSource = new MatTableDataSource(this.Size);
      }, error: (e) => {
        this.catSvc.ErrorMsgBar("Error Occurred", 5000)
        console.warn(e);
      }
    })
  }
  EditSize(cust: SizeVM) {
    this.route.navigate(['/restaurant/sale/Size'], {
      queryParams: {
        id: cust.id
      }
    });
  }
  DeleteSize(id: number) {
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
        this.resSvc.DeleteSize(id).subscribe({
          next: (data) => {
            Swal.fire(
              'Deleted!',
              'Size has been deleted.',
              'success'
            )
            this.GetSize();
          }, error: (e) => {
            this.catSvc.ErrorMsgBar("Error Occurred", 5000)
            console.warn(e);
          }
        })
      }
    })
  }
  applyFilter(event: Event) {
    const filterValue = (event.target as HTMLInputElement).value;
    this.dataSource.filter = filterValue.trim().toLowerCase();
  }
}

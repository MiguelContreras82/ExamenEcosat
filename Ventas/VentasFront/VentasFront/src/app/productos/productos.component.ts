import { Component, OnInit,ViewChild } from '@angular/core';
import { HttpRequestService } from '../services/HttpRequest/http-request.service';
import { DomSanitizer } from '@angular/platform-browser';
import { MatTableDataSource, MatTableModule } from '@angular/material/table';
import { MatInputModule } from '@angular/material/input';
import { MatSort, MatSortModule } from '@angular/material/sort';
import { MatFormFieldModule } from '@angular/material/form-field';
import {
  MatDialog,
  MatDialogActions,
  MatDialogClose,
  MatDialogContent,
  MatDialogTitle,
} from '@angular/material/dialog';
import { MatPaginator, MatPaginatorModule } from '@angular/material/paginator';

@Component({
  selector: 'app-productos',
  templateUrl: './productos.component.html',
  styleUrl: './productos.component.css'
})
export class ProductosComponent {
  cargando: boolean = false;
  ProductosSource: any;
  productos: any;
  columnasProductos: string[] = ["Folio" ,"Departamento", "Descripcion", "Precio"];
  @ViewChild(MatPaginator) paginator: MatPaginator;
  @ViewChild(MatSort) sort: MatSort;

  constructor(private reqS: HttpRequestService) { }

  applyFilter(event: Event) {
    const filterValue = (event.target as HTMLInputElement).value;
    this.ProductosSource.filter = filterValue.trim().toLowerCase();
    if (this.ProductosSource.paginator) {
      this.ProductosSource.paginator.firstPage();
    }
  }
  ngOnInit() {
    this.getProd();
  }


  async getProd() {
    this.cargando = true;
    let data = await this.reqS.getProductos();
    this.cargando = false;
    this.productos = data["data"];    
    this.ProductosSource = new MatTableDataSource(this.productos);
    setTimeout(() => {
      this.ProductosSource.paginator = this.paginator;
      this.ProductosSource.sort = this.sort;
    })
  }


}

import { Component, OnInit, ViewChild } from '@angular/core';
import { HttpRequestService } from '../services/HttpRequest/http-request.service';
import { DomSanitizer } from '@angular/platform-browser';
import { MatTableDataSource, MatTableModule } from '@angular/material/table';
import { MatInputModule } from '@angular/material/input';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatSort, MatSortModule } from '@angular/material/sort';
import {
  MatDialog,
  MatDialogActions,
  MatDialogClose,
  MatDialogContent,
  MatDialogTitle,
} from '@angular/material/dialog';
import { MatPaginator, MatPaginatorModule } from '@angular/material/paginator';
import { GenerarVentaComponent } from './generar-venta/generar-venta.component';


@Component({
  selector: 'app-principal',
  templateUrl: './principal.component.html',
  styleUrl: './principal.component.css'
})
export class PrincipalComponent {

  cargando: boolean = false;
  ventasSource: any;
  ventas: any;
  columnasVentas: string[] = ["Importe", "Usuario", "Fecha", "CantidadProd"];
  @ViewChild(MatPaginator) paginator: MatPaginator;
  @ViewChild(MatSort) sort: MatSort;
  constructor(private reqS: HttpRequestService, public dialog: MatDialog) {

  }
  applyFilter(event: Event) {
    const filterValue = (event.target as HTMLInputElement).value;
    this.ventasSource.filter = filterValue.trim().toLowerCase();
    if (this.ventasSource.paginator) {
      this.ventasSource.paginator.firstPage();
    }
  }
  ngOnInit() {
    this.getVentas();
  }
  async getVentas() {
    this.cargando = true;
    let data = await this.reqS.getVetnas();
    this.cargando = false;
    this.ventas = data["data"];
    this.ventasSource = new MatTableDataSource(this.ventas);
    setTimeout(() => {
      this.ventasSource.paginator = this.paginator;
      this.ventasSource.sort = this.sort;
    });
  }
  generarVenta() {
    const dialog = this.dialog.open(GenerarVentaComponent, {
      height: "69%",
      width: "69%"
    });
    dialog.afterClosed().subscribe(result => {
      if (result !== undefined) {
        let usuario: any = localStorage.getItem("login");
        let dataAEnviar = {
          usuarioId: JSON.parse(usuario)['idUsuario'],
          venta: result
        }
        this.cargando = true;
        this.reqS.generarVenta(dataAEnviar);
        this.getVentas();
      }
    });

  }


}

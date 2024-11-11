import { Component, ElementRef, ViewChild, inject } from '@angular/core';
import {
  MAT_DIALOG_DATA,
  MatDialog,
  MatDialogActions,
  MatDialogClose,
  MatDialogContent,
  MatDialogRef,
  MatDialogTitle,
} from '@angular/material/dialog';
import { HttpRequestService } from '../../services/HttpRequest/http-request.service';
import { FormControl } from '@angular/forms';
@Component({
  selector: 'app-generar-venta',
  templateUrl: './generar-venta.component.html',
  styleUrl: './generar-venta.component.css'
})
export class GenerarVentaComponent {
  constructor(private reqS: HttpRequestService) { }
  readonly dialogRef = inject(MatDialogRef<GenerarVentaComponent>);
  @ViewChild('input') input: ElementRef<HTMLInputElement>;

  prodControl = new FormControl('');
  productosArr: string[] = [];
  ProductosOptions: string[];
  listadoVenta: any[] = [];
  canitdad: number = 0;
  productosGloabal: any[] = [];
  enviarDatos() {
    this.dialogRef.close({ data: 5 });
  }

  ngOnInit() {
    this.productos();
  }
  async productos() {
    let respuesta = await this.reqS.getProductos();
    this.productosGloabal = respuesta['data'];
    respuesta['data'].forEach((element: any) => {
      this.productosArr.push(element.descripcion);
    });
  }
  filter(): void {
    const filterValue = this.input.nativeElement.value.toLowerCase();
    this.ProductosOptions = this.productosArr.filter(o => o.toLowerCase().includes(filterValue));
  }
  agregar() {
    console.log(this.productosGloabal.find(el => el['descripcion'] == this.prodControl.getRawValue()).id);
    let venta = {
      prodNombre: this.prodControl.getRawValue(),
      prod: this.productosGloabal.find(el => el['descripcion'] == this.prodControl.getRawValue()).id,
      cantidad: this.canitdad,
      precioIn: this.productosGloabal.find(el => el['descripcion'] == this.prodControl.getRawValue()).precio
    }
    this.listadoVenta.push(venta);
    this.prodControl.setValue('');
    this.canitdad = 0;
  }
  onSelectionChange(event: any) {
    console.log(event.option.value)
  }
  borrar(index: any) {
    this.listadoVenta.splice(index, 1)
  }
  guardar(){
    this.dialogRef.close(this.listadoVenta)
  }
}

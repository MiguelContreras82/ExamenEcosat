import { Injectable } from '@angular/core';

//export const globalUrl = "http://192.168.1.10:8080/"
export const globalUrlSecond = "";
@Injectable({
  providedIn: 'root'
})
export class HttpRequestService {
  public globalUrl: string = "http://192.168.1.33:8000/";  //webserve

  constructor() {


  }
  async login(usuario: string, contrasenia: string) {
    let data = {
      usuario: usuario,
      contrasenia: contrasenia
    };
    let respuesta = await fetch(this.globalUrl + "login", {
      method: 'POST', body: JSON.stringify(data), headers: {
        "Content-Type": "application/json",
      },
    });
    return await respuesta.json()
  }

  async getVetnas() {
    let respuesta = await fetch(this.globalUrl + "get-ventas", {
      headers: { "Content-Type": "application/json" }
    })
    return await respuesta.json();
  }
  async getProductos() {
    let respuesta = await fetch(this.globalUrl + "get-productos", {
      headers: { "Content-Type": "application/json" }
    })
    return await respuesta.json();
  }

  async generarVenta (data:any) {
    let respuesta = await fetch(this.globalUrl + "generar-venta", {
      method: 'POST', body: JSON.stringify(data), headers: {
        "Content-Type": "application/json",
      },
    });
    return await respuesta.json()
  }

}

import { Component, OnInit, HostListener, inject } from '@angular/core';
import { Router } from '@angular/router';
import { HttpRequestService } from '../services/HttpRequest/http-request.service';
import { MatSnackBar } from '@angular/material/snack-bar';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrl: './login.component.css'
})
export class LoginComponent implements OnInit {
  tamanio: string = ''
  usuario: string = '';
  contrasenia: string = '';
  cargando: boolean = false;
  private _snackBar = inject(MatSnackBar);

  constructor(private route: Router, private reqS: HttpRequestService) {

  }

  @HostListener('window:resize', ['$event'])
  onResize(event: any) {
    if (this.detectMob()) {
      this.tamanio = 'width: 85%;';
    } else {
      this.tamanio = 'width: 40%;';
    }
    event.target.innerWidth;
  }
  ngOnInit() {
    if (this.detectMob()) {
      this.tamanio = 'width: 85%;';
    } else {
      this.tamanio = 'width: 50%;';
    }
  }
  detectMob() {
    const toMatch = [
      /Android/i,
      /webOS/i,
      /iPhone/i,
      /iPad/i,
      /iPod/i,
      /BlackBerry/i,
      /Windows Phone/i
    ];
    return toMatch.some((toMatchItem) => {
      return navigator.userAgent.match(toMatchItem);
    });
  }
  async login() {
    this.cargando = true;
    let datos = await this.reqS.login(this.usuario, this.contrasenia);
    this.cargando = false;
    if (datos["estatus"]) {
      localStorage.setItem("login", JSON.stringify(datos));
      this.route.navigateByUrl('/principal')
    } else {
      this.openSnackBar(datos["message"], "Ok");
    }
  }
  openSnackBar(message: string, action: string) {
    this._snackBar.open(message, action, {duration:3000});
  }
}

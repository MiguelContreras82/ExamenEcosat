import { Routes } from '@angular/router';
import { PrincipalComponent } from '../../principal/principal.component';
import { ProductosComponent } from '../../productos/productos.component';



export const AdminRoutes: Routes = [
    { path: 'principal', component: PrincipalComponent },
    { path: 'productos', component: ProductosComponent },
]
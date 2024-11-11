import { NgModule } from '@angular/core';
import { HttpClientModule } from '@angular/common/http'; import { RouterModule } from '@angular/router';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { AdminRoutes } from './admin.routing';

import { MatDialogModule } from '@angular/material/dialog';

import { MatTableModule } from '@angular/material/table';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatInputModule } from '@angular/material/input';
import { MatCardModule } from '@angular/material/card';
import { MatButtonModule } from '@angular/material/button';
import { MatIconModule } from '@angular/material/icon';
import { PrincipalComponent } from '../../principal/principal.component';
import {MatSnackBarModule} from '@angular/material/snack-bar';
import { ProductosComponent } from '../../productos/productos.component';
import {MatPaginator, MatPaginatorModule} from '@angular/material/paginator';



@NgModule({
  imports: [
    CommonModule,
    RouterModule.forChild(AdminRoutes),
    FormsModule,
    MatTableModule,
    MatInputModule,
    MatDialogModule,
    HttpClientModule,    
    MatIconModule,
    MatSnackBarModule,
    MatCardModule,
    MatButtonModule,
    MatPaginatorModule,
    MatFormFieldModule,    
  ],
  declarations: [    
    PrincipalComponent,
    ProductosComponent
  ]
})

export class AdminModule { }
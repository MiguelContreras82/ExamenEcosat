import { NgModule } from '@angular/core';
import { RouterModule } from '@angular/router';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { AuthRoutes } from './auth.routing';
import { LoginComponent } from '../../login/login.component';
import {MatProgressSpinnerModule} from '@angular/material/progress-spinner';
import {MatSnackBarModule} from '@angular/material/snack-bar';

@NgModule({
    imports: [
      CommonModule,
      RouterModule.forChild(AuthRoutes),
      FormsModule,
      MatSnackBarModule,
      MatProgressSpinnerModule
      // NgbModule
    ],
    declarations: [
     LoginComponent
    ]
  })
  export class AuthModule { }
  
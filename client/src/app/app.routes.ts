import { Routes } from '@angular/router';
import { LoginComponent } from './pages/login/login.component';
import { authorizationNeeded } from './guards/authorization.guard';
import { HomeComponent } from './pages/home/home.component';

export const routes: Routes = [
  {
    canActivate: [authorizationNeeded],
    path: '',
    component: HomeComponent,
  },
  {
    path: 'auth',
    children: [
      {
        path: 'login',
        component: LoginComponent,
      },
    ],
  },
];

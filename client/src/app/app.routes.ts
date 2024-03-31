import { Routes } from '@angular/router';
import { LoginComponent } from './pages/login/login.component';
import {
  authorizationNeeded,
  notAuthorizationNeeded,
} from './guards/authorization.guard';
import { HomeComponent } from './pages/home/home.component';
import { AuthSkeletonComponent } from './skeletons/auth-skeleton/auth-skeleton.component';

export const routes: Routes = [
  {
    canActivate: [authorizationNeeded],
    path: '',
    component: HomeComponent,
  },
  {
    path: 'auth',
    canDeactivate: [notAuthorizationNeeded],
    component: AuthSkeletonComponent,
    children: [
      {
        path: 'login',
        component: LoginComponent,
      },
    ],
  },
];

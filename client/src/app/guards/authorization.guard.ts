import { inject } from '@angular/core';
import { CanActivateFn, Router } from '@angular/router';

export const notAuthorizationNeeded: CanActivateFn = (route, state) => {
  const token = localStorage.getItem('token');
  const router = inject(Router);

  if (!token) {
    return true;
  }
  router.navigate(['/']);

  return true;
};

export const authorizationNeeded: CanActivateFn = (route, state) => {
  const token = localStorage.getItem('token');
  const router = inject(Router);

  if (token) {
    return true;
  }
  router.navigate(['/auth/login']);

  return true;
};

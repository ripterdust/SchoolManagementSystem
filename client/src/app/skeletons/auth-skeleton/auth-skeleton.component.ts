import { Component } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { CheckboxModule } from 'primeng/checkbox';

@Component({
  selector: 'app-auth-skeleton',
  standalone: true,
  imports: [RouterOutlet, CheckboxModule],
  templateUrl: './auth-skeleton.component.html',
})
export class AuthSkeletonComponent {}

import { Component } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { MatCardModule } from '@angular/material/card';

@Component({
  selector: 'app-auth-skeleton',
  standalone: true,
  imports: [RouterOutlet, MatCardModule],
  templateUrl: './auth-skeleton.component.html',
})
export class AuthSkeletonComponent {}

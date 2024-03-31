import { Component } from '@angular/core';
import { RouterOutlet } from '@angular/router';

@Component({
  selector: 'app-auth-skeleton',
  standalone: true,
  imports: [RouterOutlet],
  templateUrl: './auth-skeleton.component.html',
})
export class AuthSkeletonComponent {}

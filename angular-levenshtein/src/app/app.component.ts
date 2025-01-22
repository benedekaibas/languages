import { Component } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { BenchmarkComponent } from './benchmark.component';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterOutlet, BenchmarkComponent],
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'angular-levenshtein';
}
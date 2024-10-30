import { Component } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { CountryComponent } from './components/country/country.component';
import { CodeComponent } from './components/code/code.component';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterOutlet, CountryComponent, CodeComponent],
  templateUrl: './app.component.html',
  styleUrl: './app.component.scss',
})
export class AppComponent {
  title = 'pruebasBackend';
}

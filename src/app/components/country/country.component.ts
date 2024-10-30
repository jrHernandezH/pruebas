import { Component } from '@angular/core';
import { CountryService } from './country.service';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-country',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './country.component.html',
  styleUrls: ['./country.component.scss'],
})
export class CountryComponent {
  countries: any[] = [];

  constructor(private countryService: CountryService) {
    this.fetchCountryData();
  }

  fetchCountryData() {
    this.countryService.getCountryData().subscribe(
      (data) => {
        this.countries = data;
      },
      (error) => {
        console.error('Error fetching country data:', error);
      }
    );
  }
}

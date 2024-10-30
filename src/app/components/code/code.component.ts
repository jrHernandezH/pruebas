import { Component } from '@angular/core';
import { CodeService } from './code.service';
import {
  FormBuilder,
  FormGroup,
  FormsModule,
  ReactiveFormsModule,
} from '@angular/forms';

@Component({
  selector: 'app-code',
  standalone: true,
  imports: [FormsModule, ReactiveFormsModule],
  templateUrl: './code.component.html',
  styleUrls: ['./code.component.scss'],
})
export class CodeComponent {
  formCode!: FormGroup;

  constructor(private codeService: CodeService, private fb: FormBuilder) {
    this.formCode = this.fb.group({
      postalCode: [''],
      state: [''],
      municipality: [''],
    });
  }

  fetchCodeData() {
    console.log('work');
    const postalCode = this.formCode.get('postalCode')?.value;
    this.codeService.getCodeDate(postalCode).subscribe({
      next: (data) => {
        console.log(data);
        this.formCode.patchValue({
          state: data.codigo_postal.estado,
          municipality: data.codigo_postal.municipio,
        });
      },
      error: (error) => {
        console.error('Error fetching code data:', error);
      },
    });
  }
}

import { ComponentFixture, TestBed } from '@angular/core/testing';

import { FiscalyearsComponent } from './fiscalyears.component';

describe('FiscalyearsComponent', () => {
  let component: FiscalyearsComponent;
  let fixture: ComponentFixture<FiscalyearsComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ FiscalyearsComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(FiscalyearsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

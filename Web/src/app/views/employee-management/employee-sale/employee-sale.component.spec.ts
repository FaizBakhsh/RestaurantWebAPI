import { ComponentFixture, TestBed } from '@angular/core/testing';

import { EmployeeSaleComponent } from './employee-sale.component';

describe('EmployeeSaleComponent', () => {
  let component: EmployeeSaleComponent;
  let fixture: ComponentFixture<EmployeeSaleComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ EmployeeSaleComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(EmployeeSaleComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

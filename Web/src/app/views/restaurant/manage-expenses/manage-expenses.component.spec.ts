import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ManageExpensesComponent } from './manage-expenses.component';

describe('ManageExpensesComponent', () => {
  let component: ManageExpensesComponent;
  let fixture: ComponentFixture<ManageExpensesComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ManageExpensesComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ManageExpensesComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

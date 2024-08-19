import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ManageServiceChargesComponent } from './manage-service-charges.component';

describe('ManageServiceChargesComponent', () => {
  let component: ManageServiceChargesComponent;
  let fixture: ComponentFixture<ManageServiceChargesComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ManageServiceChargesComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ManageServiceChargesComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

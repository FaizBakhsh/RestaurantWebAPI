import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ManageDiscountKeyComponent } from './manage-discount-key.component';

describe('ManageDiscountKeyComponent', () => {
  let component: ManageDiscountKeyComponent;
  let fixture: ComponentFixture<ManageDiscountKeyComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ManageDiscountKeyComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ManageDiscountKeyComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

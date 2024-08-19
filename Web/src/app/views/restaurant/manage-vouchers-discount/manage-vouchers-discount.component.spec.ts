import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ManageVouchersDiscountComponent } from './manage-vouchers-discount.component';

describe('ManageVouchersDiscountComponent', () => {
  let component: ManageVouchersDiscountComponent;
  let fixture: ComponentFixture<ManageVouchersDiscountComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ManageVouchersDiscountComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ManageVouchersDiscountComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

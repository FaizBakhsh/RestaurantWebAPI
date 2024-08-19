import { ComponentFixture, TestBed } from '@angular/core/testing';

import { PurchaseitemlistComponent } from './purchaseitemlist.component';

describe('PurchaseitemlistComponent', () => {
  let component: PurchaseitemlistComponent;
  let fixture: ComponentFixture<PurchaseitemlistComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ PurchaseitemlistComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(PurchaseitemlistComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

import { ComponentFixture, TestBed } from '@angular/core/testing';

import { PurchaseitemComponent } from './purchaseitem.component';

describe('PurchaseitemComponent', () => {
  let component: PurchaseitemComponent;
  let fixture: ComponentFixture<PurchaseitemComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ PurchaseitemComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(PurchaseitemComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

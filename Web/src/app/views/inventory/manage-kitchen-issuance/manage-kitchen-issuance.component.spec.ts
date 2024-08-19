import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ManageKitchenIssuanceComponent } from './manage-kitchen-issuance.component';

describe('ManageKitchenIssuanceComponent', () => {
  let component: ManageKitchenIssuanceComponent;
  let fixture: ComponentFixture<ManageKitchenIssuanceComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ManageKitchenIssuanceComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ManageKitchenIssuanceComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ManageDiscountCampaignComponent } from './manage-discount-campaign.component';

describe('ManageDiscountCampaignComponent', () => {
  let component: ManageDiscountCampaignComponent;
  let fixture: ComponentFixture<ManageDiscountCampaignComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ManageDiscountCampaignComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ManageDiscountCampaignComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

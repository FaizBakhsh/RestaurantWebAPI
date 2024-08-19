import { ComponentFixture, TestBed } from '@angular/core/testing';

import { DiscountCampaignListComponent } from './discount-campaign-list.component';

describe('DiscountCampaignListComponent', () => {
  let component: DiscountCampaignListComponent;
  let fixture: ComponentFixture<DiscountCampaignListComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ DiscountCampaignListComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(DiscountCampaignListComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ManageLoyaltyCardComponent } from './manage-loyalty-card.component';

describe('ManageLoyaltyCardComponent', () => {
  let component: ManageLoyaltyCardComponent;
  let fixture: ComponentFixture<ManageLoyaltyCardComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ManageLoyaltyCardComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ManageLoyaltyCardComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

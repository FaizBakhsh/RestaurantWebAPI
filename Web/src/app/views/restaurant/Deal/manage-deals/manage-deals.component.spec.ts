import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ManageDealsComponent } from './manage-deals.component';

describe('ManageDealsComponent', () => {
  let component: ManageDealsComponent;
  let fixture: ComponentFixture<ManageDealsComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ManageDealsComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ManageDealsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

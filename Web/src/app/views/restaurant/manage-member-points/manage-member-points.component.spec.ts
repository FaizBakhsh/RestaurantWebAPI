import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ManageMemberPointsComponent } from './manage-member-points.component';

describe('ManageMemberPointsComponent', () => {
  let component: ManageMemberPointsComponent;
  let fixture: ComponentFixture<ManageMemberPointsComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ManageMemberPointsComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ManageMemberPointsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

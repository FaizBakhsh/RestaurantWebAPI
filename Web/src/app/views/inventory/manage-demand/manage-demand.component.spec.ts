import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ManageDemandComponent } from './manage-demand.component';

describe('ManageDemandComponent', () => {
  let component: ManageDemandComponent;
  let fixture: ComponentFixture<ManageDemandComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ManageDemandComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ManageDemandComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

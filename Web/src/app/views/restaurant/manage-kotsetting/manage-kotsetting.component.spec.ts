import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ManageKOTSettingComponent } from './manage-kotsetting.component';

describe('ManageKOTSettingComponent', () => {
  let component: ManageKOTSettingComponent;
  let fixture: ComponentFixture<ManageKOTSettingComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ManageKOTSettingComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ManageKOTSettingComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

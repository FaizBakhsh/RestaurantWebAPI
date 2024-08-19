import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ManageDeviceSettingComponent } from './manage-device-setting.component';

describe('ManageDeviceSettingComponent', () => {
  let component: ManageDeviceSettingComponent;
  let fixture: ComponentFixture<ManageDeviceSettingComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ManageDeviceSettingComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ManageDeviceSettingComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

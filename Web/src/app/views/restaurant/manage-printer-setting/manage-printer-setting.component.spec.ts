import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ManagePrinterSettingComponent } from './manage-printer-setting.component';

describe('ManagePrinterSettingComponent', () => {
  let component: ManagePrinterSettingComponent;
  let fixture: ComponentFixture<ManagePrinterSettingComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ManagePrinterSettingComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ManagePrinterSettingComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

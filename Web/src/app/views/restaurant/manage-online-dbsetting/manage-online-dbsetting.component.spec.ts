import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ManageOnlineDBSettingComponent } from './manage-online-dbsetting.component';

describe('ManageOnlineDBSettingComponent', () => {
  let component: ManageOnlineDBSettingComponent;
  let fixture: ComponentFixture<ManageOnlineDBSettingComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ManageOnlineDBSettingComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ManageOnlineDBSettingComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

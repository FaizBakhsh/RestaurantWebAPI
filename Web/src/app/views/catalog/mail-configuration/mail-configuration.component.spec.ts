import { ComponentFixture, TestBed } from '@angular/core/testing';

import { MailConfigurationComponent } from './mail-configuration.component';

describe('MailConfigurationComponent', () => {
  let component: MailConfigurationComponent;
  let fixture: ComponentFixture<MailConfigurationComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ MailConfigurationComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(MailConfigurationComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

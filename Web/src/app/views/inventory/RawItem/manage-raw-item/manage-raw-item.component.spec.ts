import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ManageRawItemComponent } from './manage-raw-item.component';

describe('ManageRawItemComponent', () => {
  let component: ManageRawItemComponent;
  let fixture: ComponentFixture<ManageRawItemComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ManageRawItemComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ManageRawItemComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

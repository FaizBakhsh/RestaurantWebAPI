import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ManageSubItemsComponent } from './manage-sub-items.component';

describe('ManageSubItemsComponent', () => {
  let component: ManageSubItemsComponent;
  let fixture: ComponentFixture<ManageSubItemsComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ManageSubItemsComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ManageSubItemsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

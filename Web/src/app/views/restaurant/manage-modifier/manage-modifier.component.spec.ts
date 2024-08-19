import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ManageModifierComponent } from './manage-modifier.component';

describe('ManageModifierComponent', () => {
  let component: ManageModifierComponent;
  let fixture: ComponentFixture<ManageModifierComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ManageModifierComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ManageModifierComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

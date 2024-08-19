import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CompleteWasteComponent } from './complete-waste.component';

describe('CompleteWasteComponent', () => {
  let component: CompleteWasteComponent;
  let fixture: ComponentFixture<CompleteWasteComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ CompleteWasteComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(CompleteWasteComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

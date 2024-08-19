import { ComponentFixture, TestBed } from '@angular/core/testing';

import { RnListComponent } from './rn-list.component';

describe('RnListComponent', () => {
  let component: RnListComponent;
  let fixture: ComponentFixture<RnListComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ RnListComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(RnListComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

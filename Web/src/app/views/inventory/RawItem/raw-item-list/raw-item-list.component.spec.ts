import { ComponentFixture, TestBed } from '@angular/core/testing';

import { RawItemListComponent } from './raw-item-list.component';

describe('RawItemListComponent', () => {
  let component: RawItemListComponent;
  let fixture: ComponentFixture<RawItemListComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ RawItemListComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(RawItemListComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

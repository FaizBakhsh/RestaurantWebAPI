import { VoucherTypeComponent } from './voucher-type/voucher-type.component';
import { AssignAccountComponent } from './assign-account/assign-account.component';
import {FiscalyearlistComponent} from './FiscalYear/fiscalyearlist/fiscalyearlist.component'
import { ChartofAccountCodeComponent } from './chartof-account-code/chartof-account-code.component';
import { PayablesComponent } from './payables/payables.component';
import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { ChartOfAccountListComponent } from './chart-of-account-list/chart-of-account-list.component';
import { VoucherListComponent } from './Voucher/voucher-list/voucher-list.component';
import { ManageVoucherComponent } from './Voucher/manage-voucher/manage-voucher.component';
import { GeneralLedgerComponent } from './general-ledger/general-ledger.component';
const routes: Routes = [
  {
    path: 'payable',
    component: PayablesComponent,
  },

  {
    path: 'accountCode',
    component: ChartofAccountCodeComponent,
  },
  {
    path: 'accountList',
    component: ChartOfAccountListComponent,
  },
  {
    path: 'assignAccount',
    component: AssignAccountComponent,
  },
  {
    path: 'fiscalYear',
    component: FiscalyearlistComponent,
  },
  {
    path: 'voucherType',
    component: VoucherTypeComponent,
  },
  {
    path: 'voucher',
    component: ManageVoucherComponent,
  },
  {
    path: 'voucherList',
    component: VoucherListComponent,
  },
  {
    path: 'ledger',
    component: GeneralLedgerComponent,
  },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class AccountRoutingModule { }

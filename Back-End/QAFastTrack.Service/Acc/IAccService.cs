using Restaurant.Core.Entities.Acc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Service.Acc
{
    public interface IAccService
    {
        public ChartOfAccountDE ManageChartOfAccount ( ChartOfAccountDE mod );
        public List<ChartOfAccountDE> SearchChartOfAccount ( ChartOfAccountDE mod );
        public List<ChartOfAccountDE> GetAccounts ( ChartOfAccountDE mod );

        public VoucherDE ManageVoucher ( VoucherDE mod, int? Id = null );
        public List<VoucherDE> SearchVouchers ( VoucherDE mod );
        public List<VoucherDetailDE> SearchVoucherLines ( VoucherDetailDE mod );
        public VoucherDE GetNextVchValues ( VoucherDE vch );

        public VoucherTypeDE ManageVoucherType ( VoucherTypeDE mod );
        public List<VoucherTypeDE> SearchVoucherTypes ( VoucherTypeDE mod );

        public FiscalYearDE ManageFiscalYear(FiscalYearDE mod);
        public List<FiscalYearDE> SearchFiscalYear(FiscalYearDE mod);

        //
        
    }
}

﻿using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Restaurant.Core.Entities.Acc;
using Restaurant.Core.Constants;

namespace Restaurant.DAL.Acc
{
    public interface IAccDAL
    {
        public bool ManageChartOfAccount(ChartOfAccountDE mod, MySqlCommand? cmd = null);
        public List<ChartOfAccountDE> SearchChartOfAccount(string WhereClause, MySqlCommand? cmd = null, int PageNo = 1, int PageSize = AppConstants.GRID_MAX_PAGE_SIZE);

        public bool ManageVoucher(VoucherDE vch, MySqlCommand? cmd = null);
        public bool ManageVoucherDetail(VoucherDetailDE vDetail, MySqlCommand? cmd = null);
        public List<VoucherDE> SearchVouchers(string whereClause, MySqlCommand? cmd = null, int PageNo = 1, int PageSize = AppConstants.GRID_MAX_PAGE_SIZE);
        public List<VoucherDetailDE> SearchVoucherDetail(string whereClause, MySqlCommand? cmd = null, int PageNo = 1, int PageSize = AppConstants.GRID_MAX_PAGE_SIZE);

        public bool ManageVoucherType(VoucherTypeDE VoucherType, MySqlCommand? cmd = null);
        public List<VoucherTypeDE> SearchVoucherTypes(string whereClause, MySqlCommand? cmd = null);

        public bool ACC_Manage_FiscalYear(FiscalYearDE mod, MySqlCommand? cmd);
        public List<FiscalYearDE> ACC_Search_FiscalYear(string WhereClause, MySqlCommand? cmd = null);

        //

    }
    }

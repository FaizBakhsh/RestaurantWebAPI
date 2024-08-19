using Restaurant.DAL;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySql.Data.MySqlClient;
using NLog;
using Restaurant.Core.Entities;
using Restaurant.Core.Enums;
using System;
namespace Restaurant.Service
{
    public class ExpensesService
    {
        #region Class Members/Class Variables

        private ExpensesDAL _expensesDAL;
        private CoreDAL _corDAL;
        private ItemDAL _itemDAL;
        private Logger _logger;

        #endregion
        #region Constructors
        public ExpensesService()
        {
            _itemDAL = new ItemDAL();
            _expensesDAL = new ExpensesDAL();
            _corDAL = new CoreDAL();
            _logger = LogManager.GetLogger("fileLogger");
        }


        #endregion
        #region Expenses
        public bool ManagementExpenses(ExpensesDE mod)
        {
            bool retVal = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = RestaurantDataContext.OpenMySqlConnection();

                if (mod.DBoperation == DBoperations.Insert)
                    mod.Id = _corDAL.GetNextIdByClient (TableNames.expenses.ToString (), mod.ClientId, "ClientId");
                retVal = _expensesDAL.ManageExpenses(mod);
                if (retVal == true)
                    mod.DBoperation = DBoperations.NA;
                return retVal;
            }
            catch (Exception ex)
            {
                _logger.Error(ex);
                throw;
            }
            finally
            {
                if (cmd != null)
                    RestaurantDataContext.CloseMySqlConnection(cmd);
            }
        }
        public List<ExpensesDE> SearchExpenses(ExpensesDE mod)
        {
            List<ExpensesDE> Expensess = new List<ExpensesDE>();
            bool closeConnectionFlag = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = RestaurantDataContext.OpenMySqlConnection();

                #region Search

                string whereClause = " Where 1=1";
                if (mod.Id != default)
                    whereClause += $" AND Id={mod.Id}";
                if (mod.ClientId != default)
                    whereClause += $" AND ClientId={mod.ClientId}";
                if (mod.DayId != default)
                    whereClause += $" AND DayId={mod.DayId}";
                if (mod.ShiftId != default && mod.ShiftId!=0)
                    whereClause += $" AND ShiftId={mod.ShiftId}";
                if (mod.SupplierId != default)
                    whereClause += $" AND SupplierId={mod.SupplierId}";
                if (mod.UserId != default)
                    whereClause += $" AND UserId like ''" + mod.UserId + "''";
                if (mod.SupplierName != default)
                    whereClause += $" AND SupplierName like ''" + mod.SupplierName + "''";
                if (mod.UserName != default)
                    whereClause += $" AND UserName like ''" + mod.UserName + "''";
                if (mod.Terminal != default)
                    whereClause += $" AND Terminal like ''" + mod.Terminal + "''";
                if (mod.IsActive != default)
                    whereClause += $" AND IsActive ={mod.IsActive}";
                Expensess = _expensesDAL.SearchExpenses(whereClause);

                #endregion

            }
            catch (Exception exp)
            {
                _logger.Error(exp);
                throw;
            }
            finally
            {
                if (closeConnectionFlag)
                    RestaurantDataContext.CloseMySqlConnection(cmd);
            }
            return Expensess;
        }

        #endregion
    }
}
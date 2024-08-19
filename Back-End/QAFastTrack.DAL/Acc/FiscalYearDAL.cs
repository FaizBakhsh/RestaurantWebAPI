using Dapper;
using MySql.Data.MySqlClient;
using Restaurant.Core.Constants;
using Restaurant.Core.Entities.Acc;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.DAL.Acc
{
    public partial class AccountDAL : IAccDAL
    {
        #region Operations
        public bool ACC_Manage_FiscalYear(FiscalYearDE mod, MySqlCommand? cmd) //
        {
            bool closeConnection = false;
            try
            { 
                if (cmd == null)
                {
                    cmd = RestaurantDataContext.OpenMySqlConnection();
                    closeConnection = true;
                }
                cmd.CommandText = SPNames.ACC_Manage_FiscalYear;
                cmd.Parameters.AddWithValue("prm_clientId", mod.ClientId);
                cmd.Parameters.AddWithValue("prm_id", mod.Id);
                cmd.Parameters.AddWithValue("prm_yearCode", mod.YearCode);
                cmd.Parameters.AddWithValue("prm_yearDesc", mod.YearDesc);
                cmd.Parameters.AddWithValue("prm_yearDateFrom", mod.YearDateFrom);
                cmd.Parameters.AddWithValue("prm_yearDateTo", mod.YearDateTo);
                cmd.Parameters.AddWithValue("prm_isActiveYear", mod.IsActiveYear);
                cmd.Parameters.AddWithValue("prm_createdOn", mod.CreatedOn);
                cmd.Parameters.AddWithValue("prm_createdById", mod.CreatedById);
                cmd.Parameters.AddWithValue("prm_modifiedOn", mod.ModifiedOn);
                cmd.Parameters.AddWithValue("prm_modifiedById", mod.ModifiedById);
                cmd.Parameters.AddWithValue("prm_isActive", mod.IsActive);
                cmd.Parameters.AddWithValue("prm_dbOperation", mod.DBoperation.ToString());
                cmd.ExecuteNonQuery();
                return true;
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                cmd.Parameters.Clear();
                if (closeConnection)
                    RestaurantDataContext.CloseMySqlConnection(cmd);
            }
        }
        public List<FiscalYearDE> ACC_Search_FiscalYear(string WhereClause, MySqlCommand? cmd)
        {
            bool closeConnection = false;
            List<FiscalYearDE> fisy = new List<FiscalYearDE>();
            try
            {
                if (cmd == null)
                {
                    cmd = RestaurantDataContext.OpenMySqlConnection();
                    closeConnection = true;
                }
                var parameters = new
                {
                    prm_WhereClause = WhereClause
                ,
               
                };
                fisy = cmd.Connection.Query<FiscalYearDE>(SPNames.ACC_Search_FiscalYear.ToString(), parameters, commandType: CommandType.StoredProcedure).ToList();
                return fisy;
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                if (closeConnection)
                    RestaurantDataContext.CloseMySqlConnection(cmd);
            }
        }
        #endregion
    }
}

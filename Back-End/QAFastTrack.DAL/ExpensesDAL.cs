using Dapper;
using MySql.Data.MySqlClient;
using Restaurant.Core.Entities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.DAL
{
    public class ExpensesDAL
    {
        #region Operations

        public bool ManageExpenses(ExpensesDE exp, MySqlCommand cmd = null)
        {
            bool closeConnectionFlag = false;
            try
            {
                if (cmd == null)
                {
                    cmd = RestaurantDataContext.OpenMySqlConnection();
                    closeConnectionFlag = true;
                }
                if (cmd.Connection.State == ConnectionState.Open)
                    Console.WriteLine("Connection  has been created");
                else
                    Console.WriteLine("Connection error");
                cmd.CommandText = "ManageExpenses";
                cmd.Parameters.AddWithValue("@id", exp.Id);
                cmd.Parameters.AddWithValue ("@clientId", exp.ClientId);
                cmd.Parameters.AddWithValue("@date", exp.Date);
                cmd.Parameters.AddWithValue("@name", exp.Name);
                cmd.Parameters.AddWithValue("@userId", exp.UserId);
                cmd.Parameters.AddWithValue("@supplierId", exp.SupplierId);
                cmd.Parameters.AddWithValue("@amount", exp.Amount);
                cmd.Parameters.AddWithValue("@terminalId", exp.TerminalId);
                cmd.Parameters.AddWithValue ("@shiftId", exp.ShiftId);
                cmd.Parameters.AddWithValue ("@sourceId", exp.SourceId);
                cmd.Parameters.AddWithValue("@comments", exp.Comments);
                cmd.Parameters.AddWithValue("@createdOn", exp.CreatedOn);
                cmd.Parameters.AddWithValue("@createdById", exp.CreatedById);
                cmd.Parameters.AddWithValue("@modifiedOn", exp.ModifiedOn);
                cmd.Parameters.AddWithValue("@modifiedById", exp.ModifiedById);
                cmd.Parameters.AddWithValue("@isActive", exp.IsActive);
                cmd.Parameters.AddWithValue("@DBoperation", exp.DBoperation.ToString());

                cmd.ExecuteNonQuery();
                return true;
            }
            catch (Exception ex)
            {

                throw;
            }
            finally
            {
                if (closeConnectionFlag)
                    RestaurantDataContext.CloseMySqlConnection(cmd);
            }
        }
        public List<ExpensesDE> SearchExpenses(string whereClause, MySqlCommand cmd = null)
        {
            List<ExpensesDE> top = new List<ExpensesDE>();
            bool closeConnectionFlag = false;
            try
            {
                if (cmd == null)
                {
                    cmd = RestaurantDataContext.OpenMySqlConnection();
                    closeConnectionFlag = true;
                }
                if (cmd.Connection.State == ConnectionState.Open)
                    Console.WriteLine("Connection  has been created");
                else
                    Console.WriteLine("Connection error");
                top = cmd.Connection.Query<ExpensesDE>("call Restaurant.SearchExpenses( '" + whereClause + "')").ToList();
                return top;
            }
            catch (Exception)
            {

                throw;
            }
            finally
            {
                if (closeConnectionFlag)
                    RestaurantDataContext.CloseMySqlConnection(cmd);
            }
        }

        #endregion
    }
}

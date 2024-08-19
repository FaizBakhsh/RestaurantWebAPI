using Dapper;
using MySql.Data.MySqlClient;
using Restaurant.Core.Entities;
using Restaurant.Core.Entities.Security;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.DAL
{
    public class PrintTypeDAL
    {
        #region Operations
        public bool ManagePrintType(PrintTypeDE printType, MySqlCommand cmd = null)
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
                cmd.CommandText = "ManagePrintType";
                cmd.Parameters.AddWithValue("@id", printType.Id);
                cmd.Parameters.AddWithValue ("@clientId", printType.ClientId);
                cmd.Parameters.AddWithValue("@printerId", printType.PrinterId);
                cmd.Parameters.AddWithValue("@typeId", printType.TypeId);
                cmd.Parameters.AddWithValue("@terminal", printType.Terminal);
                cmd.Parameters.AddWithValue("@createdOn", printType.CreatedOn);
                cmd.Parameters.AddWithValue("@createdById", printType.CreatedById);
                cmd.Parameters.AddWithValue("@modifiedOn", printType.ModifiedOn);
                cmd.Parameters.AddWithValue("@modifiedById", printType.ModifiedById);
                cmd.Parameters.AddWithValue("@isActive", printType.IsActive);
                cmd.Parameters.AddWithValue("@DBoperation", printType.DBoperation.ToString());

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
        public List<PrintTypeDE> SearchPrintTypes(string whereClause, MySqlCommand cmd = null)
        {
            List<PrintTypeDE> top = new List<PrintTypeDE>();
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
                top = cmd.Connection.Query<PrintTypeDE>("call Restaurant.SearchPrintType( '" + whereClause + "')").ToList();
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

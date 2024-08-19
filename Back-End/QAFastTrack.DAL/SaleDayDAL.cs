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
    public class SaleDayDAL
    {
        #region Operations

        public bool ManageSaleDay ( SaleDayDE SaleDay, MySqlCommand cmd = null )
        {
            bool closeConnectionFlag = false;
            try
            {
                if (cmd == null)
                {
                    cmd = RestaurantDataContext.OpenMySqlConnection ();
                    closeConnectionFlag = true;
                }
                if (cmd.Connection.State == ConnectionState.Open)
                    Console.WriteLine ("Connection  has been created");
                else
                    Console.WriteLine ("Connection error");
                cmd.CommandText = "ManageSaleDay";
                cmd.Parameters.AddWithValue ("@id", SaleDay.Id);
                cmd.Parameters.AddWithValue ("@clientId", SaleDay.ClientId);
                cmd.Parameters.AddWithValue ("@date", SaleDay.Date);
                cmd.Parameters.AddWithValue ("@startUserId", SaleDay.StartUserId);
                cmd.Parameters.AddWithValue ("@endUserId", SaleDay.EndUserId);
                cmd.Parameters.AddWithValue ("@branchId", SaleDay.BranchId);
                cmd.Parameters.AddWithValue ("@dayStatusId", SaleDay.DayStatusId);
                cmd.Parameters.AddWithValue ("@terminalId", SaleDay.TerminalId);
                cmd.Parameters.AddWithValue ("@createdOn", SaleDay.CreatedOn);
                cmd.Parameters.AddWithValue ("@createdById", SaleDay.CreatedById);
                cmd.Parameters.AddWithValue ("@modifiedOn", SaleDay.ModifiedOn);
                cmd.Parameters.AddWithValue ("@modifiedById", SaleDay.ModifiedById);
                cmd.Parameters.AddWithValue ("@isActive", SaleDay.IsActive);
                cmd.Parameters.AddWithValue ("@DBoperation", SaleDay.DBoperation.ToString ());

                cmd.ExecuteNonQuery ();
                return true;
            }
            catch (Exception ex)
            {

                throw;
            }
            finally
            {
                if (closeConnectionFlag)
                    RestaurantDataContext.CloseMySqlConnection (cmd);
            }
        }
        public List<SaleDayDE> SearchSaleDays ( string whereClause, MySqlCommand cmd = null )
        {
            List<SaleDayDE> top = new List<SaleDayDE> ();
            bool closeConnectionFlag = false;
            try
            {
                if (cmd == null)
                {
                    cmd = RestaurantDataContext.OpenMySqlConnection ();
                    closeConnectionFlag = true;
                }
                if (cmd.Connection.State == ConnectionState.Open)
                    Console.WriteLine ("Connection  has been created");
                else
                    Console.WriteLine ("Connection error");
                top = cmd.Connection.Query<SaleDayDE> ("call Restaurant.SearchSaleDay( '" + whereClause + "')").ToList ();
                return top;
            }
            catch (Exception)
            {

                throw;
            }
            finally
            {
                if (closeConnectionFlag)
                    RestaurantDataContext.CloseMySqlConnection (cmd);
            }
        }

        #endregion
    }
}

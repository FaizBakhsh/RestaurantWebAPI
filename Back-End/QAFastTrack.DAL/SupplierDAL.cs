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
    public class SupplierDAL
    {
        #region Operations

        public bool ManageSupplier(SupplierDE suplr, MySqlCommand cmd = null)
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
                cmd.CommandText = "ManageSupplier";
                cmd.Parameters.AddWithValue("@id", suplr.Id);
                cmd.Parameters.AddWithValue ("@clientId", suplr.ClientId);
                cmd.Parameters.AddWithValue("@name", suplr.Name);
                cmd.Parameters.AddWithValue("@email", suplr.Email);
                cmd.Parameters.AddWithValue("@phone", suplr.Phone);
                cmd.Parameters.AddWithValue("@area", suplr.Area);
                cmd.Parameters.AddWithValue("@code", suplr.Code);
                cmd.Parameters.AddWithValue("@accountId", suplr.AccountId);
                cmd.Parameters.AddWithValue("@creditDays", suplr.CreditDays);
                cmd.Parameters.AddWithValue("@city", suplr.City);
                cmd.Parameters.AddWithValue("@cNIC", suplr.CNIC);
                cmd.Parameters.AddWithValue("@address", suplr.Address);
                cmd.Parameters.AddWithValue("@createdOn", suplr.CreatedOn);
                cmd.Parameters.AddWithValue("@createdById", suplr.CreatedById);
                cmd.Parameters.AddWithValue("@modifiedOn", suplr.ModifiedOn);
                cmd.Parameters.AddWithValue("@modifiedById", suplr.ModifiedById);
                cmd.Parameters.AddWithValue("@isActive", suplr.IsActive);
                cmd.Parameters.AddWithValue("@DBoperation", suplr.DBoperation.ToString());

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
        public List<SupplierDE> SearchSuppliers(string whereClause, MySqlCommand cmd = null)
        {
            List<SupplierDE> top = new List<SupplierDE>();
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
                top = cmd.Connection.Query<SupplierDE>("call Restaurant.SearchSupplier( '" + whereClause + "')").ToList();
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

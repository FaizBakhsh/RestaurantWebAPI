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
    public class VendorDAL
    {
        #region Operations

        public bool ManageVendor(VendorDE vndr, MySqlCommand cmd = null)
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
                cmd.CommandText = "ManageVendor";
                cmd.Parameters.AddWithValue("@id", vndr.Id);
                cmd.Parameters.AddWithValue("@name", vndr.Name);
                cmd.Parameters.AddWithValue("@email", vndr.Email);
                cmd.Parameters.AddWithValue("@phone", vndr.Phone);
                cmd.Parameters.AddWithValue("@area", vndr.Area);
                cmd.Parameters.AddWithValue("@code", vndr.Code);
                cmd.Parameters.AddWithValue("@accountId", vndr.AccountId);
                cmd.Parameters.AddWithValue("@city", vndr.City);
                cmd.Parameters.AddWithValue("@cNIC", vndr.CNIC);
                cmd.Parameters.AddWithValue("@address", vndr.Address);
                cmd.Parameters.AddWithValue("@createdOn", vndr.CreatedOn);
                cmd.Parameters.AddWithValue("@createdById", vndr.CreatedById);
                cmd.Parameters.AddWithValue("@modifiedOn", vndr.ModifiedOn);
                cmd.Parameters.AddWithValue("@modifiedById", vndr.ModifiedById);
                cmd.Parameters.AddWithValue("@isActive", vndr.IsActive);
                cmd.Parameters.AddWithValue("@DBoperation", vndr.DBoperation.ToString());

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
        public List<VendorDE> SearchVendors(string whereClause, MySqlCommand cmd = null)
        {
            List<VendorDE> top = new List<VendorDE>();
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
                top = cmd.Connection.Query<VendorDE>("call Restaurant.SearchVendor( '" + whereClause + "')").ToList();
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

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
    public class DiscountKeyDAL
    {
        #region Operations

        public bool ManageDiscountKey(DiscountKeyDE discount, MySqlCommand cmd = null)
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
                cmd.CommandText = "ManageDiscountKey";
                cmd.Parameters.AddWithValue("@id", discount.Id);
                cmd.Parameters.AddWithValue ("@clientId", discount.ClientId);
                cmd.Parameters.AddWithValue("@discountKey", discount.DiscountKey);
                cmd.Parameters.AddWithValue("@value", discount.Value);
                cmd.Parameters.AddWithValue("@discLimit", discount.DiscLimit);
                cmd.Parameters.AddWithValue("@createdOn", discount.CreatedOn);
                cmd.Parameters.AddWithValue("@createdById", discount.CreatedById);
                cmd.Parameters.AddWithValue("@modifiedOn", discount.ModifiedOn);
                cmd.Parameters.AddWithValue("@modifiedById", discount.ModifiedById);
                cmd.Parameters.AddWithValue("@isActive", discount.IsActive);
                cmd.Parameters.AddWithValue("@DBoperation", discount.DBoperation.ToString());

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
        public bool AlterDiscountKey(DiscountKeyDE discount, int? Id = null, MySqlCommand cmd = null)
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
                cmd.CommandText = "AlterDiscountKey";
                cmd.Parameters.AddWithValue("@id", Id);
                cmd.Parameters.AddWithValue("@filter", discount.DBoperation.ToString());
                cmd.ExecuteNonQuery();
                return true;
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
        public List<DiscountKeyDE> SearchDiscountKeys(string whereClause, MySqlCommand cmd = null)
        {
            List<DiscountKeyDE> top = new List<DiscountKeyDE>();
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
                top = cmd.Connection.Query<DiscountKeyDE>("call Restaurant.SearchDiscountKey( '" + whereClause + "')").ToList();
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

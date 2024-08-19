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
    public class AttributesDAL
    {
        #region Operations
        public bool ManageAttributes(AttributesDE att, MySqlCommand? cmd=null)
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
                cmd.CommandText = "ManageAttributes";
                cmd.Parameters.AddWithValue("@id", att.Id);
                cmd.Parameters.AddWithValue("@name", att.Name);
                cmd.Parameters.AddWithValue("@description", att.Description);
                cmd.Parameters.AddWithValue("@createdOn", att.CreatedOn);
                cmd.Parameters.AddWithValue("@createdById", att.CreatedById);
                cmd.Parameters.AddWithValue("@modifiedOn", att.ModifiedOn);
                cmd.Parameters.AddWithValue("@modifiedById", att.ModifiedById);
                cmd.Parameters.AddWithValue("@isActive", att.IsActive);
                cmd.Parameters.AddWithValue("@DBoperation", att.DBoperation.ToString());

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
                cmd.Parameters.Clear();
            }
        }
        public List<AttributesDE> SearchAttributes(string whereClause, MySqlCommand cmd = null)
        {
            List<AttributesDE> top = new List<AttributesDE>();
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
                top = cmd.Connection.Query<AttributesDE>("call restaurant.SearchAttributes( '" + whereClause + "')").ToList();
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

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
    public class AttributeValuesDAL
    {
        #region Operations
        public bool ManageAttributeValues(AttributeValuesDE attVal, MySqlCommand? cmd=null)
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
                cmd.CommandText = "ManageAttributeValues";
                cmd.Parameters.AddWithValue("@id", attVal.Id);
                cmd.Parameters.AddWithValue("@attributeId", attVal.AttributeId);
                cmd.Parameters.AddWithValue("@keyCode", attVal.KeyCode);
                cmd.Parameters.AddWithValue("@name", attVal.Name);
                cmd.Parameters.AddWithValue("@description", attVal.Description);
                cmd.Parameters.AddWithValue("@createdOn", attVal.CreatedOn);
                cmd.Parameters.AddWithValue("@createdById", attVal.CreatedById);
                cmd.Parameters.AddWithValue("@modifiedOn", attVal.ModifiedOn);
                cmd.Parameters.AddWithValue("@modifiedById", attVal.ModifiedById);
                cmd.Parameters.AddWithValue("@isActive", attVal.IsActive);
                cmd.Parameters.AddWithValue("@DBoperation", attVal.DBoperation.ToString());

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
        public List<AttributeValuesDE> SearchAttributeValues(string whereClause, MySqlCommand cmd = null)
        {
            List<AttributeValuesDE> top = new List<AttributeValuesDE>();
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
                top = cmd.Connection.Query<AttributeValuesDE>("call restaurant.SearchAttributeValues( '" + whereClause + "')").ToList();
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

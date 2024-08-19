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
    public class SubItemDAL
    {
        #region Operations
        public bool ManageSubItem(SubItemDE SubItem, MySqlCommand cmd = null)
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
                cmd.CommandText = "ManageSubItem";
                cmd.Parameters.AddWithValue("@id", SubItem.Id);
                cmd.Parameters.AddWithValue ("@clientId", SubItem.ClientId);
                cmd.Parameters.AddWithValue("@name", SubItem.Name);
                cmd.Parameters.AddWithValue("@createdOn", SubItem.CreatedOn);
                cmd.Parameters.AddWithValue("@createdById", SubItem.CreatedById);
                cmd.Parameters.AddWithValue("@modifiedOn", SubItem.ModifiedOn);
                cmd.Parameters.AddWithValue("@modifiedById", SubItem.ModifiedById);
                cmd.Parameters.AddWithValue("@isActive", SubItem.IsActive);
                cmd.Parameters.AddWithValue("@DBoperation", SubItem.DBoperation.ToString());

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
        public List<SubItemDE> SearchSubItems(string whereClause, MySqlCommand cmd = null)
        {
            List<SubItemDE> top = new List<SubItemDE>();
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
                top = cmd.Connection.Query<SubItemDE>("call Restaurant.SearchSubItem( '" + whereClause + "')").ToList();
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

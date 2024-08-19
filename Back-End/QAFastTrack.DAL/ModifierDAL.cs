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
    public class ModifierDAL
    {
        #region Operations
        public bool ManageModifier(ModifierDE Modifier, MySqlCommand cmd = null)
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
                cmd.CommandText = "ManageModifier";
                cmd.Parameters.AddWithValue("@id", Modifier.Id);
                cmd.Parameters.AddWithValue ("@clientId", Modifier.ClientId);
                cmd.Parameters.AddWithValue("@modifierName", Modifier.ModifierName);
                cmd.Parameters.AddWithValue("@kDSId", Modifier.KDSId);
                cmd.Parameters.AddWithValue("@kDSId2", Modifier.KDSId2);
                cmd.Parameters.AddWithValue("@rawItemId", Modifier.RawItemId);
                cmd.Parameters.AddWithValue("@qty", Modifier.Qty);
                cmd.Parameters.AddWithValue("@price", Modifier.Price);
                cmd.Parameters.AddWithValue("@createdOn", Modifier.CreatedOn);
                cmd.Parameters.AddWithValue("@createdById", Modifier.CreatedById);
                cmd.Parameters.AddWithValue("@modifiedOn", Modifier.ModifiedOn);
                cmd.Parameters.AddWithValue("@modifiedById", Modifier.ModifiedById);
                cmd.Parameters.AddWithValue("@isActive", Modifier.IsActive);
                cmd.Parameters.AddWithValue("@DBoperation", Modifier.DBoperation.ToString());

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
        public List<ModifierDE> SearchModifiers(string whereClause, MySqlCommand cmd = null)
        {
            List<ModifierDE> top = new List<ModifierDE>();
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
                top = cmd.Connection.Query<ModifierDE>("call Restaurant.SearchModifier( '" + whereClause + "')").ToList();
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

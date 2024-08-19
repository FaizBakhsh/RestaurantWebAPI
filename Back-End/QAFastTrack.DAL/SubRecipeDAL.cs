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
    public class SubRecipeDAL
    {
        #region Operations
        public bool ManageSubRecipe(SubRecipeDE subRec, MySqlCommand cmd = null)
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
                cmd.CommandText = "ManageSubRecipe";
                cmd.Parameters.AddWithValue("@id", subRec.Id);
                cmd.Parameters.AddWithValue ("@clientId", subRec.ClientId);
                cmd.Parameters.AddWithValue("@groupId", subRec.GroupId);
                cmd.Parameters.AddWithValue("@itemId", subRec.ItemId);
                cmd.Parameters.AddWithValue("@SizeId", subRec.SizeId);
                cmd.Parameters.AddWithValue("@subItemId", subRec.SubItemId);
                cmd.Parameters.AddWithValue("@qty", subRec.QTY);
                cmd.Parameters.AddWithValue("@createdOn", subRec.CreatedOn);
                cmd.Parameters.AddWithValue("@createdById", subRec.CreatedById);
                cmd.Parameters.AddWithValue("@modifiedOn", subRec.ModifiedOn);
                cmd.Parameters.AddWithValue("@modifiedById", subRec.ModifiedById);
                cmd.Parameters.AddWithValue("@isActive", subRec.IsActive);
                cmd.Parameters.AddWithValue("@DBoperation", subRec.DBoperation.ToString());

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
        public List<SubRecipeDE> SearchSubRecipe(string whereClause, MySqlCommand cmd = null)
        {
            List<SubRecipeDE> top = new List<SubRecipeDE>();
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
                top = cmd.Connection.Query<SubRecipeDE>("call Restaurant.SearchSubRecipe( '" + whereClause + "')").ToList();
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

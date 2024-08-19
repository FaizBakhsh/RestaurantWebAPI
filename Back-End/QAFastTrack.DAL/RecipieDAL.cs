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
    public class RecipeDAL
    {
        #region Operations
        public bool ManageRecipe(RecipeDE recp, MySqlCommand cmd = null)
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
                cmd.CommandText = "ManageItemRecipe";
                cmd.Parameters.AddWithValue("@id", recp.Id);
                cmd.Parameters.AddWithValue ("@clientId", recp.ClientId);
                cmd.Parameters.AddWithValue("@groupId", recp.GroupId);
                cmd.Parameters.AddWithValue("@itemId", recp.ItemId);
                cmd.Parameters.AddWithValue("@rawItemId", recp.RawItemId);
                cmd.Parameters.AddWithValue("@sizeId", recp.SizeId);
                cmd.Parameters.AddWithValue("@recipeModifierId", recp.RecipeModifierId);
                cmd.Parameters.AddWithValue("@recipeTypeId", recp.RecipeTypeId);
                cmd.Parameters.AddWithValue("@entityId", recp.EntityId);
                cmd.Parameters.AddWithValue("@orderTypeId", recp.OrderTypeId);
                cmd.Parameters.AddWithValue("@printKitchen", recp.PrintKitchen);
                cmd.Parameters.AddWithValue("@attachRecipe", recp.AttachRecipe);
                cmd.Parameters.AddWithValue("@price", recp.Price);
                cmd.Parameters.AddWithValue("@uom", recp.UOM);
                cmd.Parameters.AddWithValue("@qty", recp.QTY);
                cmd.Parameters.AddWithValue("@amount", recp.Amount);
                cmd.Parameters.AddWithValue("@createdOn", recp.CreatedOn);
                cmd.Parameters.AddWithValue("@createdById", recp.CreatedById);
                cmd.Parameters.AddWithValue("@modifiedOn", recp.ModifiedOn);
                cmd.Parameters.AddWithValue("@modifiedById", recp.ModifiedById);
                cmd.Parameters.AddWithValue("@isActive", recp.IsActive);
                cmd.Parameters.AddWithValue("@DBoperation", recp.DBoperation.ToString());

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
        public List<RecipeDE> SearchRecipes(string whereClause, MySqlCommand cmd = null)
        {
            List<RecipeDE> top = new List<RecipeDE>();
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
                top = cmd.Connection.Query<RecipeDE>("call Restaurant.SearchItemRecipe( '" + whereClause + "')").ToList();
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

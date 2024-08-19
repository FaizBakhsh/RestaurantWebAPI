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
    public class SizeDAL
    {
        #region Operations
        public bool ManageSize(SizeDE flaSize, MySqlCommand cmd = null)
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
                cmd.CommandText = "ManageSize";
                cmd.Parameters.AddWithValue("@id", flaSize.Id);
                cmd.Parameters.AddWithValue ("@clientId", flaSize.ClientId);
                cmd.Parameters.AddWithValue("@groupId", flaSize.GroupId);
                cmd.Parameters.AddWithValue("@itemId", flaSize.ItemId);
                cmd.Parameters.AddWithValue("@attribId", flaSize.AttribId);
                cmd.Parameters.AddWithValue("@attribValId", flaSize.AttribValId);
                //cmd.Parameters.AddWithValue("@kdsId", flaSize.KDSId);
                cmd.Parameters.AddWithValue("@sizeName", flaSize.SizeName);
                cmd.Parameters.AddWithValue("@price", flaSize.Price);
                cmd.Parameters.AddWithValue("@actualPrice", flaSize.ActualPrice);
                cmd.Parameters.AddWithValue("@tax", flaSize.Tax);
                cmd.Parameters.AddWithValue("@cost", flaSize.Cost);
                cmd.Parameters.AddWithValue("@suggestedPrice", flaSize.SuggestedPrice);
                cmd.Parameters.AddWithValue("@suggestedMargin", flaSize.SuggestedMargin);
                cmd.Parameters.AddWithValue("@currentMargin", flaSize.CurrentMargin);
                cmd.Parameters.AddWithValue("@createdOn", flaSize.CreatedOn);
                cmd.Parameters.AddWithValue("@createdById", flaSize.CreatedById);
                cmd.Parameters.AddWithValue("@modifiedOn", flaSize.ModifiedOn);
                cmd.Parameters.AddWithValue("@modifiedById", flaSize.ModifiedById);
                cmd.Parameters.AddWithValue("@isActive", flaSize.IsActive);
                cmd.Parameters.AddWithValue("@DBoperation", flaSize.DBoperation.ToString());

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
        public List<SizeDE> SearchSizes(string whereClause, MySqlCommand cmd = null)
        {
            List<SizeDE> top = new List<SizeDE>();
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
                top = cmd.Connection.Query<SizeDE>("call Restaurant.SearchSize( '" + whereClause + "')").ToList();
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

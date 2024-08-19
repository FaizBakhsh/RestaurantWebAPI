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
    public class CompleteWasteDAL
    {
        #region Operations
        public bool ManageCompleteWaste(CompleteWasteDE waste, MySqlCommand cmd = null)
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
                cmd.CommandText = "ManageCompleteWaste";
                cmd.Parameters.AddWithValue("@id", waste.Id);
                cmd.Parameters.AddWithValue("@groupId", waste.GroupId);
                cmd.Parameters.AddWithValue("@keyWord", waste.KeyWord);
                cmd.Parameters.AddWithValue("@date", waste.Date);
                cmd.Parameters.AddWithValue("@createdOn", waste.CreatedOn);
                cmd.Parameters.AddWithValue("@createdById", waste.CreatedById);
                cmd.Parameters.AddWithValue("@modifiedOn", waste.ModifiedOn);
                cmd.Parameters.AddWithValue("@modifiedById", waste.ModifiedById);
                cmd.Parameters.AddWithValue("@isActive", waste.IsActive);
                cmd.Parameters.AddWithValue("@DBoperation", waste.DBoperation.ToString());

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
        public List<CompleteWasteDE> SearchCompleteWastes(string whereClause, MySqlCommand cmd = null)
        {
            List<CompleteWasteDE> top = new List<CompleteWasteDE>();
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
                top = cmd.Connection.Query<CompleteWasteDE>("call Restaurant.SearchCompleteWaste( '" + whereClause + "')").ToList();
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

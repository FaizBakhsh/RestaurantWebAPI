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
    public class LoyaltyCardDAL
    {
        #region Operations

        public bool ManageLoyaltyCard(LoyaltyCardDE card, MySqlCommand cmd = null)
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
                cmd.CommandText = "ManageLoyaltyCard";
                cmd.Parameters.AddWithValue("@id", card.Id);
                cmd.Parameters.AddWithValue ("@clientId", card.ClientId);
                cmd.Parameters.AddWithValue("@name", card.Name);
                cmd.Parameters.AddWithValue("@phoneNo", card.PhoneNo);
                cmd.Parameters.AddWithValue("@discountPercentage", card.DiscountPercentage);
                cmd.Parameters.AddWithValue("@cardNo", card.CardNo);
                cmd.Parameters.AddWithValue("@createdOn", card.CreatedOn);
                cmd.Parameters.AddWithValue("@createdById", card.CreatedById);
                cmd.Parameters.AddWithValue("@modifiedOn", card.ModifiedOn);
                cmd.Parameters.AddWithValue("@modifiedById", card.ModifiedById);
                cmd.Parameters.AddWithValue("@isActive", card.IsActive);
                cmd.Parameters.AddWithValue("@DBoperation", card.DBoperation.ToString());

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
        public List<LoyaltyCardDE> SearchLoyaltyCards(string whereClause, MySqlCommand cmd = null)
        {
            List<LoyaltyCardDE> top = new List<LoyaltyCardDE>();
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
                top = cmd.Connection.Query<LoyaltyCardDE>("call Restaurant.SearchLoyaltyCard( '" + whereClause + "')").ToList();
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

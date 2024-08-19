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
    public class DiscountCampaignDAL
    {
        #region Operations

        public bool ManageDiscountCampaign(DiscountCampaignDE campaign, MySqlCommand cmd )
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
                cmd.CommandText = "ManageDiscountCampaign";
                cmd.Parameters.AddWithValue("@id", campaign.Id);
                cmd.Parameters.AddWithValue ("@clientId", campaign.ClientId);
                cmd.Parameters.AddWithValue("@name", campaign.Name);
                cmd.Parameters.AddWithValue("@discount", campaign.Discount);
                cmd.Parameters.AddWithValue("@startDate", campaign.StartDate);
                cmd.Parameters.AddWithValue("@startTime", campaign.StartTime);
                cmd.Parameters.AddWithValue("@endDate", campaign.EndDate);
                cmd.Parameters.AddWithValue("@endTime", campaign.EndTime);
                cmd.Parameters.AddWithValue("@typeId", campaign.TypeId);
                cmd.Parameters.AddWithValue("@menuGroupId", campaign.MenuGroupId);
                cmd.Parameters.AddWithValue ("@daysIds", campaign.DaysIds);
                cmd.Parameters.AddWithValue("@monday", campaign.Monday);
                cmd.Parameters.AddWithValue("@tuesday", campaign.Tuesday);
                cmd.Parameters.AddWithValue("@wednesday", campaign.Wednesday);
                cmd.Parameters.AddWithValue("@thursday", campaign.Thursday);
                cmd.Parameters.AddWithValue("@friday", campaign.Friday);
                cmd.Parameters.AddWithValue("@saturday", campaign.Saturday);
                cmd.Parameters.AddWithValue("@sunday", campaign.Sunday);
                cmd.Parameters.AddWithValue("@tillDayEnd", campaign.TillDayEnd);
                cmd.Parameters.AddWithValue("@createdOn", campaign.CreatedOn);
                cmd.Parameters.AddWithValue("@createdById", campaign.CreatedById);
                cmd.Parameters.AddWithValue("@modifiedOn", campaign.ModifiedOn);
                cmd.Parameters.AddWithValue("@modifiedById", campaign.ModifiedById);
                cmd.Parameters.AddWithValue("@isActive", campaign.IsActive);
                cmd.Parameters.AddWithValue("@DBoperation", campaign.DBoperation.ToString());

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
        public List<DiscountCampaignDE> SearchDiscountCampaigns(string whereClause, MySqlCommand cmd = null)
        {
            List<DiscountCampaignDE> top = new List<DiscountCampaignDE>();
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
                top = cmd.Connection.Query<DiscountCampaignDE>("call Restaurant.SearchDiscountCampaign( '" + whereClause + "')").ToList();
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

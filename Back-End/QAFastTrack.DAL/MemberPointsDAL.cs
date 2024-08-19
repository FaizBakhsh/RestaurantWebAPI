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
    public class MemberPointsDAL
    {
        #region Operations
        public bool ManageMemberPoints(MemberPointsDE mmbrPoints, MySqlCommand cmd = null)
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
                cmd.CommandText = "ManageMemberPoints";
                cmd.Parameters.AddWithValue("@id", mmbrPoints.Id);
                cmd.Parameters.AddWithValue ("@clientId", mmbrPoints.ClientId);
                cmd.Parameters.AddWithValue("@minSale", mmbrPoints.MinSale);
                cmd.Parameters.AddWithValue("@maxSale", mmbrPoints.MaxSale);
                cmd.Parameters.AddWithValue("@points", mmbrPoints.Points);
                cmd.Parameters.AddWithValue("@createdOn", mmbrPoints.CreatedOn);
                cmd.Parameters.AddWithValue("@createdById", mmbrPoints.CreatedById);
                cmd.Parameters.AddWithValue("@modifiedOn", mmbrPoints.ModifiedOn);
                cmd.Parameters.AddWithValue("@modifiedById", mmbrPoints.ModifiedById);
                cmd.Parameters.AddWithValue("@isActive", mmbrPoints.IsActive);
                cmd.Parameters.AddWithValue("@DBoperation", mmbrPoints.DBoperation.ToString());

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
        public List<MemberPointsDE> SearchMemberPoints(string whereClause, MySqlCommand cmd = null)
        {
            List<MemberPointsDE> top = new List<MemberPointsDE>();
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
                top = cmd.Connection.Query<MemberPointsDE>("call Restaurant.SearchMemberPoints( '" + whereClause + "')").ToList();
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

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
    public class RNDAL
    {
        #region Header Operations
        public bool INV_Manage_RN(RNDE RN, MySqlCommand? cmd)
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
                cmd.CommandText = "INV_Manage_RN";
                cmd.Parameters.AddWithValue("@id", RN.Id);
                cmd.Parameters.AddWithValue("@clientId", RN.ClientId);
                cmd.Parameters.AddWithValue("@title", RN.Title);
                cmd.Parameters.AddWithValue("@requiredBefore", RN.RequiredBefore);
                cmd.Parameters.AddWithValue("@typeId", RN.TypeId);
                cmd.Parameters.AddWithValue("@categoryId", RN.CategoryId);
                cmd.Parameters.AddWithValue("@reason", RN.Reason);
                cmd.Parameters.AddWithValue("@requesterTypeId", RN.RequesterTypeId);
                cmd.Parameters.AddWithValue("@requester", RN.Requester);
                cmd.Parameters.AddWithValue("@statusId", RN.StatusId);
                cmd.Parameters.AddWithValue("@description", RN.Description);
                cmd.Parameters.AddWithValue("@createdOn", RN.CreatedOn);
                cmd.Parameters.AddWithValue("@createdById", RN.CreatedById);
                cmd.Parameters.AddWithValue("@modifiedOn", RN.ModifiedOn);
                cmd.Parameters.AddWithValue("@modifiedById", RN.ModifiedById);
                cmd.Parameters.AddWithValue("@isActive", RN.IsActive);
                cmd.Parameters.AddWithValue("@DBoperation", RN.DBoperation.ToString());

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
        public List<RNDE> INV_Search_RN (string whereClause, MySqlCommand cmd = null)
        {
            List<RNDE> top = new List<RNDE>();
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
                top = cmd.Connection.Query<RNDE>("call Restaurant.INV_Search_RN( '" + whereClause + "')").ToList();
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
                cmd.Parameters.Clear();
            }
        }
        #endregion
        #region Line Operations
        public bool INV_Manage_RNLine (RNLineDE rNLine, MySqlCommand? cmd)
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
                cmd.CommandText = "INV_Manage_RNLine";
                cmd.Parameters.AddWithValue("@id", rNLine.Id);
                cmd.Parameters.AddWithValue("@clientId", rNLine.ClientId);
                cmd.Parameters.AddWithValue("@rnId", rNLine.RNId);
                cmd.Parameters.AddWithValue("@itemId", rNLine.ItemId);
                cmd.Parameters.AddWithValue("@requestedQty", rNLine.RequestedQty);
                cmd.Parameters.AddWithValue("@createdOn", rNLine.CreatedOn);
                cmd.Parameters.AddWithValue("@createdById", rNLine.CreatedById);
                cmd.Parameters.AddWithValue("@modifiedOn", rNLine.ModifiedOn);
                cmd.Parameters.AddWithValue("@modifiedById", rNLine.ModifiedById);
                cmd.Parameters.AddWithValue("@isActive", rNLine.IsActive);
                cmd.Parameters.AddWithValue("@DBoperation", rNLine.DBoperation.ToString());

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
        public List<RNLineDE> INV_Search_RNLine  (string whereClause, MySqlCommand cmd = null)
        {
            List<RNLineDE> top = new List<RNLineDE>();
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
                top = cmd.Connection.Query<RNLineDE>("call Restaurant.INV_Search_RNLine( '" + whereClause + "')").ToList();
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

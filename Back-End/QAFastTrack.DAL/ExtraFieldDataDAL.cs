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
    public class ExtraFieldDataDAL
    {
        #region Operations
        public bool ManageExtraFieldData(ExtraFieldDataDE _fieData, MySqlCommand cmd = null)
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
                cmd.CommandText = "ManageExtraFieldData";
                cmd.Parameters.AddWithValue("@id", _fieData.Id);
                cmd.Parameters.AddWithValue ("@clientId", _fieData.ClientId);
                cmd.Parameters.AddWithValue("@enumLineId", _fieData.EnumLineId);
                cmd.Parameters.AddWithValue("@fieldName", _fieData.FieldName);
                cmd.Parameters.AddWithValue("@fieldValue", _fieData.FieldValue);
                cmd.Parameters.AddWithValue("@createdOn", _fieData.CreatedOn);
                cmd.Parameters.AddWithValue("@createdById", _fieData.CreatedById);
                cmd.Parameters.AddWithValue("@modifiedOn", _fieData.ModifiedOn);
                cmd.Parameters.AddWithValue("@modifiedById", _fieData.ModifiedById);
                cmd.Parameters.AddWithValue("@isActive", _fieData.IsActive);
                cmd.Parameters.AddWithValue("@DBoperation", _fieData.DBoperation.ToString());

                cmd.ExecuteNonQuery();
                return true;
            }
            catch (Exception )
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
        public List<ExtraFieldDataDE> SearchExtraFieldData(string whereClause, MySqlCommand cmd = null)
        {
            List<ExtraFieldDataDE> top = new List<ExtraFieldDataDE>();
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
                top = cmd.Connection.Query<ExtraFieldDataDE>("call Restaurant.SearchExtraFieldData( '" + whereClause + "')").ToList();
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
        public List<Object> GetExtraFieldData(int TypeId, MySqlCommand cmd =null)
        {
            List<Object> ds = new List<Object>();
            List<ExtraFieldDataDE> top = new List<ExtraFieldDataDE>();
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
               // ds = cmd.Connection.Query<Object>("call Restaurant.GetExtraFieldsData( " + TypeId + ")").ToList();
                return ds;
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

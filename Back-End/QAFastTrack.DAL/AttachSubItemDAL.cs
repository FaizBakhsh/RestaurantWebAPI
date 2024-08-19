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
    public class AttachSubItemDAL
    {
        #region Operations
        public bool ManageAttachSubItem(AttachSubItemDE subitem, MySqlCommand cmd = null)
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
                cmd.CommandText = "ManageAttachSubItem";
                cmd.Parameters.AddWithValue("@id", subitem.Id);
                cmd.Parameters.AddWithValue ("@clientId", subitem.ClientId);
                cmd.Parameters.AddWithValue("@groupId", subitem.GroupId);
                cmd.Parameters.AddWithValue("@itemId", subitem.ItemId);
                cmd.Parameters.AddWithValue("@modifierId", subitem.ModifierId);
                cmd.Parameters.AddWithValue ("@sizeId", subitem.SizeId);
                cmd.Parameters.AddWithValue("@subItemId", subitem.SubItemId);
                cmd.Parameters.AddWithValue("@qty", subitem.Qty);
                cmd.Parameters.AddWithValue("@createdOn", subitem.CreatedOn);
                cmd.Parameters.AddWithValue("@createdById", subitem.CreatedById);
                cmd.Parameters.AddWithValue("@modifiedOn", subitem.ModifiedOn);
                cmd.Parameters.AddWithValue("@modifiedById", subitem.ModifiedById);
                cmd.Parameters.AddWithValue("@isActive", subitem.IsActive);
                cmd.Parameters.AddWithValue("@DBoperation", subitem.DBoperation.ToString());

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
        public List<AttachSubItemDE> SearchAttachSubItems(string whereClause, MySqlCommand cmd = null)
        {
            List<AttachSubItemDE> top = new List<AttachSubItemDE>();
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
                top = cmd.Connection.Query<AttachSubItemDE>("call Restaurant.SearchAttachSubItem( '" + whereClause + "')").ToList();
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

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
    public class NotificationTemplateDAL
    {
        #region Operations

        public bool ManageNotificationTemplate(NotificationTemplateDE _nTem, MySqlCommand cmd = null)
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
                cmd.CommandText = "ManageNotificationTemplate";
                cmd.Parameters.AddWithValue("@id", _nTem.Id);
                cmd.Parameters.AddWithValue("@keyCode", _nTem.KeyCode);
                cmd.Parameters.AddWithValue("@templateName", _nTem.TemplateName);
                cmd.Parameters.AddWithValue("@body", _nTem.Body);
                cmd.Parameters.AddWithValue("@subject", _nTem.Subject);
                cmd.Parameters.AddWithValue("@sMS", _nTem.SMS);
                cmd.Parameters.AddWithValue("@createdOn", _nTem.CreatedOn);
                cmd.Parameters.AddWithValue("@createdById", _nTem.CreatedById);
                cmd.Parameters.AddWithValue("@modifiedOn", _nTem.ModifiedOn);
                cmd.Parameters.AddWithValue("@modifiedById", _nTem.ModifiedById);
                cmd.Parameters.AddWithValue("@isActive", _nTem.IsActive);
                cmd.Parameters.AddWithValue("@DBoperation", _nTem.DBoperation.ToString());

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
            }
        }
           public List<NotificationTemplateDE> SearchNotificationTemplates(string whereClause, MySqlCommand cmd = null)
        {
            List<NotificationTemplateDE> top = new List<NotificationTemplateDE>();
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
                top = cmd.Connection.Query<NotificationTemplateDE>("call Restaurant.SearchNotificationTemplate( '" + whereClause + "')").ToList();
                return top;
            }
            catch (Exception )
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

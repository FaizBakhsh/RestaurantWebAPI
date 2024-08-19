using MySql.Data.MySqlClient;
using NLog;
using Restaurant.Core.Entities;
using Restaurant.Core.Enums;
using Restaurant.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Service
{
    public class NotificationTemplateService
    {
        #region Class Members/Class Variables

        private NotificationTemplateDAL _nTemDAL;
        private CoreDAL _corDAL;
        private Logger _logger;

        #endregion
        #region Constructors
        public NotificationTemplateService()
        {
            _nTemDAL = new NotificationTemplateDAL();
            _corDAL = new CoreDAL();
            _logger = LogManager.GetLogger ("fileLogger");
        }

        #endregion
        #region NotificationTemplate
        public bool ManagementNotificationTemplate(NotificationTemplateDE mod)
        {
            MySqlCommand cmd = null;
            try
            {
                bool check = true;
                cmd = RestaurantDataContext.OpenMySqlConnection();

                if (mod.DBoperation == DBoperations.Insert)
                    mod.Id = _corDAL.GetnextId(TableNames.notificationtemplate.ToString());
                    check = _nTemDAL.ManageNotificationTemplate(mod);
                if (check == true)
                    mod.DBoperation = DBoperations.NA;
                return true;
            }
            catch (Exception ex)
            {
                _logger.Error (ex);
                throw;
            }
            finally
            {
                if (cmd != null)
                    RestaurantDataContext.CloseMySqlConnection(cmd);
            }
        }
        public List<NotificationTemplateDE> SearchNotificationTemplates(NotificationTemplateDE mod)
        {
            List<NotificationTemplateDE> NotificationTemplate = new List<NotificationTemplateDE>();
            bool closeConnectionFlag = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = RestaurantDataContext.OpenMySqlConnection();
                #region Search

                string whereClause = " Where 1=1";
                if (mod.Id != default)
                    whereClause += $" AND Id={mod.Id}";
                if (mod.KeyCode != default)
                    whereClause += $" AND KeyCode like ''" + mod.KeyCode + "''";
                if (mod.TemplateName != default)
                    whereClause += $" AND TemplateName like ''" + mod.TemplateName + "''";
                if (mod.Subject != default)
                    whereClause += $" AND Subject like ''" + mod.Subject + "''";
                if (mod.IsActive != default)
                    whereClause += $" AND IsActive ={mod.IsActive}";
                NotificationTemplate = _nTemDAL.SearchNotificationTemplates(whereClause);

                #endregion
            }
            catch (Exception ex)
            {
                _logger.Error (ex);
                throw;
            }
            finally
            {
                if (closeConnectionFlag)
                    RestaurantDataContext.CloseMySqlConnection(cmd);
            }
            return NotificationTemplate;
        }

        #endregion
    }
}

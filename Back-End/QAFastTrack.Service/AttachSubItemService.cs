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
    public class AttachSubItemService
    {
        #region Class Members/Class Variables

        private AttachSubItemDAL _attachSubItemDAL;
        private CoreDAL _corDAL;
        private Logger _logger;

        #endregion
        #region Constructors
        public AttachSubItemService()
        {
            _attachSubItemDAL = new AttachSubItemDAL();
            _corDAL = new CoreDAL();
            _logger = LogManager.GetLogger("fileLogger");
        }
        #endregion
        #region AttachSubItem
        public bool ManagementAttachSubItem(AttachSubItemDE mod)
        {
            bool retVal = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = RestaurantDataContext.OpenMySqlConnection();
                if (mod.DBoperation == DBoperations.Insert)
                    mod.Id = _corDAL.GetNextIdByClient (TableNames.attachsubitem.ToString (), mod.ClientId, "ClientId");
                retVal = _attachSubItemDAL.ManageAttachSubItem(mod);
                if (retVal == true)
                    mod.DBoperation = DBoperations.NA;
                return retVal;
            }
            catch (Exception ex)
            {
                _logger.Error(ex);
                throw;
            }
            finally
            {
                if (cmd != null)
                    RestaurantDataContext.CloseMySqlConnection(cmd);
            }
        }
        public List<AttachSubItemDE> SearchAttachSubItems(AttachSubItemDE mod)
        {
            List<AttachSubItemDE> AttachSubItems = new List<AttachSubItemDE>();
            bool closeConnectionFlag = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = RestaurantDataContext.OpenMySqlConnection();

                #region Search

                string whereClause = " Where 1=1";
                if (mod.Id != default)
                    whereClause += $" AND Id={mod.Id}";
                if (mod.ClientId != default)
                    whereClause += $" AND ClientId={mod.ClientId}";
                if (mod.ItemId != default && mod.ItemId!=0)
                    whereClause += $" AND ItemId={mod.ItemId}";
                if (mod.GroupId != default && mod.GroupId != 0)
                    whereClause += $" AND GroupId={mod.GroupId}";
                if (mod.SubItemId != default && mod.SubItemId != 0)
                    whereClause += $" AND SubItemId={mod.SubItemId}";
                if (mod.SizeId != default && mod.SizeId != 0)
                    whereClause += $" AND SizeId={mod.SizeId}";
                if (mod.ModifierId != default && mod.ModifierId != 0)
                    whereClause += $" AND ModifierId={mod.ModifierId}";
                if (mod.IsActive != default)
                    whereClause += $" AND IsActive ={mod.IsActive}";
                AttachSubItems = _attachSubItemDAL.SearchAttachSubItems(whereClause);

                #endregion

            }
            catch (Exception exp)
            {
                _logger.Error(exp);
                throw;
            }
            finally
            {
                if (closeConnectionFlag)
                    RestaurantDataContext.CloseMySqlConnection(cmd);
            }
            return AttachSubItems;
        }
        #endregion
    }
}

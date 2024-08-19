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
    public class DiscountCampaignService
    {
        #region Class Members/Class Variables

        private DiscountCampaignDAL _DiscountCampaignDAL;
        private CoreDAL _corDAL;
        private Logger _logger;

        #endregion
        #region Constructors
        public DiscountCampaignService()
        {
            _DiscountCampaignDAL = new DiscountCampaignDAL();
            _corDAL = new CoreDAL();
            _logger = LogManager.GetLogger("fileLogger");
        }
        #endregion
        #region DiscountCampaign
        public bool ManagementDiscountCampaign(DiscountCampaignDE mod)
        {
            bool retVal = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = RestaurantDataContext.OpenMySqlConnection();
                if (mod.DBoperation == DBoperations.Insert)
                    mod.Id = _corDAL.GetNextIdByClient (TableNames.discountcampaign.ToString (), mod.ClientId, "ClientId");
                if (mod.WeekDaysIds != null)
                    mod.DaysIds = string.Join (",", mod.WeekDaysIds.ToArray ());
                retVal = _DiscountCampaignDAL.ManageDiscountCampaign(mod,cmd);
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
        public List<DiscountCampaignDE> SearchDiscountCampaigns(DiscountCampaignDE mod)
        {
            List<DiscountCampaignDE> DiscountCampaigns = new List<DiscountCampaignDE>();
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
                if (mod.Name != default)
                    whereClause += $" AND Name like ''" + mod.Name + "''";
                if (mod.IsActive != default)
                    whereClause += $" AND IsActive ={mod.IsActive}";
                DiscountCampaigns = _DiscountCampaignDAL.SearchDiscountCampaigns(whereClause);
                foreach (var line in DiscountCampaigns)
                {
                    if (line.DaysIds != null)
                    {
                        List<string> result = line.DaysIds.Split (',').ToList ();
                        line.WeekDaysIds = new List<int> ();
                        foreach (var day in result)
                        {
                            line.WeekDaysIds.Add (int.Parse (day));
                        }
                    }
                }
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
            return DiscountCampaigns;
        }
        #endregion
    }
}

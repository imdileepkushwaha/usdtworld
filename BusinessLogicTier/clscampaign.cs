using DataTier;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ARA_StringHunt;

namespace BusinessLogicTier
{
    public class clscampaign
    {
        Data ObjData = new Data();
        public string Id
        {
            get;
            set;
        }

        public string Name
        {
            get;
            set;
        }

        public DataTable fillCampaign()
        {
            DataTable dt = null;
            this.ObjData.StartConnection();
            try
            {
                string s2 = "select * from CampaignMaster";
                dt = this.ObjData.RunDataTable(s2);
            }
            catch (System.Exception ex_26)
            {
                dt = null;
            }
            this.ObjData.EndConnection();
            return dt;
        }
    }
}

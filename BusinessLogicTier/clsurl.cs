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
    public class clsurl
    {
        Data ObjData = new Data();
        public string urlId
        {
            get;
            set;
        }

        public string url
        {
            get;
            set;
        }

        public string status
        {
            get;
            set;
        }

        public string query
        {
            get;
            set;
        }
        public string channelid
        {
            get;
            set;
        }
        public string expirydate
        {
            get;
            set;
        }

        public string CampaignId
        {
            get;
            set;
        }
        public DataTable getUrlAll()
        {
            string str_query = "SELECT U.id,U.Url,U.EntryDate,C.Name AS CampaignName,U.ChannelId,U.ExpiryDate,CASE WHEN U.Status=0 THEN 'Deactive' ELSE 'Active' END AS Status1,U.CampaignId,U.status FROM tbl_url U JOIN CampaignMaster C ON U.CampaignId=C.id where 1=1 ";



            DataTable dt = null;
            ObjData.StartConnection();
            try
            {
                dt = ObjData.RunDataTable(str_query);
            }
            catch (Exception ex)
            {
                dt = null;
            }
            ObjData.EndConnection();
            return dt;
        }
        public string Insert_UpdateUrl(clsurl objUrl)
        {
            string res = "";
            string s2 = "";
            SqlConnection cn;
            SqlTransaction tr = null;
            DataSet ds = new DataSet();
            cn = ObjData.StartConnectionInTransaction();
            tr = cn.BeginTransaction(IsolationLevel.Serializable);

            try
            {
                s2 = "InsertUpdateUrl";
                SqlParameter[] parameter = {  
                new SqlParameter("@id",objUrl.urlId), 
                new SqlParameter("@url",objUrl.url),
                  new SqlParameter("@status",objUrl.status), 
                new SqlParameter("@query",objUrl.query),
                  new SqlParameter("@cid",objUrl.CampaignId), 
                new SqlParameter("@channelid",objUrl.channelid),
                  new SqlParameter("@expirydate",objUrl.expirydate) 
              
                };
                res = ObjData.RunInsUpDelQueryTransProcScalar(s2, tr, parameter);
                tr.Commit();
            }
            catch (Exception ex)
            {
                res = "0";
                tr.Rollback();
            }
            finally
            {
                ObjData.EndConnection();
                tr.Dispose();
            }
            return res;
        }
        public DataTable GetUrlList(string top, string fdate, string tdate, string setname, string id)
        {
            DataTable res = new DataTable();
            ObjData.StartConnection();
            try
            {
                string s2 = "GetUrlDetails";
                SqlParameter[] sqm = new SqlParameter[]
                {
                   new SqlParameter("@top",string.IsNullOrEmpty(top)?null:top),
                   new SqlParameter("@id",string.IsNullOrEmpty(id)?null:id),
                   new SqlParameter("@fdate",string.IsNullOrEmpty(fdate)?null:fdate),
                   new SqlParameter("@tdate",string.IsNullOrEmpty(tdate)?null:tdate),
                   new SqlParameter("@url",string.IsNullOrEmpty(setname)?null:setname),
                };
                res = ObjData.RunDataTableProcedure(s2, sqm);
            }
            catch (Exception ex)
            {
                res = null;
            }
            finally
            {
                ObjData.EndConnection();
            }
            return res;
        }


        public string InsertUpdateSetMaster(string setname, DataTable url, string status, string query, string id, string timespan, string cid, string isadclickable, string fbappid)
        {
            string r = "";
            DataTable res = new DataTable();
            ObjData.StartConnection();
            try
            {
                string s2 = "InsertUpdateSet";
                SqlParameter[] sqm = new SqlParameter[]
                {
                   new SqlParameter("@id",string.IsNullOrEmpty(id)?null:id),
                   new SqlParameter("@UrlType", url),
                   new SqlParameter("@status",string.IsNullOrEmpty(status)?null:status),
                   new SqlParameter("@query",query),
                   new SqlParameter("@setname",string.IsNullOrEmpty(setname)?null:setname),
                   new SqlParameter("@cid",string.IsNullOrEmpty(cid)?null:cid),
                   new SqlParameter("@overalltime",timespan),
                   new SqlParameter("@isadclickable",string.IsNullOrEmpty(isadclickable)?null:isadclickable),
                   new SqlParameter("@fbappid",string.IsNullOrEmpty(fbappid)?null:fbappid),
                };
                res = ObjData.RunDataTableProcedure(s2, sqm);

                if (res != null && res.Rows.Count > 0)
                {
                    r = res.Rows[0][0].ToString();
                }
                else
                {
                    r = "f";
                }
            }
            catch (Exception ex)
            {
                r = "f";
            }
            finally
            {
                ObjData.EndConnection();
            }
            return r;
        }

        public DataTable GetAllSetName()
        {
            string str_query = "SELECT * from tbl_Set ";



            DataTable dt = null;
            ObjData.StartConnection();
            try
            {
                dt = ObjData.RunDataTable(str_query);
            }
            catch (Exception ex)
            {
                dt = null;
            }
            ObjData.EndConnection();
            return dt;
        }
        public DataSet GetSetList(string top, string setname, string status, string fdate, string tdate)
        {
            string r = "";
            DataSet res = new DataSet();
            ObjData.StartConnection();
            try
            {
                string s2 = "GetSetDetails";
                SqlParameter[] sqm = new SqlParameter[]
                {
                   new SqlParameter("@top",string.IsNullOrEmpty(top)?null:top),
                   new SqlParameter("@setname", string.IsNullOrEmpty(setname)?null:setname ),
                   new SqlParameter("@status",string.IsNullOrEmpty(status)?null:status),
                   new SqlParameter("@fdate",string.IsNullOrEmpty(fdate)?null:fdate),
                   new SqlParameter("@tdate",string.IsNullOrEmpty(tdate)?null:tdate),
                };
                res = ObjData.RunDataSetProcedure(s2, sqm);
            }
            catch (Exception ex)
            {
                res = null;
            }
            finally
            {
                ObjData.EndConnection();
            }
            return res;
        }
    }
}

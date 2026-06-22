using DataTier;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogicTier
{
    public class Clstask
    {
        Data ObjData = new Data();



        public DataTable GetTaskMaster()
        {
            string r = "";
            DataTable res = new DataTable();
            ObjData.StartConnection();
            try
            {
                string s2 = "InsertUpdateSelectTask";
                SqlParameter[] sqm = new SqlParameter[]
                {
                   new SqlParameter("@query","Select")
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
        public DataTable GetMessage(string fdate, string tdate, string mssg, string type)
        {
            string r = "";
            DataTable res = new DataTable();
            ObjData.StartConnection();
            try
            {
                string s2 = "sp_GetMessageToAll";
                SqlParameter[] sqm = new SqlParameter[]
                {
                   new SqlParameter("@fdate",string.IsNullOrEmpty(fdate)?null:fdate),
                   new SqlParameter("@tdate",string.IsNullOrEmpty(tdate)?null:tdate),
                   new SqlParameter("@mssg",string.IsNullOrEmpty(mssg)?null:mssg),
                   new SqlParameter("@type",string.IsNullOrEmpty(type)?null:type),
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
        public DataTable GetMeetingSchedule(string fdate, string tdate, string mssg, string type)
        {
            string r = "";
            DataTable res = new DataTable();
            ObjData.StartConnection();
            try
            {
                string s2 = "sp_GetMeetingMessageToAll";
                SqlParameter[] sqm = new SqlParameter[]
                {
                   new SqlParameter("@fdate",string.IsNullOrEmpty(fdate)?null:fdate),
                   new SqlParameter("@tdate",string.IsNullOrEmpty(tdate)?null:tdate),
                   new SqlParameter("@mssg",string.IsNullOrEmpty(mssg)?null:mssg),
                   new SqlParameter("@type",string.IsNullOrEmpty(type)?null:type),
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
        public string Delete_Broadcastmessage(int id)
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

                s2 = " DELETE FROM MStMessage WHERE id='" + id + "' ";
                ObjData.RunInsUpDelQueryTrans(s2, tr);

                res = "t";
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
        public string Delete_Broadcastmeetingmessage(int id)
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

                s2 = " DELETE FROM MStMeeting WHERE id='" + id + "' ";
                ObjData.RunInsUpDelQueryTrans(s2, tr);

                res = "t";
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
        public DataTable InsertMessage123(string title, string mssg, string img, string type, string userid, string url, string linkname)
        {
            string r = "";
            DataTable res = new DataTable();
            ObjData.StartConnection();
            try
            {
                string s2 = "sp_SendMessageToAll";
                SqlParameter[] sqm = new SqlParameter[]
                {
                   new SqlParameter("@MSSG",mssg),
                   new SqlParameter("@title",title),
                   new SqlParameter("@img",img),
                   new SqlParameter("@type",type),
                   new SqlParameter("@userid",userid),
                     new SqlParameter("@url",url),
                       new SqlParameter("@LinkName",linkname)
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
        public DataTable InsertmeetingMessage123(string title, string mssg, string img, string type, string userid, string url, string linkname, string meetingdate, string fromtime, string totime, string isvoice, string isshow)
        {
            string r = "";
            DataTable res = new DataTable();
            ObjData.StartConnection();
            try
            {
                string s2 = "sp_SendMeetingMessageToAll";
                SqlParameter[] sqm = new SqlParameter[]
                {
                   new SqlParameter("@MSSG",mssg),
                   new SqlParameter("@title",title),
                   new SqlParameter("@img",img),
                   new SqlParameter("@type",type),
                   new SqlParameter("@userid",userid),
                     new SqlParameter("@url",url),
                       new SqlParameter("@LinkName",linkname),
                        new SqlParameter("@MeetingDate",meetingdate),
                     new SqlParameter("@fromtime",fromtime),
                       new SqlParameter("@totime",totime),
                         new SqlParameter("@Isvoice",isvoice),
                            new SqlParameter("@Isshow",isshow),

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
        public DataTable UpdatemeetingMessage123(string title, string mssg, string img, string type, string userid, string url, string linkname, string meetingdate, string fromtime, string totime, string isvoice, string isshow, string ID)
        {
            string r = "";
            DataTable res = new DataTable();
            ObjData.StartConnection();
            try
            {
                string s2 = "sp_UpdateMeetingMessageToAll";
                SqlParameter[] sqm = new SqlParameter[]
                {
                     new SqlParameter("@ID",ID),
                   new SqlParameter("@MSSG",mssg),
                   new SqlParameter("@title",title),
                   new SqlParameter("@img",img),
                   new SqlParameter("@type",type),
                   new SqlParameter("@userid",userid),
                     new SqlParameter("@url",url),
                       new SqlParameter("@LinkName",linkname),
                        new SqlParameter("@MeetingDate",meetingdate),
                     new SqlParameter("@fromtime",fromtime),
                       new SqlParameter("@totime",totime),
                         new SqlParameter("@Isvoice",isvoice),
                            new SqlParameter("@Isshow",isshow),

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
        public DataTable GetApppopup()
        {
            string r = "";
            DataTable res = new DataTable();
            ObjData.StartConnection();
            try
            {
                string s2 = "Sp_AppDashboardPopup";
                SqlParameter[] sqm = new SqlParameter[]
                {
                   new SqlParameter("@query","Select")
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
        public DataTable insertApppopup(String Id, String message, String Url, String Status, String image, string Query)
        {
            string r = "";
            DataTable res = new DataTable();
            ObjData.StartConnection();
            try
            {
                string s2 = "Sp_AppDashboardPopup";
                SqlParameter[] sqm = new SqlParameter[]
                {
                   new SqlParameter("@id",Id),
                    new SqlParameter("@img",image),
                     new SqlParameter("@message",message),
                      new SqlParameter("@url",Url),
                       new SqlParameter("@status",Status),                    
                          new SqlParameter("@query",Query),
                         
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
        public DataTable GetdailyTaskMaster()
        {
            string r = "";
            DataTable res = new DataTable();
            ObjData.StartConnection();
            try
            {
                string s2 = "InsertUpdateSelectTask";
                SqlParameter[] sqm = new SqlParameter[]
                {
                   new SqlParameter("@query","Select"),
                       new SqlParameter("@id","1")
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

        public DataTable InsertUpdateTaskMaster(string qry, string id, string task, string amount, string isactive, string taskcount)
        {
            string r = "";
            DataTable res = new DataTable();
            ObjData.StartConnection();
            try
            {
                string s2 = "InsertUpdateSelectTask";
                SqlParameter[] sqm = new SqlParameter[]
                {
                   new SqlParameter("@query",qry),
                   new SqlParameter("@id",string.IsNullOrEmpty(id)?null:id),
                   new SqlParameter("@task",string.IsNullOrEmpty(task)?null:task),
                   new SqlParameter("@amount",amount),
                   new SqlParameter("@isactive",isactive),
                   new SqlParameter("@taskcount",taskcount)
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
        public DataTable GetDailyTaskMapping()
        {
            string r = "";
            DataTable res = new DataTable();
            ObjData.StartConnection();
            try
            {
                string s2 = "InsertSelectDailyTaskMapping";
                SqlParameter[] sqm = new SqlParameter[]
                {
                   new SqlParameter("@query","Select")
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
        public string UpdateDailyTaskMapping(string cid, string id, string type)
        {
            string r = "f";
            DataTable res = new DataTable();
            SqlConnection cn;
            SqlTransaction tr = null;
            DataSet ds = new DataSet();
            cn = ObjData.StartConnectionInTransaction();
            tr = cn.BeginTransaction(IsolationLevel.Serializable);

            try
            {
                string s2 = "UpdateDailyTaskMapping";
                SqlParameter[] sqm1 = new SqlParameter[]
                {
                   new SqlParameter("@id",id),
                   new SqlParameter("@cid",cid),
                   new SqlParameter("@type",type)
                };
                ObjData.RunDataTableProcedureTRans(s2, tr, sqm1);

                tr.Commit();
                r = "t";
            }
            catch (Exception ex)
            {
                r = "f";
                tr.Rollback();
            }
            finally
            {
                ObjData.EndConnection();
            }
            return r;
        }
        public class DailyTaskModel
        {

            public string CID { get; set; }
            public string DailyTaskCount { get; set; }
            public string Type { get; set; }
        }
        public string deleteDailyTaskMapping(string id)
        {
            string r = "f";
            DataTable res = new DataTable();
            SqlConnection cn;
            SqlTransaction tr = null;
            DataSet ds = new DataSet();
            cn = ObjData.StartConnectionInTransaction();
            tr = cn.BeginTransaction(IsolationLevel.Serializable);

            try
            {
                string s2 = "deleteDailyTaskMapping";
                SqlParameter[] sqm1 = new SqlParameter[]
                {
                   new SqlParameter("@id",id),
                 
                };
                ObjData.RunDataTableProcedureTRans(s2, tr, sqm1);

                tr.Commit();
                r = "t";
            }
            catch (Exception ex)
            {
                r = "f";
                tr.Rollback();
            }
            finally
            {
                ObjData.EndConnection();
            }
            return r;
        }
        public string InsertSelectDailyMapping(string dailcount, List<DailyTaskModel> list)
        {
            string r = "f";
            DataTable res = new DataTable();
            SqlConnection cn;
            SqlTransaction tr = null;
            DataSet ds = new DataSet();
            cn = ObjData.StartConnectionInTransaction();
            tr = cn.BeginTransaction(IsolationLevel.Serializable);

            try
            {
                string s2 = "DELETE FROM DailyTaskMapping;";
                ObjData.RunInsUpDelQueryTrans(s2, tr);
                string ids = "";
                for (int i = 0; i < list.Count; i++)
                {
                    s2 = "InsertSelectDailyTaskMapping";
                    SqlParameter[] sqm = new SqlParameter[]
                {
                   new SqlParameter("@query","Insert"),
                   new SqlParameter("@cid",list[i].CID),
                   new SqlParameter("@dailycount",dailcount),
                   new SqlParameter("@taskno",(i+1)),
                    new SqlParameter("@type",list[i].Type)
                };

                    ids = ids + list[i] + ",";
                    ObjData.RunDataTableProcedureTRans(s2, tr, sqm);
                }

                ids = ids.TrimEnd(',');

                s2 = "InsertUpdateTaskHistory";
                SqlParameter[] sqm1 = new SqlParameter[]
                {
                   new SqlParameter("@taskid","1"),
                   new SqlParameter("@campaignids",ids),
                   new SqlParameter("@taskcount",dailcount)
                };
                ObjData.RunDataTableProcedureTRans(s2, tr, sqm1);

                tr.Commit();
                r = "t";
            }
            catch (Exception ex)
            {
                r = "f";
                tr.Rollback();
            }
            finally
            {
                ObjData.EndConnection();
            }
            return r;
        }
        public DataSet GetTask(string userid, string taskid)
        {
            string r = "";
            DataSet res = new DataSet();
            ObjData.StartConnection();
            try
            {

                //string s2 = "NewGetDailyTask22222";
                //string s2 = "MobWebNewGetDailyTask";
                string s2 = "HimMobWebNewGetDailyTask";

                SqlParameter[] sqm = new SqlParameter[]
                {
                   new SqlParameter("@userid",userid),
                   new SqlParameter("@taskid",taskid),
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
        public DataTable getTaskAssign(string UserId)
        {
            string str_query = "DailyTaskAssign";
            SqlParameter[] param = new SqlParameter[]
             {
                 new SqlParameter("@userid",UserId)
             };


            DataTable dt = null;
            ObjData.StartConnection();
            try
            {
                dt = ObjData.RunDataTableProcedure(str_query, param);
            }
            catch (Exception ex)
            {
                dt = null;
            }
            ObjData.EndConnection();
            return dt;
        }
        public DataTable GettotalTask(string userid)
        {
            string r = "";
            DataTable res = new DataTable();
            ObjData.StartConnection();
            try
            {

                //string s2 = "NewGetDailyTask22222";
                //string s2 = "MobWebNewGetDailyTask";
                string s2 = "sp_getdailyTotaltask";

                SqlParameter[] sqm = new SqlParameter[]
                {
                   new SqlParameter("@userid",userid),
                
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
        public DataTable GetpendingpendingTask(string userid)
        {
            string r = "";
            DataTable res = new DataTable();
            ObjData.StartConnection();
            try
            {

                //string s2 = "NewGetDailyTask22222";
                //string s2 = "MobWebNewGetDailyTask";
                string s2 = "sp_getdailypendingtask";

                SqlParameter[] sqm = new SqlParameter[]
                {
                   new SqlParameter("@userid",userid),
                
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
        public DataTable GetFirstpendingpendingTask(string userid, string Type)
        {
            string r = "";
            DataTable res = new DataTable();
            ObjData.StartConnection();
            try
            {

                //string s2 = "NewGetDailyTask22222";
                //string s2 = "MobWebNewGetDailyTask";
                string s2 = "sp_getfirstpendingtask";

                SqlParameter[] sqm = new SqlParameter[]
                {
                   new SqlParameter("@userid",userid),
                   new SqlParameter("@type",Type),
                
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

        public DataTable InsertUpdateSelectNextTask(string query, string userid, string sid, string taskid, string cid, string tasknoid, string taskno, string url, string channelid = "")
        {
            DataTable res = new DataTable();
            ObjData.StartConnection();
            try
            {

                string s2 = "InsertUpdateSelectNextTaskNew";
                SqlParameter[] sqm = new SqlParameter[]
                {
                   new SqlParameter("@query",query),
                   new SqlParameter("@userid",userid),
                   new SqlParameter("@cid",string.IsNullOrEmpty(cid)?null:cid),
                   new SqlParameter("@sid",string.IsNullOrEmpty(sid)?null:sid),
                   new SqlParameter("@taskid",string.IsNullOrEmpty(taskid)?null:taskid),
                   new SqlParameter("@taskno",string.IsNullOrEmpty(taskno)?null:taskno),
                   new SqlParameter("@tasknoid",string.IsNullOrEmpty(tasknoid)?null:tasknoid),
                   new SqlParameter("@url",string.IsNullOrEmpty(url)?null:url),
                   new SqlParameter("@channelid",string.IsNullOrEmpty(channelid)?null:channelid)
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

        public DataSet GetTask1(string sid)
        {
            string r = "";
            DataSet res = new DataSet();
            ObjData.StartConnection();
            try
            {
                string s2 = "GetSetUrl";
                SqlParameter[] sqm = new SqlParameter[]
                {
                   new SqlParameter("@sid",sid)
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

        public string InsertTaskCompletion(string userid, string taskid, string setid, string tasknoid, string cid, string taskno, string IP)
        {
            string r = "";
            DataTable res = new DataTable();
            ObjData.StartConnection();
            try
            {
                string s2 = "";
                s2 = "HimInsertDailyTaskCompletion";


                SqlParameter[] sqm = new SqlParameter[]
                {
                   new SqlParameter("@userid",userid),
                   new SqlParameter("@taskid",taskid),
                   new SqlParameter("@setid",setid),
                   new SqlParameter("@tasknoid",tasknoid),
                   new SqlParameter("@cid",cid),
                   new SqlParameter("@taskno",taskno),
                   new SqlParameter("@IPAddress",IP)
                };

                res = ObjData.RunDataTableProcedure(s2, sqm);

                if (res != null && res.Rows.Count > 0)
                {
                    r = res.Rows[0][0].ToString() + ((char)160) + res.Rows[0][1].ToString() + ((char)160) + res.Rows[0][2].ToString();
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
        public string InsertUpdateAppUrlMasterNew(string url, string status, string query, string id, string img, string packagename, string amount, string isOccassional, string affiliateurl, string campaignid, string vendorid, string kpi,
     string appname, string apptype, string shortkpi, string offerid, string duration, string type, string iconimage, string gender, string state
     )
        {
            string r = "";
            DataTable res = new DataTable();
            ObjData.StartConnection();
            try
            {
                string s2 = "InsertUpdateAPPUrlNew";
                SqlParameter[] sqm = new SqlParameter[]
                {
                   new SqlParameter("@id",string.IsNullOrEmpty(id)?null:id),
                   new SqlParameter("@status",string.IsNullOrEmpty(status)?null:status),
                   new SqlParameter("@query",query),
                   new SqlParameter("@OfferId",offerid),
                   new SqlParameter("@url",string.IsNullOrEmpty(url)?null:url),
                   new SqlParameter("@img",string.IsNullOrEmpty(img)?null:img),
                   new SqlParameter("@packagename",string.IsNullOrEmpty(packagename)?null:packagename),
                   new SqlParameter("@amount",string.IsNullOrEmpty(amount)?null:amount),
                   new SqlParameter("@isoccassional",string.IsNullOrEmpty(isOccassional)?null:isOccassional),
                   new SqlParameter("@affiliateurl",string.IsNullOrEmpty(affiliateurl)?null:affiliateurl),
                   new SqlParameter("@campaignid",string.IsNullOrEmpty(campaignid)?null:campaignid),
                   new SqlParameter("@vendorid",string.IsNullOrEmpty(vendorid)?null:vendorid),
                   new SqlParameter("@kpi",string.IsNullOrEmpty(kpi)?null:kpi),
                   new SqlParameter("@AppName",string.IsNullOrEmpty(appname)?null:appname),
                   new SqlParameter("@AppType",string.IsNullOrEmpty(apptype)?null:apptype),
                   new SqlParameter("@ShortKPI",string.IsNullOrEmpty(shortkpi)?null:shortkpi),
                   new SqlParameter("@Duration",string.IsNullOrEmpty(duration)?null:duration),
                   new SqlParameter("@type",string.IsNullOrEmpty(type)?null:type),
                   new SqlParameter("@iconimg",string.IsNullOrEmpty(iconimage)?null:iconimage),
                    new SqlParameter("@gender",string.IsNullOrEmpty(gender)?null:gender),
                     new SqlParameter("@state",state)
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
        public DataTable GetAppUrlListNew(string top, string fdate, string tdate, string setname, string id)
        {
            DataTable res = new DataTable();
            ObjData.StartConnection();
            try
            {
                string s2 = "GetAppUrlDetailsNew";
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
        public DataTable Getoccationaltask(string id)
        {
            DataTable res = new DataTable();
            ObjData.StartConnection();
            try
            {
                string s2 = "Getoccationaltaskbyid";
                SqlParameter[] sqm = new SqlParameter[]
                {
                  
                   new SqlParameter("@id",string.IsNullOrEmpty(id)?null:id),
                
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

        public DataSet IUSDVisitEanrMasterList(string query, string id, string type, string domainid, string status, string coin, string vendorid, string domain, string surl)
        {
            ObjData.StartConnection();
            DataSet dt = new DataSet();
            try
            {
                SqlParameter[] param = new SqlParameter[9];
                param[0] = new SqlParameter("@query", query);
                param[1] = new SqlParameter("@id", string.IsNullOrEmpty(id) ? null : id);
                param[2] = new SqlParameter("@type", string.IsNullOrEmpty(type) ? null : type);
                param[3] = new SqlParameter("@domainid", string.IsNullOrEmpty(domainid) ? null : domainid);
                param[4] = new SqlParameter("@coin", string.IsNullOrEmpty(coin) ? null : coin);
                param[5] = new SqlParameter("@vendorid", string.IsNullOrEmpty(vendorid) ? null : vendorid);
                param[6] = new SqlParameter("@status", string.IsNullOrEmpty(status) ? null : status);
                param[7] = new SqlParameter("@domain", string.IsNullOrEmpty(domain) ? null : domain);
                param[8] = new SqlParameter("@surl", string.IsNullOrEmpty(surl) ? null : surl);
                return ObjData.RunDataSetProcedure("Sp_MasterVisitEarn", param);
            }
            catch
            {
                return dt;
            }
            finally
            {
                ObjData.EndConnection();
            }

        }

        public DataTable InsertaffCallBackURL(string url, string IP)
        {
            DataTable dt = null;
            this.ObjData.StartConnection();
            try
            {
                string s2 = "sp_InsertaffCallbackUrl";
                SqlParameter[] parameter = new SqlParameter[]
				{
					new SqlParameter("@Url", url),
                    new SqlParameter("@IP", IP)
				};
                dt = this.ObjData.RunDataTableProcedure(s2, parameter);
            }
            catch (System.Exception ex_41)
            {
                dt = null;
            }
            this.ObjData.EndConnection();
            return dt;
        }


        public DataTable InsertshopCallBackdilievery(string url, string IP)
        {
            DataTable dt = null;
            this.ObjData.StartConnection();
            try
            {
                string s2 = "sp_InsertdilieveryCallbackUrl";
                SqlParameter[] parameter = new SqlParameter[]
                {
                    new SqlParameter("@Url", url),
                    new SqlParameter("@IP", IP)
                };
                dt = this.ObjData.RunDataTableProcedure(s2, parameter);
            }
            catch (System.Exception ex_41)
            {
                dt = null;
            }
            this.ObjData.EndConnection();
            return dt;
        }

        public void Updateaffliatecallback(string Userid, string payout, string offeramount, string deviceinfo, string placementidentifier, string IP)
        {
            this.ObjData.StartConnection();
            try
            {
                string s2 = "callback_offeraffilaite";
                SqlParameter[] parameter = new SqlParameter[]
				{
				
					new SqlParameter("@Userid", Userid),
					new SqlParameter("@Payout", payout),
					new SqlParameter("@offerAmount", offeramount),
					new SqlParameter("@deviceinfo", deviceinfo),
					new SqlParameter("@placementidentifier", placementidentifier),
					new SqlParameter("@IP", IP),
					
				};
                DataTable dt = this.ObjData.RunDataTableProcedure(s2, parameter);
            }
            catch (System.Exception ex_C0)
            {
            }
            this.ObjData.EndConnection();
        }
        public void offlineshoppingcallback(string OrderNo, string IP)
        {
            this.ObjData.StartConnection();
            try
            {
                string s2 = "shopMoneyfy_Usercallbackoffline";
                SqlParameter[] parameter = new SqlParameter[]
                {

                    new SqlParameter("@OrderNo", OrderNo),              
                    new SqlParameter("@IP", IP),

                };
                DataTable dt = this.ObjData.RunDataTableProcedure(s2, parameter);
            }
            catch (System.Exception ex_C0)
            {
            }
            this.ObjData.EndConnection();
        }
        public DataTable UpdateDilieveryShopping(string Mobileno, string Refrenceid, string IP)
        {
            DataTable dt = new DataTable();
            this.ObjData.StartConnection();

            try
            {
                string s2 = "sp_UpdateshoppingDilievered";
                SqlParameter[] parameter = new SqlParameter[]
                {

                    new SqlParameter("@RefrenceID", Refrenceid),
                    new SqlParameter("@MobileNo", Mobileno),
                    new SqlParameter("@IP", IP),                

                };
                dt = this.ObjData.RunDataTableProcedure(s2, parameter);
            }
            catch (System.Exception ex_C0)
            {
            }
            this.ObjData.EndConnection();
            return dt;
        }
        public DataTable GetMonthtaskbalance(string Month, string Year, string Userid)
        {
            string r = "";
            DataTable res = new DataTable();
            ObjData.StartConnection();
            try
            {
                string s2 = "sp_gettaskmonthbalance";
                SqlParameter[] sqm = new SqlParameter[]
                {
                   new SqlParameter("@Month",Month),
                    new SqlParameter("@Year",Year),
                     new SqlParameter("@Userid",Userid)
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

        public DataTable transfertomainwallet(string TID)
        {

            string s2 = "";
            string s3 = "";
            DataTable dt = null;
            SqlConnection cn;
            SqlTransaction tr = null;
            cn = ObjData.StartConnectionInTransaction();
            tr = cn.BeginTransaction(IsolationLevel.Serializable);
            try
            {
                s2 = "Sp_TransferMonthlyBalancenew";
                SqlParameter[] parameter = {              
                    new SqlParameter("@id",TID), 
                    
                   
                 
                  
                };
                dt = ObjData.RunDataTableProcedureTRans(s2, tr, parameter);
                tr.Commit();
            }
            catch (Exception ex)
            {
                s3 = "f";
                tr.Rollback();
            }
            ObjData.EndConnection();
            return dt;
        }

    }
}

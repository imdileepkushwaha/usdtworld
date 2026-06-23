using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BusinessLogicTier;
using DataTier;
using System.Data.SqlClient;

public partial class TASKSubmit : System.Web.UI.Page
{
    Data ObjData = new Data();
    clsAccount objaccount = new clsAccount();
    clsUser objclsUser = new clsUser();
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["userid"] != null)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["FID"] != null)
                {
                    txtuserid.Text = Session["userid"].ToString();
                    loaduser(Request.QueryString["FID"].ToString());
                }
            }
        }
        else
        {
            Response.Redirect("logout.aspx");
        }
       
       
    }
    void loaduser(string id)
    {
        DataTable dt = getRecentNews(id);
        if (dt != null && dt.Rows.Count > 0)
        {
            lbltaskid.Text = dt.Rows[0]["ID"].ToString();
           
            HyperLink1.NavigateUrl = dt.Rows[0]["URL"].ToString();
            
            f1.Src = dt.Rows[0]["URL"].ToString();
        }
        //GridView1.DataSource = dt;
        //GridView1.DataBind();
    }

    public string UploadImage()
    {
        string Imagename = "";
        if (panUpload.HasFile)
        {
            string RandomNumber = DateTime.Now.Ticks.ToString();
            string fileName = System.IO.Path.GetFileName(panUpload.PostedFile.FileName);
            Imagename = RandomNumber + fileName;
            panUpload.PostedFile.SaveAs(Server.MapPath("~/ProductImage/") + Imagename);
        }
        return Imagename;
    }
    public DataTable getRecentNews(string ID)
    {
        string str_query = "SELECT T.TasknoID,T.ID,CAST(T.Assigndate AS DATE) Assigndate,datename(dw,T.Assigndate) Dayname,U.URL FROM TaskAssignment T JOIN tbl_url U ON T.URLID=U.id   WHERE T.Status=0 and userid='" + Session["userid"].ToString() + "' and T.ID='" + ID + "'";

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
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string image = UploadImage();
        objclsUser.UserId=txtuserid.Text;
        objclsUser.StateId=lbltaskid.Text;
        objclsUser.PanImage=image;
        if (image != string.Empty)
        {
            string d = activateUserWithWallet(objclsUser);
            if (d == "1")
            {

              //  Message.Show("record update Successfully...!!!");
                string message = "update sucessful";
                string url = "urltask.aspx";
                string script = "window.onload = function(){ alert('";
                script += message;
                script += "');";
                script += "window.location = '";
                script += url;
                script += "'; }";
                ClientScript.RegisterStartupScript(this.GetType(), "Redirect", script, true);

            }
            else
                if (d == "0")
                {
                    string message = "Task already updated";
                    string url = "urltask.aspx";
                    string script = "window.onload = function(){ alert('";
                    script += message;
                    script += "');";
                    script += "window.location = '";
                    script += url;
                    script += "'; }";
                    ClientScript.RegisterStartupScript(this.GetType(), "Redirect", script, true);
                }
        }
        else
        {
            Message.Show("Please upload image for verification...!!!");
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("URLtask.aspx");
    }
    public string activateUserWithWallet(clsUser objUser)
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
            s2 = "updateURLTask";
            SqlParameter[] parameter = {
                    new SqlParameter("@userid",objUser.UserId),
                    new SqlParameter("@TaskID",objUser.StateId),
                new SqlParameter("@Image",objUser.PanImage),
                  
                    

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
}
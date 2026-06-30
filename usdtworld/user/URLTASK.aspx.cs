using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using DataTier;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Data;
using BusinessLogicTier;
using DataTier;

public partial class URLTASK : System.Web.UI.Page
{
    Data ObjData = new Data();
    clsAccount objaccount = new clsAccount();
    clsUser objclsUser = new clsUser();
    Clstask objt = new Clstask();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] == null)
        {
            Response.Redirect("index.aspx");
        }
        if (!IsPostBack)
        {
            DataTable dt = getTaskAssign(Session["userid"].ToString());
            loaduser();
        }
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
    void loaduser()
    {
        DataTable dt = getRecentNews();
        GridView1.DataSource = dt;
        GridView1.DataBind();
      
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "edt")
        {
            int index = Convert.ToInt32(e.CommandArgument.ToString());
            Label lblid = (Label)GridView1.Rows[index].FindControl("lblid");
            Response.Redirect("TASKSubmit.aspx?FID=" + lblid.Text);
           
        }
    }
    public DataTable getRecentNews()
    {
        string str_query = "SELECT TasknoID,ID,CAST(Assigndate AS DATE) Assigndate,datename(dw,Assigndate) Dayname FROM TaskAssignment    WHERE Status=0 and userid='" + Session["userid"].ToString()+ "'";

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
}
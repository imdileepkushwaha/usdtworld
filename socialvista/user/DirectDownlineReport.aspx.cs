using BusinessLogicTier;
using DataTier;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_DirectReport : System.Web.UI.Page
{
    clsState objState = new clsState();
    clsUser objUser = new clsUser();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["userid"] != null)
            {
                txtuserid.Text = Session["userid"].ToString();
                txtuserid.Enabled = false;
                filldashboard();
            }
            else
            {
                Response.Redirect("logout.aspx");
            }
        }
    }
    void loadLeftuser()
    {
        objUser.UserId = txtuserid.Text;
        DataTable dt = new DataTable();
        dt = objUser.getUserDirectLeft(objUser);
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }
    void loadRightuser()
    {
        objUser.UserId = txtuserid.Text;
        DataTable dt = new DataTable();
        dt = objUser.getUserDirectRight(objUser);
        GridView2.DataSource = dt;
        GridView2.DataBind();
    }
    public DataTable getUserDirectLeft(clsUser objUser)
    {
        //string str_query = "";
        //            string str_query = @"DECLARE @child NVARCHAR(100)
        //
        //SELECT @child=userid FROM UserDetail WHERE ParentUserId='" + objUser.UserId + @"' AND StandingPosition='1'
        //; WITH MyCTE
        //AS ( SELECT id,userid,username,ParentUserId,Case when isnull(Status,0)=1 then 'active' else 'deactive' end as Status,1 AS userlevel
        //FROM userdetail
        //WHERE UserId =@child
        //UNION ALL
        //SELECT UserDetail.id,userdetail.userid,userdetail.username,  userdetail.ParentUserId ,Case when isnull(UserDetail.Status,0)=1 then 'active' else 'deactive' end as Status,MyCTE.userlevel+1 
        //FROM userdetail
        //INNER JOIN MyCTE ON userdetail.parentuserid = MyCTE.userid
        //WHERE userdetail.userid !=@child )
        //SELECT MyCTE.*,ud.username as parentname
        //FROM MyCTE left join userdetail ud on mycte.parentuserid=ud.userid ";



        //            DataTable dt = null;
        //            ObjData.StartConnection();
        //            try
        //            {
        //                dt = ObjData.RunDataTable(str_query);
        //            }
        //            catch (Exception ex)
        //            {
        //                dt = null;
        //            }
        //            ObjData.EndConnection();
        //            return dt;

        SqlParameter[] para ={
                                     new SqlParameter ("@UserId",objUser.UserId),

                                     };
        DataSet ds = DBHelper.ExecuteQuery("GetDirectWiseLeft", para);

        DataTable dt = ds.Tables[0];

        return dt;
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label lblstatus = (Label)e.Row.FindControl("lblStatus");
            if (lblstatus.Text == "Unpaid")
            {
                e.Row.BackColor = System.Drawing.Color.Black;
                e.Row.ForeColor = System.Drawing.Color.White ;
            }
            else
            {
                e.Row.BackColor = System.Drawing.Color.Black;
                e.Row.ForeColor = System.Drawing.Color.White;
            }

        }
    }



     void filldashboard()
    {
        objUser.UserId = Session["userid"].ToString();
        DataTable LeftDt = objUser.getUserDirectLeft(objUser);
        DataTable RightDt = objUser.getUserDirectRight(objUser);
        LblTotalLeft.Text = LeftDt.Rows.Count.ToString();
        LblTotalright.Text = RightDt.Rows.Count.ToString();
        //DataRow[] Sactiveusers = LeftDt.Select("Status='active'");
        //DataRow[] Sdeactiveusers = RightDt.Select("Status='active'");
        //DataRow[] SLdeactiveusers = LeftDt.Select("Status='deactive'");
        //DataRow[] SRdeactiveusers = RightDt.Select("Status='deactive'");
        //Lblactiveleft.Text = Sactiveusers.Length.ToString();
        //LblActiveRight.Text = Sdeactiveusers.Length.ToString();
        //LblInactiveleft.Text = SLdeactiveusers.Length.ToString();
        //LblInActiveRight.Text = SRdeactiveusers.Length.ToString();
        //DataTable LeftDirectt = objUser.getUserleftDirect(objUser);
        //DataTable RightDirectt = objUser.getUserrightDirect(objUser);
        //LblLeftDirect.Text = LeftDirectt.Rows[0][0].ToString();
        //LblRightDirect.Text = RightDirectt.Rows[0][0].ToString();
        //string Fromdate = string.Empty;
        //string Todatedate = string.Empty;

      //  DataTable Dt = objCL.getdailyClosingReport(Fromdate, Todatedate, Session["UserId"].ToString());
        //lblleftbv.Text = Dt.Rows[0]["leftbv"].ToString();
        //lblrightbv.Text = Dt.Rows[0]["rightbv"].ToString();


        //  DataSet Ds = objuser.getTotalamount(objuser);
        //  LblBinaryIncome.Text = Ds.Tables[0].Rows[0][0].ToString();
        // LblDirectIncome.Text = Ds.Tables[1].Rows[0][0].ToString();
        //  LblSponserIncome.Text = Ds.Tables[2].Rows[0][0].ToString();
        // LblRoinIncome.Text = Ds.Tables[3].Rows[0][0].ToString();
        //lblTotalincome.Text = Convert.ToString(Convert.ToDecimal(LblBinaryIncome.Text)

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        loadLeftuser();
        loadRightuser();
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Dashboard.aspx");
    }
    protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label lblstatus = (Label)e.Row.FindControl("lblStatus");
            if (lblstatus.Text == "Unpaid")
            {
                e.Row.BackColor = System.Drawing.Color.Black;
                e.Row.ForeColor = System.Drawing.Color.White;
            }
            else
            {
                e.Row.BackColor = System.Drawing.Color.Black;
                e.Row.ForeColor = System.Drawing.Color.White;
            }

        }
    }
}
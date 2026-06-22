using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

using System.Configuration;
using BusinessLogicTier;
using DataTier;
public partial class TaskStatusReport : System.Web.UI.Page
{
    clsAccount objaccount = new clsAccount();
    Data ObjData = new Data();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["userid"] != null)
            {
                txtuserid.Text = Session["userid"].ToString();
                txtuserid.Enabled = false;
            }
            else
            {
                Response.Redirect("logout.aspx");
            }
        }
    }


   

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        loaduser();
    }
    void loaduser()
    {

        if (txtfromdate.Text != "")
        {
            objaccount.FromDate = Message.GetIndianDate(txtfromdate.Text);
        }
        else
        {
            objaccount.FromDate = DateTime.MinValue;
        }
        if (txttodate.Text != "")
        {
            objaccount.ToDate = Message.GetIndianDate(txttodate.Text);
        }
        else
        {
            objaccount.ToDate = DateTime.MinValue;
        }
        objaccount.UserId = txtuserid.Text;
        DataTable dt = new DataTable();
        dt = getBinaryIncome(objaccount);
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "photolarge")
        {
            int index = Convert.ToInt32(e.CommandArgument.ToString());
            Label lblid = (Label)GridView1.Rows[index].FindControl("lblid");
            Label LblImage = (Label)GridView1.Rows[index].FindControl("LblImage");
            ImageLarge.ImageUrl = LblImage.Text;
            ScriptManager.RegisterStartupScript(this, this.GetType(), Guid.NewGuid().ToString(), "showModal1();", true);
        }
    }
    protected void grdGetHelp_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label lblstatus = (Label)e.Row.FindControl("Label1pimg");
            HyperLink HyperLink1 = (HyperLink)e.Row.FindControl("HyperLink1");

            if (lblstatus.Text == "")
            {
                HyperLink1.Text = "Not Upload";
                lblstatus.CssClass = "label label-warning";
            }
            else
            {
                HyperLink1.Text = "View";
                lblstatus.CssClass = "label label-Danger";
            }
        }
    }
    public DataTable getBinaryIncome(clsAccount objaccount)
    {
        string str_query = "SELECT ID,userid,assigndate,img as Pimg,paneltype,Tasknoid,campaign,status,adminstatus,admindate,paidstatus,case when img='' then '../ProductImage/images.png' else '../ProductImage/'+ img end as img,CASE WHEN isnull(status,0)=0 THEN 'Pending' when isnull(status,0)=1 THEN 'Done' ELSE 'Not Done' END AS Status1,CASE WHEN isnull(adminstatus,0)=0 THEN 'Pending' when isnull(adminstatus,0)=1 THEN 'Approved' ELSE 'Reject' END AS adminStatus1,CASE WHEN isnull(paidstatus,0)=0 THEN 'Pending' when isnull(paidstatus,0)=1 THEN 'Paid' ELSE 'Reject' END AS paidStatus1 FROM TaskAssignment  WHERE 1=1 ";


        if (objaccount.UserId != "")
        {
            str_query += "  AND UserId = '" + objaccount.UserId + "' ";
        }

        if (objaccount.FromDate != DateTime.MinValue && objaccount.ToDate != DateTime.MinValue)
        {
            str_query += "  and assigndate  >= '" + objaccount.FromDate + "'   and assigndate   <= '" + objaccount.ToDate + "' ";
        }





        str_query += " order by ID  desc";



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
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Dashboard.aspx");
    }
}
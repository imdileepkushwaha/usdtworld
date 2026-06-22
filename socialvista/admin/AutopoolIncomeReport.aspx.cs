using BusinessLogicTier;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
public partial class admin_UserReport : System.Web.UI.Page
{
    clsAccount objaccount = new clsAccount();
    clsClosing objclosing = new clsClosing();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["useradmin"] != null)
            {
            //    loadclosingperiod();
              
            }
            else
            {
                Response.Redirect("logout.aspx");
            }
        }
    }


    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {

    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        loaduser();
    }
    //void loadclosingperiod()
    //{
    //    ddclosingperiod.Items.Clear();
    //    DataTable dt = new DataTable();
    //    dt = objclosing.getClosingPeriod();

    //    ddclosingperiod.DataSource = dt;
    //    ddclosingperiod.DataTextField = "closingperiod";
    //    ddclosingperiod.DataValueField = "id";
    //    ddclosingperiod.DataBind();
    //    ListItem li = new ListItem("Select Closing Period", "0");
    //    ddclosingperiod.Items.Insert(0, li);
    //}
    void loaduser()
    {

        objaccount.UserId = txtuserid.Text;
        objaccount.PoolNo = ddpoolno.SelectedValue.ToString();
        objaccount.Status = ddstatus.SelectedValue.ToString();
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
        DataTable dt = new DataTable();
        dt = objaccount.getAUtopoolIncomeUser(objaccount);
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Dashboard.aspx");
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label lblactivestatus = (Label)e.Row.FindControl("lblstatus");
            if (lblactivestatus.Text == "1")
            {
                lblactivestatus.Text = "Paid";
                lblactivestatus.CssClass = "badge bg-success";
            }
            else
                if (lblactivestatus.Text == "0")
            {
                lblactivestatus.Text = "Unpaid";
                lblactivestatus.CssClass = "badge bg-danger";
            }
        }
    }
}
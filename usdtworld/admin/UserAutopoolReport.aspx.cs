using BusinessLogicTier;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_DownlineReport : System.Web.UI.Page
{
    clsState objState = new clsState();
    clsUser objUser = new clsUser();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["useradmin"] != null)
            {
            }
            else
            {
                Response.Redirect("logout.aspx");
            }
        }
    }
    void loaduser()
    {
        objUser.UserId = txtuserid.Text;
        //if (txtpoolno.Text != "")
        //{

        //    objUser.PoolNo = Convert.ToInt32(txtpoolno.Text);
        //}
        //else
        //{
        //    objUser.PoolNo = 0;

        //}
       
       
            objUser.PoolNo = ddpoolno.SelectedValue.ToString();
       
       
        DataTable dt = new DataTable();
        dt = objUser.getUserAutopoolReport(objUser);
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        loaduser();
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Dashboard.aspx");
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //Label lblstatus = (Label)e.Row.FindControl("lblstatus");
            //if (lblstatus.Text == "Paid")
            //{
            //    lblstatus.CssClass = "label label-success";
            //}
            //else
            //{
            //    lblstatus.CssClass = "label label-danger";

            //}

        }
    }
}
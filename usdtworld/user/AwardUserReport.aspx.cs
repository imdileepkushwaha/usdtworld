using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using DataTier;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BusinessLogicTier;
using DataTier;

public partial class AwardUserReport : System.Web.UI.Page
{
    Data ObjData = new Data();
    clsUser objclsUser = new clsUser();
    clsClosing objCl = new clsClosing();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] == null)
        {
            Response.Redirect("index.aspx");
        }
        if (!IsPostBack)
        {
            FillAssociatesDetails();
        }
    }

    public void FillAssociatesDetails()
    {
        DataTable dt = new DataTable();
        objCl.GenerateUserId = Session["userid"].ToString();
        dt = getUserRewardReport(objCl);
        grdBank.DataSource = dt;
        grdBank.DataBind();
    }
    public DataTable getUserRewardReport(clsClosing objCl)
    {
     

        SqlParameter[] para ={
                                     new SqlParameter ("@UserId",objCl.GenerateUserId),

                                     };
        DataSet ds = DBHelper.ExecuteQuery("sp_getRewardListUserWise", para);

        DataTable dt = ds.Tables[0];

        return dt;
    }
    protected void grdBank_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            DataRowView drv = e.Row.DataItem as DataRowView;
            if (e.Row.Cells[11].Text.ToUpper()=="YES")
            {
                e.Row.BackColor = System.Drawing.Color.LightGreen;
               // e.Row.ForeColor = System.Drawing.Color.White;
            }
            //else
            //{
            //    e.Row.BackColor = System.Drawing.Color.Green;
            //}
        }
    }
}
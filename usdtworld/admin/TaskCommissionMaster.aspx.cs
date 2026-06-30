using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BusinessLogicTier;
using DataTier;

public partial class TaskCommissionMaster : System.Web.UI.Page
{
    Data ObjData = new Data();
    clsAccount objaccount = new clsAccount();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["useradmin"] != null)
        {
            if (!IsPostBack)
            {
                loaddata();
            }
        }
        else
        {
            Response.Redirect("logout.aspx");
        }
    }
    void loaddata()
    {
        DataTable dt = new DataTable();
        dt = objaccount.gettaskCommissionMaster();
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow r in GridView1.Rows)
        {
            Label lblLevelNo = (Label)r.FindControl("lblLevelNo");
            TextBox txtcommission = (TextBox)r.FindControl("txtcommission");
            objaccount.LevelNo = lblLevelNo.Text;
            objaccount.Fivecommission = Convert.ToDecimal(txtcommission.Text);
            objaccount.UpdateRechargeCommissionMaster(objaccount);
        }
        string popupScript = "alert('Data Updated Successfully');";
        ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), popupScript, true);

    }
   
}
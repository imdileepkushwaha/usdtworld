using BusinessLogicTier;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_TaskMaster : System.Web.UI.Page
{
    Clstask objT = new Clstask();
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
        dt = objT.GetTaskMaster();
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "edt")
        {
            int index = Convert.ToInt32(e.CommandArgument.ToString());
            Label lblid = (Label)GridView1.Rows[index].FindControl("lblid");
            Label lblCampaign = (Label)GridView1.Rows[index].FindControl("lblCampaign");
            Label lblstatus1 = (Label)GridView1.Rows[index].FindControl("lblstatus1");
            Label lblAmount = (Label)GridView1.Rows[index].FindControl("lblAmount");
            Label lblTaskCount = (Label)GridView1.Rows[index].FindControl("lblTaskCount");
            lblcityid.Text = lblid.Text;
            TxtamounrEdit.Text = lblAmount.Text;
            TxttaskCount.Text = lblTaskCount.Text;
            txtcitynameedit.Text = lblCampaign.Text;
            ddlststatusedit.SelectedValue = lblstatus1.Text;
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "showModal();", true);
        }
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {

        DataTable Dt = objT.InsertUpdateTaskMaster("Update", lblcityid.Text, txtcitynameedit.Text, TxtamounrEdit.Text, ddlststatusedit.SelectedValue, TxttaskCount.Text);
       if (Dt.Rows[0][0].ToString() == "t")
        {
            string popupScript = "alert('Record Edited Successfully');";
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), popupScript, true);
            string popupScript2 = "Closepopup();";
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), popupScript2, true);
            loaddata();
        }

    }
}
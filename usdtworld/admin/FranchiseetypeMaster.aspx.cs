using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BusinessLogicTier;

public partial class FranchiseetypeMaster : System.Web.UI.Page
{
    clsAccount objaccount = new clsAccount();
    clsDownload objD = new clsDownload();
    clsfranchisee objUser = new clsfranchisee();
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
        dt = objUser.getFranchiseetype();
        rptFranchiseeTypes.DataSource = dt;
        rptFranchiseeTypes.DataBind();
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        foreach (RepeaterItem item in rptFranchiseeTypes.Items)
        {
            if (item.ItemType != ListItemType.Item && item.ItemType != ListItemType.AlternatingItem)
                continue;

            Label lbllevel = (Label)item.FindControl("lblid");
            TextBox TxtAdminCharge = (TextBox)item.FindControl("TxtAdminCharge");
            TextBox TxtTdswithpam = (TextBox)item.FindControl("TxtTdswithpam");

            if (lbllevel == null || TxtAdminCharge == null || TxtTdswithpam == null)
                continue;

            objUser.Updatefranchiseecommission(lbllevel.Text, TxtAdminCharge.Text, TxtTdswithpam.Text);
        }
        string popupScript = "alert('Data Updated Successfully');";
        ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), popupScript, true);
        loaddata();
    }
}

using BusinessLogicTier;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_Urlmaster : System.Web.UI.Page
{
    clscampaign objCam = new clscampaign();
    clsurl objUrl= new clsurl();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["useradmin"] != null)
            {
                loadcalpaign();
                loadurl();
                loadcalpaignedit();
            }
            else
            {
                Response.Redirect("logout.aspx");
            }
        }
    }
    void loadcalpaign()
    {
        ddCampain.Items.Clear();
        DataTable dt = new DataTable();
        dt = objCam.fillCampaign();
        ddCampain.DataSource = dt;
        ddCampain.DataTextField = "Name";
        ddCampain.DataValueField = "ID";
        ddCampain.DataBind();
        ListItem li = new ListItem("Select Campaign", "0");
        ddCampain.Items.Insert(0, li);
    }
    void loadcalpaignedit()
    {
        ddlstcampaignedit.Items.Clear();
        DataTable dt = new DataTable();
        dt = objCam.fillCampaign();
        ddlstcampaignedit.DataSource = dt;
        ddlstcampaignedit.DataTextField = "Name";
        ddlstcampaignedit.DataValueField = "ID";
        ddlstcampaignedit.DataBind();
        ListItem li = new ListItem("Select Campaign", "0");
        ddlstcampaignedit.Items.Insert(0, li);
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        objUrl.url = TxtUrl.Text;
        objUrl.CampaignId = ddCampain.SelectedValue;
        objUrl.status = ddStatus.SelectedValue;
        objUrl.query = "insert";
        string res = objUrl.Insert_UpdateUrl(objUrl);
        if (res == "t")
        {
            string popupScript = "alert('URL Added Successfully');";
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), popupScript, true);
            TxtUrl.Text = ""; ddCampain.SelectedValue = "0"; ddStatus.SelectedValue = "0";
            loadurl();
        }
        else
        {
            string popupScript = "alert('Unknow error occurred');";
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), popupScript, true);
        }

    }
    void loadurl()
    {
        DataTable dt = new DataTable();
        dt = objUrl.getUrlAll();
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        objUrl.urlId = lblcityid.Text;
        objUrl.url = txtcitynameedit.Text;
        objUrl.CampaignId = ddlstcampaignedit.SelectedValue;
        objUrl.status = ddlststatusedit.SelectedValue;
        objUrl.query = "update";
        string res = objUrl.Insert_UpdateUrl(objUrl);
        if (res == "t")
        {
            string popupScript = "alert('Url Edited Successfully');";
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), popupScript, true);
            string popupScript2 = "Closepopup();";
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), popupScript2, true);
            loadurl();
        }

    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "edt")
        {
            int index = Convert.ToInt32(e.CommandArgument.ToString());
            Label lblid = (Label)GridView1.Rows[index].FindControl("lblid");
            Label lblstatus = (Label)GridView1.Rows[index].FindControl("LablblStatus");
            Label LaCampaignId = (Label)GridView1.Rows[index].FindControl("LaCampaignId");
            Label lblurl = (Label)GridView1.Rows[index].FindControl("lblurl");
            lblcityid.Text = lblid.Text;
            ddlstcampaignedit.SelectedValue = LaCampaignId.Text;
            txtcitynameedit.Text = lblurl.Text;
            ddlststatusedit.SelectedValue = lblstatus.Text;
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "showModal();", true);
        }
    }
}
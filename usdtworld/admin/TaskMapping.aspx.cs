using BusinessLogicTier;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TaskMapping : System.Web.UI.Page
{
    clscampaign objCam = new clscampaign();
    Clstask objUrl = new Clstask();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["useradmin"] != null)
            {
                loadTotaltask();
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

        List<BusinessLogicTier.Clstask.DailyTaskModel> ddltask = new List<BusinessLogicTier.Clstask.DailyTaskModel>();
        DataTable dty = objUrl.GetDailyTaskMapping();
        foreach (DataRow row in dty.Rows)
        {
            var State = new BusinessLogicTier.Clstask.DailyTaskModel();           
            State.CID = row["campaignid"].ToString();
            State.DailyTaskCount = TxtTotaltask.Text;
            State.Type = "WEB";
            ddltask.Add(State);
        }
        if (Convert.ToInt32(Lbltaskleft.Text) > 0)
        {
            for (int i = 0; i < Convert.ToInt32(Lbltaskleft.Text); i++)
            {

                var State1 = new BusinessLogicTier.Clstask.DailyTaskModel();
                State1.CID = ddCampain.SelectedValue;
                State1.DailyTaskCount = TxtTotaltask.Text;
                State1.Type = "WEB";
                ddltask.Add(State1);
            }
        }
        string res = objUrl.InsertSelectDailyMapping(TxtTotaltask.Text, ddltask);
        if (res == "t")
        {
            string popupScript = "alert('Record Edited Successfully');";
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), popupScript, true);
            loadTotaltask();
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
        dt = objUrl.GetDailyTaskMapping();
        GridView1.DataSource = dt;
        GridView1.DataBind();
       
        Lbltaskleft.Text =Convert.ToString(Convert.ToInt32(Lbltaskleft.Text) - dt.Rows.Count);
        
    }

    void loadTotaltask()
    {
        DataTable dt = new DataTable();
        dt = objUrl.GetdailyTaskMaster();
        Lbltaskleft.Text = dt.Rows[0][5].ToString();
        TxtTotaltask.Text = dt.Rows[0][5].ToString();
    }
   
    protected void btnUpdate_Click(object sender, EventArgs e)
    {

        string res = objUrl.UpdateDailyTaskMapping(ddlstcampaignedit.SelectedValue, lblcityid.Text, DDLsttype.SelectedValue);
        if (res == "t")
        {
            string popupScript = "alert('Record Edited Successfully');";
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), popupScript, true);
            string popupScript2 = "Closepopup();";
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), popupScript2, true);
            loadTotaltask();
            loadurl();
        }
        else
        {
            string popupScript2 = "Closepopup();";
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), popupScript2, true);
            string popupScript = "alert('Unknow error occurred');";
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), popupScript, true);
           
        }      

    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "edt")
        {
            int index = Convert.ToInt32(e.CommandArgument.ToString());
            Label lblid = (Label)GridView1.Rows[index].FindControl("lblid");           
            Label LaCampaignId = (Label)GridView1.Rows[index].FindControl("LaCampaignId");
            Label lblType = (Label)GridView1.Rows[index].FindControl("lblType");
            lblcityid.Text = lblid.Text;
            ddlstcampaignedit.SelectedValue = LaCampaignId.Text;
            DDLsttype.SelectedValue = lblType.Text;      
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "showModal();", true);
        }
        if (e.CommandName == "delete")
        {

            int index = Convert.ToInt32(e.CommandArgument.ToString());
            Label lblid = (Label)GridView1.Rows[index].FindControl("lblid");
            Label LaCampaignId = (Label)GridView1.Rows[index].FindControl("LaCampaignId");
            Label lblType = (Label)GridView1.Rows[index].FindControl("lblType");
            string res = objUrl.deleteDailyTaskMapping(lblid.Text);
            string popupScript = "alert('Record delete Successfully');";
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), popupScript, true);
            loadTotaltask();
            loadurl();
        }
    }
}
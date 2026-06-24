using BusinessLogicTier;
using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_CountryAdd : System.Web.UI.Page
{
    clsState objState = new clsState();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["useradmin"] != null)
                loaddata();
            else
                Response.Redirect("logout.aspx");
        }
    }

    void loaddata()
    {
        GridView1.DataSource = objState.getCountry();
        GridView1.DataBind();
    }

    void SetEditMode(bool isEdit)
    {
        btnSubmit.Visible = !isEdit;
        btnUpdate.Visible = isEdit;
        litFormTitle.Text = isEdit ? "Edit Country" : "Add Country";
    }

    void ResetForm()
    {
        lblcountryid.Text = "";
        txtcountryname.Text = "";
        txtcountrycode.Text = "";
        SetEditMode(false);
    }

    void ScrollToMainForm()
    {
        ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), "scrollForm",
            "var el=document.getElementById('admMainForm');if(el){el.scrollIntoView({behavior:'smooth',block:'start'});}", true);
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        objState.CountryName = txtcountryname.Text;
        objState.CountryCode = txtcountrycode.Text;
        objState.CountryId = lblcountryid.Text;
        string res = objState.Update_Country(objState);
        if (res == "t")
        {
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), "alert('Country Edited Successfully');", true);
            ResetForm();
            loaddata();
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        objState.CountryName = txtcountryname.Text;
        objState.CountryCode = txtcountrycode.Text;
        objState.MentionBy = Session["useradmin"].ToString();
        string res = objState.Insert_Country(objState);
        if (res == "t")
        {
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), "alert('Country Added Successfully');", true);
            ResetForm();
            loaddata();
        }
        else
        {
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), "alert('Unknow error occurred');", true);
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        ResetForm();
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "edt")
        {
            int index = Convert.ToInt32(e.CommandArgument.ToString());
            Label lblid = (Label)GridView1.Rows[index].FindControl("lblid");
            Label lblCountryname = (Label)GridView1.Rows[index].FindControl("lblCountryname");
            Label lblCountrycode = (Label)GridView1.Rows[index].FindControl("lblCountrycode");
            lblcountryid.Text = lblid.Text;
            txtcountryname.Text = lblCountryname.Text;
            txtcountrycode.Text = lblCountrycode.Text;
            SetEditMode(true);
            ScrollToMainForm();
        }
    }
}

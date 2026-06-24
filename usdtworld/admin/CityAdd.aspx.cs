using BusinessLogicTier;
using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_CityAdd : System.Web.UI.Page
{
    clsState objState = new clsState();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["useradmin"] != null)
            {
                loadcountry();
                loadcity();
            }
            else
            {
                Response.Redirect("logout.aspx");
            }
        }
    }

    void loadcountry()
    {
        bindCountryDropdown(ddcountry);
    }

    void bindCountryDropdown(DropDownList ddl)
    {
        ddl.Items.Clear();
        DataTable dt = objState.getCountry();
        ddl.DataSource = dt;
        ddl.DataTextField = "CountryName";
        ddl.DataValueField = "CountryID";
        ddl.DataBind();
        ddl.Items.Insert(0, new ListItem("Select Country", "0"));
    }

    void loadstate()
    {
        bindStateDropdown(ddstate, ddcountry.SelectedValue);
    }

    void bindStateDropdown(DropDownList ddl, string countryId)
    {
        ddl.Items.Clear();
        if (string.IsNullOrEmpty(countryId) || countryId == "0")
        {
            ddl.Items.Insert(0, new ListItem("Select State", "0"));
            return;
        }
        objState.CountryId = countryId;
        DataTable dt = objState.getState(objState);
        ddl.DataSource = dt;
        ddl.DataTextField = "StateName";
        ddl.DataValueField = "StateID";
        ddl.DataBind();
        ddl.Items.Insert(0, new ListItem("Select State", "0"));
    }

    void loadcity()
    {
        GridView1.DataSource = objState.getCityAll();
        GridView1.DataBind();
    }

    void SetEditMode(bool isEdit)
    {
        btnSubmit.Visible = !isEdit;
        btnUpdate.Visible = isEdit;
        litFormTitle.Text = isEdit ? "Edit City" : "Add City";
    }

    void ResetForm()
    {
        lblcityid.Text = "";
        txtcityname.Text = "";
        ddcountry.SelectedValue = "0";
        bindStateDropdown(ddstate, "0");
        SetEditMode(false);
    }

    void ScrollToMainForm()
    {
        ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), "scrollForm",
            "var el=document.getElementById('admMainForm');if(el){el.scrollIntoView({behavior:'smooth',block:'start'});}", true);
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        objState.StateId = ddstate.SelectedValue;
        objState.CityName = txtcityname.Text;
        objState.CityId = lblcityid.Text;
        string res = objState.Update_City(objState);
        if (res == "t")
        {
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), "alert('City Edited Successfully');", true);
            ResetForm();
            loadcity();
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        objState.StateId = ddstate.SelectedValue;
        objState.CityName = txtcityname.Text;
        objState.MentionBy = Session["useradmin"].ToString();
        string res = objState.Insert_City(objState);
        if (res == "t")
        {
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), "alert('City Added Successfully');", true);
            ResetForm();
            loadcity();
        }
        else if (res == "f")
        {
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), "alert('City Already Exists');", true);
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

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType != DataControlRowType.DataRow) return;

        Label lblcountryid = (Label)e.Row.FindControl("lblcountryid");
        if (lblcountryid == null) return;

        DataRowView row = (DataRowView)e.Row.DataItem;
        lblcountryid.Text = GetRowValue(row, "countryid", "CountryID", "CountryId");
    }

    static string GetRowValue(DataRowView row, params string[] columnNames)
    {
        foreach (string name in columnNames)
        {
            foreach (DataColumn col in row.DataView.Table.Columns)
            {
                if (string.Equals(col.ColumnName, name, StringComparison.OrdinalIgnoreCase)
                    && row[col.ColumnName] != DBNull.Value)
                    return row[col.ColumnName].ToString();
            }
        }
        return "";
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "edt")
        {
            int index = Convert.ToInt32(e.CommandArgument.ToString());
            Label lblid = (Label)GridView1.Rows[index].FindControl("lblid");
            Label lblcityname = (Label)GridView1.Rows[index].FindControl("lblcityname");
            Label lblcountryid = (Label)GridView1.Rows[index].FindControl("lblcountryid");
            Label lblstateid = (Label)GridView1.Rows[index].FindControl("lblstateid");

            bindCountryDropdown(ddcountry);
            lblcityid.Text = lblid.Text;
            txtcityname.Text = lblcityname.Text;
            if (lblcountryid != null && !string.IsNullOrEmpty(lblcountryid.Text))
            {
                ddcountry.SelectedValue = lblcountryid.Text;
                bindStateDropdown(ddstate, lblcountryid.Text);
            }
            if (lblstateid != null && !string.IsNullOrEmpty(lblstateid.Text))
                ddstate.SelectedValue = lblstateid.Text;

            SetEditMode(true);
            ScrollToMainForm();
        }
    }

    protected void ddcountry_SelectedIndexChanged(object sender, EventArgs e)
    {
        loadstate();
    }
}

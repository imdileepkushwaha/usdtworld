using BusinessLogicTier;
using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_StateAdd : System.Web.UI.Page
{
    clsState objState = new clsState();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["useradmin"] != null)
            {
                loadcountry();
                loadstate();
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
        GridView1.DataSource = objState.getStateAll();
        GridView1.DataBind();
    }

    void SetEditMode(bool isEdit)
    {
        btnSubmit.Visible = !isEdit;
        btnUpdate.Visible = isEdit;
        litFormTitle.Text = isEdit ? "Edit State" : "Add State";
    }

    void ResetForm()
    {
        lblstateid.Text = "";
        txtstatename.Text = "";
        ddcountry.SelectedValue = "0";
        SetEditMode(false);
    }

    void ScrollToMainForm()
    {
        ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), "scrollForm",
            "var el=document.getElementById('admMainForm');if(el){el.scrollIntoView({behavior:'smooth',block:'start'});}", true);
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        objState.CountryId = ddcountry.SelectedValue;
        objState.StateName = txtstatename.Text;
        objState.StateId = lblstateid.Text;
        string res = objState.Update_State(objState);
        if (res == "t")
        {
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), "alert('State Edited Successfully');", true);
            ResetForm();
            loadstate();
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        objState.CountryId = ddcountry.SelectedValue;
        objState.StateName = txtstatename.Text;
        objState.MentionBy = Session["useradmin"].ToString();
        string res = objState.Insert_State(objState);
        if (res == "t")
        {
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), "alert('State Added Successfully');", true);
            ResetForm();
            loadstate();
        }
        else if (res == "f")
        {
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), "alert('State Already Exists');", true);
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
            Label lblstatename = (Label)GridView1.Rows[index].FindControl("lblstatename");
            Label lblcountryid = (Label)GridView1.Rows[index].FindControl("lblcountryid");

            bindCountryDropdown(ddcountry);
            lblstateid.Text = lblid.Text;
            txtstatename.Text = lblstatename.Text;
            if (lblcountryid != null && !string.IsNullOrEmpty(lblcountryid.Text))
                ddcountry.SelectedValue = lblcountryid.Text;

            SetEditMode(true);
            ScrollToMainForm();
        }
    }
}

using BusinessLogicTier;
using System;
using DataTier;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_UserEdit : System.Web.UI.Page
{
    clsState objState = new clsState();
    Data ObjData = new Data();
    clsUser objUser = new clsUser();
    clsBank objbank = new clsBank();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["userid"] != null)
            {

                loadcountry();
                loadbank();
                loaddata();
                //if (GetProfileEditStatus())
                //{
                //    txtname.Enabled = true;
                //    txtmobile.Enabled = true;
                //    div_update.Visible = true;
                //    div_noupdate.Visible = false;
                //}
                //else
                //{
                //    Txtwallettype.Enabled = false;
                //    TxtWalletAdd.Enabled = false;
                //    txtname.Enabled = false;
                //    txtmobile.Enabled = false;
                //    div_update.Visible = false;
                //    div_noupdate.Visible = true;
                //    string url = "alert('You cannot update profile.Please contact admin.');";
                //    ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), url, true);
                //}

            }
            else
            {
                Response.Redirect("logout.aspx");
            }
        }
    }


    //public bool GetProfileEditStatus()
    //{
    //    clsVerfification obj = new clsVerfification();
    //    DataTable dt = obj.getProfileEditableStatus(Session["userid"].ToString());
    //    if (dt != null && dt.Rows.Count > 0)
    //    {
    //        if (Convert.ToBoolean(dt.Rows[0]["IsEditable"].ToString()))
    //            return true;
    //        else
    //            return false;
    //    }
    //    else
    //    {
    //        return false;
    //    }
    //}



    void loaddata()
    {
        objUser.UserId = Session["userid"].ToString();
        DataTable dt = GetUserDetail(objUser.UserId);
        if (dt == null || dt.Rows.Count == 0)
        {
            Message.Show("Unable to load user profile. Please try again or contact support.");
            return;
        }

        txtsponserid.Text = dt.Rows[0]["sponserid"].ToString();
        loadsusername();
        txtname.Text = dt.Rows[0]["username"].ToString();
        txtmobile.Text = dt.Rows[0]["mobile"].ToString();
        txtemail.Text = dt.Rows[0]["email"].ToString();
        if (ddgender.Items.FindByValue(dt.Rows[0]["gender"].ToString()) != null)
            ddgender.SelectedValue = dt.Rows[0]["gender"].ToString();
        txtaddress.Text = dt.Rows[0]["address"].ToString();
        if (ddcountry.Items.FindByValue(dt.Rows[0]["countryid"].ToString()) != null)
            ddcountry.SelectedValue = dt.Rows[0]["countryid"].ToString();
        loadstate();
        if (ddstate.Items.FindByValue(dt.Rows[0]["stateid"].ToString()) != null)
            ddstate.SelectedValue = dt.Rows[0]["stateid"].ToString();
        loadcity();
        if (ddcity.Items.FindByValue(dt.Rows[0]["cityid"].ToString()) != null)
            ddcity.SelectedValue = dt.Rows[0]["cityid"].ToString();
        txtareaname.Text = dt.Rows[0]["areaname"].ToString();
        txtpincode.Text = dt.Rows[0]["pincode"].ToString();
        try
        {
            txtdateofbirth.Text = Convert.ToDateTime(dt.Rows[0]["dateofbirth"].ToString()).ToString("dd/MM/yyyy");
        }
        catch { }
        txtnomineename.Text = dt.Rows[0]["nomineename"].ToString();
        txtnomineerelation.Text = dt.Rows[0]["nomineerelation"].ToString();
        txtaccountholdername.Text = dt.Rows[0]["accountholdername"].ToString();
        txtaccountno.Text = dt.Rows[0]["accountno"].ToString();
        txtpan.Text = dt.Rows[0]["pannumber"].ToString();
        if (dt.Columns.Contains("wallettype"))
            Txtwallettype.Text = dt.Rows[0]["wallettype"].ToString();
        if (dt.Columns.Contains("walletaddress"))
            TxtWalletAdd.Text = dt.Rows[0]["walletaddress"].ToString();
        txtifsccode.Text = dt.Rows[0]["ifsccode"].ToString();
        txtbranchname.Text = dt.Rows[0]["branchname"].ToString();
        if (ddbank.Items.FindByValue(dt.Rows[0]["bankname"].ToString()) != null)
            ddbank.SelectedValue = dt.Rows[0]["bankname"].ToString();
        hdstatus.Value = dt.Rows[0]["status"].ToString();
    }
    void loadbank()
    {
        ddbank.Items.Clear();
        DataTable dt = objbank.getBank();
        if (dt == null) return;
        ddbank.DataSource = dt;
        ddbank.DataTextField = "BankName";
        ddbank.DataValueField = "BankID";
        ddbank.DataBind();
        ListItem li = new ListItem("Select Bank", "0");
        ddbank.Items.Insert(0, li);
    }
    void loadcountry()
    {
        ddcountry.Items.Clear();
        DataTable dt = objState.getCountry();
        if (dt == null) return;
        ddcountry.DataSource = dt;
        ddcountry.DataTextField = "CountryName";
        ddcountry.DataValueField = "CountryID";
        ddcountry.DataBind();
        ListItem li = new ListItem("Select Country", "0");
        ddcountry.Items.Insert(0, li);
    }
    void loadstate()
    {
        ddstate.Items.Clear();
        objState.CountryId = ddcountry.SelectedValue.ToString();
        DataTable dt = objState.getState(objState);
        if (dt == null) return;
        ddstate.DataSource = dt;
        ddstate.DataTextField = "StateName";
        ddstate.DataValueField = "StateID";
        ddstate.DataBind();
        ListItem li = new ListItem("Select State", "0");
        ddstate.Items.Insert(0, li);
    }
    void loadcity()
    {
        ddcity.Items.Clear();
        objState.StateId = ddstate.SelectedValue.ToString();
        DataTable dt = objState.getCity(objState);
        if (dt == null) return;
        ddcity.DataSource = dt;
        ddcity.DataTextField = "CityName";
        ddcity.DataValueField = "CityID";
        ddcity.DataBind();
        ListItem li = new ListItem("Select City", "0");
        ddcity.Items.Insert(0, li);
    }


    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        objUser.UserId = Session["userid"].ToString();
        objUser.UserName = txtname.Text;
        objUser.Mobile = txtmobile.Text;
        objUser.Email = txtemail.Text;
        objUser.Gender = ddgender.SelectedValue.ToString();
        objUser.Address = txtaddress.Text;
        objUser.CityId = ddcity.SelectedValue.ToString();

        objUser.CountryId = ddcountry.SelectedValue.ToString();
        objUser.StateId = ddstate.SelectedValue.ToString();
        objUser.AreaName = txtareaname.Text;
        objUser.Pincode = txtpincode.Text;
        // objUser.DateOfBirth = Message.GetIndianDate(txtdateofbirth.Text);
        objUser.MentionBy = Session["userid"].ToString();
        objUser.NomineeName = txtnomineename.Text;
        objUser.NomineeRelation = txtnomineerelation.Text;
        objUser.AccHolderName = txtaccountholdername.Text;
        objUser.wallet = TxtWalletAdd.Text;
        objUser.wallettype = Txtwallettype.Text;
        objUser.AccNo = txtaccountno.Text;
        objUser.IFSCCode = txtifsccode.Text;
        objUser.PanCardNo = txtpan.Text;
        objUser.BankName = ddbank.SelectedValue.ToString();
        objUser.BranchName = txtbranchname.Text;

        objUser.EditStatus = hdstatus.Value.ToString() == "0" ? "1" : "0";

        string res = Update_UserProfile(objUser);
        if (res == "f")
        {
            string popupScript = "alert('User Not Found.');";
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), popupScript, true);
        }
        else
            if (res == "0")
            {
                string popupScript = "alert('Unknow error occurred');";
                ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), popupScript, true);
            }
            else
            {

                string popupScript = "alert('User Details Updated Successfully.');";
                ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), popupScript, true);
                //if (GetProfileEditStatus())
                //{
                //    div_update.Visible = true;
                //}
                //else
                //{
                //    div_update.Visible = false;
                //}

                
            }
    }
    public string Update_UserProfile(clsUser objUser)
    {
        string res = "";
        string s2 = "";
        SqlConnection cn;
        SqlTransaction tr = null;
        DataSet ds = new DataSet();
        cn = ObjData.StartConnectionInTransaction();
        tr = cn.BeginTransaction(IsolationLevel.Serializable);
        try
        {
            if (string.IsNullOrEmpty(objUser.UpdateType))
            {
                s2 = "update UserDetail  set IsEditable='" + objUser.EditStatus + "',username='" + objUser.UserName + "',walletaddress='" + objUser.wallet + "',wallettype='" + objUser.wallettype + "', email='" + objUser.Email + "',gender='" + objUser.Gender + "' ,mobile='" + objUser.Mobile + "', address='" + objUser.Address + "', cityid='" + objUser.CityId + "',areaName='" + objUser.AreaName + "' ,pincode='" + objUser.Pincode + "',AccountHolderName='" + objUser.AccHolderName + "',AccountNo='" + objUser.AccNo + "',IFSCCode='" + objUser.IFSCCode + "',BankName='" + objUser.BankName + "',BranchName='" + objUser.BranchName + "',PanNumber='" + objUser.PanCardNo + "',NomineeName='" + objUser.NomineeName + "',NomineeRelation='" + objUser.NomineeRelation + "'  where UserId='" + objUser.UserId + "'   ";
            }
            else
                if (objUser.UpdateType == "Bank")
                {
                    s2 = "update UserDetail  set IsBankEditable='" + objUser.EditStatus + "',username='" + objUser.UserName + "', walletaddress='" + objUser.wallet + "',wallettype='" + objUser.wallettype + "',email='" + objUser.Email + "',gender='" + objUser.Gender + "' ,mobile='" + objUser.Mobile + "', address='" + objUser.Address + "', cityid='" + objUser.CityId + "',areaName='" + objUser.AreaName + "' ,pincode='" + objUser.Pincode + "',AccountHolderName='" + objUser.AccHolderName + "',AccountNo='" + objUser.AccNo + "',IFSCCode='" + objUser.IFSCCode + "',BankName='" + objUser.BankName + "',BranchName='" + objUser.BranchName + "',PanNumber='" + objUser.PanCardNo + "',NomineeName='" + objUser.NomineeName + "',NomineeRelation='" + objUser.NomineeRelation + "'  where UserId='" + objUser.UserId + "'   ";
                }
            ObjData.RunInsUpDelQueryTrans(s2, tr);
            res = "t";
            tr.Commit();
        }
        catch (Exception ex)
        {
            res = "0";
            tr.Rollback();
        }
        finally
        {
            ObjData.EndConnection();
            tr.Dispose();
        }
        return res;
    }
    protected void ddcountry_SelectedIndexChanged(object sender, EventArgs e)
    {
        loadstate();
    }
    protected void ddstate_SelectedIndexChanged(object sender, EventArgs e)
    {
        loadcity();
    }

    void loadsusername()
    {
        objUser.UserId = txtsponserid.Text;
        DataTable dt = objUser.getUserName(objUser);
        if (dt != null && dt.Rows.Count > 0)
        {
            txtsponsername.Text = dt.Rows[0]["username"].ToString();
        }
        else
        {
            if (txtsponserid.Text == "0")
            {
                txtsponsername.Text = "Company";
                txtsponserid.Text = "0";
            }
            else
            {
                txtsponsername.Text = "";
                txtsponserid.Text = "";
                string popupScript = "alert('Invalid User Id');";
                ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), popupScript, true);
            }
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Dashboard.aspx");
    }

    DataTable GetUserDetail(string userId)
    {
        string str_query = "SELECT ud.*,cm.stateid,sm.countryid,sm.statename,CASE WHEN isnull(ud.PhotoImage,'')='' THEN 'img/default.png' ELSE '../ProductImage/'+ud.PhotoImage END AS PhotoImage,(select UserName from userdetail where UserId=ud.sponserid) as Sponsername,(select UserName from userdetail where UserId=ud.parentuserid) as parentname,convert(char,ud.activatedate,103) as activationdate,(select top 1 planamount from UserTopupTb where userid=ud.userid and type='A') planamount FROM userdetail ud left join citymaster cm on ud.cityid=cm.cityid left join statemaster sm on cm.stateid=sm.stateid where ud.UserId = '" + userId + "' ";
        DataTable dt = null;
        ObjData.StartConnection();
        try
        {
            dt = ObjData.RunDataTable(str_query);
        }
        catch
        {
            dt = null;
        }
        ObjData.EndConnection();
        return dt;
    }
}
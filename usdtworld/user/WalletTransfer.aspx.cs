using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

using System.Configuration;
using BusinessLogicTier;
using DataTier;
using ARA_StringHunt;

public partial class WalletTransfer : System.Web.UI.Page
{
    clsEPin objEPin = new clsEPin();
    clsUser objUser = new clsUser();
    clsAccount objaccount = new clsAccount();

    Data ObjData = new Data();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userid"] != null)
        {
            if (!IsPostBack)
            {
                if (Session["chktrans"] != null)
                {
                    txtuserid.Text = Session["userid"].ToString();

                    loadusername();
                    balance();
                    Session.Remove("chktrans");
                }
                else
                {
                    Session["pg"] = "wallettransfer";
                    Response.Redirect("TransactionPass.aspx");
                }
            }
        }
        else
        {
            Response.Redirect("index.aspx");
        }
    }
   
    
   
    void loadusername()
    {
        DataTable dt = new DataTable();
        objUser.UserId = txtuserid.Text;
        dt = objUser.getUserName(objUser);
        if (dt.Rows.Count > 0)
        {
            txtusername.Text = dt.Rows[0]["username"].ToString();
            
        }
        else
        {
            txtusername.Text = "";
            txtuserid.Text = "";
            
            Message.Show("Invalid User Id...!!!");
        }
    }
   
    void loadtransferusername()
    {
        DataTable dt = new DataTable();
        objUser.UserId = txttransferuserid.Text;
        dt = objUser.getUserName(objUser);
        if (dt.Rows.Count > 0)
        {
            txttransferusername.Text = dt.Rows[0]["username"].ToString();
        }
        else
        {
            txttransferusername.Text = "";
            txttransferuserid.Text = "";
            Message.Show("Invalid User Id...!!!");
        }
    }


    void insertvalues()
    {
        if(Session["totp"].ToString()==txtotp.Text)
        { 
        if (txtuserid.Text != "")
        {
            if (txttransferuserid.Text != "")
            {

                if (Convert.ToDecimal(txtbalance.Text) >= Convert.ToDecimal(TXtAmount.Text))
                {
                    objUser.UserId = txtuserid.Text;
                    objUser.TransferUserId = txttransferuserid.Text;
                    objUser.chargeAmount = Convert.ToDecimal(TXtAmount.Text);
                    objUser.MentionBy = Session["userid"].ToString();

                    decimal t = 0;
                    decimal f = Convert.ToDecimal(TXtAmount.Text);
                    t = f % 1;
                    if (t != 0)
                    {

                        Message.Show("Transfer Amount should be multiple of  1 $ ...!!!");
                        return;
                    }
                    string rs = objUser.Transferamountwallet(objUser);
                    if (rs == "t")
                    {
                        pnlotp.Visible = false;
                        btnotpsubmit.Visible = false;
                        btnSubmit.Visible = true;

                        clsUser cl = new clsUser();
                        cl.UserId = objUser.UserId;
                        DataTable from = cl.getUserName(cl);
                        string fmob = from.Rows[0]["mobile"].ToString();

                        cl.UserId = objUser.TransferUserId;
                        DataTable to = cl.getUserName(cl);
                        string tomob = from.Rows[0]["mobile"].ToString();

                        clsLogin objl = new clsLogin();

                        objl.SendsmsWalletTransfer("Dear User, Amont " + objUser.chargeAmount + " has been transferred to User " + objUser.TransferUserId, fmob);
                        objl.SendsmsWalletTransfer("Dear User, Amont " + objUser.chargeAmount + " has been transferred from User " + objUser.UserId, tomob);

                        Message.Show("wallet transfer Successfully...!!!");
                        txttransferuserid.Text = "";
                        txttransferusername.Text = "";
                        balance();
                        //txtuserid.Text = "";
                        // txtusername.Text = "";

                    }
                    else
                        if (rs == "f")
                    {
                        Message.Show("balance amount should be greater than transfer amount...!!!");
                    }
                    else
                            if (rs == "m")
                    {
                        Message.Show("both user should be paid user");
                    }
                    else
                    {
                        Message.Show("Unknown Error Occurred...!!!");
                    }

                }
                else
                {
                    Message.Show("balance amount should be greater than transfer amount...!!!");
                }
            }
            else
            {
                Message.Show("Enter transfer user id...!!!");
            }
        }
        else
        {
            Message.Show("Enter user id...!!!");
        }
        }
        else
        {
            Message.Show("Invalid OTP...!!!");
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (txtuserid.Text != "")
        {
            if (txttransferuserid.Text != "")
            {

                if (Convert.ToDecimal(txtbalance.Text) >= Convert.ToDecimal(TXtAmount.Text))
                {
                    var rand = new Random();
                    var uid = rand.Next(1000, 10000);

                    string str_otp = uid.ToString();
                    Session["totp"] = str_otp;
                    string str_url = "http://sms.shortmsgservice.com/sms-panel/api/http/index.php?username=usdtwallet&apikey=D65F1-900D2&apirequest=Text&sender=UPPDTE&mobile=" + Session["Mobile"].ToString() + "&message=Dear Member " + str_otp + " is the Otp For Wallet Transfer, usdwallet. sms&route=TRANS&TemplateID=1607100000000385070&format=JSON";
                    //string str_url = "http://sms.shortmsgservice.com/sms-panel/api/http/index.php?username=usdtwallet&apikey=D65F1-900D2&apirequest=Text&sender=UPPDTE&mobile=" + "7905329740" + "&message=Dear Member " + str_otp + " is the Otp For Wallet Transfer, usdwallet. sms&route=TRANS&TemplateID=1607100000000385070&format=JSON";

                    string res=   str_url.CallURL();
                    objUser.Insert_SendSMS(Session["mobile"].ToString(), res, str_url);
                    pnlotp.Visible = true;
                    btnotpsubmit.Visible = true;

                    btnSubmit.Visible = false;
                    Message.Show("OTP Sent To Your Registered Mobile No");
                }
                else
                {
                    Message.Show("balance amount should be greater than transfer amount...!!!");
                }
            }
            else
            {
                Message.Show("Enter transfer user id...!!!");
            }
        }
        else
        {
            Message.Show("Enter user id...!!!");
        }
    }

    void balance()
    {

        DataTable dtrechrge = getBalance();
      
            txtbalance.Text = dtrechrge.Rows[0]["utilitybalance"].ToString();
       



    }

    public DataTable getBalance()
    {
        string str_query = @"select balanceamount,utilitybalance  from userdetail with (nolock) where userid='" + Session["userid"].ToString() + "'";

        //  str_query += " order by sa.instno ";
        DataTable dt = null;
        ObjData.StartConnection();
        try
        {
            dt = ObjData.RunDataTable(str_query);
        }
        catch (Exception ex)
        {
            dt = null;
        }
        ObjData.EndConnection();
        return dt;
    }


    protected void txtuserid_TextChanged(object sender, EventArgs e)
    {
        loadusername();
    }
    protected void txttransferuserid_TextChanged(object sender, EventArgs e)
    {
        loadtransferusername();
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("dashboard.aspx");
    }
    protected void btnCancel_Click1(object sender, EventArgs e)
    {
        Response.Redirect("Dashboard.aspx");
    }


    protected void btnotpsubmit_Click(object sender, EventArgs e)
    {
        insertvalues();
    }
}
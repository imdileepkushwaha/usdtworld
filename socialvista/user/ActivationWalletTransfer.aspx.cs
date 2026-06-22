using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using DataTier;
using System.Data.SqlClient;
using System.Configuration;
using BusinessLogicTier;

public partial class WalletTransfer : System.Web.UI.Page
{
    Data ObjData = new Data();
    clsEPin objEPin = new clsEPin();
    clsUser objUser = new clsUser();
    clsAccount objaccount = new clsAccount();
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
                    Session["pg"] = "ActivationWalletTransfer";
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

    protected void btnSubmit_Click(object sender, EventArgs e)
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
                    string rs = Transferamountwallet(objUser);
                    if (rs == "t")
                    {
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


    public string Transferamountwallet(clsUser objUser)
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
            s2 = "sp_WalletTransferUserActivation";
            SqlParameter[] parameter = {              
                    new SqlParameter("@UserId",objUser.UserId), 
                    new SqlParameter("@TransferUserId",objUser.TransferUserId), 
                    new SqlParameter("@Amount",objUser.chargeAmount), 
                  
                };
            res = ObjData.RunInsUpDelQueryTransProcScalar(s2, tr, parameter);

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
    void balance()
    {
        objaccount.UserId = Session["userId"].ToString();
        
        DataTable dtrechrge = getUserWalletBalanceReportrechargewallet(objaccount);
        txtbalance.Text = dtrechrge.Rows[0]["bal"].ToString();

       

    }
    public DataTable getUserWalletBalanceReportrechargewallet(clsAccount objaccount)
    {
        string str_query = "select isnull( sum(cramount),0) as sumCr,isnull( sum(dramount),0) as sumdr,isnull( sum(cramount),0)-isnull( sum(dramount),0) as bal from TransactionDetail_dummy td where 1=1";

        if (objaccount.UserId != "")
        {
            str_query += "  and td.UserId = '" + objaccount.UserId + "' ";
        }

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
   
}
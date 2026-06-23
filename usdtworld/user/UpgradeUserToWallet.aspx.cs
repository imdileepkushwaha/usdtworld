﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataTier;
using System.Data;
using System.Data.SqlClient;
using BusinessLogicTier;
using System.IO;
using DataTier;


public partial class user_ActivateUserToWallet : System.Web.UI.Page
{
    Data ObjData = new Data();
    clsEPin objEPin = new clsEPin();
    clsUser objUser = new clsUser();
    clsplan objplan = new clsplan();
    clsAccount objaccount = new clsAccount();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userid"] != null)
        {
            if (!IsPostBack)
            {
                txtuserid.Text = Session["userid"].ToString();

                loadusername();
                loadplan();
              
               
            }
        }
        else
        {
            Response.Redirect("index.aspx");
        }
    }


    void loadplan()
    {
        ddplan.Items.Clear();
        DataTable dt = new DataTable();
        dt = getPlanAll();
        ddplan.DataSource = dt;
        ddplan.DataTextField = "planname";
        ddplan.DataValueField = "id";
        ddplan.DataBind();
        ListItem li = new ListItem("Select Plan", "0");
        ddplan.Items.Insert(0, li);
    }
    public DataTable getPlanAll()
    {
        //string str_query = "SELECT (Planname+'('+Rtrim(Convert(CHAR,Planamount))+')')AS [plan],Planamount FROM PlanMaster ";
        //str_query += " order by mentiondate  desc";

        string str_query = "SELECT id, Planname, Planamount FROM PlanMaster where topuptype='ReTopup'";
        //  str_query += " and PlanName Like 'Joining package%' ";

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
    //void loadAmountepin()
    //{
    //    DataTable dt = new DataTable();
    //    objEPin.GenerateUserId = txtuserid.Text;
    //    dt = objEPin.getEPinForUpgradation(objEPin);
    //    DDLstPlan.DataSource = dt;
    //    DDLstPlan.DataTextField = "plan";
    //    DDLstPlan.DataValueField = "Planamount";
    //    DDLstPlan.DataBind();
    //    ListItem li = new ListItem("Select Plan", "0");
    //    DDLstPlan.Items.Insert(0, li);
    //}

   
    void loadusername()
    {
        DataTable dt = new DataTable();
        objUser.UserId = txtuserid.Text;
        dt = objUser.getUserName(objUser);
        if (dt.Rows.Count > 0)
        {
            txtusername.Text = dt.Rows[0]["username"].ToString();

            objaccount.UserId = txtuserid.Text;
            DataTable dtbalnce = new DataTable();
            dtbalnce = objaccount.getAccountBalance(objaccount);
            if (dtbalnce.Rows.Count > 0)
            {
                txtbalance.Text = dtbalnce.Rows[0][0].ToString();
            }
            else
            {
                txtbalance.Text = "0.0";
            }

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
        if (txtamount.Text == string.Empty)
        {
            Message.Show("Please enter the amount !");
            return;
        }
        //if (Convert.ToDecimal(txtamount.Text) < 50)
        //{
        //    Message.Show("Minimum Amount Should be 50$ !");
        //    txtamount.Text = "";
        //    return;
        //}

        //if (Convert.ToDecimal(txtamount.Text) > 500)
        //{
        //    Message.Show("Maximum Amount Should be 500$ !");
        //    txtamount.Text = "";
        //    return;
        //}

        //decimal t = 0;
        //decimal f = Convert.ToDecimal(txtamount.Text);
        //t = f % 50;
        //if (t != 0)
        //{

        //    Message.Show("Activation Amount should be multiple of  50 $ ...!!!");
        //    return;
        //}
        if (txtuserid.Text != "")
        {
            if (ddplan.SelectedValue != "0" || ddplan.SelectedValue != "")
            {
                

                if (txttransferuserid.Text != "")
                {
                    if (Convert.ToDecimal(txtbalance.Text) >= Convert.ToDecimal(txtamount.Text))
                    {

                        objUser.UserId = Session["userid"].ToString();
                        objUser.TransferUserId = txttransferuserid.Text;
                        objUser.Amount = Convert.ToDecimal(txtamount.Text);
                        objUser.CallStatus = ddplan.SelectedValue.ToString();
                        string rs = objUser.UpgradeeUserWithWallet(objUser);
                        if (rs == "t")
                        {
                            loadusername();
                            Message.Show("record update Successfully...!!!");
                            txttransferuserid.Text = "";
                            txttransferusername.Text = "";
                            //txtuserid.Text = "";
                            // txtusername.Text = "";

                        }
                        else
                            if (rs == "f")
                        {
                            Message.Show("this User Id alredy activate...!!!");
                        }
                        else
                                if (rs == "n")
                        {
                            Message.Show("invalid plan amount...!!!");
                        }
                        else
                                    if (rs == "b")
                        {
                            Message.Show("Wallet Amount Insufficiant...!!!");
                        }
                        else
                                    if (rs == "a")
                        {
                            Message.Show("Prevoius Level Not Upgrade...!!!");
                        }


                        else
                        {
                            Message.Show("Unknown Error Occurred...!!!");
                        }
                    }
                    else
                    {
                        Message.Show("Wallet Amount Insufficiant...!!!");
                    }

                }
                else
                {
                    Message.Show("Enter Activate user id...!!!");
                }
            }
            else
            {
                Message.Show("Select plan!");
            }
        }
        else
        {
            Message.Show("Enter user id...!!!");
        }
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
    protected void ddplan_SelectedIndexChanged(object sender, EventArgs e)
    {
        loadamount();
    }
    void loadamount()
    {
        DataTable dt = new DataTable();
        objplan.id = ddplan.SelectedValue;
        dt = objplan.getPlan(objplan);
        if (dt.Rows.Count > 0)
        {
            txtamount.Text = dt.Rows[0]["planamount"].ToString();
            ViewState["min"] = dt.Rows[0]["planamount"].ToString();
            ViewState["max"] = dt.Rows[0]["productid"].ToString();
           // lblmssg.Text = "Enter Minimum " + ViewState["min"].ToString() + " Maximum " + ViewState["max"].ToString() + " Amount";
        }
        else
        {
            txtamount.Text = "";
           // lblmssg.Text = "";

        }
    }
    public bool IsDivisible(int x, int n)
    {
        return (x % n) == 0;
    }

    protected void txtamount_TextChanged(object sender, EventArgs e)
    {
        int y=0;
        if (int.TryParse(txtamount.Text,out y))
        {
            if (Convert.ToInt32(txtamount.Text) > 0)
            {
                if (IsDivisible(Convert.ToInt32(txtamount.Text), 5))
                {

                }
                else
                {
                    Message.Show("Amount Should be multiple of 5 $ !");
                    txtamount.Text = "";
                }
            }
            else
            {
                Message.Show("Amount Should be multiple of 5 $ !");
                txtamount.Text = "";
            }
        }
    }
}
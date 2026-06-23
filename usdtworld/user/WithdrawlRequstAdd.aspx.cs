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

public partial class user_WithdrawlRequstAdd : System.Web.UI.Page
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
                txtuserid.Text = Session["userid"].ToString();
                txtuserid.Enabled = false;
                loadsusername();
                loadnotification();
                RDBtnTRecharge.Checked = true;
            }
        }
        else
        {
            Response.Redirect("index.aspx");
        }
    }
    public string UploadImage()
    {
        string Imagename = "";
        if (ImageUpload.HasFile)
        {
            string RandomNumber = DateTime.Now.Ticks.ToString();
            string fileName = Path.GetFileName(ImageUpload.PostedFile.FileName);
            Imagename = RandomNumber + fileName;
            ImageUpload.PostedFile.SaveAs(Server.MapPath("~/ProductImage/") + Imagename);

        }
        return Imagename;
    }
    void loadnotification()
    {
        objUser.UserId = Session["userid"].ToString();
        DataTable dt = new DataTable();
        dt = objUser.getUserDetail(objUser);
        if (dt.Rows[0]["activestatus"].ToString() == "0")
        {
            Response.Redirect("Dashboard.aspx");
        }
    }
    protected void txtuserid_TextChanged(object sender, EventArgs e)
    {
        loadsusername();
    }
    void loadsusername()
    {
        DataTable dt = new DataTable();
        objUser.UserId = txtuserid.Text;
        dt = objUser.getUserName(objUser);
        if (dt.Rows.Count > 0)
        {
            txtusername.Text = dt.Rows[0]["username"].ToString();
            objaccount.UserId = txtuserid.Text;
            DataTable dtrechrge = getUserWalletBalanceReportrechargewallet(objaccount);

            if (dtrechrge.Rows.Count > 0)
            {
                txtbalance.Text = dtrechrge.Rows[0]["bal"].ToString();
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


    public DataTable getUserWalletBalanceReportrechargewallet(clsAccount objaccount)
    {
        string str_query = "select isnull( sum(cramount),0) as sumCr,isnull( sum(dramount),0) as sumdr,isnull( sum(cramount),0)-isnull( sum(dramount),0) as bal from TransactionDetail td where 1=1";

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
   

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (txtuserid.Text != "")
        {
            if (txtusername.Text != "")
            {
                if (txtamount.Text != "")
                {
                    if (Convert.ToDecimal(txtbalance.Text) >= Convert.ToDecimal(txtamount.Text))
                    {
                        //  if (Convert.ToDecimal(txtamount.Text) >= 6.25M)
                        //  {
                        objaccount.img = UploadImage();
                        objaccount.WithdrawlAmount = Convert.ToDecimal(txtamount.Text.Trim());
                        objaccount.MentionBy = Session["userid"].ToString();
                        objaccount.UserId = Session["userid"].ToString();
                       

                        if (RDBtnTRecharge.Checked == true)
                        {
                            objaccount.DepositrequestRequestType = "R";
                        }
                        else
                        {
                            objaccount.DepositrequestRequestType = "U";
                        }

                        //decimal t = 0;
                        //decimal f = Convert.ToDecimal(txtamount.Text);
                        //t = f % 10;
                        //if (t != 0)
                        //{

                        //    Message.Show("Withdrwal Amount should be multiple of  10 $ ...!!!");
                        //    return;
                        //}
                        DataTable rs = objaccount.Insert_WithdrawlRequestDt(objaccount);
                        if (rs != null)
                        {

                            // Message.Show("Withdrawal Request Successfully...!!!");
                            Message.Show(rs.Rows[0][0].ToString());
                            loadsusername();
                        }
                        else
                        {
                            Message.Show("Unknown Error Occurred...!!!");
                        }


                        //  }
                        //  else
                        //  {
                        ///      Message.Show("Withdrwal Amount Must Be multiple of 10$...!!!");
                        //  }
                    }
                    else
                    {
                        Message.Show("Withdrawl Amount Must Be Lesss Than Or Equal Than Account Balance...!!!");
                    }
                }
                else
                {
                    Message.Show("Enter Amount...!!!");
                }
            }
            else
            {
                Message.Show("Enter User Name...!!!");
            }
        }
        else
        {
            Message.Show("Enter User Id...!!!");
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Dashboard.aspx");
    }
   
    protected void RDBtnTRecharge_CheckedChanged(object sender, EventArgs e)
    {
        balance();

    }
    protected void RdBtnUtility_CheckedChanged(object sender, EventArgs e)
    {
        balance();
    }
    void balance()
    {
        objaccount.UserId = Session["userId"].ToString();
        if (RDBtnTRecharge.Checked == true)
        {
            DataTable dtrechrge = objaccount.getUserWalletBalanceReportrechargewallet(objaccount);
            txtbalance.Text = dtrechrge.Rows[0]["bal"].ToString();

        }
        if (RdBtnUtility.Checked == true)
        {
            DataTable dtuility = objaccount.getUserWalletBalanceReportrechargeuntility(objaccount);
            txtbalance.Text = dtuility.Rows[0]["bal"].ToString();
        }

    }
}
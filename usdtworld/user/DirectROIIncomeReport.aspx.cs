using BusinessLogicTier;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using DataTier;

using System.Web.UI;
using System.Web.UI.WebControls;
public partial class LevelROIIncomeReport : System.Web.UI.Page
{
    Data ObjData = new Data();
    clsAccount objaccount = new clsAccount();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["userid"] != null)
            {
                txtuserid.Text = Session["userid"].ToString();
                txtuserid.Enabled = false;
            }
            else
            {
                Response.Redirect("logout.aspx");
            }
        }
    }


    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {

    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        loaduser();
    }
    void loaduser()
    {

        if (txtfromdate.Text != "")
        {
            objaccount.FromDate = Message.GetIndianDate(txtfromdate.Text);
        }
        else
        {
            objaccount.FromDate = DateTime.MinValue;
        }
        if (txttodate.Text != "")
        {
            objaccount.ToDate = Message.GetIndianDate(txttodate.Text);
        }
        else
        {
            objaccount.ToDate = DateTime.MinValue;
        }
        objaccount.UserId = txtuserid.Text;
        DataTable dt = new DataTable();
        dt = getLevelRoiIncome(objaccount);
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }


    public DataTable getLevelRoiIncome(clsAccount objaccount)
    {
        string str_query = "SELECT I.Userid,U.UserName,I.amount,Convert(VARCHAR(50),I.Mentiondate,103) PaymentDate,I.MentionBy AS fromuserid,ud3.UserName AS Fromusername FROM roidetail I JOIN UserDetail U ON I.Userid=U.UserId  JOIN userdetail ud3 ON ud3.UserId=I.MentionBy   where 1=1 AND ROIType='DirectROI' ";


        if (objaccount.FromDate != DateTime.MinValue && objaccount.ToDate != DateTime.MinValue)
        {
            str_query += "  and cast(I.Mentiondate as date)  >= cast('" + objaccount.FromDate + "' as date)   and cast(I.Mentiondate as date)   <= cast('" + objaccount.ToDate + "' as date) ";
        }


        if (objaccount.UserId != "")
        {
            str_query += "  and I.UserId = '" + objaccount.UserId + "' ";
        }


        str_query += " order by PaymentDate  desc";



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
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Dashboard.aspx");
    }
}
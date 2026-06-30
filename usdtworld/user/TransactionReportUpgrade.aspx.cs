using BusinessLogicTier;
using DataTier;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
public partial class admin_UserReport : System.Web.UI.Page
{
    clsAccount objaccount = new clsAccount();

    Data ObjData = new Data();
    private DataTable TransactionData
    {
        get { return ViewState["TransactionData"] as DataTable; }
        set { ViewState["TransactionData"] = value; }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["userid"] != null)
            {
                txtuserid.Text = Session["userid"].ToString();
                txtuserid.Enabled = false;
                ddlRecordFilter.SelectedValue = "25";
                loaduser();
                balance();
            }
            else
            {
                Response.Redirect("logout.aspx");
            }
        }
    }

    void balance()
    {
        objaccount.UserId = Session["userId"].ToString();
        objaccount.userType = "1";
        DataTable dt = new DataTable();
        dt = objaccount.getUserWalletBalanceReportrechargewallet(objaccount);
        if (dt.Rows.Count > 0)
        {
            LblCredited.Text = dt.Rows[0]["sumCr"].ToString();
            LblDebited.Text = dt.Rows[0]["sumdr"].ToString();
            LblCurrentWallet.Text = dt.Rows[0]["bal"].ToString();
        }


    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {

    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        BindGrid(e.NewPageIndex);
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        loaduser();
    }

    void ApplyPageSize()
    {
        string selected = ddlRecordFilter.SelectedItem.Text;

        if (selected == "All")
        {
            GridView1.AllowPaging = false;
            return;
        }

        int pageSize;
        if (int.TryParse(selected, out pageSize) && pageSize > 0)
        {
            GridView1.AllowPaging = true;
            GridView1.PageSize = pageSize;
        }
    }

    void BindGrid(int pageIndex)
    {
        DataTable dt = TransactionData;
        if (dt == null)
        {
            GridView1.DataSource = null;
            GridView1.DataBind();
            UpdatePagerInfo();
            return;
        }

        if (GridView1.AllowPaging)
        {
            int maxPage = (int)Math.Ceiling(dt.Rows.Count / (double)GridView1.PageSize);
            if (maxPage == 0) maxPage = 1;
            if (pageIndex >= maxPage) pageIndex = maxPage - 1;
            if (pageIndex < 0) pageIndex = 0;
            GridView1.PageIndex = pageIndex;
        }
        else
        {
            GridView1.PageIndex = 0;
        }

        GridView1.DataSource = dt;
        GridView1.DataBind();
        UpdatePagerInfo();
    }

    void UpdatePagerInfo()
    {
        DataTable dt = TransactionData;
        if (dt == null || dt.Rows.Count == 0)
        {
            lblPagerInfo.Text = "No transactions found.";
            return;
        }

        int total = dt.Rows.Count;

        if (!GridView1.AllowPaging)
        {
            lblPagerInfo.Text = "Showing all " + total + " records";
            return;
        }

        int start = (GridView1.PageIndex * GridView1.PageSize) + 1;
        int end = Math.Min((GridView1.PageIndex + 1) * GridView1.PageSize, total);
        int totalPages = GridView1.PageCount;

        lblPagerInfo.Text = string.Format(
            "Showing {0}–{1} of {2} records | Page {3} of {4}",
            start, end, total, GridView1.PageIndex + 1, totalPages);
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

        objaccount.NoOfRow = "";
        objaccount.UserId = txtuserid.Text;
        DataTable dt = new DataTable();
        dt = getTransactionReport(objaccount);
        TransactionData = dt;
        ApplyPageSize();
        BindGrid(0);
    }

    public DataTable getTransactionReport(clsAccount objaccount)
    {
        string str_query = "select " + objaccount.NoOfRow + " * from TransactionDetailUpgrade where   1=1 ";


        if (objaccount.FromDate != DateTime.MinValue && objaccount.ToDate != DateTime.MinValue)
        {
            str_query += "  and cast(mentiondate as date)  >= '" + objaccount.FromDate + "'   and cast(mentiondate as date)   <= '" + objaccount.ToDate + "' ";
        }


        if (objaccount.UserId != "")
        {
            str_query += "  and UserId = '" + objaccount.UserId + "' ";
        }


        str_query += " order by mentiondate  desc";




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

    public override void VerifyRenderingInServerForm(Control control)
    {
        //required to avoid the run time error "  
        //Control 'GridView1' of type 'Grid View' must be placed inside a form tag with runat=server."  
    }

    protected void ExportGridToExcel()
    {
        Response.Clear();
        Response.Buffer = true;
        Response.ClearContent();
        Response.ClearHeaders();
        Response.Charset = "";
        string FileName = "TransactionReport_" + DateTime.Now + ".xls";
        System.IO.StringWriter strwritter = new System.IO.StringWriter();
        HtmlTextWriter htmltextwrtter = new HtmlTextWriter(strwritter);
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.ContentType = "application/vnd.ms-excel";
        Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);
        GridView1.HeaderStyle.BackColor = System.Drawing.Color.AliceBlue;
        GridView1.GridLines = GridLines.Both;
        GridView1.HeaderStyle.Font.Bold = true;
        GridView1.RenderControl(htmltextwrtter);
        Response.Write(strwritter.ToString());
        Response.End();

    }

    protected void imgExcel_Click(object sender, ImageClickEventArgs e)
    {
        if (TransactionData == null)
        {
            loaduser();
        }

        int savedPageIndex = GridView1.PageIndex;
        bool savedPaging = GridView1.AllowPaging;

        GridView1.AllowPaging = false;
        GridView1.DataSource = TransactionData;
        GridView1.DataBind();

        ExportGridToExcel();

        GridView1.AllowPaging = savedPaging;
        BindGrid(savedPageIndex);
    }
    protected void ddlRecordFilter_SelectedIndexChanged(object sender, EventArgs e)
    {
        ApplyPageSize();
        BindGrid(0);
    }
}

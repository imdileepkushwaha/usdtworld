using BusinessLogicTier;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using DataTier;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;

using System.Web.UI.WebControls;

public partial class admin_DownlineReport : System.Web.UI.Page
{
    Data ObjData = new Data();
    clsState objState = new clsState();
    clsUser objUser = new clsUser();

    private DataTable DownlineData
    {
        get { return ViewState["DownlineData"] as DataTable; }
        set { ViewState["DownlineData"] = value; }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["userid"] != null)
            {

                TxtUserId.Text = Session["userid"].ToString();
                TxtUserId.Enabled = false;
            }
            else
            {
                Response.Redirect("logout.aspx");
            }
        }
    }
    void loaduser()
    {
        objUser.UserId = TxtUserId.Text;
        DataTable dt = getUserDirectLeft(objUser);
        DownlineData = dt;
        BindGrid(0);
    }

    void BindGrid(int pageIndex)
    {
        DataTable dt = DownlineData;
        if (dt == null)
        {
            GridView1.DataSource = null;
            GridView1.DataBind();
            UpdatePagerInfo();
            return;
        }

        int maxPage = (int)Math.Ceiling(dt.Rows.Count / (double)GridView1.PageSize);
        if (maxPage == 0) maxPage = 1;
        if (pageIndex >= maxPage) pageIndex = maxPage - 1;
        if (pageIndex < 0) pageIndex = 0;
        GridView1.PageIndex = pageIndex;

        GridView1.DataSource = dt;
        GridView1.DataBind();
        UpdatePagerInfo();
    }

    void UpdatePagerInfo()
    {
        DataTable dt = DownlineData;
        if (dt == null || dt.Rows.Count == 0)
        {
            lblPagerInfo.Text = "No downline members found.";
            return;
        }

        int total = dt.Rows.Count;
        int start = (GridView1.PageIndex * GridView1.PageSize) + 1;
        int end = Math.Min((GridView1.PageIndex + 1) * GridView1.PageSize, total);
        int totalPages = GridView1.PageCount;

        lblPagerInfo.Text = string.Format(
            "Showing {0}–{1} of {2} records | Page {3} of {4}",
            start, end, total, GridView1.PageIndex + 1, totalPages);
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        BindGrid(e.NewPageIndex);
    }

    public DataTable getUserDownline(clsUser objUser)
    {
        string str_query = "";

        str_query = @"; WITH MyCTE
AS ( SELECT id,userid,username,   sponserid,1 AS userlevel
FROM userdetail
WHERE UserId ='" + objUser.UserId + @"'
UNION ALL
SELECT UserDetail.id,userdetail.userid,userdetail.username,  userdetail.sponserid ,MyCTE.userlevel+1 
FROM userdetail
INNER JOIN MyCTE ON userdetail.sponserid = MyCTE.userid
WHERE userdetail.userid !='" + objUser.UserId + @"' )
SELECT MyCTE.*,ud.username as parentname
FROM MyCTE left join userdetail ud on mycte.sponserid=ud.userid ";



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

    public DataTable getUserDirectLeft(clsUser objUser)
    {
        //string str_query = "";
        //            string str_query = @"DECLARE @child NVARCHAR(100)
        //
        //SELECT @child=userid FROM UserDetail WHERE ParentUserId='" + objUser.UserId + @"' AND StandingPosition='1'
        //; WITH MyCTE
        //AS ( SELECT id,userid,username,ParentUserId,Case when isnull(Status,0)=1 then 'active' else 'deactive' end as Status,1 AS userlevel
        //FROM userdetail
        //WHERE UserId =@child
        //UNION ALL
        //SELECT UserDetail.id,userdetail.userid,userdetail.username,  userdetail.ParentUserId ,Case when isnull(UserDetail.Status,0)=1 then 'active' else 'deactive' end as Status,MyCTE.userlevel+1 
        //FROM userdetail
        //INNER JOIN MyCTE ON userdetail.parentuserid = MyCTE.userid
        //WHERE userdetail.userid !=@child )
        //SELECT MyCTE.*,ud.username as parentname
        //FROM MyCTE left join userdetail ud on mycte.parentuserid=ud.userid ";



        //            DataTable dt = null;
        //            ObjData.StartConnection();
        //            try
        //            {
        //                dt = ObjData.RunDataTable(str_query);
        //            }
        //            catch (Exception ex)
        //            {
        //                dt = null;
        //            }
        //            ObjData.EndConnection();
        //            return dt;

        SqlParameter[] para ={
                                     new SqlParameter ("@UserId",objUser.UserId),

                                     };
        DataSet ds = DBHelper.ExecuteQuery("GetDownlineStandingWiseLeft", para);

        DataTable dt = ds.Tables[0];

        return dt;
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        loaduser();
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Dashboard.aspx");
    }
    protected void ExportToExcel(object sender, EventArgs e)
    {
        if (DownlineData == null)
        {
            loaduser();
        }

        if (DownlineData == null || DownlineData.Rows.Count == 0)
            return;

        int savedPageIndex = GridView1.PageIndex;
        bool savedPaging = GridView1.AllowPaging;

        GridView1.AllowPaging = false;
        GridView1.DataSource = DownlineData;
        GridView1.DataBind();

        Response.Clear();
        Response.Buffer = true;
        Response.AddHeader("content-disposition", "attachment;filename=DownlineReport.xls");
        Response.Charset = "";
        Response.ContentType = "application/vnd.ms-excel";
        using (StringWriter sw = new StringWriter())
        {
            HtmlTextWriter hw = new HtmlTextWriter(sw);

            GridView1.HeaderRow.BackColor = Color.White;
            foreach (TableCell cell in GridView1.HeaderRow.Cells)
            {
                cell.BackColor = GridView1.HeaderStyle.BackColor;
            }
            foreach (GridViewRow row in GridView1.Rows)
            {
                row.BackColor = Color.White;
                foreach (TableCell cell in row.Cells)
                {
                    if (row.RowIndex % 2 == 0)
                    {
                        cell.BackColor = GridView1.AlternatingRowStyle.BackColor;
                    }
                    else
                    {
                        cell.BackColor = GridView1.RowStyle.BackColor;
                    }
                    cell.CssClass = "textmode";
                }
            }

            GridView1.RenderControl(hw);

            string style = @"<style> .textmode { } </style>";
            Response.Write(style);
            Response.Output.Write(sw.ToString());
            Response.Flush();
            Response.End();
        }

        GridView1.AllowPaging = savedPaging;
        BindGrid(savedPageIndex);
    }

    public override void VerifyRenderingInServerForm(Control control)
    {
        /* Verifies that the control is rendered */
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "myteam")
        {
            int index = Convert.ToInt32(e.CommandArgument.ToString());
            Label lbluserid = (Label)GridView1.Rows[index].FindControl("lbluserid");
            objUser.UserId = lbluserid.Text;
            DataTable dt = new DataTable();
            dt = getUserDirectLeft(objUser);
            GridView2.DataSource = dt;
            GridView2.DataBind();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "showModal();", true);
        }
    }
}
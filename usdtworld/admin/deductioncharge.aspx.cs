using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using BusinessLogicTier;

public partial class deductioncharge : System.Web.UI.Page
{
    clsAccount objaccount = new clsAccount();
    clsDownload objD = new clsDownload();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["useradmin"] != null)
        {
            if (!IsPostBack)
            {
                loaddata();
            }
        }
        else
        {
            Response.Redirect("logout.aspx");
        }
    }
    void loaddata()
    {
        DataTable dt = objD.Deductioncommission();
        if (dt == null || dt.Rows.Count == 0)
            return;

        DataRow row = dt.Rows[0];
        lblid.Text = row["id"].ToString();
        txtAdminCharge.Text = row["admincharge"].ToString();
        txtTdswithpan.Text = row["tdswithpan"].ToString();
        txtTdswithoutpan.Text = row["tdswithoutpan"].ToString();
        txtCashWallet.Text = row["CashWallet"].ToString();
        txtCashWalletPercent.Text = row["CashWalletPercent"].ToString();
        txtCappingAmount.Text = row["CappingAmount"].ToString();
        txtMinAmt.Text = row["MinDepositAmount"].ToString();
        txtMaxAmt.Text = row["MaxDepositAmount"].ToString();
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        objaccount.Updatedeductioncommission(
            lblid.Text,
            txtAdminCharge.Text,
            txtTdswithpan.Text,
            txtTdswithoutpan.Text,
            txtCashWallet.Text,
            txtCashWalletPercent.Text,
            txtCappingAmount.Text,
            txtMinAmt.Text,
            txtMaxAmt.Text);

        string popupScript = "alert('Data Updated Successfully');";
        ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), Guid.NewGuid().ToString(), popupScript, true);
    }
}

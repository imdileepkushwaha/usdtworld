using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["useradmin"] == null)
        {
            Response.Redirect("index.aspx");
            return;
        }

        if (!IsPostBack)
        {
            string adminName = Session["useradmin"].ToString();
            LblUsernameSideMenu.Text = adminName;
            LblMainId.Text = adminName;
            litAdminWelcome.Text = adminName;
        }
    }
}

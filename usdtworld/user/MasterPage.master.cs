using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userid"] != null)
        {
            string userId = Session["userid"].ToString();
            string userName = Session["username"] != null ? Session["username"].ToString() : userId;
            litUserDisplay.Text = userName;
            litUserName.Text = userName;
            litUserId.Text = userId;

            String UserImage = Session["UserImage"].ToString();
            string imagePath;
            if (UserImage.ToString() != "")
            {
                imagePath = "~/ProductImage/" + UserImage.ToString();
            }
            else
            {
                imagePath = "~/ProductImage/636549111447865966default.png";
            }
            dvUserImage3.Src = imagePath;
            dvUserImage4.Src = imagePath;

            if (Session["status"].ToString() == "1")
            {
                // JoinPackage.Visible = false;
               // limyteam.Visible = true;
                // transfertowallet.Visible = false;
            }
            else
            {
               // limyteam.Visible = true;
                //  transfertowallet.Visible = true; 
            }
        }
        else
        {
            Response.Redirect("logout.aspx");
        }

    }
}

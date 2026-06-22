using BusinessLogicTier;
using DataTier;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ARA_StringHunt;
using System.Net;
using System.Net.Mail;
using System.Net.Mime;
using System.IO;



public partial class Contact : System.Web.UI.Page
{
    clsState objState = new clsState();
    clsUser objUser = new clsUser();
    clsEPin objepin = new clsEPin();
    Clsmail objmail = new Clsmail();
    Data ObjData = new Data();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (txtname.Text == "")
        {
            string popupScript = "alert('Enter your Name');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), Guid.NewGuid().ToString(), popupScript, true);
            return;
        }

        if (TxtEmail.Text == "")
        {
            string popupScript = "alert('Enter Email');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), Guid.NewGuid().ToString(), popupScript, true);
            return;
        }

        if (TxtTitle.Text == "")
        {
            string popupScript = "alert('Enter Title');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), Guid.NewGuid().ToString(), popupScript, true);
            return;
        }







        userMail(txtname.Text, TxtTitle.Text, TxtDescription.Text, TxtEmail.Text, TxtMobileNo.Text);

        //  smssending(number, username, userid, password);
        Message.Show("thank you for contact us, We will get back to you !");
        //  Response.Redirect("contact.aspx");



    }


    public bool userMail(string username, string title, string description, string useremail, string mobile)
    {

        MailMessage mail = new MailMessage();
        //
        string Subject2 = "Welcome to Prime India";
        string Body2 = "Dear " + username + ",<br><br> Welcome to Prime India Thank you for choosing us. <br><br>Title :-" + title + " <br> Your mobile :-" + mobile + "<br> <br> Your email :-" + useremail + "<br> <br> Your Query :-" + description + "<br><br> You can logged in your account from here: <br><br> <button style=' appearance: none; -webkit-appearance: none; font-family: sans-serif; cursor: pointer; padding: 12px; min-width: 100px; border: 0px; -webkit-transition: background-color 100ms linear; -ms-transition: background-color 100ms linear; transition: background-color 100ms linear;  outline: 0; border-radius: 8px;   background: #3498db; color: #ffffff;  background: #2980b9; color: #ffffff;'><a style='color:white' href='https://primeindia.live/user/index.aspx'>Login</a></button><br><br>  For more details please checkout our website www.primeindia.live <br><br>If you need any help, you can email us at info@primeindia.live<br><br>Sincerely,<br>Prime India & Team";
        //


        ContentType mimeType = new System.Net.Mime.ContentType("text/html");
        string body = HttpUtility.HtmlDecode(Body2);
        AlternateView alternate = AlternateView.CreateAlternateViewFromString(body, mimeType);
        mail.AlternateViews.Add(alternate);

        mail.To.Add(useremail);
        mail.From = new MailAddress("indiaprime643@gmail.com");
        mail.Subject = Subject2;
        mail.Body = Body2;
        mail.IsBodyHtml = true;
        SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
        smtp.EnableSsl = true;
        smtp.UseDefaultCredentials = false;
        smtp.Credentials = new System.Net.NetworkCredential("indiaprime643@gmail.com", "ncnaheiretzitupj");


        try
        {
            smtp.Send(mail);
            return true;
        }
        catch (Exception ex)
        {
            return false;
        }

    }

    //public string smssending(string number, string username, string userid, string password)
    //{
    //    string txtnumber = number;
    //    string txtmessage = "Dear " + username + ",Thank you for choosing  SANDHYA INFO SOLUTION. Please use the following data to login. Your User id :- " + userid + "and Your password :- " + password + ". For login please visit 'https://GOOGLE.COM/'";
    //    //txtmessage = txtmessage.Replace("#", "%23").Replace(":", "%3A").Replace(",", "%2C").Replace(" ", "%20");


    //    string strurl = "http://chatway.in/api/" + txtnumber + "&message=" + txtmessage + "&";

    //  //string strurl = "http://chatway.in/api/send-msg?username=SG686869&number=" + txtnumber + "&message=" + txtmessage + "&token=TDlua0RhVlZQOFhMTGlOSFU3bG5GQT09";
    //    //string strurl = "http://chatway.in/api/send-file?username=SG686869&number=" + txtnumber + "&message=" + txtmessage + "&token=TDlua0RhVlZQOFhMTGlOSFU3bG5GQT09&file_url=&file_name=";

    //    string result = apicall(strurl);

    //    return result;
    //}

    public string apicall(string url)
    {
        HttpWebRequest httpreq = (HttpWebRequest)WebRequest.Create(url);
        try
        {
            HttpWebResponse httpres = (HttpWebResponse)httpreq.GetResponse();
            StreamReader sr = new StreamReader(httpres.GetResponseStream());
            string results = sr.ReadToEnd();
            sr.Close();
            return results;
        }
        catch
        {
            return "0";
        }
    }




}
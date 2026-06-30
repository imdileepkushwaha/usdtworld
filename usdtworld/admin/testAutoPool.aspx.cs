using BusinessLogicTier;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
public partial class User_test : System.Web.UI.Page
{
    clsUser objUser = new clsUser();
    protected void Page_Load(object sender, EventArgs e)
    {
       loadbinary(Request.QueryString["SuperId"].ToString(),Request.QueryString["poolno"].ToString());
    }

    DataTable getleftdata(string str_id)
    {
        DataTable dt = new DataTable();
        //objUser.UserId = str_id;
        //dt = objUser.getLeftDataPlanWise2(objUser);
        return dt;
    }


    DataTable getRightdata(string str_id)
    {
        DataTable dt = new DataTable();
        //objUser.UserId = str_id;
        //dt = objUser.getRightDataPlanWise2(objUser);
        return dt;
    }

    void loadbinary(string str_superid,string str_poolno)
    {
        objUser.UserId = str_superid;
        objUser.PoolNo = str_poolno;
        DataTable dt = new DataTable();
        dt = objUser.getUserNameAutoPool(objUser);
        if (dt.Rows.Count > 0)
        {
            //divdata.Visible = true;
            lbluserid1.Text = @"<a href='testAutoPool.aspx?SuperId=" + dt.Rows[0]["Userid"].ToString() + @"' >" + dt.Rows[0]["Userid"].ToString() + @"</a>";
            lbluseridnew1.Text = dt.Rows[0]["Userid"].ToString();
            lblusername1.Text = @"<a href='testAutoPool.aspx?SuperId=" + dt.Rows[0]["Userid"].ToString() + @"' >" + dt.Rows[0]["username"].ToString() + @"</a>";
            if (dt.Rows[0]["activestatus"].ToString() == "1")
            {
                ltuser1.Text = @"<a href='testAutoPool.aspx?SuperId=" + dt.Rows[0]["Userid"].ToString() + @"'  data-html=""true""   class='showpopover'  data-content=""" + getBinarydata(dt.Rows[0]["Userid"].ToString()) + @""" rel=""popover"" data-placement=""bottom"" data-original-title=""Binary Details"" data-trigger=""hover""  ><img src=""img/5.png"" style=""height:70px;"" /></a>";
         
            }
            else
            {
                ltuser1.Text = @"<a href='testAutoPool.aspx?SuperId=" + dt.Rows[0]["Userid"].ToString() + @"'  data-html=""true""   class='showpopover'  data-content=""" + getBinarydata(dt.Rows[0]["Userid"].ToString()) + @""" rel=""popover"" data-placement=""bottom"" data-original-title=""Binary Details"" data-trigger=""hover""  ><img src=""img/2.png"" style=""height:70px;"" /></a>";
            }
          
            //================ Second Child============
            DataTable dt2 = new DataTable();
            dt2 = loadchild(lbluseridnew1.Text, "1");
            if (dt2.Rows.Count > 0)
            {
                lbluserid2.Text = @"<a href='testAutoPool.aspx?SuperId=" + dt2.Rows[0]["Userid"].ToString() + @"' >" + dt2.Rows[0]["Userid"].ToString() + @"</a>";
                lbluseridnew2.Text = dt2.Rows[0]["Userid"].ToString();
                lblusername2.Text = @"<a href='testAutoPool.aspx?SuperId=" + dt2.Rows[0]["Userid"].ToString() + @"' >" + dt2.Rows[0]["username"].ToString() + @"</a>";
                if (dt2.Rows[0]["activestatus"].ToString() == "1")
                {
                    ltuser2.Text = @"<a href='testAutoPool.aspx?SuperId=" + dt2.Rows[0]["Userid"].ToString() + @"'  data-html=""true""   class='showpopover'  data-content=""" + getBinarydata(dt2.Rows[0]["Userid"].ToString()) + @""" rel=""popover"" data-placement=""bottom"" data-original-title=""Binary Details"" data-trigger=""hover""  ><img src=""img/5.png"" style=""height:70px;"" /></a>";
                }
                else
                {
                    ltuser2.Text = @"<a href='testAutoPool.aspx?SuperId=" + dt2.Rows[0]["Userid"].ToString() + @"'  data-html=""true""   class='showpopover'  data-content=""" + getBinarydata(dt2.Rows[0]["Userid"].ToString()) + @""" rel=""popover"" data-placement=""bottom"" data-original-title=""Binary Details"" data-trigger=""hover""  ><img src=""img/2.png"" style=""height:70px;"" /></a>";
                }
               
            }
            else
            {
                ltuser2.Text = @"<img src=""img/0.png"" style=""height:70px;"" />";
            }
            //================ Second Child============


            //================ Third Child============

            DataTable dt3 = new DataTable();
            dt3 = loadchild(lbluseridnew1.Text, "2");
            if (dt3.Rows.Count > 0)
            {
                lbluserid3.Text = @"<a href='testAutoPool.aspx?SuperId=" + dt3.Rows[0]["Userid"].ToString() + @"' >" + dt3.Rows[0]["Userid"].ToString() + @"</a>";
                lbluseridnew3.Text = dt3.Rows[0]["Userid"].ToString();
                lblusername3.Text = @"<a href='testAutoPool.aspx?SuperId=" + dt3.Rows[0]["Userid"].ToString() + @"' >" + dt3.Rows[0]["username"].ToString() + @"</a>";
                if (dt3.Rows[0]["activestatus"].ToString() == "1")
                {
                    ltuser3.Text = @"<a href='testAutoPool.aspx?SuperId=" + dt3.Rows[0]["Userid"].ToString() + @"'  data-html=""true""   class='showpopover'  data-content=""" + getBinarydata(dt3.Rows[0]["Userid"].ToString()) + @""" rel=""popover"" data-placement=""bottom"" data-original-title=""Binary Details"" data-trigger=""hover""  ><img src=""img/5.png"" style=""height:70px;"" /></a>";
                }
                else
                {
                    ltuser3.Text = @"<a href='testAutoPool.aspx?SuperId=" + dt3.Rows[0]["Userid"].ToString() + @"'  data-html=""true""   class='showpopover'  data-content=""" + getBinarydata(dt3.Rows[0]["Userid"].ToString()) + @""" rel=""popover"" data-placement=""bottom"" data-original-title=""Binary Details"" data-trigger=""hover""  ><img src=""img/2.png"" style=""height:70px;"" /></a>";
                }
               

            }
            else
            {
                ltuser3.Text = @"<img src=""img/0.png"" style=""height:70px;"" />";
            }


            //================ Third Child============

            //================ Fourth Child============

            DataTable dt4 = new DataTable();
            dt4 = loadchild(lbluseridnew2.Text, "1");
            if (dt4.Rows.Count > 0)
            {
                lbluserid4.Text = @"<a href='testAutoPool.aspx?SuperId=" + dt4.Rows[0]["Userid"].ToString() + @"' >" + dt4.Rows[0]["Userid"].ToString() + @"</a>";
                lbluseridnew4.Text = dt4.Rows[0]["Userid"].ToString();
                lblusername4.Text = @"<a href='testAutoPool.aspx?SuperId=" + dt4.Rows[0]["Userid"].ToString() + @"' >" + dt4.Rows[0]["username"].ToString() + @"</a>";
                if (dt4.Rows[0]["activestatus"].ToString() == "1")
                {
                    ltuser4.Text = @"<a href='testAutoPool.aspx?SuperId=" + dt4.Rows[0]["Userid"].ToString() + @"'  data-html=""true""   class='showpopover'  data-content=""" + getBinarydata(dt4.Rows[0]["Userid"].ToString()) + @""" rel=""popover"" data-placement=""bottom"" data-original-title=""Binary Details"" data-trigger=""hover""  ><img src=""img/5.png"" style=""height:70px;"" /></a>";
                }
                else
                {
                    ltuser4.Text = @"<a href='testAutoPool.aspx?SuperId=" + dt4.Rows[0]["Userid"].ToString() + @"'  data-html=""true""   class='showpopover'  data-content=""" + getBinarydata(dt4.Rows[0]["Userid"].ToString()) + @""" rel=""popover"" data-placement=""bottom"" data-original-title=""Binary Details"" data-trigger=""hover""  ><img src=""img/2.png"" style=""height:70px;"" /></a>";
                }
              
            }
            else
            {
                ltuser4.Text = @"<img src=""img/0.png"" style=""height:70px;"" />";
            }


            //================ Fourth Child============


            //================ Fifth Child============

            DataTable dt5 = new DataTable();
            dt5 = loadchild(lbluseridnew2.Text, "2");
            if (dt5.Rows.Count > 0)
            {
                lbluserid5.Text = @"<a href='testAutoPool.aspx?SuperId=" + dt5.Rows[0]["Userid"].ToString() + @"' >" + dt5.Rows[0]["Userid"].ToString() + @"</a>";
                lbluseridnew5.Text = dt5.Rows[0]["Userid"].ToString();
                lblusername5.Text = @"<a href='testAutoPool.aspx?SuperId=" + dt5.Rows[0]["Userid"].ToString() + @"' >" + dt5.Rows[0]["username"].ToString() + @"</a>";
                if (dt5.Rows[0]["activestatus"].ToString() == "1")
                {
                    ltuser5.Text = @"<a href='testAutoPool.aspx?SuperId=" + dt5.Rows[0]["Userid"].ToString() + @"'  data-html=""true""   class='showpopover'  data-content=""" + getBinarydata(dt5.Rows[0]["Userid"].ToString()) + @""" rel=""popover"" data-placement=""bottom"" data-original-title=""Binary Details"" data-trigger=""hover""  ><img src=""img/5.png"" style=""height:70px;"" /></a>";
                }
                else
                {
                    ltuser5.Text = @"<a href='testAutoPool.aspx?SuperId=" + dt5.Rows[0]["Userid"].ToString() + @"'  data-html=""true""   class='showpopover'  data-content=""" + getBinarydata(dt5.Rows[0]["Userid"].ToString()) + @""" rel=""popover"" data-placement=""bottom"" data-original-title=""Binary Details"" data-trigger=""hover""  ><img src=""img/2.png"" style=""height:70px;"" /></a>";
                }
               
            }
            else
            {
                ltuser5.Text = @"<img src=""img/0.png"" style=""height:70px;"" />";
            }


            //================ Fifth Child============


            //================ Sixth Child============

            DataTable dt6 = new DataTable();
            dt6 = loadchild(lbluseridnew3.Text, "1");
            if (dt6.Rows.Count > 0)
            {
                lbluserid6.Text = @"<a href='testAutoPool.aspx?SuperId=" + dt6.Rows[0]["Userid"].ToString() + @"' >" + dt6.Rows[0]["Userid"].ToString() + @"</a>";
                lbluseridnew6.Text = dt6.Rows[0]["Userid"].ToString();
                lblusername6.Text = @"<a href='testAutoPool.aspx?SuperId=" + dt6.Rows[0]["Userid"].ToString() + @"' >" + dt6.Rows[0]["username"].ToString() + @"</a>";
                if (dt6.Rows[0]["activestatus"].ToString() == "1")
                {
                    ltuser6.Text = @"<a href='testAutoPool.aspx?SuperId=" + dt6.Rows[0]["Userid"].ToString() + @"'  data-html=""true""   class='showpopover'  data-content=""" + getBinarydata(dt6.Rows[0]["Userid"].ToString()) + @""" rel=""popover"" data-placement=""bottom"" data-original-title=""Binary Details"" data-trigger=""hover""  ><img src=""img/5.png"" style=""height:70px;"" /></a>";
                }
                else
                {
                    ltuser6.Text = @"<a href='testAutoPool.aspx?SuperId=" + dt6.Rows[0]["Userid"].ToString() + @"'  data-html=""true""   class='showpopover'  data-content=""" + getBinarydata(dt6.Rows[0]["Userid"].ToString()) + @""" rel=""popover"" data-placement=""bottom"" data-original-title=""Binary Details"" data-trigger=""hover""  ><img src=""img/2.png"" style=""height:70px;"" /></a>";
                }

              
            }
            else
            {
                ltuser6.Text = @"<img src=""img/0.png"" style=""height:70px;"" />";
            }


            //================ Sixth Child============


            //================ Seventh Child============

            DataTable dt7 = new DataTable();
            dt7 = loadchild(lbluseridnew3.Text, "2");
            if (dt7.Rows.Count > 0)
            {
                lbluserid7.Text =@"<a href='testAutoPool.aspx?SuperId=" + dt7.Rows[0]["Userid"].ToString() + @"' >"+ dt7.Rows[0]["Userid"].ToString()+@"</a>";
                lbluseridnew7.Text = dt7.Rows[0]["Userid"].ToString();
                lblusername7.Text =@"<a href='testAutoPool.aspx?SuperId=" + dt7.Rows[0]["Userid"].ToString() + @"' >"+ dt7.Rows[0]["username"].ToString()+@"</a>";
                if (dt7.Rows[0]["activestatus"].ToString() == "1")
                {
                    ltuser7.Text = @"<a href='testAutoPool.aspx?SuperId=" + dt7.Rows[0]["Userid"].ToString() + @"'  data-html=""true""   class='showpopover'  data-content=""" + getBinarydata(dt7.Rows[0]["Userid"].ToString()) + @""" rel=""popover"" data-placement=""bottom"" data-original-title=""Binary Details"" data-trigger=""hover""  ><img src=""img/5.png"" style=""height:70px;"" /></a>";
                }
                else
                {
                    ltuser7.Text = @"<a href='testAutoPool.aspx?SuperId=" + dt7.Rows[0]["Userid"].ToString() + @"'  data-html=""true""   class='showpopover'  data-content=""" + getBinarydata(dt7.Rows[0]["Userid"].ToString()) + @""" rel=""popover"" data-placement=""bottom"" data-original-title=""Binary Details"" data-trigger=""hover""  ><img src=""img/2.png"" style=""height:70px;"" /></a>";
                }

              
            }
            else
            {
                ltuser7.Text = @"<img src=""img/0.png"" style=""height:70px;"" />";
            }


            //================ Seventh Child============

        }
        else
        {
            //divdata.Visible = false;
            Message.Show("Invalid User Id...!!!");
        }

    }

    DataTable loadchild(string str_parentid, string str_position)
    {
        objUser.ParentUserId = str_parentid;
        objUser.StandingPosition = str_position;
        objUser.PoolNo = Request.QueryString["poolno"].ToString();
        DataTable dt = new DataTable();
        dt = objUser.getUserChildAutopool(objUser);
        return dt;
    }
    string getBinarydata(string userid)
    {
        //objUser.UserId = userid;
        //string strleftid = "";
        //string strrightid = "";
        //string strleftidactive = "";
        //string strrightidactive = "";
        //DataTable dtleft = getleftdata(userid);
        //if (dtleft.Rows.Count > 0)
        //{
        //    strleftid = dtleft.Rows[0]["totaluser"].ToString();
        //    strleftidactive = dtleft.Rows[0]["activeuser"].ToString();
        //}
        //else
        //{
        //    strleftid = "0";
        //    strleftidactive = "0";
        //}

        //DataTable dtright = getRightdata(userid);
        //if (dtright.Rows.Count > 0)
        //{
        //    strrightid = dtright.Rows[0]["totaluser"].ToString();
        //    strrightidactive = dtright.Rows[0]["activeuser"].ToString();
        //}
        //else
        //{
        //    strrightid = "0";
        //    strrightidactive = "0";
        //}
        //int dcmatch1 = 0;
        //int dcmatchactive = 0;
        //if (Convert.ToInt32(strleftid) >= Convert.ToInt32(strrightid))
        //{
        //    dcmatch1 = Convert.ToInt32(strrightid);
        //}
        //else
        //{
        //    dcmatch1 = Convert.ToInt32(strleftid);
        //}
        //if (Convert.ToInt32(strleftidactive) >= Convert.ToInt32(strrightidactive))
        //{
        //    dcmatchactive = Convert.ToInt32(strrightidactive);
        //}
        //else
        //{
        //    dcmatchactive = Convert.ToInt32(strleftidactive);
        //}


        //string str_data = "";

        //    str_data = @"<table id='SalaryTable' class='table table-bordered table-hover' style='width:250px;' >
        //                                        <thead>
        //                                            <tr role='row'>
        //                                                <th >Business Detail</th>
        //                                                <th  >Left Side</th>
        //                                                <th  >Right Side</th>
        //                                                <th  >Pair</th>

        //                                            </tr>
        //                                        </thead>

        //                                        <tbody>
        //                                            <tr role='row' class='odd'>
        //                                                <td >Total Child</td>
        //                                                <td>  " + strleftid + @"</td>
        //                                                <td>  " + strrightid + @"</td>
        //                                                <td>  " + "" + @"</td>
        //                                            </tr>
        //                                            <tr role='row' class='even'>
        //                                                <td >Active Child</td>
        //                                             <td>  " + strleftidactive + @"</td>
        //                                                <td>  " + strrightidactive + @"</td>
        //                                                <td>  " + dcmatchactive + @"</td>
        //                                            </tr>


        //                                        </tbody>
        //                                    </table>";

        // return str_data;
        return "";
    }
}
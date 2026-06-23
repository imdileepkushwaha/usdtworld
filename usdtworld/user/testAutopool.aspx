<%@ Page Language="C#" AutoEventWireup="true" CodeFile="testAutoPool.aspx.cs" Inherits="User_test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
   
<%--    <script src="assets/js/jquery-1.8.2.js"></script>
    <script src="assets/js/jquery.tooltip.min.js" type="text/javascript"></script>--%>
    
 
    <script type="text/javascript">

        function InitializeToolTip() {

            $(".gridViewToolTip").tooltip({

                track: true,

                delay: 0,

                showURL: false,

                fade: 100,

                bodyHandler: function () {

                    return $($(this).next().html());

                },

                showURL: false

            });

        }

    </script>

    <script type="text/javascript">

        $(function () {

            InitializeToolTip();

        })

    </script>
      <link href="popover/bootstrap.min.css" rel="stylesheet" />
  
</head>
<body>
    <form id="form1" runat="server">
       <%--<a href="https://api.whatsapp.com/send?text=https://www.manglayatan.com" data-action="share/whatsapp/share">Share via Whatsapp</a>--%>
        <table style="width: 100%">
            <tr>
                <td style="text-align: center;" colspan="8">
                    <%--<img src="img/0.png" style="height:70px;" />--%>
                    <asp:Literal ID="ltuser1" runat="server"></asp:Literal>
                        <div id="Div1" style="display: none;">

                        <table style="width:100%;">
                            <tr>
                                <td style="white-space: nowrap;">
                                    <b>L:</b>&nbsp;
                                </td>
                                <td>
                                    <asp:Label ID="lblleftid1" runat="server" Text="Label"></asp:Label>
                                </td> 
                                  <td style="white-space: nowrap;">
                                    <b>R:</b>&nbsp;
                                </td>
                                <td>
                                    <asp:Label ID="lblrightid1" runat="server" Text="Label"></asp:Label>
                                </td>
                                   <td style="white-space: nowrap;">
                                    <b>Total Pair:</b>&nbsp;
                                </td>
                                <td>
                                    <asp:Label ID="lbltotalid1" runat="server" Text="Label"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <br />
                    <asp:Label ID="lbluserid1" runat="server" Text=""></asp:Label>-<asp:Label ID="lblusername1" runat="server" Text=""></asp:Label>

                        <asp:Label ID="lbluseridnew1" runat="server" visible="false" Text=""></asp:Label>
                        <asp:Label ID="lbluseridnew2" runat="server" visible="false" Text=""></asp:Label>
                        <asp:Label ID="lbluseridnew3" runat="server" visible="false" Text=""></asp:Label>
                        <asp:Label ID="lbluseridnew4" runat="server" visible="false" Text=""></asp:Label>
                        <asp:Label ID="lbluseridnew5" runat="server" visible="false" Text=""></asp:Label>
                        <asp:Label ID="lbluseridnew6" runat="server" visible="false" Text=""></asp:Label>
                        <asp:Label ID="lbluseridnew7" runat="server" visible="false" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="text-align: center;" colspan="8">
                    <img src="img/band1.gif" />
                </td>
            </tr>
            <tr>

                <td style="text-align: center;" colspan="4">
                    <asp:Literal ID="ltuser2" runat="server"></asp:Literal>
                              <div id="Div3" style="display: none;">
                        <table style="width:100%;">
                            <tr>
                                 <td style="white-space: nowrap;">
                                    <b>L:</b>&nbsp;
                                </td>
                                <td>
                                    <asp:Label ID="lblleftid2" runat="server" Text="Label"></asp:Label>
                                </td>
                                  <td style="white-space: nowrap;">
                                    <b>R:</b>&nbsp;
                                </td>
                               
                                <td>
                                    <asp:Label ID="lblrightid2" runat="server" Text="Label"></asp:Label>
                                </td>
                                 <td style="white-space: nowrap;">
                                    <b>Total Pair:</b>&nbsp;
                                </td>
                                <td>
                                    <asp:Label ID="lbltotalid2" runat="server" Text="Label"></asp:Label>
                                </td>
                            </tr>
                         

                        </table>

                    </div>
                    <br />
                    <asp:Label ID="lbluserid2" runat="server" Text=""></asp:Label>-<asp:Label ID="lblusername2" runat="server" Text=""></asp:Label>

                    


      
                </td>
                <td style="text-align: center;" colspan="4">
                    <asp:Literal ID="ltuser3" runat="server"></asp:Literal>
                          <div id="Div2" style="display: none;">
                        <table style="width:100%;">                        
                            <tr>
                                 <td style="white-space: nowrap;">
                                    <b>L:</b>&nbsp;
                                </td>
                                <td>
                                    <asp:Label ID="lblleftid3" runat="server" Text="Label"></asp:Label>
                                </td>
                                  <td style="white-space: nowrap;">
                                    <b>R:</b>&nbsp;
                                </td>
                                 <td>
                                    <asp:Label ID="lblrightid3" runat="server" Text="Label"></asp:Label>
                                </td> 
                                 <td style="white-space: nowrap;">
                                    <b>Total Pair:</b>&nbsp;
                                </td>
                                <td>
                                    <asp:Label ID="lbltotalid3" runat="server" Text="Label"></asp:Label>
                                </td>                              
                            </tr>                       
                        </table>
                    </div>
                    <br />
                    <asp:Label ID="lbluserid3" runat="server" Text=""></asp:Label>-<asp:Label ID="lblusername3" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>

                <td style="text-align: center;" colspan="4">
                    <img src="img/band2.gif" />
                </td>
                <td style="text-align: center;" colspan="4">
                    <img src="img/band2.gif" />
                </td>
            </tr>

            <tr>

                <td style="text-align: center;" colspan="2">
                    <asp:Literal ID="ltuser4" runat="server"></asp:Literal>
                       <div id="Div4" style="display: none;">

                        <table style="width:100%;">
                         
                           <tr>
                                 <td style="white-space: nowrap;">
                                    <b>L:</b>&nbsp;
                                </td>
                                <td>
                                    <asp:Label ID="lblleftid4" runat="server" Text="Label"></asp:Label>
                                </td>
                                  <td style="white-space: nowrap;">
                                    <b>R:</b>&nbsp;
                                </td>
                                 <td>
                                    <asp:Label ID="lblrightid4" runat="server" Text="Label"></asp:Label>
                                </td> 
                                <td style="white-space: nowrap;">
                                    <b>Total Pair:</b>&nbsp;
                                </td>
                                <td>
                                    <asp:Label ID="lbltotalid4" runat="server" Text="Label"></asp:Label>
                                </td>                              
                            </tr>
                         
                        </table>

                    </div>
                    <br />
                    <asp:Label ID="lbluserid4" runat="server" Text=""></asp:Label>-<asp:Label ID="lblusername4" runat="server" Text=""></asp:Label>

                </td>
                <td style="text-align: center;" colspan="2">
                    <asp:Literal ID="ltuser5" runat="server"></asp:Literal>
                       <div id="Div5" style="display: none;">

                        <table style="width:100%;">     
                              <tr>
                                 <td style="white-space: nowrap;">
                                    <b>L:</b>&nbsp;
                                </td>
                                <td>
                                    <asp:Label ID="lblleftid5" runat="server" Text="0"></asp:Label>
                                </td>
                                  <td style="white-space: nowrap;">
                                    <b>R:</b>&nbsp;
                                </td>
                                 <td>
                                    <asp:Label ID="lblrightid5" runat="server" Text="0"></asp:Label>
                                </td> 
                                   <td style="white-space: nowrap;">
                                    <b>Total Pair:</b>&nbsp;
                                </td>
                                <td>
                                    <asp:Label ID="lbltotalid5" runat="server" Text="0"></asp:Label>
                                </td>                              
                            </tr>

                        </table>

                    </div>
                    <br />
                    <asp:Label ID="lbluserid5" runat="server" Text=""></asp:Label>-<asp:Label ID="lblusername5" runat="server" Text=""></asp:Label>

                </td>
                <td style="text-align: center;" colspan="2">
                    <asp:Literal ID="ltuser6" runat="server"></asp:Literal>
                       <div id="Div6" style="display: none;">

                        <table style="width:100%;">
                           <tr>
                                 <td style="white-space: nowrap;">
                                    <b>L:</b>&nbsp;
                                </td>
                                <td>
                                    <asp:Label ID="lblleftid6" runat="server" Text="0"></asp:Label>
                                </td>
                                  <td style="white-space: nowrap;">
                                    <b>R:</b>&nbsp;
                                </td>
                                 <td>
                                    <asp:Label ID="lblrightid6" runat="server" Text="0"></asp:Label>
                                </td> 
                                <td style="white-space: nowrap;">
                                    <b>Total Pair:</b>&nbsp;
                                </td>
                                <td>
                                    <asp:Label ID="lbltotalid6" runat="server" Text="Label"></asp:Label>
                                </td>                              
                            </tr>
                        </table>

                    </div>
                    <br />
                    <asp:Label ID="lbluserid6" runat="server" Text=""></asp:Label>-<asp:Label ID="lblusername6" runat="server" Text=""></asp:Label>


                </td>
                <td style="text-align: center;" colspan="2">
                    <asp:Literal ID="ltuser7" runat="server"></asp:Literal>
                       <div id="Div7" style="display: none;">

                        <table style="width:100%;">
                             <tr>
                                 <td style="white-space: nowrap;">
                                    <b>L:</b>&nbsp;
                                </td>
                                <td>
                                    <asp:Label ID="lblleftid7" runat="server" Text="Label"></asp:Label>
                                </td>
                                  <td style="white-space: nowrap;">
                                    <b>R:</b>&nbsp;
                                </td>
                                 <td>
                                    <asp:Label ID="lblrightid7" runat="server" Text="Label"></asp:Label>
                                </td>  
                                  <td style="white-space: nowrap;">
                                    <b>Total Pair:</b>&nbsp;
                                </td>
                                <td>
                                    <asp:Label ID="lbltotalid7" runat="server" Text="Label"></asp:Label>
                                </td>                             
                            </tr>
                        </table>

                    </div>
                    <br />
                    <asp:Label ID="lbluserid7" runat="server" Text=""></asp:Label>-<asp:Label ID="lblusername7" runat="server" Text=""></asp:Label>

                </td>
            </tr>
            <tr>
                <td style="text-align: center;">&nbsp;</td>
                <td style="text-align: center;">&nbsp;</td>
                <td style="text-align: center;">&nbsp;</td>
                <td style="text-align: center;">&nbsp;</td>
                <td style="text-align: center;">&nbsp;</td>
                <td style="text-align: center;">&nbsp;</td>
                <td style="text-align: center;">&nbsp;</td>
                <td style="text-align: center;">&nbsp;</td>
            </tr>
        </table>
             <script src="popover/bootstrap.min.js"></script>
    <script>
        $('.showpopover').popover();
    </script>
    </form>
</body>
</html>

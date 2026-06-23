<%@ Page Title="Autopool   Income Report" Language="C#" MasterPageFile="adminmaster.master" AutoEventWireup="true" CodeFile="AutopoolIncomeReport.aspx.cs" Inherits="admin_UserReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPageHeading" runat="Server">
 <section class="content-header">
      <h1>
       Autopool Income Report     
      </h1>
      <ol class="breadcrumb">
     <li><a href="Dashboard.aspx"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">Retailer</a></li>
        <li class="active">Autopool Income  Report</li>
      </ol>
    </section>  
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentpageData" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
              <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
        <ProgressTemplate>
            <div class="modal2">
                <div class="center2">
                    <img alt="" src="loader.gif" />
                </div>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
             <div class="box">
                    <div class="box-header">
                        <h5>Search Criteria</h5>
                    </div>
                    <div class="box-body">
                            
                                  <div class="row">
                                   <%-- <div class="col-md-2">Closing Period</div>
                                    <div class="col-md-3">
                                        <asp:DropDownList ID="ddclosingperiod"   CssClass="form-control " runat="server"></asp:DropDownList>
                                    </div>
                                   <div class="col-md-1"></div>--%>
                                         <div class="col-md-2">From Date</div>
                                    <div class="col-md-2">
                                        <asp:TextBox ID="txtfromdate" CssClass="form-control form_date" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-md-2">To Date</div>
                                    <div class="col-md-2">
                                        <asp:TextBox ID="txttodate" CssClass="form-control form_date" runat="server"></asp:TextBox>
                                    </div>
                                        <div class="col-md-2">User Id</div>
                                    <div class="col-md-2">
                                      <asp:TextBox ID="txtuserid"   CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                               
                                 <div class="row">
                            <div class="col-md-2">Pool No</div>
                                    <div class="col-md-2">
                                       <asp:DropDownList ID="ddpoolno" CssClass="form-control" runat="server">
                                            <asp:ListItem Value="0">Select Pool</asp:ListItem>
                                            <asp:ListItem value="1">5$</asp:ListItem>
                                            <asp:ListItem value="2">25$</asp:ListItem>
                                            <asp:ListItem value="3">150$</asp:ListItem>
                                            <asp:ListItem value="4">600$</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                      <div class="col-md-2">Payment Status</div>
                            <div class="col-md-2">
                                 <asp:DropDownList ID="ddstatus" CssClass="form-control" runat="server">
                                            <asp:ListItem Value="-1"> Select Status</asp:ListItem>
                                            <asp:ListItem Value="0">Unpaid</asp:ListItem>
                                            <asp:ListItem Value="1">Paid</asp:ListItem>
                                        </asp:DropDownList>
                            </div>
                                </div>
                                <hr />
                                <div class="row">
                                    <div class="col-md-12">
                                        <asp:Button ID="btnSubmit"  CssClass="btn btn-primary has-ripple" runat="server" Text="Search" OnClick="btnSubmit_Click" />
                                        <asp:Button ID="btnCancel" CssClass="btn btn-danger has-ripple" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                                    </div>
                                </div>
                </div>
            </div>

            <div class="box">
                    <div class="box-header">
                        <h5>Autopool Income Report</h5>
                    </div>
                    <div class="box-body">

                        <div class="table-responsive">

                            <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-hover" Width="100%" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand" OnRowDataBound="GridView1_RowDataBound">
                               <Columns>
                                    <asp:TemplateField HeaderText="#">
                                        <ItemTemplate>
                                            <%#Container.DataItemIndex+1 %>
                                          
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                     
                                     <asp:TemplateField HeaderText="User Id">
                                        <ItemTemplate>
                                            <asp:Label ID="lbluserid" runat="server" Text='<%#Eval("userid") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="User Name">
                                        <ItemTemplate>
                                            <asp:Label ID="lblusenamegf" runat="server" Text='<%#Eval("username") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Transaction Id">
                                        <ItemTemplate>
                                            <asp:Label ID="lblusername" runat="server" Text='<%#Eval("transactionid") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Pool No">
                                        <ItemTemplate>
                                            <asp:Label ID="lblpoolno" runat="server" Text='<%#Eval("poolid") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                   <asp:TemplateField HeaderText="Direct Target">
                                        <ItemTemplate>
                                            <asp:Label ID="lblpoffffolno" runat="server" Text='<%#Eval("directcount") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                   <asp:TemplateField HeaderText="Direct Team">
                                        <ItemTemplate>
                                            <asp:Label ID="lblpkkkoolno" runat="server" Text='<%#Eval("directteam") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <%--<asp:TemplateField HeaderText="Level">
                                        <ItemTemplate>
                                            <asp:Label ID="lbllevel" runat="server" Text='<%#Eval("levelno") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>--%>
                                                        <asp:TemplateField HeaderText="Amount">
                                        <ItemTemplate>
                                            <asp:Label ID="lblamount" runat="server" Text='<%#Eval("amount") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>   
                                      <asp:TemplateField HeaderText="Status">
                                        <ItemTemplate>
                                            <asp:Label ID="lblstatus" runat="server" Text='<%#Eval("incomestatus2") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField> 
                                   <%-- <asp:TemplateField HeaderText="From Id">
                                        <ItemTemplate>
                                            <asp:Label ID="lblfinalamt" runat="server" Text='<%#Eval("JuniorUserId") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>      --%> 
                                    <asp:TemplateField HeaderText="Date">
                                        <ItemTemplate>
                                            <asp:Label ID="lbldate" runat="server" Text='<%#Eval("mentiondate","{0:dd/MM/yyyy}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>  
                                                               
                                </Columns>
                            </asp:GridView>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" runat="Server">
     
</asp:Content>


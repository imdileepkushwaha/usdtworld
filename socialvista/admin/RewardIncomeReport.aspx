<%@ Page Title="Reward Income Report" Language="C#" MasterPageFile="adminmaster.master" AutoEventWireup="true" CodeFile="RewardIncomeReport.aspx.cs" Inherits="admin_UserReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentPageHeading" runat="Server">
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
<asp:Content ID="Content5" ContentPlaceHolderID="contentpageData" runat="Server">
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
             <div class="box panel-default">
        <div class="box-header">
            <strong>Search Criteria</strong>
        </div>
        <div class="box-body">
                            
                                  <div class="row">
                                    <div class="col-md-2">Closing Period</div>
                                    <div class="col-md-3">
                                        <asp:DropDownList ID="ddclosingperiod"   CssClass="form-control " runat="server"></asp:DropDownList>
                                    </div>
                                   <div class="col-md-1"></div>
                                        <div class="col-md-2">User Id</div>
                                    <div class="col-md-3">
                                      <asp:TextBox ID="txtuserid"   CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                               
                               
                                <hr />
                                <div class="row">
                                    <div class="col-md-12">
                                        <asp:Button ID="btnSubmit"  CssClass="btn btn-success" runat="server" Text="Search" OnClick="btnSubmit_Click" />
                                        <asp:Button ID="btnCancel" CssClass="btn btn-danger" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                                    </div>
                                </div>
                </div>
            </div>

              <div class="box">
        <div class="box-header">
            <strong>Reward Income Report</strong>
        </div>
        <div class="box-body">
                        <div class="table-responsive">

                            <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-hover" Width="100%" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand">
                               <Columns>
                                    <asp:TemplateField HeaderText="#">
                                        <ItemTemplate>
                                            <%#Container.DataItemIndex+1 %>
                                          
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                       <asp:TemplateField HeaderText="Closing Period">
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%#Eval("fromdate","{0:dd/MM/yyyy}") %>'></asp:Label>-
                                            <asp:Label ID="lbluserid" runat="server" Text='<%#Eval("todate","{0:dd/MM/yyyy}") %>'></asp:Label>
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
                                 <%--   <asp:TemplateField HeaderText="Transaction Id">
                                        <ItemTemplate>
                                            <asp:Label ID="lblusername" runat="server" Text='<%#Eval("transactionid") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>--%>
                                   <%-- <asp:TemplateField HeaderText="Comm %">
                                        <ItemTemplate>
                                            <asp:Label ID="lbllevel" runat="server" Text='<%#Eval("commissionpercent") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>--%>
                                                        <asp:TemplateField HeaderText="Income">
                                        <ItemTemplate>
                                            <asp:Label ID="lblamount" runat="server" Text='<%#Eval("amount") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>  
                                    
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


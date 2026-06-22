<%@ Page Title="Binary Report Autopool" Language="C#" MasterPageFile="~/user/MasterPage.master" AutoEventWireup="true" CodeFile="BinaryReportAutopool.aspx.cs" Inherits="admin_BinaryReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPageHeading" Runat="Server">
   <section class="content-header">
      <h1>
       Binary Report      Autopool
      </h1>
      <ol class="breadcrumb">
     <li><a href="Dashboard.aspx"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">User</a></li>
        <li class="active">Binary Report Autopool</li>
      </ol>
    </section>  
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentpageData" Runat="Server">
       <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

          <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">Search Crteria</h3>
                        </div>

                        <div class="box-body">
                            <fieldset>
                                <div class="row form-group">
                                    <div class="col-md-2">User Id</div>
                                    <div class="col-md-2">
                                        <asp:TextBox ID="txtuserid" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-md-2">Select Pool</div>
                                    <div class="col-md-2">
                                        <asp:DropDownList ID="ddpoolno" CssClass="form-control" runat="server">
                                            <asp:ListItem Value="0">Select Pool</asp:ListItem>
                                            <asp:ListItem value="1">5$</asp:ListItem>
                                            <asp:ListItem value="2">25$</asp:ListItem>
                                            <asp:ListItem value="3">150$</asp:ListItem>
                                            <asp:ListItem value="4">600$</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                  
                                </div>
                              
                                <hr />
                                <div class="row form-group">
                                    <div class="col-md-12">
                                        <asp:Button ID="btnSubmit"  CssClass="btn btn-success" runat="server" Text="Search" OnClick="btnSubmit_Click" />
                                        <asp:Button ID="btnCancel" CssClass="btn btn-danger" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                                    </div>
                                </div>
                            </fieldset>
                        </div>
                    </div>
                

             <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">Binary Report Autopool</h3>
                        </div>

                        <div class="box-body">
                        <div class="row form-group">
                            <div class="col-md-12">
                        <div class="table-responsive">

                          <iframe id="f1" runat="server" style="height:500px;width:100%;border:0px;"></iframe>
                        </div>
                                </div>
                        </div>
                    </div>
                </div>
         
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" Runat="Server">
</asp:Content>



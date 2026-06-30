<%@ Page Title="Binary Report Autopool" Language="C#" MasterPageFile="adminmaster.master" AutoEventWireup="true" CodeFile="BinaryReportAutopool.aspx.cs" Inherits="admin_BinaryReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="css/admin-form-page.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPageHeading" Runat="Server">
    <section class="content-header">
        <h1>Binary Report Autopool</h1>
        <ol class="breadcrumb">
            <li><a href="Dashboard.aspx"><i class="fa fa-dashboard"></i> Home</a></li>
            <li><a href="#">User</a></li>
            <li class="active">Binary Report Autopool</li>
        </ol>
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentpageData" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1" DisplayAfter="200" DynamicLayout="false">
        <ProgressTemplate>
            <div class="adm-page-loader">
                <div class="adm-page-loader__card">
                    <div class="adm-page-loader__spinner"></div>
                    <span class="adm-page-loader__text">Loading binary tree...</span>
                </div>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="adm-form-page">
                <div class="row">
                    <div class="col-12">
                        <div class="box box-primary adm-form-card">
                            <div class="box-header with-border">
                                <h3 class="box-title">Search Criteria</h3>
                            </div>
                            <div class="box-body">
                                <div class="adm-form-section__grid">
                                    <div class="adm-field">
                                        <label class="adm-field-label" for="<%= txtuserid.ClientID %>">User Id <span class="adm-field-label__req">*</span></label>
                                        <div class="adm-input-wrap">
                                            <i class="fa-solid fa-id-card adm-input-wrap__icon" aria-hidden="true"></i>
                                            <asp:TextBox ID="txtuserid" CssClass="form-control" runat="server" placeholder="Enter user id"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="adm-field">
                                        <label class="adm-field-label" for="<%= ddpoolno.ClientID %>">Select Pool</label>
                                        <asp:DropDownList ID="ddpoolno" CssClass="form-control" runat="server">
                                            <asp:ListItem Value="0">Select Pool</asp:ListItem>
                                            <asp:ListItem Value="1">5$</asp:ListItem>
                                            <asp:ListItem Value="2">25$</asp:ListItem>
                                            <asp:ListItem Value="3">150$</asp:ListItem>
                                            <asp:ListItem Value="4">600$</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                            <div class="box-footer">
                                <asp:Button ID="btnSubmit" CssClass="btn btn-primary" runat="server" Text="Search" OnClick="btnSubmit_Click" />
                                <asp:Button ID="btnCancel" CssClass="btn btn-outline-secondary" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                            </div>
                        </div>
                    </div>

                    <div class="col-12">
                        <div class="box box-primary adm-table-card">
                            <div class="box-header with-border">
                                <h3 class="box-title">Binary Report Autopool</h3>
                            </div>
                            <div class="box-body">
                                <iframe id="f1" runat="server" class="adm-report-frame" title="Binary autopool tree"></iframe>
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

<%@ Page Title="Franchisee Type Master" Language="C#" MasterPageFile="adminmaster.master" AutoEventWireup="true" CodeFile="FranchiseetypeMaster.aspx.cs" Inherits="FranchiseetypeMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="css/admin-form-page.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPageHeading" Runat="Server">
    <section class="content-header">
        <h1>Franchisee Type Master</h1>
        <ol class="breadcrumb">
            <li><a href="Dashboard.aspx"><i class="fa fa-dashboard"></i> Home</a></li>
            <li><a href="#">Utility management</a></li>
            <li class="active">Franchisee Type</li>
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
                    <span class="adm-page-loader__text">Saving franchisee types...</span>
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
                                <h3 class="box-title">Franchisee Type Settings</h3>
                            </div>
                            <div class="box-body">
                                <asp:Repeater ID="rptFranchiseeTypes" runat="server">
                                    <ItemTemplate>
                                        <div class="adm-form-section">
                                            <h4 class="adm-form-section__title">
                                                <i class="fa-solid fa-store" aria-hidden="true"></i>
                                                Franchisee Type #<%# Container.ItemIndex + 1 %>
                                            </h4>
                                            <asp:Label ID="lblid" runat="server" Visible="false" Text='<%# Eval("id") %>'></asp:Label>
                                            <div class="adm-form-section__grid">
                                                <div class="adm-field">
                                                    <label class="adm-field-label">Type Name</label>
                                                    <div class="adm-input-wrap">
                                                        <i class="fa-solid fa-tag adm-input-wrap__icon" aria-hidden="true"></i>
                                                        <asp:TextBox ID="TxtAdminCharge" runat="server" Text='<%# Eval("type") %>' CssClass="form-control" placeholder="Enter franchisee type"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="adm-field">
                                                    <label class="adm-field-label">Profit (%)</label>
                                                    <div class="adm-input-wrap">
                                                        <i class="fa-solid fa-percent adm-input-wrap__icon" aria-hidden="true"></i>
                                                        <asp:TextBox ID="TxtTdswithpam" runat="server" Text='<%# Eval("profit") %>' CssClass="form-control" placeholder="0.00"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                            <div class="box-footer">
                                <asp:Button ID="btnUpdate" CssClass="btn btn-primary" runat="server" Text="Update Settings" OnClick="btnUpdate_Click" />
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

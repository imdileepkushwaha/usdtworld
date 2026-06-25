<%@ Page Title="Purchase Report" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="PurchaseReport.aspx.cs" Inherits="admin_PurchaseReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="css/account-pages.css" rel="stylesheet" />
    <link href="css/report-pages.css" rel="stylesheet" />
    <link href="css/purchase-pages.css" rel="stylesheet" />
    <link href="css/messages-page.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPageHeading" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentpageData" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="sv-account-page sv-report-page sv-purchase-page">
                <div class="sv-page-header sv-page-header--purchase">
                    <div class="sv-page-header__glow sv-page-header__glow--1"></div>
                    <div class="sv-page-header__glow sv-page-header__glow--2"></div>
                    <div class="sv-page-header__main">
                        <div class="sv-page-header__icon">
                            <i class="fa-solid fa-bag-shopping"></i>
                        </div>
                        <div class="sv-page-header__text">
                            <h1>Purchase Report</h1>
                            <p>Search and review your repurchase history</p>
                        </div>
                    </div>
                    <div class="sv-page-header__actions">
                        <a href="Dashboard.aspx" class="sv-page-breadcrumb">
                            <iconify-icon icon="solar:home-smile-angle-outline" class="icon"></iconify-icon>
                            Dashboard
                        </a>
                        <span class="sv-page-header__crumb">Repurchase / Purchase Report</span>
                    </div>
                </div>

                <nav class="sv-purchase-tabs" aria-label="Repurchase sections">
                    <a href="PurchaseItem.aspx" class="sv-purchase-tabs__item"><i class="fa-solid fa-cart-shopping"></i> Purchase Product</a>
                    <a href="PurchaseReport.aspx" class="sv-purchase-tabs__item sv-purchase-tabs__item--active"><i class="fa-solid fa-clipboard-list"></i> Purchase Report</a>
                </nav>

                <div class="sv-form-card">
                    <div class="sv-form-card__head">
                        <span class="sv-form-card__head-icon"><i class="fa-solid fa-magnifying-glass"></i></span>
                        <div class="sv-form-card__head-text">
                            <h3>Search Criteria</h3>
                            <p>Filter purchases by date, user and status</p>
                        </div>
                    </div>
                    <div class="sv-form-card__body">
                        <div class="row g-3">
                            <div class="col-md-4">
                                <div class="sv-field">
                                    <label class="sv-field__label"><i class="fa-solid fa-calendar"></i> From Date</label>
                                    <asp:TextBox ID="txtfromdate" CssClass="form-control form_date" runat="server" placeholder="dd/MM/yyyy"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="sv-field">
                                    <label class="sv-field__label"><i class="fa-solid fa-calendar-day"></i> To Date</label>
                                    <asp:TextBox ID="txttodate" CssClass="form-control form_date" runat="server" placeholder="dd/MM/yyyy"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="sv-field">
                                    <label class="sv-field__label"><i class="fa-solid fa-user"></i> User ID</label>
                                    <asp:TextBox ID="txtuserid" CssClass="form-control" runat="server" placeholder="Enter User ID"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="sv-field">
                                    <label class="sv-field__label"><i class="fa-solid fa-circle-check"></i> Status</label>
                                    <asp:DropDownList ID="ddstatus" CssClass="form-control" runat="server">
                                        <asp:ListItem Value="0">Select Status</asp:ListItem>
                                        <asp:ListItem Value="1">Approved</asp:ListItem>
                                        <asp:ListItem Value="2">Rejected</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>

                        <div class="sv-report-actions">
                            <div class="sv-report-actions__left">
                                <asp:Button ID="btnSubmit" CssClass="sv-btn-primary" runat="server" Text="Search" OnClick="btnSubmit_Click" />
                                <asp:Button ID="btnCancel" CssClass="sv-btn-danger" runat="server" Text="Reset" OnClick="btnCancel_Click" />
                            </div>
                        </div>
                    </div>
                </div>

                <div class="sv-form-card">
                    <div class="sv-form-card__head">
                        <span class="sv-form-card__head-icon"><i class="fa-solid fa-list"></i></span>
                        <div class="sv-form-card__head-text">
                            <h3>Purchase Details</h3>
                            <p>Your product purchase history</p>
                        </div>
                    </div>
                    <div class="sv-form-card__body">
                        <div class="sv-report-toolbar">
                            <p class="sv-report-toolbar__title">
                                <i class="fa-solid fa-table"></i> Purchase List
                            </p>
                        </div>

                        <div class="sv-msg-table-wrap">
                            <div class="sv-msg-table-scroll">
                                <asp:GridView ID="GridView1" runat="server" CssClass="sv-msg-table table table-borderless" Width="100%"
                                    AutoGenerateColumns="False" GridLines="None" OnRowCommand="GridView1_RowCommand">
                                    <Columns>
                                        <asp:TemplateField HeaderText="#">
                                            <ItemTemplate>
                                                <span class="sv-msg-sr"><%# Container.DataItemIndex + 1 %></span>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="User ID">
                                            <ItemTemplate>
                                                <span class="sv-txn-id"><%# Eval("userID") %></span>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Date">
                                            <ItemTemplate>
                                                <span class="sv-msg-date"><%# Eval("PurchaseDate", "{0:dd/MM/yyyy}") %></span>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Image">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnkph" runat="server" CommandName="photolarge" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>">
                                                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Image") %>' Height="40px" Width="40px" CssClass="rounded" />
                                                </asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Product Name">
                                            <ItemTemplate>
                                                <span class="sv-txn-desc"><%# Eval("ProductName") %></span>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Amount/pcs">
                                            <ItemTemplate>
                                                <span class="sv-txn-amount sv-txn-amount--credit"><%# Eval("Amount") %></span>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Quantity">
                                            <ItemTemplate>
                                                <span class="sv-txn-type"><%# Eval("Quantity") %></span>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Total Amount">
                                            <ItemTemplate>
                                                <span class="sv-txn-amount sv-txn-amount--credit"><%# Eval("TotalAmount") %></span>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" runat="Server">
    <script src="../bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
    <script type="text/javascript">
        Sys.Application.add_load(LoadHandler);
        function LoadHandler() {
            $('.form_date').datepicker({
                format: 'dd/mm/yyyy',
            }).on('changeDate', function (ev) {
                $(this).datepicker('hide');
            });
        }
    </script>
</asp:Content>

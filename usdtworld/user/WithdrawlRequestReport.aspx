<%@ Page Title="Withdrawl Request Report" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="WithdrawlRequestReport.aspx.cs" Inherits="admin_UserReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="css/account-pages.css" rel="stylesheet" />
    <link href="css/report-pages.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPageHeading" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentpageData" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

            <div class="sv-account-page sv-report-page">
                <div class="sv-page-header sv-page-header--withdraw">
                    <div class="sv-page-header__glow sv-page-header__glow--1"></div>
                    <div class="sv-page-header__glow sv-page-header__glow--2"></div>
                    <div class="sv-page-header__main">
                        <div class="sv-page-header__icon">
                            <i class="fa-solid fa-file-invoice-dollar"></i>
                        </div>
                        <div class="sv-page-header__text">
                            <h1>Withdrawal Request Report</h1>
                            <p>Track pending, approved and cancelled withdrawals</p>
                        </div>
                    </div>
                    <div class="sv-page-header__actions">
                        <a href="Dashboard.aspx" class="sv-page-breadcrumb">
                            <iconify-icon icon="solar:home-smile-angle-outline" class="icon"></iconify-icon>
                            Dashboard
                        </a>
                        <span class="sv-page-header__crumb">Withdrawal / Request Report</span>
                    </div>
                </div>

                <div class="sv-form-card sv-form-card--withdraw">
                    <div class="sv-form-card__head">
                        <span class="sv-form-card__head-icon"><i class="fa-solid fa-magnifying-glass"></i></span>
                        <div class="sv-form-card__head-text">
                            <h3>Search Criteria</h3>
                            <p>Filter withdrawal requests by date and status</p>
                        </div>
                    </div>
                    <div class="sv-form-card__body">
                        <div class="row g-3">
                            <div class="col-md-4">
                                <div class="sv-field">
                                    <label class="sv-field__label"><i class="fa-solid fa-calendar"></i> From Date</label>
                                    <asp:TextBox runat="server" CssClass="form-control form_date" ID="txtfromdate" placeholder="dd/MM/yyyy"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="sv-field">
                                    <label class="sv-field__label"><i class="fa-solid fa-calendar-day"></i> To Date</label>
                                    <asp:TextBox runat="server" CssClass="form-control form_date" ID="txttodate" placeholder="dd/MM/yyyy"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="sv-field">
                                    <label class="sv-field__label"><i class="fa-solid fa-circle-check"></i> Status</label>
                                    <asp:DropDownList ID="ddstatus" CssClass="form-control" runat="server">
                                        <asp:ListItem Value="0">Select Status</asp:ListItem>
                                        <asp:ListItem>Pending</asp:ListItem>
                                        <asp:ListItem>Approved</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>

                        <div class="sv-report-actions">
                            <div class="sv-report-actions__left">
                                <asp:Button ID="btnSubmit" CssClass="sv-btn-primary" runat="server" Text="Search" OnClick="btnSubmit_Click" />
                                <asp:Button ID="btnCancel" CssClass="sv-btn-danger" runat="server" Text="Reset" OnClick="btncancel_Click" />
                            </div>
                        </div>
                    </div>
                </div>

                <div class="sv-form-card">
                    <div class="sv-form-card__head">
                        <span class="sv-form-card__head-icon"><i class="fa-solid fa-list"></i></span>
                        <div class="sv-form-card__head-text">
                            <h3>Withdrawal History</h3>
                            <p>All submitted withdrawal requests</p>
                        </div>
                    </div>
                    <div class="sv-form-card__body">
                        <div class="sv-report-toolbar">
                            <p class="sv-report-toolbar__title">
                                <i class="fa-solid fa-table"></i> Request List
                            </p>
                        </div>

                        <div class="sv-report-table-wrap table-responsive">
                            <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover" Width="100%" AutoGenerateColumns="False" OnRowDataBound="grdGetHelp_RowDataBound">
                                <Columns>
                                    <asp:TemplateField HeaderText="S.No">
                                        <ItemTemplate>
                                            <%#Container.DataItemIndex+1 %>
                                            <asp:Label ID="lblid" runat="server" Visible="false" Text='<%#Eval("id") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Date of Request">
                                        <ItemTemplate>
                                            <asp:Label ID="lblcreatingdate" runat="server" Text='<%#Eval("MentionDate","{0:dd/MM/yyyy hh:mm tt}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Approve Date">
                                        <ItemTemplate>
                                            <asp:Label ID="lblreleasedate" runat="server" Text='<%#Eval("approvedate","{0:dd/MM/yyyy hh:mm tt}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Amount">
                                        <ItemTemplate>
                                            <asp:Label ID="lblamount" runat="server" Text='<%#Eval("amount") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Status">
                                        <ItemTemplate>
                                            <asp:Label ID="lblstatus" runat="server" Text='<%#Eval("status") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Mode">
                                        <ItemTemplate>
                                            <asp:Label ID="lblmode" runat="server" Text='<%#Eval("paymentmode") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Transaction Id">
                                        <ItemTemplate>
                                            <asp:Label ID="lbltransactionid" runat="server" Text='<%#Eval("OnlineTransactionId") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" runat="Server">
    <script type="text/javascript">
        $('.form_date').datepicker({
            format: 'dd/mm/yyyy',
        }).on('changeDate', function (ev) {
            $(this).datepicker('hide');
        });
    </script>
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

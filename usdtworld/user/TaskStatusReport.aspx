<%@ Page Title="Task Status Report" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="TaskStatusReport.aspx.cs" Inherits="TaskStatusReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="css/account-pages.css" rel="stylesheet" />
    <link href="css/report-pages.css" rel="stylesheet" />
    <link href="css/task-pages.css" rel="stylesheet" />
    <link href="css/messages-page.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPageHeading" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentpageData" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
        <ProgressTemplate>
            <div class="sv-page-loader">
                <div class="sv-page-loader__card">
                    <div class="sv-page-loader__spinner"></div>
                    <span class="sv-page-loader__text">Loading task report...</span>
                </div>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="sv-account-page sv-report-page sv-task-page">
                <div class="sv-page-header sv-page-header--task-report">
                    <div class="sv-page-header__glow sv-page-header__glow--1"></div>
                    <div class="sv-page-header__glow sv-page-header__glow--2"></div>
                    <div class="sv-page-header__main">
                        <div class="sv-page-header__icon">
                            <i class="fa-solid fa-list-check"></i>
                        </div>
                        <div class="sv-page-header__text">
                            <h1>Task Status Report</h1>
                            <p>Track your assigned tasks and approval status</p>
                        </div>
                    </div>
                    <div class="sv-page-header__actions">
                        <a href="Dashboard.aspx" class="sv-page-breadcrumb">
                            <iconify-icon icon="solar:home-smile-angle-outline" class="icon"></iconify-icon>
                            Dashboard
                        </a>
                        <span class="sv-page-header__crumb">My Task / Status Report</span>
                    </div>
                </div>

                <nav class="sv-task-tabs" aria-label="Task sections">
                    <a href="URLTASK.aspx" class="sv-task-tabs__item"><i class="fa-solid fa-clipboard-list"></i> View Task</a>
                    <a href="TaskStatusReport.aspx" class="sv-task-tabs__item sv-task-tabs__item--active"><i class="fa-solid fa-chart-simple"></i> Task Status</a>
                </nav>

                <div class="sv-form-card">
                    <div class="sv-form-card__head">
                        <span class="sv-form-card__head-icon"><i class="fa-solid fa-magnifying-glass"></i></span>
                        <div class="sv-form-card__head-text">
                            <h3>Search Criteria</h3>
                            <p>Filter tasks by date range and user</p>
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
                                    <asp:TextBox ID="txtuserid" CssClass="form-control" runat="server"></asp:TextBox>
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
                        <span class="sv-form-card__head-icon"><i class="fa-solid fa-table-list"></i></span>
                        <div class="sv-form-card__head-text">
                            <h3>Task Details</h3>
                            <p>Submission, admin review and payment status</p>
                        </div>
                    </div>
                    <div class="sv-form-card__body">
                        <div class="sv-report-toolbar">
                            <p class="sv-report-toolbar__title">
                                <i class="fa-solid fa-table"></i> Task History
                            </p>
                        </div>

                        <div class="sv-msg-table-wrap">
                            <div class="sv-msg-table-scroll">
                                <asp:GridView ID="GridView1" runat="server" CssClass="sv-msg-table table table-borderless" Width="100%"
                                    AutoGenerateColumns="False" GridLines="None" OnRowDataBound="grdGetHelp_RowDataBound" OnRowCommand="GridView1_RowCommand">
                                    <Columns>
                                        <asp:TemplateField HeaderText="#">
                                            <ItemTemplate>
                                                <span class="sv-msg-sr"><%# Container.DataItemIndex + 1 %></span>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="User ID">
                                            <ItemTemplate>
                                                <span class="sv-txn-id"><%# Eval("userid") %></span>
                                                <asp:Label ID="lblid" runat="server" Text='<%# Eval("id") %>' Visible="false"></asp:Label>
                                                <asp:Label ID="LblStatusdefault" runat="server" Text='<%# Eval("status") %>' Visible="false"></asp:Label>
                                                <asp:Label ID="LbladminStatusdefault" runat="server" Text='<%# Eval("adminstatus") %>' Visible="false"></asp:Label>
                                                <asp:Label ID="LblpaidStatusdefault" runat="server" Text='<%# Eval("paidstatus") %>' Visible="false"></asp:Label>
                                                <asp:Label ID="LblImage" runat="server" Text='<%# Eval("img") %>' Visible="false"></asp:Label>
                                                <asp:Label ID="Label1pimg" runat="server" Text='<%# Eval("pimg") %>' Visible="false"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Assign Date">
                                            <ItemTemplate>
                                                <span class="sv-msg-date"><%# Eval("assigndate", "{0:dd/MM/yyyy}") %></span>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Panel Type">
                                            <ItemTemplate>
                                                <span class="sv-txn-type"><%# Eval("Paneltype") %></span>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Campaign">
                                            <ItemTemplate>
                                                <span class="sv-txn-desc" title='<%# Eval("Campaign") %>'><%# Eval("Campaign") %></span>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Upload">
                                            <ItemTemplate>
                                                <asp:HyperLink ID="HyperLink1" runat="server" Target="_blank" ToolTip="View uploaded image"
                                                    NavigateUrl='<%# Eval("Pimg", "~/ProductImage/{0}") %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Status">
                                            <ItemTemplate>
                                                <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("Status1") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Admin Status">
                                            <ItemTemplate>
                                                <asp:Label ID="lbladminStatus" runat="server" Text='<%# Eval("AdminStatus1") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Approved Date">
                                            <ItemTemplate>
                                                <span class="sv-msg-date"><%# Eval("admindate", "{0:dd/MM/yyyy}") %></span>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Paid Status">
                                            <ItemTemplate>
                                                <asp:Label ID="lblPaiStatus" runat="server" Text='<%# Eval("paidStatus1") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>

                <div id="DivPhotolarge" class="modal fade sv-purchase-modal sv-task-photo-modal" tabindex="-1" aria-hidden="true">
                    <div class="modal-dialog modal-lg modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">Task Image</h4>
                                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <asp:Image ID="ImageLarge" runat="server" CssClass="img-fluid" />
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="sv-btn-danger" data-bs-dismiss="modal">Close</button>
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
    <script src="js/user-modal.js"></script>
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

<%@ page title="Transaction Report" language="C#" masterpagefile="MasterPage.master" autoeventwireup="true" inherits="admin_UserReport, App_Web_0nrxdzsb" %>

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
                <div class="sv-page-header sv-page-header--report">
                    <div class="sv-page-header__glow sv-page-header__glow--1"></div>
                    <div class="sv-page-header__glow sv-page-header__glow--2"></div>
                    <div class="sv-page-header__main">
                        <div class="sv-page-header__icon">
                            <i class="fa-solid fa-receipt"></i>
                        </div>
                        <div class="sv-page-header__text">
                            <h1>Transaction Report</h1>
                            <p>Search and review your wallet transactions</p>
                        </div>
                    </div>
                    <div class="sv-page-header__actions">
                        <a href="Dashboard.aspx" class="sv-page-breadcrumb">
                            <iconify-icon icon="solar:home-smile-angle-outline" class="icon"></iconify-icon>
                            Dashboard
                        </a>
                        <span class="sv-page-header__crumb">Reports / Transaction Report</span>
                    </div>
                </div>

                <div class="sv-form-card">
                    <div class="sv-form-card__head">
                        <span class="sv-form-card__head-icon"><i class="fa-solid fa-magnifying-glass"></i></span>
                        <div class="sv-form-card__head-text">
                            <h3>Search Criteria</h3>
                            <p>Filter transactions by date range and user</p>
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
                        </div>

                        <div class="sv-report-actions">
                            <div class="sv-report-actions__left">
                                <asp:Button ID="btnSubmit" CssClass="sv-btn-primary" runat="server" Text="Search" OnClick="btnSubmit_Click" />
                                <asp:Button ID="btnCancel" CssClass="sv-btn-danger" runat="server" Text="Reset" OnClick="btnCancel_Click" />
                            </div>
                            <asp:ImageButton ID="imgExcel" runat="server" ImageUrl="~/img/excel-img.png" ToolTip="Download Excel" CssClass="sv-excel-btn" OnClick="imgExcel_Click" />
                        </div>
                    </div>
                </div>

                <div class="sv-form-card">
                    <div class="sv-form-card__head">
                        <span class="sv-form-card__head-icon"><i class="fa-solid fa-list"></i></span>
                        <div class="sv-form-card__head-text">
                            <h3>Transaction Details</h3>
                            <p>Summary and full transaction history</p>
                        </div>
                    </div>
                    <div class="sv-form-card__body">
                        <div class="sv-report-summary">
                            <div class="sv-report-stat sv-report-stat--credit">
                                <div class="sv-report-stat__glow"></div>
                                <div class="sv-report-stat__top">
                                    <span class="sv-report-stat__icon"><i class="fa-solid fa-arrow-down"></i></span>
                                    <span class="sv-report-stat__label">Total Income</span>
                                </div>
                                <div class="sv-report-stat__value">
                                    <asp:TextBox ID="LblCredited" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>
                                </div>
                            </div>
                            <div class="sv-report-stat sv-report-stat--debit">
                                <div class="sv-report-stat__glow"></div>
                                <div class="sv-report-stat__top">
                                    <span class="sv-report-stat__icon"><i class="fa-solid fa-arrow-up"></i></span>
                                    <span class="sv-report-stat__label">Total Deduct</span>
                                </div>
                                <div class="sv-report-stat__value">
                                    <asp:TextBox ID="LblDebited" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>
                                </div>
                            </div>
                            <div class="sv-report-stat sv-report-stat--balance">
                                <div class="sv-report-stat__glow"></div>
                                <div class="sv-report-stat__top">
                                    <span class="sv-report-stat__icon"><i class="fa-solid fa-wallet"></i></span>
                                    <span class="sv-report-stat__label">Balance</span>
                                </div>
                                <div class="sv-report-stat__value">
                                    <asp:TextBox ID="LblCurrentWallet" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="sv-report-toolbar">
                            <p class="sv-report-toolbar__title">
                                <i class="fa-solid fa-table"></i> All Transactions
                            </p>
                            <div class="sv-report-filter">
                                <span class="sv-report-filter__label">Show rows</span>
                                <asp:DropDownList ID="ddlRecordFilter" runat="server" CssClass="form-control" AutoPostBack="true"
                                    OnSelectedIndexChanged="ddlRecordFilter_SelectedIndexChanged">
                                    <asp:ListItem>All</asp:ListItem>
                                    <asp:ListItem>25</asp:ListItem>
                                    <asp:ListItem>50</asp:ListItem>
                                    <asp:ListItem>100</asp:ListItem>
                                    <asp:ListItem>500</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>

                        <div class="sv-report-table-wrap table-responsive">
                            <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover" Width="100%"
                                AutoGenerateColumns="False" AllowPaging="true" PageSize="25"
                                PagerSettings-Mode="NumericFirstLast" PagerSettings-Position="Bottom" PagerSettings-PageButtonCount="5"
                                PagerSettings-FirstPageText="&laquo; First" PagerSettings-PreviousPageText="&lsaquo; Prev"
                                PagerSettings-NextPageText="Next &rsaquo;" PagerSettings-LastPageText="Last &raquo;"
                                PagerStyle-CssClass="sv-grid-pager" PagerStyle-HorizontalAlign="Center"
                                OnPageIndexChanging="GridView1_PageIndexChanging" OnRowCommand="GridView1_RowCommand">
                                <Columns>
                                    <asp:TemplateField HeaderText="#">
                                        <ItemTemplate>
                                            <%# (GridView1.PageIndex * GridView1.PageSize) + Container.DataItemIndex + 1 %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Date">
                                        <ItemTemplate>
                                            <asp:Label ID="lbldate" runat="server" Text='<%#Eval("mentiondate","{0:dd/MM/yyyy hh:mm tt}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="User Id" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lbluserid" runat="server" Text='<%#Eval("userid") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Transaction Id">
                                        <ItemTemplate>
                                            <asp:Label ID="lblusername" runat="server" Text='<%#Eval("transactionid") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Credit Amount">
                                        <ItemTemplate>
                                            <asp:Label ID="lblmobile" runat="server" Text='<%#Eval("cramount") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Debit Amount">
                                        <ItemTemplate>
                                            <asp:Label ID="lblmobile" runat="server" Text='<%#Eval("dramount") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Type">
                                        <ItemTemplate>
                                            <asp:Label ID="lbltransactiontype" runat="server" Text='<%#Eval("transactiontype") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Description">
                                        <ItemTemplate>
                                            <asp:Label ID="lblemail" runat="server" Text='<%#Eval("Remark") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                        <div class="sv-report-pager-info">
                            <asp:Label ID="lblPagerInfo" runat="server" CssClass="sv-report-pager-info__text"></asp:Label>
                        </div>
                    </div>
                </div>
            </div>

        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="imgExcel" />
        </Triggers>
    </asp:UpdatePanel>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" runat="Server">
    <script type="text/javascript">
        $('.form_date').datepicker({
            format: 'dd/MM/yyyy',
        }).on('changeDate', function (ev) {
            $(this).datepicker('hide');
        });
    </script>
    <script src="../bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
    <script type="text/javascript">
        Sys.Application.add_load(LoadHandler);
        function LoadHandler() {
            $('.form_date').datepicker({
                format: 'dd/MM/yyyy',
            }).on('changeDate', function (ev) {
                $(this).datepicker('hide');
            });
        }
    </script>
</asp:Content>

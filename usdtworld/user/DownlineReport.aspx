<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="DownlineReport.aspx.cs" Inherits="admin_DownlineReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="css/account-pages.css" rel="stylesheet" />
    <link href="css/report-pages.css" rel="stylesheet" />
    <link href="css/messages-page.css" rel="stylesheet" />
    <link href="css/team-pages.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPageHeading" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentpageData" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="sv-account-page sv-report-page sv-team-page">
                <div class="sv-page-header sv-page-header--team">
                    <div class="sv-page-header__glow sv-page-header__glow--1"></div>
                    <div class="sv-page-header__glow sv-page-header__glow--2"></div>
                    <div class="sv-page-header__main">
                        <div class="sv-page-header__icon"><i class="fa-solid fa-sitemap"></i></div>
                        <div class="sv-page-header__text">
                            <h1>My Downline</h1>
                            <p>Explore your full team network by level</p>
                        </div>
                    </div>
                    <div class="sv-page-header__actions">
                        <a href="Dashboard.aspx" class="sv-page-breadcrumb">
                            <iconify-icon icon="solar:home-smile-angle-outline" class="icon"></iconify-icon>
                            Dashboard
                        </a>
                        <span class="sv-page-header__crumb">My Team / Downline</span>
                    </div>
                </div>

                <nav class="sv-team-tabs" aria-label="Team sections">
                    <a href="DirectDownlineReport.aspx" class="sv-team-tabs__item"><i class="fa-solid fa-user-check"></i> My Direct</a>
                    <a href="DownlineReport.aspx" class="sv-team-tabs__item sv-team-tabs__item--active"><i class="fa-solid fa-sitemap"></i> My Downline</a>
                    <a href="treeview.aspx" class="sv-team-tabs__item"><i class="fa-solid fa-diagram-project"></i> Tree View</a>
                </nav>

                <div class="sv-form-card">
                    <div class="sv-form-card__head">
                        <span class="sv-form-card__head-icon"><i class="fa-solid fa-magnifying-glass"></i></span>
                        <div class="sv-form-card__head-text">
                            <h3>Search Criteria</h3>
                            <p>Load downline members for a user</p>
                        </div>
                    </div>
                    <div class="sv-form-card__body">
                        <div class="row g-3">
                            <div class="col-md-6">
                                <div class="sv-field">
                                    <label class="sv-field__label"><i class="fa-solid fa-user"></i> User ID</label>
                                    <asp:TextBox ID="TxtUserId" CssClass="form-control" runat="server"></asp:TextBox>
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
                    <div class="sv-form-card__head sv-form-card__head--split">
                        <div class="sv-form-card__head-main">
                            <span class="sv-form-card__head-icon"><i class="fa-solid fa-list"></i></span>
                            <div class="sv-form-card__head-text">
                                <h3>Downline Details</h3>
                                <p>Full team list with levels</p>
                            </div>
                        </div>
                        <div class="sv-form-card__head-actions">
                            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/img/excel-img.png" Height="28" Width="28" ToolTip="Export Excel" CssClass="sv-excel-btn" OnClick="ExportToExcel" />
                        </div>
                    </div>
                    <div class="sv-form-card__body">
                        <div class="sv-msg-table-wrap">
                            <div class="sv-msg-table-scroll">
                                <asp:GridView ID="GridView1" runat="server" OnRowCommand="GridView1_RowCommand"
                                    OnPageIndexChanging="GridView1_PageIndexChanging"
                                    CssClass="sv-msg-table table table-borderless" Width="100%" GridLines="None"
                                    AutoGenerateColumns="False" EmptyDataText="No downline members found"
                                    AllowPaging="true" PageSize="25"
                                    PagerSettings-Mode="NumericFirstLast" PagerSettings-Position="Bottom" PagerSettings-PageButtonCount="5"
                                    PagerSettings-FirstPageText="&laquo; First" PagerSettings-PreviousPageText="&lsaquo; Prev"
                                    PagerSettings-NextPageText="Next &rsaquo;" PagerSettings-LastPageText="Last &raquo;"
                                    PagerStyle-CssClass="sv-grid-pager" PagerStyle-HorizontalAlign="Center">
                                    <EmptyDataTemplate>
                                        <div class="sv-team-tree-empty">
                                            <i class="fa-solid fa-sitemap"></i>
                                            <p>No downline data found. Click Search to load team.</p>
                                        </div>
                                    </EmptyDataTemplate>
                                    <Columns>
                                        <asp:TemplateField HeaderText="#">
                                            <ItemTemplate>
                                                <span class="sv-msg-sr"><%# (GridView1.PageIndex * GridView1.PageSize) + Container.DataItemIndex + 1 %></span>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="User ID">
                                            <ItemTemplate>
                                                <span class="sv-team-user-id"><%# Eval("userid") %></span>
                                                <asp:Label ID="lbluserid" runat="server" Visible="false" Text='<%# Eval("userid") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Name">
                                            <ItemTemplate>
                                                <span class="sv-team-name"><%# Eval("username") %></span>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Sponsor ID">
                                            <ItemTemplate>
                                                <span class="sv-team-user-id"><%# Eval("sponserid") %></span>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Topup">
                                            <ItemTemplate>
                                                <span class="sv-team-amount"><%# Eval("toupamount") %></span>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Level">
                                            <ItemTemplate>
                                                <span class="sv-team-level"><%# Eval("userlevel") %></span>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Action">
                                            <ItemStyle CssClass="sv-msg-col-file" />
                                            <HeaderStyle CssClass="sv-msg-col-file" />
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbteam" CommandName="myteam" CssClass="sv-team-action" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" runat="server">
                                                    <i class="fa-solid fa-users"></i> View Team
                                                </asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                        <div class="sv-report-pager-info">
                            <asp:Label ID="lblPagerInfo" runat="server" CssClass="sv-report-pager-info__text"></asp:Label>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="ImageButton1" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" runat="Server">
    <asp:UpdatePanel runat="server" ID="uplMaster" UpdateMode="Always">
        <ContentTemplate>
            <div id="myModal" class="modal fade sv-team-modal">
                <div class="modal-dialog modal-xl modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title"><i class="fa-solid fa-users" style="margin-right:8px;color:#c4b5fd;"></i>Sub Team Members</h4>
                            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close" onclick="Closepopup(); return false;"></button>
                        </div>
                        <div class="modal-body">
                            <div class="sv-msg-table-wrap">
                                <div class="sv-msg-table-scroll">
                                    <asp:GridView ID="GridView2" runat="server" CssClass="sv-msg-table table table-borderless" Width="100%" GridLines="None" AutoGenerateColumns="False">
                                        <Columns>
                                            <asp:TemplateField HeaderText="#">
                                                <ItemTemplate>
                                                    <span class="sv-msg-sr"><%# Container.DataItemIndex + 1 %></span>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="User ID">
                                                <ItemTemplate>
                                                    <span class="sv-team-user-id"><%# Eval("userid") %></span>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Name">
                                                <ItemTemplate>
                                                    <span class="sv-team-name"><%# Eval("username") %></span>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Sponsor ID">
                                                <ItemTemplate>
                                                    <span class="sv-team-user-id"><%# Eval("sponserid") %></span>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Level">
                                                <ItemTemplate>
                                                    <span class="sv-team-level"><%# Eval("userlevel") %></span>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" onclick="Closepopup()">Close</button>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

    <script type="text/javascript">
        function getTeamModal() {
            var el = document.getElementById('myModal');
            if (!el || typeof bootstrap === 'undefined') return null;
            return bootstrap.Modal.getOrCreateInstance(el);
        }

        function showModal() {
            var modal = getTeamModal();
            if (modal) modal.show();
        }

        function Closepopup() {
            var modal = getTeamModal();
            if (modal) {
                modal.hide();
                return;
            }

            var el = document.getElementById('myModal');
            if (el) {
                el.classList.remove('show');
                el.style.display = 'none';
                el.setAttribute('aria-hidden', 'true');
            }
            document.body.classList.remove('modal-open');
            document.body.style.paddingRight = '';
            var backdrops = document.querySelectorAll('.modal-backdrop');
            for (var i = 0; i < backdrops.length; i++) {
                backdrops[i].parentNode.removeChild(backdrops[i]);
            }
        }
    </script>
</asp:Content>

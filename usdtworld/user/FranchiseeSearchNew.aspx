<%@ Page Title="Franchisee Search" Language="C#" MasterPageFile="~/user/MasterPage.master" AutoEventWireup="true" CodeFile="FranchiseeSearchNew.aspx.cs" Inherits="FranchiseeSearchNew" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="css/account-pages.css" rel="stylesheet" />
    <link href="css/report-pages.css" rel="stylesheet" />
    <link href="css/purchase-pages.css" rel="stylesheet" />
    <link href="css/franchisee-pages.css" rel="stylesheet" />
    <link href="css/messages-page.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPageHeading" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentpageData" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="sv-account-page sv-report-page sv-purchase-page">
                <div class="sv-page-header sv-page-header--franchisee">
                    <div class="sv-page-header__glow sv-page-header__glow--1"></div>
                    <div class="sv-page-header__glow sv-page-header__glow--2"></div>
                    <div class="sv-page-header__main">
                        <div class="sv-page-header__icon">
                            <i class="fa-solid fa-store"></i>
                        </div>
                        <div class="sv-page-header__text">
                            <h1>Franchisee Search</h1>
                            <p>Find a franchisee and start your repurchase</p>
                        </div>
                    </div>
                    <div class="sv-page-header__actions">
                        <a href="Dashboard.aspx" class="sv-page-breadcrumb">
                            <iconify-icon icon="solar:home-smile-angle-outline" class="icon"></iconify-icon>
                            Dashboard
                        </a>
                        <span class="sv-page-header__crumb">Repurchase / Franchisee Search</span>
                    </div>
                </div>

                <nav class="sv-purchase-tabs" aria-label="Repurchase sections">
                    <a href="FranchiseeSearchNew.aspx" class="sv-purchase-tabs__item sv-purchase-tabs__item--active"><i class="fa-solid fa-magnifying-glass-location"></i> Find Franchisee</a>
                    <a href="PurchaseReport.aspx" class="sv-purchase-tabs__item"><i class="fa-solid fa-clipboard-list"></i> Purchase Report</a>
                </nav>

                <div class="sv-form-card sv-franchisee-search-card">
                    <div class="sv-form-card__head">
                        <span class="sv-form-card__head-icon"><i class="fa-solid fa-filter"></i></span>
                        <div class="sv-form-card__head-text">
                            <h3>Search Franchisee</h3>
                            <p>Filter by location to find nearby franchisee</p>
                        </div>
                    </div>
                    <div class="sv-form-card__body">
                        <asp:Label ID="Label2" CssClass="form-control" runat="server" Visible="false"></asp:Label>
                        <div class="row g-3">
                            <div class="col-md-4">
                                <div class="sv-field">
                                    <label class="sv-field__label"><i class="fa-solid fa-map"></i> State</label>
                                    <asp:DropDownList ID="ddstate" AutoPostBack="true" CssClass="form-control" runat="server" OnSelectedIndexChanged="ddstate_SelectedIndexChanged">
                                        <asp:ListItem Value="0">Select State</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="sv-field">
                                    <label class="sv-field__label"><i class="fa-solid fa-city"></i> City</label>
                                    <asp:DropDownList ID="ddcity" CssClass="form-control" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddcity_SelectedIndexChanged">
                                        <asp:ListItem Value="0">Select City</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="sv-field">
                                    <label class="sv-field__label"><i class="fa-solid fa-location-crosshairs"></i> Tehsil</label>
                                    <asp:DropDownList ID="ddlsttehsil" AutoPostBack="true" CssClass="form-control" runat="server" OnSelectedIndexChanged="DDlstTehsil_SelectedIndexChanged">
                                        <asp:ListItem Value="0">Select Tehsil</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="sv-field">
                                    <label class="sv-field__label"><i class="fa-solid fa-shop"></i> Market</label>
                                    <asp:DropDownList ID="ddlstmarket" CssClass="form-control" runat="server">
                                        <asp:ListItem Value="0">Select Market</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="sv-field">
                                    <label class="sv-field__label"><i class="fa-solid fa-envelope"></i> Pincode</label>
                                    <asp:TextBox ID="txtpincode" CssClass="form-control" runat="server" placeholder="Enter pincode"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="sv-report-actions">
                            <div class="sv-report-actions__left">
                                <asp:Button ID="Button1" runat="server" CssClass="sv-btn-primary" Text="Search Franchisee" OnClick="BtnSearchFranchisee_Click" />
                            </div>
                        </div>
                    </div>
                </div>

                <div class="sv-form-card">
                    <div class="sv-form-card__head">
                        <span class="sv-form-card__head-icon"><i class="fa-solid fa-list"></i></span>
                        <div class="sv-form-card__head-text">
                            <h3>Franchisee List</h3>
                            <p>View details or select franchisee to purchase</p>
                        </div>
                    </div>
                    <div class="sv-form-card__body">
                        <div class="sv-report-toolbar">
                            <p class="sv-report-toolbar__title">
                                <i class="fa-solid fa-table"></i> Available Franchisees
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
                                                <asp:Label ID="lblid" runat="server" Text='<%# Eval("id") %>' Visible="false"></asp:Label>
                                                <asp:Label ID="LblStateID" runat="server" Text='<%# Eval("stateid") %>' Visible="false"></asp:Label>
                                                <asp:Label ID="LblCityId" runat="server" Text='<%# Eval("cityid") %>' Visible="false"></asp:Label>
                                                <asp:Label ID="Lbltehsilid" runat="server" Text='<%# Eval("TehsilId") %>' Visible="false"></asp:Label>
                                                <asp:Label ID="Lblmarketid" runat="server" Text='<%# Eval("MarketID") %>' Visible="false"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Name">
                                            <ItemTemplate>
                                                <span class="sv-franchisee-name"><%# Eval("Username") %></span>
                                                <asp:Label ID="lbluserid" runat="server" Text='<%# Eval("userid") %>' Visible="false"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Address">
                                            <ItemTemplate>
                                                <span class="sv-franchisee-address" title='<%# Eval("Address") %>'><%# Eval("Address") %></span>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="City">
                                            <ItemTemplate>
                                                <span class="sv-franchisee-loc"><%# Eval("CityName") %></span>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Tehsil">
                                            <ItemTemplate>
                                                <span class="sv-franchisee-loc"><%# Eval("TehsilName") %></span>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Market">
                                            <ItemTemplate>
                                                <span class="sv-franchisee-loc"><%# Eval("MarketName") %></span>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="State">
                                            <ItemTemplate>
                                                <span class="sv-txn-type"><%# Eval("StateName") %></span>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Pincode">
                                            <ItemTemplate>
                                                <span class="sv-txn-id"><%# Eval("Pincode") %></span>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Mobile">
                                            <ItemTemplate>
                                                <span class="sv-franchisee-mobile"><i class="fa-solid fa-phone"></i> <%# Eval("Mobile") %></span>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Actions">
                                            <ItemTemplate>
                                                <div class="sv-franchisee-actions">
                                                    <asp:LinkButton ID="lbEdit1" CommandName="View"
                                                        CommandArgument='<%# Eval("StateId").ToString() + "_" + Eval("CityId").ToString() + "_" + Eval("id").ToString() %>'
                                                        runat="server" CssClass="sv-franchisee-action sv-franchisee-action--view" ToolTip="View Details">
                                                        <i class="fa-solid fa-eye"></i>
                                                    </asp:LinkButton>
                                                    <asp:HyperLink ID="HyperLink1" runat="server"
                                                        NavigateUrl='<%# string.Format("PurchaseItemRepurchase.aspx?FID={0}", HttpUtility.UrlEncode(Eval("userid").ToString() + "_" + "1" + "_" + "1")) %>'
                                                        CssClass="sv-franchisee-action sv-franchisee-action--cart" ToolTip="Purchase">
                                                        <i class="fa-solid fa-cart-shopping"></i>
                                                    </asp:HyperLink>
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>

                        <div class="sv-purchase-pager">
                            <div class="sv-purchase-pager__info">
                                <asp:Label ID="LblRecordCount" runat="server" Text=""></asp:Label>
                            </div>
                            <ul class="pagination">
                                <asp:Repeater ID="rptPager" runat="server">
                                    <ItemTemplate>
                                        <li class="paginate_button">
                                            <asp:LinkButton ID="lnkPage" runat="server" Text='<%# Eval("Text") %>' CommandArgument='<%# Eval("Value") %>'
                                                CssClass='<%# Convert.ToBoolean(Eval("Enabled")) ? "page_enabled" : "page_disabled" %>'
                                                OnClick="Page_Changed" OnClientClick='<%# !Convert.ToBoolean(Eval("Enabled")) ? "return false;" : "" %>'></asp:LinkButton>
                                        </li>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </ul>
                        </div>
                    </div>
                </div>

                <div id="Div_FDetails" class="modal fade sv-purchase-modal" tabindex="-1" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">Franchisee Details</h4>
                                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <div class="sv-franchisee-detail">
                                    <div class="sv-franchisee-detail__row">
                                        <span class="sv-franchisee-detail__label">Name</span>
                                        <span class="sv-franchisee-detail__value"><asp:Label ID="lblfname" runat="server"></asp:Label></span>
                                    </div>
                                    <div class="sv-franchisee-detail__row">
                                        <span class="sv-franchisee-detail__label">Mobile</span>
                                        <span class="sv-franchisee-detail__value"><asp:Label ID="lblmob" runat="server"></asp:Label></span>
                                    </div>
                                    <div class="sv-franchisee-detail__row">
                                        <span class="sv-franchisee-detail__label">Address</span>
                                        <span class="sv-franchisee-detail__value"><asp:Label ID="lbladdress" runat="server"></asp:Label></span>
                                    </div>
                                    <div class="sv-franchisee-detail__row sv-franchisee-detail__row--split">
                                        <span class="sv-franchisee-detail__label">State</span>
                                        <span class="sv-franchisee-detail__value"><asp:Label ID="lblstate" runat="server"></asp:Label></span>
                                        <span class="sv-franchisee-detail__label">City</span>
                                        <span class="sv-franchisee-detail__value"><asp:Label ID="lblcity" runat="server"></asp:Label></span>
                                    </div>
                                    <div class="sv-franchisee-detail__row">
                                        <span class="sv-franchisee-detail__label">Pincode</span>
                                        <span class="sv-franchisee-detail__value"><asp:Label ID="lblpincode" runat="server"></asp:Label></span>
                                    </div>
                                </div>
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
    <script src="js/user-modal.js"></script>
</asp:Content>

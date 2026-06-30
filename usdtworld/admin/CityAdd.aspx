<%@ Page Title="Add City" Language="C#" MasterPageFile="adminmaster.master" AutoEventWireup="true" CodeFile="CityAdd.aspx.cs" Inherits="admin_CityAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="css/admin-form-page.css" rel="stylesheet" />
    <script type="text/javascript">
        function validate() {
            if (document.getElementById("<%=ddcountry.ClientID%>").value == "0") {
                alert('Select Country');
                document.getElementById("<%=ddcountry.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=ddstate.ClientID%>").value == "0") {
                alert('Select State');
                document.getElementById("<%=ddstate.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtcityname.ClientID%>").value == "") {
                alert('Enter City Name');
                document.getElementById("<%=txtcityname.ClientID%>").focus();
                return false;
            }
            return true;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPageHeading" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentpageData" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1" DisplayAfter="200" DynamicLayout="false">
        <ProgressTemplate>
            <div class="adm-page-loader">
                <div class="adm-page-loader__card">
                    <div class="adm-page-loader__spinner"></div>
                    <span class="adm-page-loader__text">Saving city...</span>
                </div>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="adm-form-page">
                <div class="adm-page-head">
                    <div>
                        <h1 class="adm-page-head__title">Add City</h1>
                        <p class="mb-0 text-muted" style="font-size:0.85rem;">Manage cities under country and state</p>
                    </div>
                    <ol class="adm-page-head__breadcrumb">
                        <li><a href="Dashboard.aspx"><i class="fa-solid fa-house"></i></a></li>
                        <li><span class="sep">/</span></li>
                        <li>Utility Management</li>
                        <li><span class="sep">/</span></li>
                        <li class="active">Add City</li>
                    </ol>
                </div>

                <nav class="adm-util-tabs" aria-label="Utility management">
                    <a href="CountryAdd.aspx" class="adm-util-tabs__item"><i class="fa-solid fa-globe"></i> Country</a>
                    <a href="StateAdd.aspx" class="adm-util-tabs__item"><i class="fa-solid fa-map"></i> State</a>
                    <a href="CityAdd.aspx" class="adm-util-tabs__item adm-util-tabs__item--active"><i class="fa-solid fa-city"></i> City</a>
                    <a href="BankAdd.aspx" class="adm-util-tabs__item"><i class="fa-solid fa-building-columns"></i> Bank</a>
                    <a href="BankAccountAdd.aspx" class="adm-util-tabs__item"><i class="fa-solid fa-wallet"></i> Bank Account</a>
                    <a href="deductioncharge.aspx" class="adm-util-tabs__item"><i class="fa-solid fa-percent"></i> Deduction</a>
                    <a href="NewsAdd.aspx" class="adm-util-tabs__item"><i class="fa-solid fa-newspaper"></i> News</a>
                </nav>

                <div class="row">
                    <div class="col-12">
                        <div id="admMainForm" class="box box-primary adm-form-card">
                            <div class="box-header with-border">
                                <h3 class="box-title"><asp:Literal ID="litFormTitle" runat="server" Text="Add City" /></h3>
                            </div>
                            <div class="box-body">
                                <asp:Label ID="lblcityid" Visible="false" runat="server" Text=""></asp:Label>
                                <div class="adm-form-section">
                                    <h4 class="adm-form-section__title">
                                        <i class="fa-solid fa-city" aria-hidden="true"></i>
                                        City Details
                                    </h4>
                                    <div class="adm-form-section__grid">
                                        <div class="adm-field">
                                            <label class="adm-field-label" for="<%= ddcountry.ClientID %>">Select Country <span class="adm-field-label__req">*</span></label>
                                            <div class="adm-input-wrap">
                                                <i class="fa-solid fa-globe adm-input-wrap__icon" aria-hidden="true"></i>
                                                <asp:DropDownList ID="ddcountry" AutoPostBack="true" CssClass="form-control" runat="server" OnSelectedIndexChanged="ddcountry_SelectedIndexChanged">
                                                    <asp:ListItem Value="0">Select Country</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="adm-field">
                                            <label class="adm-field-label" for="<%= ddstate.ClientID %>">Select State <span class="adm-field-label__req">*</span></label>
                                            <div class="adm-input-wrap">
                                                <i class="fa-solid fa-map adm-input-wrap__icon" aria-hidden="true"></i>
                                                <asp:DropDownList ID="ddstate" CssClass="form-control" runat="server">
                                                    <asp:ListItem Value="0">Select State</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="adm-field">
                                            <label class="adm-field-label" for="<%= txtcityname.ClientID %>">City Name <span class="adm-field-label__req">*</span></label>
                                            <div class="adm-input-wrap">
                                                <i class="fa-solid fa-location-dot adm-input-wrap__icon" aria-hidden="true"></i>
                                                <asp:TextBox ID="txtcityname" CssClass="form-control" runat="server" placeholder="Enter city name"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="box-footer">
                                <asp:Button ID="btnSubmit" OnClientClick="return validate();" CssClass="btn btn-primary" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                                <asp:Button ID="btnUpdate" OnClientClick="return validate();" CssClass="btn btn-primary" runat="server" Text="Update" OnClick="btnUpdate_Click" Visible="false" />
                                <asp:Button ID="btnCancel" CssClass="btn btn-outline-secondary" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                            </div>
                        </div>
                    </div>

                    <div class="col-12">
                        <div class="box box-primary adm-table-card">
                            <div class="box-header with-border">
                                <h3 class="box-title">City List</h3>
                            </div>
                            <div class="box-body box-body--flush">
                                <div class="table-responsive">
                                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover mb-0" Width="100%" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand" OnRowDataBound="GridView1_RowDataBound" GridLines="None">
                                        <Columns>
                                            <asp:TemplateField HeaderText="#">
                                                <ItemTemplate>
                                                    <span class="adm-table__index"><%# Container.DataItemIndex + 1 %></span>
                                                    <asp:Label ID="lblid" runat="server" Visible="false" Text='<%# Eval("cityid") %>'></asp:Label>
                                                    <asp:Label ID="lblcountryid" runat="server" Visible="false" Text=""></asp:Label>
                                                    <asp:Label ID="lblstateid" runat="server" Visible="false" Text='<%# Eval("stateid") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Country Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblCountryname" runat="server" Text='<%# Eval("CountryName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="State Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblstatename" runat="server" Text='<%# Eval("statename") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="City Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblcityname" runat="server" Text='<%# Eval("cityname") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Action">
                                                <ItemStyle CssClass="text-center" />
                                                <HeaderStyle CssClass="text-center" />
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lbEdit" CommandName="edt" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" runat="server" CssClass="adm-action-btn" ToolTip="Edit">
                                                        <i class="fa-solid fa-pen" aria-hidden="true"></i>
                                                    </asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="ddcountry" EventName="SelectedIndexChanged" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>

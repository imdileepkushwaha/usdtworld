<%@ Page Title="Add Bank" Language="C#" MasterPageFile="adminmaster.master" AutoEventWireup="true" CodeFile="BankAdd.aspx.cs" Inherits="admin_BankAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="css/admin-form-page.css" rel="stylesheet" />
    <script type="text/javascript">
        function validate() {
            if (document.getElementById("<%=txtbankname.ClientID%>").value == "") {
                alert('Enter Bank Name');
                document.getElementById("<%=txtbankname.ClientID%>").focus();
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
                    <span class="adm-page-loader__text">Saving bank...</span>
                </div>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="adm-form-page">
                <div class="adm-page-head">
                    <div>
                        <h1 class="adm-page-head__title">Add Bank</h1>
                        <p class="mb-0 text-muted" style="font-size:0.85rem;">Manage bank names for account setup</p>
                    </div>
                    <ol class="adm-page-head__breadcrumb">
                        <li><a href="Dashboard.aspx"><i class="fa-solid fa-house"></i></a></li>
                        <li><span class="sep">/</span></li>
                        <li>Utility Management</li>
                        <li><span class="sep">/</span></li>
                        <li class="active">Add Bank</li>
                    </ol>
                </div>

                <nav class="adm-util-tabs" aria-label="Utility management">
                    <a href="CountryAdd.aspx" class="adm-util-tabs__item"><i class="fa-solid fa-globe"></i> Country</a>
                    <a href="StateAdd.aspx" class="adm-util-tabs__item"><i class="fa-solid fa-map"></i> State</a>
                    <a href="CityAdd.aspx" class="adm-util-tabs__item"><i class="fa-solid fa-city"></i> City</a>
                    <a href="BankAdd.aspx" class="adm-util-tabs__item adm-util-tabs__item--active"><i class="fa-solid fa-building-columns"></i> Bank</a>
                    <a href="BankAccountAdd.aspx" class="adm-util-tabs__item"><i class="fa-solid fa-wallet"></i> Bank Account</a>
                    <a href="deductioncharge.aspx" class="adm-util-tabs__item"><i class="fa-solid fa-percent"></i> Deduction</a>
                    <a href="NewsAdd.aspx" class="adm-util-tabs__item"><i class="fa-solid fa-newspaper"></i> News</a>
                </nav>

                <div class="row">
                    <div class="col-12">
                        <div id="admMainForm" class="box box-primary adm-form-card">
                            <div class="box-header with-border">
                                <h3 class="box-title"><asp:Literal ID="litFormTitle" runat="server" Text="Add Bank" /></h3>
                            </div>
                            <div class="box-body">
                                <asp:Label ID="lblbankid" Visible="false" runat="server" Text=""></asp:Label>
                                <div class="adm-form-section">
                                    <h4 class="adm-form-section__title">
                                        <i class="fa-solid fa-building-columns" aria-hidden="true"></i>
                                        Bank Details
                                    </h4>
                                    <div class="adm-form-section__grid">
                                        <div class="adm-field">
                                            <label class="adm-field-label" for="<%= txtbankname.ClientID %>">Bank Name <span class="adm-field-label__req">*</span></label>
                                            <div class="adm-input-wrap">
                                                <i class="fa-solid fa-landmark adm-input-wrap__icon" aria-hidden="true"></i>
                                                <asp:TextBox ID="txtbankname" CssClass="form-control" runat="server" placeholder="Enter bank name"></asp:TextBox>
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
                                <h3 class="box-title">Bank List</h3>
                            </div>
                            <div class="box-body box-body--flush">
                                <div class="table-responsive">
                                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover mb-0" Width="100%" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand" GridLines="None">
                                        <Columns>
                                            <asp:TemplateField HeaderText="#">
                                                <ItemTemplate>
                                                    <span class="adm-table__index"><%# Container.DataItemIndex + 1 %></span>
                                                    <asp:Label ID="lblid" runat="server" Visible="false" Text='<%# Eval("Bankid") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Bank Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblbankname" runat="server" Text='<%# Eval("BankName") %>'></asp:Label>
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
    </asp:UpdatePanel>
</asp:Content>

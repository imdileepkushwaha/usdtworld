<%@ Page Title="User Report" Language="C#" MasterPageFile="~/admin/adminmaster.master" AutoEventWireup="true" CodeFile="UserReport.aspx.cs" Inherits="admin_UserReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="css/admin-form-page.css" rel="stylesheet" />
    <script type="text/javascript">
        function validate2() {
            if (document.getElementById("<%=txtnameedit.ClientID%>").value == "") {
                alert('Enter Name');
                document.getElementById("<%=txtnameedit.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtmobileedit.ClientID%>").value == "") {
                alert('Enter Mobile');
                document.getElementById("<%=txtmobileedit.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtemailedit.ClientID%>").value == "") {
                alert('Enter Email');
                document.getElementById("<%=txtemailedit.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=txtaddressedit.ClientID%>").value == "") {
                alert('Enter Address');
                document.getElementById("<%=txtaddressedit.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=ddcountryedit.ClientID%>").value == "0") {
                alert('Select Country');
                document.getElementById("<%=ddcountryedit.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=ddstateedit.ClientID%>").value == "0") {
                alert('Select State');
                document.getElementById("<%=ddstateedit.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=ddcityedit.ClientID%>").value == "0") {
                alert('Select City');
                document.getElementById("<%=ddcityedit.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=ddareaedit.ClientID%>").value == "0") {
                alert('Select Area');
                document.getElementById("<%=ddareaedit.ClientID%>").focus();
                return false;
            }
            return true;
        }

        function isNumber(evt) {
            var charCode = (evt.which) ? evt.which : evt.keyCode;
            if (charCode > 31 && (charCode < 48 || charCode > 57)) return false;
            return true;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPageHeading" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentpageData" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1" DisplayAfter="200" DynamicLayout="false">
        <ProgressTemplate>
            <div class="adm-page-loader">
                <div class="adm-page-loader__card">
                    <div class="adm-page-loader__spinner"></div>
                    <span class="adm-page-loader__text">Loading members...</span>
                </div>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="adm-form-page">
                <div class="adm-page-head">
                    <div>
                        <h1 class="adm-page-head__title">User Report</h1>
                        <p class="mb-0 text-muted" style="font-size:0.85rem;">Search, filter and manage registered members</p>
                    </div>
                    <ol class="adm-page-head__breadcrumb">
                        <li><a href="Dashboard.aspx"><i class="fa-solid fa-house"></i></a></li>
                        <li><span class="sep">/</span></li>
                        <li>Member</li>
                        <li><span class="sep">/</span></li>
                        <li class="active">User Report</li>
                    </ol>
                </div>

                <div class="row">
                    <div class="col-12">
                        <div class="box box-primary adm-form-card">
                            <div class="box-header with-border">
                                <h3 class="box-title">Search Criteria</h3>
                            </div>
                            <div class="box-body">
                                <div class="adm-form-section">
                                    <h4 class="adm-form-section__title">
                                        <i class="fa-solid fa-magnifying-glass" aria-hidden="true"></i>
                                        Filter Members
                                    </h4>
                                    <div class="adm-form-section__grid">
                                        <div class="adm-field">
                                            <label class="adm-field-label" for="<%= txtuserid.ClientID %>">User Id</label>
                                            <div class="adm-input-wrap">
                                                <i class="fa-solid fa-id-card adm-input-wrap__icon" aria-hidden="true"></i>
                                                <asp:TextBox ID="txtuserid" CssClass="form-control" runat="server" placeholder="Member user id"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="adm-field">
                                            <label class="adm-field-label" for="<%= txtname.ClientID %>">Name</label>
                                            <div class="adm-input-wrap">
                                                <i class="fa-solid fa-user adm-input-wrap__icon" aria-hidden="true"></i>
                                                <asp:TextBox ID="txtname" CssClass="form-control" runat="server" placeholder="Member name"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="adm-field">
                                            <label class="adm-field-label" for="<%= txtmobile.ClientID %>">Mobile No</label>
                                            <div class="adm-input-wrap">
                                                <i class="fa-solid fa-mobile-screen adm-input-wrap__icon" aria-hidden="true"></i>
                                                <asp:TextBox ID="txtmobile" onkeypress="return isNumber(event)" CssClass="form-control" runat="server" placeholder="Mobile number"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="adm-field" style="display:none;">
                                            <label class="adm-field-label" for="<%= txtemail.ClientID %>">Email Id</label>
                                            <asp:TextBox ID="txtemail" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="adm-field">
                                            <label class="adm-field-label" for="<%= txtfromdate.ClientID %>">From Date</label>
                                            <asp:TextBox ID="txtfromdate" CssClass="form-control form_date" runat="server" placeholder="dd/mm/yyyy"></asp:TextBox>
                                        </div>
                                        <div class="adm-field">
                                            <label class="adm-field-label" for="<%= txttodate.ClientID %>">To Date</label>
                                            <asp:TextBox ID="txttodate" CssClass="form-control form_date" runat="server" placeholder="dd/mm/yyyy"></asp:TextBox>
                                        </div>
                                        <div class="adm-field">
                                            <label class="adm-field-label" for="<%= txtPinCode.ClientID %>">Area Pin Code</label>
                                            <div class="adm-input-wrap">
                                                <i class="fa-solid fa-location-dot adm-input-wrap__icon" aria-hidden="true"></i>
                                                <asp:TextBox ID="txtPinCode" runat="server" CssClass="form-control" MaxLength="6" placeholder="6-digit pin code"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="adm-field">
                                            <label class="adm-field-label" for="<%= ddstate.ClientID %>">State</label>
                                            <asp:DropDownList ID="ddstate" AutoPostBack="true" CssClass="form-control" runat="server" OnSelectedIndexChanged="ddstate_SelectedIndexChanged">
                                                <asp:ListItem Value="0">Select State</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="adm-field">
                                            <label class="adm-field-label" for="<%= ddcity.ClientID %>">City</label>
                                            <asp:DropDownList ID="ddcity" AutoPostBack="true" OnSelectedIndexChanged="ddcity_SelectedIndexChanged" CssClass="form-control" runat="server">
                                                <asp:ListItem Value="0">Select City</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="adm-field">
                                            <label class="adm-field-label" for="<%= ddarea.ClientID %>">Area</label>
                                            <asp:DropDownList ID="ddarea" CssClass="form-control" runat="server">
                                                <asp:ListItem Value="0">Select Area</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="adm-field">
                                            <label class="adm-field-label" for="<%= ddlPackage.ClientID %>">Package</label>
                                            <asp:DropDownList ID="ddlPackage" CssClass="form-control" runat="server">
                                                <asp:ListItem Value="0">Select Package</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="adm-field">
                                            <label class="adm-field-label" for="<%= ddlSponsor.ClientID %>">Sponsor Id</label>
                                            <asp:DropDownList ID="ddlSponsor" CssClass="form-control" runat="server">
                                                <asp:ListItem Value="0">Select Sponsor</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="adm-field">
                                            <label class="adm-field-label" for="<%= txtPanNumber.ClientID %>">Pan Number</label>
                                            <div class="adm-input-wrap">
                                                <i class="fa-solid fa-id-badge adm-input-wrap__icon" aria-hidden="true"></i>
                                                <asp:TextBox ID="txtPanNumber" runat="server" CssClass="form-control" placeholder="PAN number"></asp:TextBox>
                                            </div>
                                        </div>
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
                            <div class="box-header with-border d-flex justify-content-between align-items-center flex-wrap gap-2">
                                <h3 class="box-title mb-0">Member Details</h3>
                                <div class="d-flex align-items-center gap-2">
                                    <span class="text-muted small">Show</span>
                                    <asp:DropDownList ID="ddlRecordFilter" runat="server" AutoPostBack="true" OnSelectedIndexChanged="btnSubmit_Click" CssClass="form-control form-control-sm" Style="width:auto; min-width:88px;">
                                        <asp:ListItem>25</asp:ListItem>
                                        <asp:ListItem>50</asp:ListItem>
                                        <asp:ListItem>100</asp:ListItem>
                                        <asp:ListItem>500</asp:ListItem>
                                        <asp:ListItem>All</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="box-body box-body--flush">
                                <div class="table-responsive">
                                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover mb-0 adm-table--compact" Width="100%" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand" GridLines="None">
                                        <Columns>
                                            <asp:TemplateField HeaderText="#">
                                                <ItemTemplate>
                                                    <span class="adm-table__index"><%# Container.DataItemIndex + 1 %></span>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="User ID">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbluserid" runat="server" Text='<%# Eval("userid") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblusername" runat="server" Text='<%# Eval("username") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Password">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblpassword" runat="server" Text='<%# Eval("password") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Package">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblPackage" runat="server" Text='<%# Eval("packageName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="City">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblCity" runat="server" Text='<%# Eval("CityName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="State">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblState" runat="server" Text='<%# Eval("stateName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Mobile">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblmobile" runat="server" Text='<%# Eval("mobile") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Email">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblemail" runat="server" Text='<%# Eval("email") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Pan Number">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblPanCard" runat="server" Text='<%# Eval("PanNumber") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Pin Code">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblPincode" runat="server" Text='<%# Eval("Pincode") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Sponsor Id">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSponsorId" runat="server" Text='<%# Eval("SponserId") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Sponsor Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSponsorName" runat="server" Text='<%# Eval("sponserName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Recharge Wallet">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblRechargeWallet" runat="server" Text='<%# Eval("balanceamount") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Utility Wallet">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblUtilityWallet" runat="server" Text='<%# Eval("utilityBalance") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Reg. Date">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbldate" runat="server" Text='<%# Eval("mentiondate", "{0:dd/MM/yyyy}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="E-Pin Generation">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkEpinStatus" runat="server" CommandName="epin" CommandArgument='<%# Eval("userid") %>'
                                                        Text='<%# Eval("epinGenerationStatus").ToString() == "1" ? "Unblock" : "Block" %>'
                                                        CssClass='<%# Eval("epinGenerationStatus").ToString() == "1" ? "Active" : "Deactive" %>'
                                                        ToolTip='<%# "Click to " + (Eval("epinGenerationStatus").ToString() == "1" ? "Block" : "Unblock") %>'></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Status">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkActiveStatus" runat="server" CommandName="changeStatus" CommandArgument='<%# Eval("userid") %>'
                                                        Text='<%# Eval("activeStatus").ToString() == "1" ? "Active" : "Deactive" %>'
                                                        CssClass='<%# Eval("activeStatus").ToString() == "1" ? "Active" : "Deactive" %>'
                                                        ToolTip='<%# "Click to " + (Eval("activeStatus").ToString() == "1" ? "Deactive" : "Active") %>'></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="TopUp Status">
                                                <ItemTemplate>
                                                    <asp:Label ID="lnkActiveStatus1" runat="server" Text='<%# Eval("Status").ToString() == "1" ? "Topup" : "Free" %>'
                                                        CssClass='<%# Eval("Status").ToString() == "1" ? "Active" : "Deactive" %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Action">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lbEdit" CommandName="edt" CommandArgument="<%# ((GridViewRow)Container).RowIndex %>" runat="server" CssClass="adm-action-btn" ToolTip="Edit">
                                                        <i class="fa-solid fa-pen" aria-hidden="true"></i>
                                                    </asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Bank Details">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lbEditw" CommandArgument='<%# Eval("userid") %>' runat="server" Text="Edit" OnClick="btneditbank_click" CssClass="btn btn-sm btn-outline-primary"></asp:LinkButton>
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

            <div id="myModal" class="modal fade adm-modal" tabindex="-1" aria-hidden="true">
                <div class="modal-dialog modal-lg modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">
                                <i class="fa-solid fa-pen-to-square" aria-hidden="true"></i>
                                Edit User Details
                            </h4>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div class="adm-form-section__grid">
                                <div class="adm-field">
                                    <label class="adm-field-label" for="<%= txtnameedit.ClientID %>">Name</label>
                                    <asp:TextBox ID="txtnameedit" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="adm-field">
                                    <label class="adm-field-label" for="<%= txtmobileedit.ClientID %>">Mobile</label>
                                    <asp:TextBox ID="txtmobileedit" onkeypress="return isNumber(event)" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="adm-field">
                                    <label class="adm-field-label" for="<%= txtemailedit.ClientID %>">Email</label>
                                    <asp:TextBox ID="txtemailedit" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="adm-field">
                                    <label class="adm-field-label" for="<%= ddgenderedit.ClientID %>">Gender</label>
                                    <asp:DropDownList ID="ddgenderedit" CssClass="form-control" runat="server">
                                        <asp:ListItem Value="0">Select Gender</asp:ListItem>
                                        <asp:ListItem Value="Male">Male</asp:ListItem>
                                        <asp:ListItem Value="Female">Female</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="adm-field adm-form-grid--full">
                                    <label class="adm-field-label" for="<%= txtaddressedit.ClientID %>">Address</label>
                                    <asp:TextBox ID="txtaddressedit" TextMode="MultiLine" Rows="3" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="adm-field">
                                    <label class="adm-field-label" for="<%= ddcountryedit.ClientID %>">Country</label>
                                    <asp:DropDownList ID="ddcountryedit" AutoPostBack="true" CssClass="form-control" runat="server" OnSelectedIndexChanged="ddcountryedit_SelectedIndexChanged">
                                        <asp:ListItem Value="0">Select Country</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="adm-field">
                                    <label class="adm-field-label" for="<%= ddstateedit.ClientID %>">State</label>
                                    <asp:DropDownList ID="ddstateedit" AutoPostBack="true" CssClass="form-control" runat="server" OnSelectedIndexChanged="ddstateedit_SelectedIndexChanged">
                                        <asp:ListItem Value="0">Select State</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="adm-field">
                                    <label class="adm-field-label" for="<%= ddcityedit.ClientID %>">City</label>
                                    <asp:DropDownList ID="ddcityedit" AutoPostBack="true" OnSelectedIndexChanged="ddcityedit_SelectedIndexChanged" CssClass="form-control" runat="server">
                                        <asp:ListItem Value="0">Select City</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="adm-field">
                                    <label class="adm-field-label" for="<%= ddareaedit.ClientID %>">Other</label>
                                    <asp:TextBox ID="ddareaedit" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="adm-field">
                                    <label class="adm-field-label" for="<%= txtpincodeedit.ClientID %>">Pincode</label>
                                    <asp:TextBox ID="txtpincodeedit" onkeypress="return isNumber(event)" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="adm-field">
                                    <label class="adm-field-label" for="<%= txtdateofbirthedit.ClientID %>">Date of Birth</label>
                                    <asp:TextBox ID="txtdateofbirthedit" CssClass="form-control form_date" runat="server" placeholder="dd/mm/yyyy"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClientClick="return validate2();" CssClass="btn btn-primary" OnClick="btnUpdate_Click" />
                            <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" runat="Server">
    <script type="text/javascript">
        function showModal() {
            var el = document.getElementById('myModal');
            if (!el) return;
            if (window.bootstrap && bootstrap.Modal) {
                bootstrap.Modal.getOrCreateInstance(el, { backdrop: 'static', keyboard: false }).show();
            } else if (window.jQuery) {
                $('#myModal').modal({ backdrop: 'static', keyboard: false });
            }
        }

        function Closepopup() {
            var el = document.getElementById('myModal');
            if (!el) return;
            if (window.bootstrap && bootstrap.Modal) {
                var instance = bootstrap.Modal.getInstance(el);
                if (instance) instance.hide();
            } else if (window.jQuery) {
                $('#myModal').modal('hide');
            }
        }
    </script>
</asp:Content>

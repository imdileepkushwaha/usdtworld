<%@ Page Title="Franchisee Report" Language="C#" MasterPageFile="adminmaster.master" AutoEventWireup="true" CodeFile="FranchiseeReport.aspx.cs" Inherits="FranchiseeReport" %>

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
    <section class="content-header">
        <h1>Franchisee Report</h1>
        <ol class="breadcrumb">
            <li><a href="Dashboard.aspx"><i class="fa fa-dashboard"></i> Home</a></li>
            <li><a href="#">Franchisee</a></li>
            <li class="active">Franchisee Report</li>
        </ol>
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentpageData" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1" DisplayAfter="200" DynamicLayout="false">
        <ProgressTemplate>
            <div class="adm-page-loader">
                <div class="adm-page-loader__card">
                    <div class="adm-page-loader__spinner"></div>
                    <span class="adm-page-loader__text">Loading franchisees...</span>
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
                                <h3 class="box-title">Search Criteria</h3>
                            </div>
                            <div class="box-body">
                                <div class="adm-form-section__grid">
                                    <div class="adm-field">
                                        <label class="adm-field-label" for="<%= txtname.ClientID %>">Name</label>
                                        <div class="adm-input-wrap">
                                            <i class="fa-solid fa-user adm-input-wrap__icon" aria-hidden="true"></i>
                                            <asp:TextBox ID="txtname" CssClass="form-control" runat="server" placeholder="Franchisee name"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="adm-field">
                                        <label class="adm-field-label" for="<%= txtmobile.ClientID %>">Mobile No</label>
                                        <div class="adm-input-wrap">
                                            <i class="fa-solid fa-mobile-screen adm-input-wrap__icon" aria-hidden="true"></i>
                                            <asp:TextBox ID="txtmobile" onkeypress="return isNumber(event)" CssClass="form-control" runat="server" placeholder="Mobile number"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="adm-field">
                                        <label class="adm-field-label" for="<%= txtemail.ClientID %>">Email Id</label>
                                        <div class="adm-input-wrap">
                                            <i class="fa-solid fa-envelope adm-input-wrap__icon" aria-hidden="true"></i>
                                            <asp:TextBox ID="txtemail" CssClass="form-control" runat="server" placeholder="Email address"></asp:TextBox>
                                        </div>
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
                                        <label class="adm-field-label" for="<%= ddcountry.ClientID %>">Country</label>
                                        <asp:DropDownList ID="ddcountry" AutoPostBack="true" CssClass="form-control" runat="server" OnSelectedIndexChanged="ddcountry_SelectedIndexChanged">
                                            <asp:ListItem Value="0">Select Country</asp:ListItem>
                                        </asp:DropDownList>
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
                                        <label class="adm-field-label" for="<%= ddlsttehsil.ClientID %>">Tehsil</label>
                                        <asp:DropDownList ID="ddlsttehsil" CssClass="form-control" runat="server" AutoPostBack="true">
                                            <asp:ListItem Value="0">Select Tehsil</asp:ListItem>
                                        </asp:DropDownList>
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
                            <div class="box-header with-border">
                                <h3 class="box-title">Franchisee Details</h3>
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
                                            <asp:TemplateField HeaderText="Franchisee Type">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblusertype" runat="server" Text='<%# Eval("Type") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblusername" runat="server" Text='<%# Eval("username") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Password">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblpswd" runat="server" Text='<%# Eval("password") %>'></asp:Label>
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
                                            <asp:TemplateField HeaderText="City">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbladdress" runat="server" Text='<%# Eval("cityname") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Balance Amount">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbladdress1" runat="server" Text='<%# Eval("balanceamount") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Date">
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
                                            <asp:TemplateField HeaderText="Action">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lbEdit" CommandName="edt" CommandArgument="<%# ((GridViewRow)Container).RowIndex %>" runat="server" CssClass="adm-action-btn" ToolTip="Edit">
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

            <div id="myModal" class="modal fade adm-modal" tabindex="-1" aria-hidden="true">
                <div class="modal-dialog modal-lg modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">
                                <i class="fa-solid fa-pen-to-square" aria-hidden="true"></i>
                                Edit Franchisee Details
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
                                    <label class="adm-field-label" for="<%= ddltehsiledit.ClientID %>">Tehsil</label>
                                    <asp:DropDownList ID="ddltehsiledit" AutoPostBack="true" OnSelectedIndexChanged="ddltehsiledit_SelectedIndexChanged" CssClass="form-control" runat="server">
                                        <asp:ListItem Value="0">Select Tehsil</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:TextBox ID="ddareaedit" CssClass="form-control" runat="server" Visible="false"></asp:TextBox>
                                </div>
                                <div class="adm-field">
                                    <label class="adm-field-label" for="<%= ddlmarketedit.ClientID %>">Market</label>
                                    <asp:DropDownList ID="ddlmarketedit" CssClass="form-control" runat="server">
                                        <asp:ListItem Value="0">Select Market</asp:ListItem>
                                    </asp:DropDownList>
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
<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" Runat="Server">
    <script type="text/javascript">
        function initFranchiseeDatePicker() {
            if (!window.jQuery || !$.fn.datepicker) return;
            $('.form_date').each(function () {
                var $el = $(this);
                if ($el.data('datepicker')) return;
                $el.datepicker({
                    format: 'dd/mm/yyyy',
                    autoclose: true
                }).on('changeDate', function () {
                    $(this).datepicker('hide');
                });
            });
        }

        Sys.Application.add_load(function () {
            if (!window.jQuery) return;
            if ($.fn.datepicker) {
                initFranchiseeDatePicker();
                return;
            }
            var script = document.createElement('script');
            script.src = '../bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js';
            script.onload = initFranchiseeDatePicker;
            document.body.appendChild(script);
        });
    </script>
</asp:Content>

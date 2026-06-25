<%@ Page Title="KYC Approval" Language="C#" MasterPageFile="~/admin/adminmaster.master" AutoEventWireup="true" CodeFile="kycApprovalForUser.aspx.cs" Inherits="admin_kycApprovalForUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="css/admin-form-page.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPageHeading" Runat="Server">
    <section class="content-header">
        <h1>KYC Approval</h1>
        <ol class="breadcrumb">
            <li><a href="Dashboard.aspx"><i class="fa fa-dashboard"></i> Home</a></li>
            <li><a href="#">User</a></li>
            <li class="active">KYC Approval</li>
        </ol>
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentpageData" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <asp:UpdateProgress ID="updateProgress" runat="server" AssociatedUpdatePanelID="UpdatePanel1" DisplayAfter="200" DynamicLayout="false">
        <ProgressTemplate>
            <div class="adm-page-loader">
                <div class="adm-page-loader__card">
                    <div class="adm-page-loader__spinner"></div>
                    <span class="adm-page-loader__text">Loading KYC records...</span>
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
                                        <label class="adm-field-label" for="<%= txtname.ClientID %>">User ID</label>
                                        <div class="adm-input-wrap">
                                            <i class="fa-solid fa-id-card adm-input-wrap__icon" aria-hidden="true"></i>
                                            <asp:TextBox ID="txtname" CssClass="form-control" runat="server" placeholder="Search by user id"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="adm-field">
                                        <label class="adm-field-label" for="<%= txtmobile.ClientID %>">Mobile No</label>
                                        <div class="adm-input-wrap">
                                            <i class="fa-solid fa-mobile-screen adm-input-wrap__icon" aria-hidden="true"></i>
                                            <asp:TextBox ID="txtmobile" onkeypress="return isNumber(event)" CssClass="form-control" runat="server" placeholder="10 digit mobile"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="adm-field">
                                        <label class="adm-field-label" for="<%= txtemail.ClientID %>">Email Id</label>
                                        <div class="adm-input-wrap">
                                            <i class="fa-solid fa-envelope adm-input-wrap__icon" aria-hidden="true"></i>
                                            <asp:TextBox ID="txtemail" CssClass="form-control" runat="server" placeholder="user@example.com"></asp:TextBox>
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
                                        <label class="adm-field-label" for="<%= ddarea.ClientID %>">Area</label>
                                        <asp:DropDownList ID="ddarea" CssClass="form-control" runat="server">
                                            <asp:ListItem Value="0">Select Area</asp:ListItem>
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
                                <h3 class="box-title">KYC Details</h3>
                            </div>
                            <div class="box-body box-body--flush">
                                <div class="table-responsive">
                                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover mb-0" Width="100%"
                                        OnRowCommand="GridView1_RowCommand" AutoGenerateColumns="False" GridLines="None">
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
                                            <asp:TemplateField HeaderText="Sign Up Form">
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="imgSignUpForm" runat="server" AlternateText="Sign up form" CommandName="openSignUpImg" CssClass="adm-kyc-thumb" Height="80" Width="80" ImageUrl='<%# "../ProductImage/" + Eval("SignUpFormImage") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Sign Up Status">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSignUpStatus" runat="server" Text='<%# Eval("SignUpImgStatuss") %>' CssClass='<%# Eval("SignUpImgStatuss") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Action for Sign Up">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkApproveSignUp" runat="server" OnClientClick="return confirm('Sure to Approve Sign Up Form?');" Text="Approve |" CommandName="approve_signup" CommandArgument='<%# Eval("userid") %>'
                                                        Visible='<%# Eval("SignUpFormImage").ToString() != "" ? Eval("SignUpImgStatuss").ToString() == "Pending" ? true : false : false %>'></asp:LinkButton>
                                                    <asp:LinkButton ID="lnkRejectSignUp" runat="server" OnClientClick="return confirm('Sure to Reject Sign Up Form?');" Text="Reject" CommandName="reject_signup" CommandArgument='<%# Eval("userid") %>'
                                                        Visible='<%# Eval("SignUpFormImage").ToString() != "" ? Eval("SignUpImgStatuss").ToString() == "Pending" ? true : false : false %>'></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="PAN Card">
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="imgPANCard" runat="server" AlternateText="PAN card" CommandName="openPANImg" CssClass="adm-kyc-thumb" Height="80" Width="80" ImageUrl='<%# "../ProductImage/" + Eval("PanImage") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="PAN Card Status">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblPanStatus" runat="server" Text='<%# Eval("PanImgStatuss") %>' CssClass='<%# Eval("PanImgStatuss") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Action for PAN">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkApprovePan" runat="server" OnClientClick="return confirm('Sure to Approve PAN Card?');" Text="Approve |" CommandName="approve_pan" CommandArgument='<%# Eval("userid") %>'
                                                        Visible='<%# Eval("PanImage").ToString() != "" ? Eval("PanImgStatuss").ToString() == "Pending" ? true : false : false %>'></asp:LinkButton>
                                                    <asp:LinkButton ID="lnkRejectPan" runat="server" Text="Reject" OnClientClick="return confirm('Sure to Reject PAN Card?');" CommandName="reject_pan" CommandArgument='<%# Eval("userid") %>'
                                                        Visible='<%# Eval("PanImage").ToString() != "" ? Eval("PanImgStatuss").ToString() == "Pending" ? true : false : false %>'></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Cancel Cheque/Passbook">
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="imgCheque" runat="server" AlternateText="Cancel cheque" CommandName="openChequeImg" CssClass="adm-kyc-thumb" Height="80" Width="80" ImageUrl='<%# "../ProductImage/" + Eval("CancelCheque") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Cancel Cheque/Passbook Status">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblCheque" runat="server" Text='<%# Eval("ChequeImgStatuss") %>' CssClass='<%# Eval("ChequeImgStatuss") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Action for Cheque">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkApproveCheque" runat="server" OnClientClick="return confirm('Sure to Approve Cancel Cheque/Passbook?');" Text="Approve |" CommandName="approve_cheque" CommandArgument='<%# Eval("userid") %>'
                                                        Visible='<%# Eval("CancelCheque").ToString() != "" ? Eval("ChequeImgStatuss").ToString() == "Pending" ? true : false : false %>'></asp:LinkButton>
                                                    <asp:LinkButton ID="lnkRejectCheque" runat="server" OnClientClick="return confirm('Sure to Reject Cancel Cheque/Passbook?');" Text="Reject" CommandName="reject_cheque" CommandArgument='<%# Eval("userid") %>'
                                                        Visible='<%# Eval("CancelCheque").ToString() != "" ? Eval("ChequeImgStatuss").ToString() == "Pending" ? true : false : false %>'></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Aadhaar Card">
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="imgAadhaar" runat="server" AlternateText="Aadhaar front" CommandName="openAadhaarImg" CssClass="adm-kyc-thumb" Height="80" Width="80"
                                                        ImageUrl='<%# "../ProductImage/" + Eval("AadharImage") %>' />
                                                    <asp:ImageButton ID="imgAadhaarBack" runat="server" AlternateText="Aadhaar back" CommandName="openAadhaarImgBack" CssClass="adm-kyc-thumb" Height="80" Width="80"
                                                        ImageUrl='<%# "../ProductImage/" + Eval("AadharImageBack") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Aadhaar Card Status">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblAadhaarStatus" runat="server" Text='<%# Eval("AadharImgStatuss") %>' CssClass='<%# Eval("AadharImgStatuss") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Action for Aadhaar Card">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkApproveAadhaar" runat="server" OnClientClick="return confirm('Sure to Approve Aadhaar Card?');" Text="Approve |" CommandName="approve_aadhaar" CommandArgument='<%# Eval("userid") %>'
                                                        Visible='<%# Eval("AadharImage").ToString() != "" ? Eval("AadharImgStatuss").ToString() == "Pending" ? true : false : false %>'></asp:LinkButton>
                                                    <asp:LinkButton ID="lnkRejectAadhaar" runat="server" OnClientClick="return confirm('Sure to Reject Aadhaar Card?');" Text="Reject" CommandName="reject_aadhaar" CommandArgument='<%# Eval("userid") %>'
                                                        Visible='<%# Eval("AadharImage").ToString() != "" ? Eval("AadharImgStatuss").ToString() == "Pending" ? true : false : false %>'></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="GST" Visible="false">
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="imgGSTCard" runat="server" AlternateText="GST" CommandName="opengstImg" CssClass="adm-kyc-thumb" Height="80" Width="80" ImageUrl='<%# "../ProductImage/" + Eval("gstImage") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="GST Status" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblGstStatus" runat="server" Text='<%# Eval("IsGstApplicable") %>' CssClass='<%# Eval("IsGstApplicable") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Action for GST" Visible="false">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkApproveGST" runat="server" OnClientClick="return confirm('Sure to Approve GST?');" Text="Approve |" CommandName="approve_GST" CommandArgument='<%# Eval("userid") %>'
                                                        Visible='<%# Eval("gstImage").ToString() != "" ? Eval("IsGstApplicable").ToString() == "Pending" ? true : false : false %>'></asp:LinkButton>
                                                    <asp:LinkButton ID="lnkRejectGST" runat="server" Text="Reject" OnClientClick="return confirm('Sure to Reject GST?');" CommandName="reject_GST" CommandArgument='<%# Eval("userid") %>'
                                                        Visible='<%# Eval("gstImage").ToString() != "" ? Eval("IsGstApplicable").ToString() == "Pending" ? true : false : false %>'></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Edit">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkedit" runat="server" Text="Edit" CommandArgument='<%# Eval("userid") %>' OnClick="lnkedit_click"></asp:LinkButton>
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

            <div id="DivPhotolarge" class="modal fade adm-modal" tabindex="-1" aria-hidden="true">
                <div class="modal-dialog modal-lg modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">
                                <i class="fa-solid fa-image" aria-hidden="true"></i>
                                Document Preview
                            </h4>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body text-center">
                            <asp:Image ID="ImageLarge" runat="server" CssClass="img-fluid rounded" />
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" Runat="Server">
    <script type="text/javascript">
        function isNumber(evt) {
            var charCode = (evt.which) ? evt.which : evt.keyCode;
            if (charCode > 31 && (charCode < 48 || charCode > 57)) return false;
            return true;
        }

        function initKycDatePicker() {
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
                initKycDatePicker();
                return;
            }
            var script = document.createElement('script');
            script.src = '../bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js';
            script.onload = initKycDatePicker;
            document.body.appendChild(script);
        });
    </script>
</asp:Content>

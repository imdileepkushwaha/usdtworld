<%@ Page Title="Deposit Request Report" Language="C#" MasterPageFile="adminmaster.master" AutoEventWireup="true" CodeFile="DepositRequestReport.aspx.cs" Inherits="admin_DepositRequestReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="css/admin-form-page.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPageHeading" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentpageData" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <asp:UpdateProgress ID="updateProgress" runat="server" AssociatedUpdatePanelID="UpdatePanel1" DisplayAfter="200" DynamicLayout="false">
        <ProgressTemplate>
            <div class="adm-page-loader">
                <div class="adm-page-loader__card">
                    <div class="adm-page-loader__spinner"></div>
                    <span class="adm-page-loader__text">Loading fund requests...</span>
                </div>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="adm-form-page">
                <div class="adm-page-head">
                    <div>
                        <h1 class="adm-page-head__title">User Fund Request</h1>
                        <p class="mb-0 text-muted" style="font-size:0.85rem;">Review and approve member deposit / topup requests</p>
                    </div>
                    <ol class="adm-page-head__breadcrumb">
                        <li><a href="Dashboard.aspx"><i class="fa-solid fa-house"></i></a></li>
                        <li><span class="sep">/</span></li>
                        <li>Fund Request</li>
                        <li><span class="sep">/</span></li>
                        <li class="active">Deposit Request</li>
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
                                        Filter Requests
                                    </h4>
                                    <div class="adm-form-section__grid">
                                        <div class="adm-field">
                                            <label class="adm-field-label" for="<%= txtfromdate.ClientID %>">From Date</label>
                                            <asp:TextBox runat="server" CssClass="form-control form_date" ID="txtfromdate" placeholder="dd/mm/yyyy"></asp:TextBox>
                                        </div>
                                        <div class="adm-field">
                                            <label class="adm-field-label" for="<%= txttodate.ClientID %>">To Date</label>
                                            <asp:TextBox runat="server" CssClass="form-control form_date" ID="txttodate" placeholder="dd/mm/yyyy"></asp:TextBox>
                                        </div>
                                        <div class="adm-field">
                                            <label class="adm-field-label" for="<%= txtuserid.ClientID %>">User Id</label>
                                            <div class="adm-input-wrap">
                                                <i class="fa-solid fa-id-card adm-input-wrap__icon" aria-hidden="true"></i>
                                                <asp:TextBox ID="txtuserid" CssClass="form-control" runat="server" placeholder="Member user id"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="adm-field">
                                            <label class="adm-field-label" for="<%= ddstatus.ClientID %>">Status</label>
                                            <asp:DropDownList ID="ddstatus" CssClass="form-control" runat="server">
                                                <asp:ListItem Value="0">Select Status</asp:ListItem>
                                                <asp:ListItem>Pending</asp:ListItem>
                                                <asp:ListItem>Approved</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="box-footer">
                                <asp:Button ID="btnSubmit" CssClass="btn btn-primary" runat="server" Text="Search" OnClick="btnSubmit_Click" />
                                <asp:Button ID="btnCancel" CssClass="btn btn-outline-secondary" runat="server" Text="Cancel" OnClick="btncancel_Click" />
                            </div>
                        </div>
                    </div>

                    <div class="col-12">
                        <div class="box box-primary adm-table-card">
                            <div class="box-header with-border">
                                <h3 class="box-title mb-0">Request Details</h3>
                            </div>
                            <div class="box-body box-body--flush">
                                <div class="table-responsive">
                                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover mb-0 adm-table--compact" Width="100%" AutoGenerateColumns="False" OnRowDataBound="grdGetHelp_RowDataBound" OnRowCommand="GridView1_RowCommand" GridLines="None">
                                        <Columns>
                                            <asp:TemplateField HeaderText="#">
                                                <ItemTemplate>
                                                    <span class="adm-table__index"><%# Container.DataItemIndex + 1 %></span>
                                                    <asp:Label ID="lblId" runat="server" Visible="false" Text='<%# Eval("id") %>'></asp:Label>
                                                    <asp:Label ID="LblImage" runat="server" Visible="false" Text='<%# Eval("Image") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Date of Request">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblcreatingdate" runat="server" Text='<%# Eval("mentiondate", "{0:dd/MM/yyyy hh:mm tt}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="User ID">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbluserid" runat="server" Text='<%# Eval("userid") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="User Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblusername" runat="server" Text='<%# Eval("username") %>'></asp:Label>
                                                    <asp:Label ID="lblmobile" runat="server" Text='<%# Eval("mobile") %>' Visible="false"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Product Image" Visible="false">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkph" runat="server" CommandName="photolarge" CommandArgument="<%# ((GridViewRow)Container).RowIndex %>">
                                                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Image") %>' Height="40px" Width="40px" />
                                                    </asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Approve By">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblApproveBy" runat="server" Text='<%# Eval("ApproveBy") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Approve Date">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblreleasedate" runat="server" Text='<%# Eval("approvedate", "{0:dd/MM/yyyy hh:mm tt}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Amount">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblamount" runat="server" Text='<%# Eval("amount") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Status">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblstatus" runat="server" Text='<%# Eval("status") %>' CssClass="adm-status-badge"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Deposit Type">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblDepositBank" runat="server" Text='<%# Eval("AccountNo") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Mode" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblmode" runat="server" Text='<%# Eval("paymentmode") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Transaction Id">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbltransactionid" runat="server" Text='<%# Eval("OnlineTransactionId") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Narration" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbltransactionid123" runat="server" Text='<%# Eval("Narration") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Request Type" Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblrequestType1" runat="server" Text='<%# Eval("RequestType1") %>'></asp:Label>
                                                    <asp:Label ID="LblRequestType" runat="server" Text='<%# Eval("RequestType") %>' Visible="false"></asp:Label>
                                                    <asp:Label ID="LblRequestTo" runat="server" Text='<%# Eval("RequestTo") %>' Visible="false"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Action">
                                                <ItemTemplate>
                                                    <div class="d-flex flex-wrap gap-1">
                                                        <asp:LinkButton ID="btnApprove" CommandName="approve" OnClick="btnApprove_click" runat="server" CssClass="btn btn-sm btn-success">Approve</asp:LinkButton>
                                                        <asp:LinkButton ID="btnReject" CommandName="reject" OnClick="btnReject_click" runat="server" CssClass="btn btn-sm btn-outline-danger">Reject</asp:LinkButton>
                                                    </div>
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
                                Product Image
                            </h4>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body text-center">
                            <asp:Image ID="ImageLarge" runat="server" CssClass="img-fluid rounded" Style="max-height:420px; width:auto;" />
                        </div>
                        <div class="modal-footer">
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
        function showModal1() {
            var el = document.getElementById('DivPhotolarge');
            if (!el) return;
            if (window.bootstrap && bootstrap.Modal) {
                bootstrap.Modal.getOrCreateInstance(el, { backdrop: 'static', keyboard: false }).show();
            } else if (window.jQuery) {
                $('#DivPhotolarge').modal({ backdrop: 'static', keyboard: false });
            }
        }

        function Closepopup() {
            var el = document.getElementById('DivPhotolarge');
            if (!el) return;
            if (window.bootstrap && bootstrap.Modal) {
                var instance = bootstrap.Modal.getInstance(el);
                if (instance) instance.hide();
            } else if (window.jQuery) {
                $('#DivPhotolarge').modal('hide');
            }
        }
    </script>
</asp:Content>

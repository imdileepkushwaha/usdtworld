<%@ Page Title="" Language="C#" MasterPageFile="masterpage.master" AutoEventWireup="true" CodeFile="DownlineReport.aspx.cs" Inherits="admin_DownlineReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPageHeading" runat="Server">
    <section class="content-header">
        <h1>Downline Report     
        </h1>
        <ol class="breadcrumb">
            <li><a href="Dashboard.aspx"><i class="fa fa-dashboard"></i>Home</a></li>
            <li><a href="#">User</a></li>
            <li class="active">Downline Report</li>
        </ol>
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentpageData" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="row">
                <div class="col-md-12">
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">Search Crteria</h3>
                        </div>
                        <div class="box-body">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>User ID</label>
                                        <asp:TextBox ID="TxtUserId" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="box-footer">
                            <asp:Button ID="btnSubmit" CssClass="btn btn-primary" runat="server" Text="Search" OnClick="btnSubmit_Click" />
                            <asp:Button ID="btnCancel" CssClass="btn btn-danger" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                        </div>

                    </div>
                </div>
                <div class="col-md-12">
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">Details</h3>
                            <div style="float: right">
                                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="../user/img/excel123.png" Height="25px" Width="25px" OnClick="ExportToExcel" />
                            </div>
                        </div>
                        <div class="box-body">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <asp:GridView ID="GridView1" runat="server" OnRowCommand="GridView1_RowCommand" CssClass="table table-bordered table-hover dataTable" Width="100%" AutoGenerateColumns="False">
                                            <Columns>
                                                <asp:TemplateField HeaderText="#">
                                                    <ItemTemplate>
                                                        <%#Container.DataItemIndex+1 %>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="User ID">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lbluserid" runat="server" Text='<%#Eval("userid") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Name">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblusername" runat="server" Text='<%#Eval("username") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Sponser id">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblsponserid" runat="server" Text='<%#Eval("sponserid") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                 <asp:TemplateField HeaderText="Topup Amount">
     <ItemTemplate>
         <asp:Label ID="lbltopup" runat="server" Text='<%#Eval("toupamount") %>'></asp:Label>
     </ItemTemplate>
 </asp:TemplateField>
                                                                                                <asp:TemplateField HeaderText="Level">
    <ItemTemplate>
        <asp:Label ID="lbluserlevel" runat="server" Text='<%#Eval("userlevel") %>'></asp:Label>
    </ItemTemplate>
</asp:TemplateField>
                                              <%--  <asp:TemplateField HeaderText="Sponser Name">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblsponsername" runat="server" Text='<%#Eval("parentname") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>--%>
                                               <%-- <asp:TemplateField HeaderText="Sponser  id">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblsponserid" runat="server" Text='<%#Eval("SPONSERID") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Sponser Name">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblsponsername" runat="server" Text='<%#Eval("Sponsername") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>--%>
                                                 <asp:TemplateField HeaderText="Action">
                                        <ItemTemplate>
                                                <asp:LinkButton ID="lbteam" CommandName="myteam" CssClass="btn btn-success btn-sm" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" runat="server">View Team</asp:LinkButton>
                                           
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="box-footer">
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
            <div id="myModal" class="modal fade">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">Edit Delivery Status</h4>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="table-responsive">
                              <asp:GridView ID="GridView2" runat="server" CssClass="table table-bordered table-hover dataTable" Width="100%" AutoGenerateColumns="False">
                                            <Columns>
                                                <asp:TemplateField HeaderText="#">
                                                    <ItemTemplate>
                                                        <%#Container.DataItemIndex+1 %>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="User ID">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lbluserid" runat="server" Text='<%#Eval("userid") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Name">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblusername" runat="server" Text='<%#Eval("username") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Sponser id">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblsponserid" runat="server" Text='<%#Eval("sponserid") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                  <asp:TemplateField HeaderText="Level">
      <ItemTemplate>
          <asp:Label ID="lbllevel" runat="server" Text='<%#Eval("userlevel") %>'></asp:Label>
      </ItemTemplate>
  </asp:TemplateField>
                                             <%--   <asp:TemplateField HeaderText="Sponser Name">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblsponsername" runat="server" Text='<%#Eval("parentname") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>--%>
                                            
                                            </Columns>
                                        </asp:GridView>
                             </div>
                                    </div>
                                </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" onclick="Closepopup() ">Close</button>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

   

    <script type="text/javascript">
        function showModal() {
            $('#myModal').modal('show');
        }
        function Closepopup() {
            $('#myModal').modal('hide');
            $('body').removeClass('modal-open');
            $('body').css('padding-right', '0');
            $('.modal-backdrop').remove();
        }
    </script>
</asp:Content>


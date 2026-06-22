<%@ page title="" language="C#" masterpagefile="masterpage.master" autoeventwireup="true" inherits="TopupDetail, App_Web_u1sscnrz" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPageHeading" runat="Server">
   
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentpageData" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="row">
                <div class="col-md-12">
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">Details</h3>
                        </div>
                        <!-- /.box-header -->
                        <!-- form start -->
                        <div class="box-body">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group table-responsive">
                                        <asp:GridView ID="grdBank" runat="server" CssClass="table-bordered table-hover dataTable" Width="100%" AutoGenerateColumns="false" style="background-color:#000; color:#fff">
                                            <Columns>
                                                <asp:BoundField DataField="Userid" HeaderText="User Id" />
                                                <asp:BoundField DataField="entrydate" HeaderText="Topup Date" />
                                                <asp:BoundField DataField="PlanAmount" HeaderText="Plan Amount" />
                                              
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                            </div>
                            <!-- /.box-body -->
                        </div>
                    </div>
                </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" runat="Server">
</asp:Content>
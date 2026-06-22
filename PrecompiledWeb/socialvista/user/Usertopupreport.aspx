<%@ page title="Topup Report" language="C#" masterpagefile="masterpage.master" autoeventwireup="true" inherits="Usertopupreport, App_Web_w2cbuwev" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
	
      <script type="text/javascript">

          function validate() {
			  
			   if (document.getElementById("<%=txtuserid.ClientID%>").value == "") {

                alert('Enter Userid');
                // alert("Enter Rank No"); 
                document.getElementById("<%=txtuserid.ClientID%>").focus();
                return false;
            }
        }
		   </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPageHeading" runat="Server">
   <section class="content-header">
     <div class="d-flex flex-wrap align-items-center justify-content-between gap-3 mb-24">
         <h6 class="fw-semibold mb-0">Direct user Topup Report</h6>
         <ul class="d-flex align-items-center gap-2">
             <li class="fw-medium">
                 <a href="Dashboard.aspx" class="d-flex align-items-center gap-1 hover-text-primary">
                     <iconify-icon icon="solar:home-smile-angle-outline" class="icon text-lg"></iconify-icon>
                     Topup Request
                 </a>
             </li>
             <li>/</li>
             <li class="fw-medium"></li>
             <li>/</li>
             <li class="fw-medium">Direct user Topup Report</li>
         </ul>
     </div>
 </section>  
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentpageData" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdateProgress ID="updateProgress" runat="server">
        <ProgressTemplate>
            <div style="position: fixed; text-align: center; height: 100%; width: 100%; top: 0; right: 0; left: 0; z-index: 9999999; background-color: #000000; opacity: 0.7;">
                <asp:Image ID="imgUpdateProgress" runat="server" ImageUrl="~/img/ajax-loader.gif" AlternateText="Loading ..." ToolTip="Loading ..." Style="padding: 10px; position: fixed; top: 15%; left: 25%;" />
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

            <div class="row">
                <div class="col-md-12">

                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">Search Criteria</h3>
                        </div>

                        <div class="box-body">

                            <div class="row" style="Display:none";>

                                <div class="col-md-6">
                                    <div class="form-group">
                                         <label>To date</label>
                                         <asp:TextBox ID="txtFromDate" runat="server" placeholder="From Date" CssClass="form-control"></asp:TextBox>
                                    <cc1:CalendarExtender ID="CalFromDate" runat="server" TargetControlID="txtFromDate" Format="dd-MMM-yyyy"></cc1:CalendarExtender>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>To date</label>
                                          <asp:TextBox ID="txtToDate" runat="server" placeholder="To Date" CssClass="form-control"></asp:TextBox>
                                    <cc1:CalendarExtender ID="CalToDate" runat="server" TargetControlID="txtToDate" Format="dd-MMM-yyyy"></cc1:CalendarExtender>
                                    </div>
                                </div>

                            </div>
                            <div class="row">

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>User Id</label>
                                        <asp:TextBox ID="txtuserid" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6" style="display:none">
                                    <div class="form-group">
                                        <label>Status</label>
                                        <asp:DropDownList ID="ddstatus" CssClass="form-control" runat="server">
                                            <asp:ListItem Value="0">Select Status</asp:ListItem>
                                            <asp:ListItem>Pending</asp:ListItem>
                                            <asp:ListItem>Deliver</asp:ListItem>
                                              <asp:ListItem>Cancel</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>

                            </div>


                        </div>
                        <div class="box-footer">



                            <asp:Button ID="btnSubmit" CssClass="btn btn-primary" runat="server" Text="Search" OnClick="btnSubmit_Click" />
                            <asp:Button ID="btnCancel" CssClass="btn btn-danger" runat="server" Text="Cancel" OnClick="btncancel_Click" />
                        </div>

                    </div>
                </div>
                <div class="col-md-12">

                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">Details</h3>
                        </div>
                        <style>
                            .myLabel {
                                font-weight: bold;
                            }
                        </style>
                        <div class="box-body">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group table-responsive">
                                        <asp:GridView ID="GridView1" runat="server" CssClass="table-bordered table-hover dataTable" Width="100%" AutoGenerateColumns="False" OnRowDataBound="grdGetHelp_RowDataBound" OnRowCommand="GridView1_RowCommand" style="background-color:#000; color:#fff" >
                                            <Columns>
                                                <asp:TemplateField HeaderText="S.No">
                                                    <ItemTemplate>
                                                        <%#Container.DataItemIndex+1 %>
                                                      
                                                      
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                               
                                                <asp:TemplateField HeaderText="User Id">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lbluserid" runat="server" Text='<%#Eval("userid") %>'></asp:Label>
                                                      
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="User Name">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblusername" runat="server" Text='<%#Eval("username") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                 <asp:TemplateField HeaderText="Plan Amount ($)">
                                                    <ItemTemplate>
                                                      <asp:Label ID="lblmobile" runat="server" Text='<%#Eval("PlanAmount") %>' ></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Activation Date">
                                                    <ItemTemplate>
                                                      <asp:Label ID="lblmobiles" runat="server" Text='<%#Eval("entrydate") %>'></asp:Label>
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
                <div id="DivPhotolarge" class="modal fade">
                    <div class="modal-dialog">
                        <div class="modal-content">

                            <div class="modal-body">

                                <div class="form-group">

                                    <asp:Image ID="ImageLarge" runat="server" Width="570px" Height="400px" />
                                </div>

                            </div>
                            <div class="modal-footer">

                                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" runat="Server">
    <script type="text/javascript">
        $('.form_date').datepicker({
            format: 'dd/mm/yyyy',
        }).on('changeDate', function (ev) {
            $(this).datepicker('hide');
        });
    </script>
    <script src="../bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
    <script type="text/javascript">
        Sys.Application.add_load(LoadHandler);
        function LoadHandler() {
            $('.form_date').datepicker({
                format: 'dd/mm/yyyy',
            }).on('changeDate', function (ev) {
                $(this).datepicker('hide');
            });
        }
    </script>
    <script type="text/javascript">


        function showModal1() {
            $('#DivPhotolarge').modal({ backdrop: 'static', keyboard: false })
        }
        function Closepopup() {
            $('#DivPhotolarge').modal('hide');
            $('body').removeClass('modal-open');
            $('body').css('padding-right', '0');
            $('.modal-backdrop').remove();

        }
    </script>
</asp:Content>


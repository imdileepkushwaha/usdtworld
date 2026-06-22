<%@ page title="Binary Income Report" language="C#" masterpagefile="MasterPage.master" autoeventwireup="true" inherits="TaskStatusReport, App_Web_shn2h2tp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
 <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPageHeading" runat="Server">
    <section class="content-header">
      <h1>
     Task Status Report  
      </h1>
      <ol class="breadcrumb">
     <li><a href="Dashboard.aspx"><i class="fa fa-dashboard"></i> Home</a></li>
            <li><a href="#">Accounts</a></li>
        <li class="active">Task Status Report   </li>
      
      </ol>
    </section>   
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentpageData" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
      <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
        <ProgressTemplate>
            <div class="modal2">
                <div class="center2">
                    <img alt="" src="loader.gif" />
                </div>
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
                  
                          <div class="row">
                         <div class="col-md-4">
                             <div class="form-group">
                                 <label>From date :</label>
                                  <asp:TextBox ID="txtfromdate" CssClass="form-control form_date" runat="server"></asp:TextBox>
                             </div>
                         </div>
                         <div class="col-md-4">
                             <div class="form-group">
                                 <label>To date :</label>
                                   <asp:TextBox ID="txttodate"  CssClass="form-control form_date" runat="server"></asp:TextBox>
                             </div>
                         </div>
                               <div class="col-md-4">
                             <div class="form-group">
                                 <label>User ID :</label>
                                  <asp:TextBox ID="txtuserid"  CssClass="form-control" runat="server"></asp:TextBox>
                             </div>
                         </div>
                     </div>
                         
                          
                       </div>
                         <div class="box-footer">
                        
             

                              <asp:Button ID="btnSubmit"  CssClass="btn btn-primary" runat="server" Text="Search" OnClick="btnSubmit_Click" />
                                        <asp:Button ID="btnCancel" CssClass="btn btn-danger" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                    
              </div>


                  
              </div>


              <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">Details</h3>
            </div>
                   <div class="box-body">
                  
                          <div class="row" style="background-color:#000; color:#fff">
                         <div class="col-md-12">
                             <div class="form-group">
                                <asp:GridView ID="GridView1" runat="server" CssClass="table-bordered table-hover dataTable" Width="100%" AutoGenerateColumns="False"  OnRowDataBound="grdGetHelp_RowDataBound" OnRowCommand="GridView1_RowCommand">
                               <Columns>
                                    <asp:TemplateField HeaderText="#">
                                        <ItemTemplate>
                                            <%#Container.DataItemIndex+1 %>
                                          
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderText="User Id">
                                        <ItemTemplate>
                                            <asp:Label ID="lbluserid" runat="server" Text='<%#Eval("userid") %>'></asp:Label>
                                             <asp:Label ID="lblid" runat="server" Text='<%#Eval("id") %>' Visible="false"></asp:Label>
                                             <asp:Label ID="LblStatusdefault" runat="server" Text='<%#Eval("status") %>' Visible="false"></asp:Label>
                                              <asp:Label ID="LbladminStatusdefault" runat="server" Text='<%#Eval("adminstatus") %>' Visible="false"></asp:Label>
                                              <asp:Label ID="LblpaidStatusdefault" runat="server" Text='<%#Eval("paidstatus") %>' Visible="false"></asp:Label>
                                             <asp:Label ID="LblImage" runat="server" Text='<%#Eval("img") %>' Visible="false"></asp:Label>
                                             <asp:Label ID="Label1pimg" runat="server" Text='<%#Eval("pimg") %>' Visible="false"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                   <asp:TemplateField HeaderText="Task Assign Date">
                                        <ItemTemplate>
                                            <asp:Label ID="lbldate" runat="server" Text='<%#Eval("assigndate","{0:dd/MM/yyyy}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>         
                                     <asp:TemplateField HeaderText="Panel Type">
                                        <ItemTemplate>
                                              <asp:Label ID="lblpaneltype" runat="server" Text='<%#Eval("Paneltype") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>      
                                     <asp:TemplateField HeaderText="Campaign">
                                        <ItemTemplate>
                                              <asp:Label ID="lblCampaign" runat="server" Text='<%#Eval("Campaign") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>                                                                                                                    
                                    
                                      <asp:TemplateField HeaderText="Upload Image">
                                        <ItemTemplate>
                                              <asp:HyperLink ID="HyperLink1" runat="server" Target="_blank" CssClass="" ToolTip="Download Attachment" Text="View" NavigateUrl='<%# Eval("Pimg", "~/ProductImage/{0}") %>'/>
                                        </ItemTemplate>
                                    </asp:TemplateField>       
                                      <asp:TemplateField HeaderText="Status">
                                        <ItemTemplate>
                                              <asp:Label ID="lblStatus" runat="server" Text='<%#Eval("Status1") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>       
                                     <asp:TemplateField HeaderText="AdminStatus">
                                        <ItemTemplate>
                                              <asp:Label ID="lbladminStatus" runat="server" Text='<%#Eval("AdminStatus1") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>    
                                     <asp:TemplateField HeaderText="Admin approvedate">
                                        <ItemTemplate>
                                <asp:Label ID="lbladmindate" runat="server" Text='<%#Eval("admindate","{0:dd/MM/yyyy}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField> 
                                     <asp:TemplateField HeaderText="PaiStatus">
                                        <ItemTemplate>
                                              <asp:Label ID="lblPaiStatus" runat="server" Text='<%#Eval("paidStatus1") %>'></asp:Label>
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
                  </div>


             <div id="DivPhotolarge" class="modal fade">
                    <div class="modal-dialog">
                        <div class="modal-content" style="margin-top: 10%;">

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


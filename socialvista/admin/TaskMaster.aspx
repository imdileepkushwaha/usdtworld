<%@ Page Title="" Language="C#" MasterPageFile="adminmaster.master" AutoEventWireup="true" CodeFile="TaskMaster.aspx.cs" Inherits="admin_TaskMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
      <script type="text/javascript">
          function validate2() {
              // alert('sd');
              if (document.getElementById("<%=txtcitynameedit.ClientID%>").value == "") {

                    alert('Enter Task');
                    // alert("Enter Rank No"); 
                    document.getElementById("<%=txtcitynameedit.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=TxtamounrEdit.ClientID%>").value == "") {

                    alert('Enter Amount');
                    // alert("Enter Rank No"); 
                    document.getElementById("<%=TxtamounrEdit.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=TxttaskCount.ClientID%>").value == "0") {

                    alert('Enter Task Count');
                    // alert("Enter Rank No"); 
                    document.getElementById("<%=TxttaskCount.ClientID%>").focus();
                return false;
            }
        }
            </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPageHeading" Runat="Server">

       <div class="page-heading">
        <h1>Task Master</h1>
        <ol class="breadcrumb">
            <li><a href="Dashboard.aspx"><i class="fa fa-dashboard"></i>Home</a></li>
            <li><a href="#">Task Master</a></li>
            <li class="active">Task Master</li>
        </ol>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentpageData" Runat="Server">
      <asp:ScriptManager ID="ScriptManager2" runat="server"></asp:ScriptManager>
    <asp:UpdateProgress ID="updateProgress" runat="server">
        <ProgressTemplate>
            <div style="position: fixed; text-align: center; height: 100%; width: 100%; top: 0; right: 0; left: 0; z-index: 9999999; background-color: #000000; opacity: 0.7;">
                <asp:Image ID="imgUpdateProgress" runat="server" ImageUrl="~/img/ajax-loader.gif" AlternateText="Loading ..." ToolTip="Loading ..." Style="padding: 10px; position: fixed; top: 15%; left: 25%;" />
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
              <div class="panel panel-default">
                <div class="panel-heading">
                  Task Master
                </div>
                <div class="panel-body">
                    <div class="box-body">
                        <div class="form-group table-responsive">
                            <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-hover dataTable" Width="100%" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand">
                                <Columns>
                                    <asp:TemplateField HeaderText="#">
                                        <ItemTemplate>
                                            <%#Container.DataItemIndex+1 %>
                                            <asp:Label ID="lblid" runat="server" Visible="false" Text='<%#Eval("id") %>'></asp:Label>
                                               <asp:Label ID="lblstatus1" runat="server" Visible="false" Text='<%#Eval("Status") %>'></asp:Label>
                                         
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="task">
                                        <ItemTemplate>
                                            <asp:Label ID="lblCampaign" runat="server" Text='<%#Eval("task") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Status">
                                        <ItemTemplate>
                                            <asp:Label ID="lblStatus" runat="server" Text='<%#Eval("isactive").ToString()== "1" ? "Active" : "Deactive" %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Amount">
                                        <ItemTemplate>
                                            <asp:Label ID="lblAmount" runat="server" Text='<%#Eval("Amount") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                         <asp:TemplateField HeaderText="TaskCount">
                                        <ItemTemplate>
                                            <asp:Label ID="lblTaskCount" runat="server" Text='<%#Eval("TaskCount") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    
                                    <asp:TemplateField HeaderText="Action">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lbEdit" CommandName="edt" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" runat="server"><i class="icon fa fa-pencil-square-o" aria-hidden="true"></i></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
                <div id="myModal" class="modal fade">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">Edit Task</h4>
                            </div>
                            <div class="modal-body">
                                <div class="form-group">
                                  
                            <asp:Label ID="lblcityid" Visible="false" runat="server" Text=""></asp:Label>
                                     <label>Task</label>
                                    <asp:TextBox runat="server" class="form-control" ID="txtcitynameedit"></asp:TextBox>
                                </div>
                                
                                   <div class="form-group">
                                       <label>Status</label>
                                         <asp:DropDownList ID="ddlststatusedit" CssClass="form-control" runat="server">
                                        <asp:ListItem Value="1"> Active</asp:ListItem>
                                          <asp:ListItem Value="0">Deactive</asp:ListItem>
                                             </asp:DropDownList>
                                       </div>

                                   <div class="form-group">
                                         <label>Amount</label>
                                          <asp:TextBox runat="server" class="form-control" ID="TxtamounrEdit"></asp:TextBox>
                                       </div>
                                 <div class="form-group">
                                         <label>Task Count</label>
                                          <asp:TextBox runat="server" class="form-control" ID="TxttaskCount"></asp:TextBox>
                                       </div>
                            </div>
                            <div class="modal-footer">
                                <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClientClick="return validate2();" CssClass="btn btn-primary" OnClick="btnUpdate_Click" />
                                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </ContentTemplate>
        </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" Runat="Server">
     <script type="text/javascript">

         $(document).ready(function () {

             $("#ctl00_contentpageData_GridView1").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();

         });

         function showModal() {
             $('#myModal').modal({ backdrop: 'static', keyboard: false })
         }
         function Closepopup() {
             $('#myModal').modal('hide');
             $('body').removeClass('modal-open');
             $('body').css('padding-right', '0');
             $('.modal-backdrop').remove();

         }
    </script>
</asp:Content>


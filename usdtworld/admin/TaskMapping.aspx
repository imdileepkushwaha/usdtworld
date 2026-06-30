<%@ Page Title="" Language="C#" MasterPageFile="adminmaster.master" AutoEventWireup="true" CodeFile="TaskMapping.aspx.cs" Inherits="TaskMapping" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
      <script type="text/javascript">

          function validate() {

              if (document.getElementById("<%=ddCampain.ClientID%>").value == "0") {

                alert('Select Campaign');
                // alert("Enter Rank No"); 
                document.getElementById("<%=ddCampain.ClientID%>").focus();
                return false;
            }           
          
        }
        function validate2() {
            // alert('sd');
         
            if (document.getElementById("<%=ddlstcampaignedit.ClientID%>").value == "0") {

                alert('Select Campaign');
                // alert("Enter Rank No"); 
                document.getElementById("<%=ddlstcampaignedit.ClientID%>").focus();
                return false;
            }
           
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPageHeading" Runat="Server">
       <div class="page-heading">
        <h1>Daily Task Mapping</h1>
        <ol class="breadcrumb">
            <li><a href="Dashboard.aspx"><i class="fa fa-dashboard"></i>Home</a></li>
            <li><a href="#">Task Master</a></li>
            <li class="active">Daily Task Mapping</li>
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
                    Add Url
                </div>
                <div class="panel-body">
                    <div class="box-body">
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Select Campaign</label>
                                    <asp:DropDownList ID="ddCampain"  CssClass="form-control" runat="server">
                                        <asp:ListItem Value="0"> Select Campaign</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                               <div class="col-md-4">
                                <div class="form-group">
                                    <label>Total task</label>
                                     <asp:TextBox ID="TxtTotaltask" runat="server" Text="0" Enabled="false" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                             <div class="col-md-4">
                                <div class="form-group">
                                    <label>Task Remain</label>
                                     <asp:TextBox ID="Lbltaskleft" runat="server" Text="0" Enabled="false" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                         </div>
                           <div class="row">
                              <div class="col-md-4">
                                <div class="form-group">
                                    <asp:Button ID="btnSubmit" OnClientClick="return validate();" CssClass="btn btn-primary" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                        <asp:Button ID="btnCancel" CssClass="btn btn-danger" runat="server" Text="Cancel" />
                                </div>
                            </div>
                               <div class="col-md-4">
                                <div class="form-group">
                                  
                                    </div>
                                   </div>
                        </div>
                     
                    </div>
                    <div class="box-footer">
                       
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading">
                    Details
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
                                          
                                               <asp:Label ID="LaCampaignId" runat="server" Visible="false" Text='<%#Eval("CampaignId") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Campaign">
                                        <ItemTemplate>
                                            <asp:Label ID="lblCampaign" runat="server" Text='<%#Eval("name") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>                                  
                                       <asp:TemplateField HeaderText="Type">
                                        <ItemTemplate>
                                            <asp:Label ID="lblType" runat="server" Text='<%#Eval("Type") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Edit">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lbEdit" CommandName="edt" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" runat="server"><i class="icon fa fa-pencil-square-o" aria-hidden="true"></i></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                       <asp:TemplateField HeaderText="Delete">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lbEdit1" CommandName="delete" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" runat="server"><i class="icon fa fa-pencil-square-o" aria-hidden="true"></i></asp:LinkButton>
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
                                <h4 class="modal-title">Edit Task Mapping</h4>
                            </div>
                            <div class="modal-body">
                                <div class="form-group">
                                  
                            <asp:Label ID="lblcityid" Visible="false" runat="server" Text=""></asp:Label>

                                   
                                </div>
                                   <div class="form-group">
                                       <label>Campaign</label>
                                           <asp:DropDownList ID="ddlstcampaignedit"  CssClass="form-control" runat="server">
                                        <asp:ListItem Value="0"> Select Campaign</asp:ListItem>
                                    </asp:DropDownList>
                                       </div>
                                   <div class="form-group">
                                            <label>Type</label>
                                       <asp:DropDownList ID="DDLsttype"  CssClass="form-control" runat="server">
                                        <asp:ListItem Value="WEB"> WEB</asp:ListItem>
                                            <asp:ListItem Value="APP">APP</asp:ListItem>
                                    </asp:DropDownList>
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


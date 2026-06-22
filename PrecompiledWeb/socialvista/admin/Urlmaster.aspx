<%@ page title="" language="C#" masterpagefile="adminmaster.master" autoeventwireup="true" inherits="admin_Urlmaster, App_Web_xaf2lnhz" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
      <script type="text/javascript">

          function validate() {

              if (document.getElementById("<%=ddCampain.ClientID%>").value == "0") {

                alert('Select Campaign');
                // alert("Enter Rank No"); 
                document.getElementById("<%=ddCampain.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=ddStatus.ClientID%>").value == "0") {

                alert('Select Status');
                // alert("Enter Rank No"); 
                document.getElementById("<%=ddStatus.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=TxtUrl.ClientID%>").value == "") {

                alert('Enter URL');
                // alert("Enter Rank No"); 
                document.getElementById("<%=TxtUrl.ClientID%>").focus();
                return false;
            }
        }
        function validate2() {
            // alert('sd');
            if (document.getElementById("<%=txtcitynameedit.ClientID%>").value == "") {

                alert('Enter Url');
                // alert("Enter Rank No"); 
                document.getElementById("<%=txtcitynameedit.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=ddlstcampaignedit.ClientID%>").value == "0") {

                alert('Select Campaign');
                // alert("Enter Rank No"); 
                document.getElementById("<%=ddlstcampaignedit.ClientID%>").focus();
                return false;
            }
            if (document.getElementById("<%=ddlststatusedit.ClientID%>").value == "0") {

                alert('Select Status');
                // alert("Enter Rank No"); 
                document.getElementById("<%=ddlststatusedit.ClientID%>").focus();
                return false;
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPageHeading" Runat="Server">
       <div class="page-heading">
        <h1>URL Master</h1>
        <ol class="breadcrumb">
            <li><a href="Dashboard.aspx"><i class="fa fa-dashboard"></i>Home</a></li>
            <li><a href="#">Set-URL Master</a></li>
            <li class="active">URL Master</li>
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
                                    <label>Select Status</label>
                                    <asp:DropDownList ID="ddStatus" CssClass="form-control" runat="server">
                                        <asp:ListItem Value="1"> Active</asp:ListItem>
                                          <asp:ListItem Value="0">Deactive</asp:ListItem>
                                       
                                    </asp:DropDownList>
                                </div>
                            </div>
                              <div class="col-md-4">
                                <div class="form-group">
                                    <label>Enter Url</label>
                                    <asp:TextBox ID="TxtUrl" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                     
                    </div>
                    <div class="box-footer">
                        <asp:Button ID="btnSubmit" OnClientClick="return validate();" CssClass="btn btn-primary" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                        <asp:Button ID="btnCancel" CssClass="btn btn-danger" runat="server" Text="Cancel" />
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
                                              <asp:Label ID="LablblStatus" runat="server" Visible="false" Text='<%#Eval("status") %>'></asp:Label>
                                               <asp:Label ID="LaCampaignId" runat="server" Visible="false" Text='<%#Eval("CampaignId") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Campaign">
                                        <ItemTemplate>
                                            <asp:Label ID="lblCampaign" runat="server" Text='<%#Eval("CampaignName") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="url">
                                        <ItemTemplate>
                                            <asp:Label ID="lblurl" runat="server" Text='<%#Eval("url") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="ChannelId">
                                        <ItemTemplate>
                                            <asp:Label ID="lblChannelId" runat="server" Text='<%#Eval("ChannelId") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                         <asp:TemplateField HeaderText="Status">
                                        <ItemTemplate>
                                            <asp:Label ID="lblStatus1" runat="server" Text='<%#Eval("Status1") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                       <asp:TemplateField HeaderText="Entrydate">
                                        <ItemTemplate>
                                            <asp:Label ID="lblEntrydate" runat="server" Text='<%#Eval("Entrydate") %>'></asp:Label>
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
                                <h4 class="modal-title">Edit Url Details</h4>
                            </div>
                            <div class="modal-body">
                                <div class="form-group">
                                  
                            <asp:Label ID="lblcityid" Visible="false" runat="server" Text=""></asp:Label>

                                    <asp:TextBox runat="server" class="form-control" ID="txtcitynameedit"></asp:TextBox>
                                </div>
                                   <div class="form-group">
                                           <asp:DropDownList ID="ddlstcampaignedit"  CssClass="form-control" runat="server">
                                        <asp:ListItem Value="0"> Select Campaign</asp:ListItem>
                                    </asp:DropDownList>
                                       </div>
                                   <div class="form-group">
                                         <asp:DropDownList ID="ddlststatusedit" CssClass="form-control" runat="server">
                                        <asp:ListItem Value="1"> Active</asp:ListItem>
                                          <asp:ListItem Value="0">Deactive</asp:ListItem>
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


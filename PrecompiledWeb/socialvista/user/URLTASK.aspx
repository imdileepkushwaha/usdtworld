<%@ page title="" language="C#" masterpagefile="~/user/usermaster.master" autoeventwireup="true" inherits="URLTASK, App_Web_farxqaeb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPageHeading" runat="Server">
    <section class="content-header">
        <h1>User Task</h1>
        <ol class="breadcrumb">
            <li><a href="Dashboard.aspx"><i class="fa fa-dashboard"></i>Home</a></li>
            <li><a href="#">My Task</a></li>
            <li class="active">User Task</li>
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
                            <h3 class="box-title">Task Details</h3>
                        </div>
                   <div class="box-body">
<div class="row">
                  
                 
                <div class="form-group table-responsive">
                  <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-hover dataTable" Width="100%" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand"  >
                                <Columns>
                                <asp:TemplateField HeaderText="#">
                                    <ItemTemplate>
                                        <%#Container.DataItemIndex+1 %>
                                        <asp:Label ID="lblid" runat="server" Visible="false" Text='<%#Eval("id") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                           <asp:TemplateField HeaderText="Task No">
                               <ItemTemplate>
                                     <asp:Label ID="lblCountryname" runat="server"  Text='<%#Eval("TasknoID") %>'></asp:Label>
                               </ItemTemplate>
                           </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Assigndate">
                               <ItemTemplate>
                                     <asp:Label ID="lblstatename" runat="server"  Text='<%#Eval("Assigndate") %>'></asp:Label>
                               </ItemTemplate>
                           </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Day">
                               <ItemTemplate>
                                     <asp:Label ID="lblcityname" runat="server"  Text='<%#Eval("Dayname") %>'></asp:Label>
                               </ItemTemplate>
                           </asp:TemplateField>
                                          <asp:TemplateField HeaderText="Action">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lbEdit" CommandName="edt"  CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"  runat="server"><i class="icon fa fa-pencil-square-o" aria-hidden="true"></i></asp:LinkButton>
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
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" runat="Server">
</asp:Content>

<%@ page title="" language="C#" masterpagefile="adminmaster.master" autoeventwireup="true" inherits="admin_DownlineReport, App_Web_y1bjnat5" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPageHeading" runat="Server">
 <section class="content-header">
      <h1>
       User Report     
      </h1>
      <ol class="breadcrumb">
     <li><a href="Dashboard.aspx"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">Retailer</a></li>
        <li class="active">User Report</li>
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
                    <div class="widgets-container">
                        <div class="form-horizontal">
                            <fieldset>
                             
                                     <div class="row form-group">
                                    <div class="col-md-3">User Id</div>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="txtuserid" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                  <%--  <div class="col-md-3">Pool No</div>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="txtpoolno" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>--%>
                                         
                                    <div class="col-md-3">Level No</div>
                                    <div class="col-md-3">
                                         <asp:DropDownList ID="ddpoolno" CssClass="form-control" runat="server">
                                            <asp:ListItem Value="0">Select Pool</asp:ListItem>
                                            <asp:ListItem value="1">5$</asp:ListItem>
                                            <asp:ListItem value="2">25$</asp:ListItem>
                                            <asp:ListItem value="3">150$</asp:ListItem>
                                            <asp:ListItem value="4">600$</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                        </div>
                                 <div class="row form-group">
                                   
                                </div>
                              
                                <hr />
                                <div class="row form-group">
                                    <div class="col-md-12">
                                        <asp:Button ID="btnSubmit"  CssClass="btn btn-success" runat="server" Text="Search" OnClick="btnSubmit_Click" />
                                        <asp:Button ID="btnCancel" CssClass="btn btn-danger" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                                    </div>
                                </div>
                            </fieldset>
                        </div>
                    </div>
                </div>
            </div>
           <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">Autopool List</h3>
                        </div>

                        <div class="box-body">
                    <div class="widgets-container">

                        <div class="table-responsive">

                            <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-hover" Width="100%" AutoGenerateColumns="False" OnRowDataBound="GridView1_RowDataBound">
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
                                      <asp:TemplateField HeaderText="Standing Position">
                                        <ItemTemplate>
                                            <asp:Label ID="lblstanding" runat="server" Text='<%#Eval("standingposition") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                   
                                    <asp:TemplateField HeaderText="Parent Id">
                                        <ItemTemplate>
                                            <asp:Label ID="lblsponserid" runat="server" Text='<%#Eval("parentuserid") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Parent Name">
                                        <ItemTemplate>
                                            <asp:Label ID="lblsponsername" runat="server" Text='<%#Eval("parentname") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                     <asp:TemplateField HeaderText="Pool No">
                                        <ItemTemplate>
                                            <asp:Label ID="lblpoolno" runat="server" Text='<%#Eval("poolid") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderText="Level No">
                                        <ItemTemplate>
                                            <asp:Label ID="lbllevelno" runat="server" Text='<%#Eval("userlevel") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                   
                                    
                                   
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" Runat="Server">
</asp:Content>


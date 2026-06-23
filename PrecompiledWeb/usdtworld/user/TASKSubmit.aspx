<%@ page title="" language="C#" masterpagefile="~/user/usermaster.master" autoeventwireup="true" inherits="TASKSubmit, App_Web_etllp144" %>

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
                 <div class="row">
                <div class="col-md-12">
                    <div class="box box-primary text-white">

                        <div class="box-body text-white">

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>User Id :</label>
                                        <asp:TextBox ID="txtuserid" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>
                                        <asp:Label ID="lbltaskid" runat="server" Text="Label" Visible="false"></asp:Label>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                         <label>URL Link :</label>
                                        <asp:HyperLink ID="HyperLink1" runat="server" Target="_blank" CssClass="form-control">Refresh URL to another tab</asp:HyperLink>                                       
                                        
                                    </div>
                                </div>
                            </div>
                             <div class="row">
                                <div class="col-md-6">
                                        <div class="form-group">
                             <label>Upload Snapshot :</label>
                                 <asp:FileUpload ID="panUpload" runat="server" />    
                                    </div>
                                 </div>
                             </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">


                                        <asp:Button ID="btnSubmit" CssClass="btn btn-primary" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                                        <asp:Button ID="btnCancel" CssClass="btn btn-danger" runat="server" Text="Back" OnClick="btnCancel_Click" />
                                    </div>
                                </div>
                                
                            </div>


                        </div>
                    </div>
                    
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">Report</h3>
                        </div>
                        <div class="box-body">
                            <iframe id="f1" runat="server" style="height: 500px; width: 100%; border: 0px;"></iframe>

                            


                        </div>
                    </div>
                </div>
            </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
          <Triggers>

            <asp:PostBackTrigger ControlID="btnSubmit" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" runat="Server">
</asp:Content>

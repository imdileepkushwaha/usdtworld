<%@ page title="" language="C#" masterpagefile="masterpage.master" autoeventwireup="true" inherits="user_ActivateUserToWallet, App_Web_s2gvt0bk" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <script type="text/javascript">
        function validate() {
            if (document.getElementById("<%=txtuserid.ClientID%>").value == "") {
                  alert('Enter User Id');
                  // alert("Enter Rank No"); 
                  document.getElementById("<%=txtuserid.Text%>").focus();
                   return false;
               }
               if (document.getElementById("<%=txtusername.ClientID%>").value == "") {
                  alert('Enter User Name');
                  // alert("Enter Rank No"); 
                  document.getElementById("<%=txtusername.ClientID%>").focus();
                   return false;
               }
           }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPageHeading" Runat="Server">
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentpageData" Runat="Server">
     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="row text-light">
                <div class="col-md-12">
                    <div class="box box-primary">
                        <div class="box-header with-border text-light">
                            <h3 class="box-title">Activate User With Wallet </h3>
                        </div>
                        <div class="box-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>User Id :</label>
                                        <asp:TextBox ID="txtuserid" Enabled="false" AutoPostBack="true" runat="server" CssClass="form-control" OnTextChanged="txtuserid_TextChanged" />
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>User Name :</label>
                                        <asp:TextBox ID="txtusername" Enabled="false" runat="server" CssClass="form-control" />
                                    </div>
                                </div>
                            </div>


                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Activate UserID :</label>
                                        <asp:TextBox ID="txttransferuserid" AutoPostBack="true" runat="server" CssClass="form-control" OnTextChanged="txttransferuserid_TextChanged" />
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Activate User Name :</label>
                                        <asp:TextBox ID="txttransferusername" runat="server" CssClass="form-control" />
                                    </div>
                                </div>
                            </div>
                              <div class="row">
                               
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Wallet Balance :</label>
                                        <asp:TextBox ID="txtbalance" Enabled="false" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>

                                  <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Amount :</label>
                                        <asp:TextBox ID="txtamount" Text="" Enabled="true" CssClass="form-control" runat="server" AutoPostBack="true" OnTextChanged="txtamount_TextChanged"></asp:TextBox>
                                    </div>
                                </div>
                            </div>

                              <div class="row" style="display:none">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Select Plan :</label>
                                        <asp:DropDownList ID="ddplan" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddplan_SelectedIndexChanged" runat="server"></asp:DropDownList>
                                    </div>
                                </div>
                                
                            </div>
                              
                         
                            
                        </div>
                        <div class="box-footer">
                            <asp:Button ID="btnSubmit" OnClientClick="return validate();" CssClass="btn btn-primary" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                            <asp:Button ID="btnCancel" OnClick="btnCancel_Click1" CssClass="btn btn-danger" runat="server" Text="Cancel" />
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" Runat="Server">
</asp:Content>

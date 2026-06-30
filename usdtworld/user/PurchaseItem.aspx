<%@ Page Title="Purchase Item" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="PurchaseItem.aspx.cs" Inherits="admin_PurchaseItem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="css/account-pages.css" rel="stylesheet" />
    <link href="css/purchase-pages.css" rel="stylesheet" />
    <link href="css/messages-page.css" rel="stylesheet" />
    <script>
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
        function BeginRequestHandler(sender, args) { var oControl = args.get_postBackElement(); oControl.disabled = true; }
    </script>
    <script type="text/javascript">
        function gettotal() {
            var Quantity = 0, Amount = 0;
            if (document.getElementById("<%=TxtQuantity.ClientID%>").value != "") {
                Quantity = document.getElementById("<%=TxtQuantity.ClientID%>").value;
            }
            if (document.getElementById("<%=TxtAmount.ClientID%>").value != "") {
                Amount = document.getElementById("<%=TxtAmount.ClientID%>").value;
            }
            document.getElementById("<%=TxtTotalAmount.ClientID%>").innerText = Quantity * Amount;
        }

        function validate() {
            if (document.getElementById("<%=TxtQuantity.ClientID%>").value == "") {
                alert('Enter Quantity');
                document.getElementById("<%=TxtQuantity.ClientID%>").focus();
                return false;
            }
            return true;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPageHeading" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentpageData" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="sv-account-page sv-purchase-page">
                <div class="sv-page-header sv-page-header--purchase">
                    <div class="sv-page-header__glow sv-page-header__glow--1"></div>
                    <div class="sv-page-header__glow sv-page-header__glow--2"></div>
                    <div class="sv-page-header__main">
                        <div class="sv-page-header__icon">
                            <i class="fa-solid fa-cart-shopping"></i>
                        </div>
                        <div class="sv-page-header__text">
                            <h1>Purchase Product</h1>
                            <p>Browse products and add to your cart</p>
                        </div>
                    </div>
                    <div class="sv-page-header__actions">
                        <div class="sv-purchase-balance">
                            <i class="fa-solid fa-wallet"></i>
                            <span>Shopping Balance</span>
                            <span class="sv-purchase-balance__value"><i class="fa-solid fa-indian-rupee-sign"></i> <asp:Label ID="LblUtility" runat="server" Text="Balance"></asp:Label></span>
                        </div>
                        <a href="Dashboard.aspx" class="sv-page-breadcrumb">
                            <iconify-icon icon="solar:home-smile-angle-outline" class="icon"></iconify-icon>
                            Dashboard
                        </a>
                        <span class="sv-page-header__crumb">Repurchase / Purchase Product</span>
                    </div>
                </div>

                <div style="display:none">
                    <asp:Label ID="Lblbalance" runat="server" Text="Balance"></asp:Label>
                </div>

                <nav class="sv-purchase-tabs" aria-label="Repurchase sections">
                    <a href="PurchaseItem.aspx" class="sv-purchase-tabs__item sv-purchase-tabs__item--active"><i class="fa-solid fa-cart-shopping"></i> Purchase Product</a>
                    <a href="PurchaseReport.aspx" class="sv-purchase-tabs__item"><i class="fa-solid fa-clipboard-list"></i> Purchase Report</a>
                </nav>

                <asp:Panel ID="PurchasePanel" runat="server" Visible="false">
                    <div class="sv-form-card sv-purchase-cart">
                        <div class="sv-form-card__head">
                            <span class="sv-form-card__head-icon"><i class="fa-solid fa-basket-shopping"></i></span>
                            <div class="sv-form-card__head-text">
                                <h3>Your Cart</h3>
                                <p>Review items before checkout</p>
                            </div>
                        </div>
                        <div class="sv-form-card__body">
                            <asp:TextBox ID="txtuserid" CssClass="form-control" runat="server" Visible="false"></asp:TextBox>

                            <div class="sv-msg-table-wrap">
                                <div class="sv-msg-table-scroll">
                                    <asp:GridView ID="GridView1" runat="server" CssClass="sv-msg-table table table-borderless" Width="100%"
                                        AutoGenerateColumns="False" GridLines="None" OnRowCommand="GridView1_RowCommand"
                                        ShowFooter="true" OnRowDataBound="GridView1_RowDataBound">
                                        <Columns>
                                            <asp:TemplateField HeaderText="#">
                                                <ItemTemplate>
                                                    <span class="sv-msg-sr"><%# Container.DataItemIndex + 1 %></span>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Image">
                                                <ItemTemplate>
                                                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("Image") %>' Height="40px" Width="40px" CssClass="rounded" />
                                                    <asp:Label ID="LblProductImageG" runat="server" Text='<%# Eval("Image") %>' Visible="false"></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Product Code">
                                                <ItemTemplate>
                                                    <asp:Label ID="LblCatId" runat="server" Text='<%# Eval("CatID") %>' Visible="false"></asp:Label>
                                                    <span class="sv-txn-id"><asp:Label ID="LblProductCodeG" runat="server" Text='<%# Eval("ProductId") %>'></asp:Label></span>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Product Name">
                                                <ItemTemplate>
                                                    <span class="sv-txn-desc"><asp:Label ID="LblProductNameG" runat="server" Text='<%# Eval("ProductName") %>'></asp:Label></span>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Amount/Piece">
                                                <ItemTemplate>
                                                    <span class="sv-txn-amount sv-txn-amount--credit"><asp:Label ID="LblProductAmountG" runat="server" Text='<%# Eval("Amount") %>'></asp:Label></span>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="BV">
                                                <ItemTemplate>
                                                    <span class="sv-txn-type"><asp:Label ID="LblBv" runat="server" Text='<%# Eval("BV") %>'></asp:Label></span>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Qty">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblQuantity" runat="server" Text='<%# Eval("Quantity") %>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <strong>Total:</strong>
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Amount">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblTotalAmount" runat="server" Text='<%# Eval("TotalAmount") %>'></asp:Label>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <asp:Label ID="lblGrandTotal" runat="server" Text="" CssClass="sv-txn-amount sv-txn-amount--credit"></asp:Label>
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lbEdit" CommandName="edt" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"
                                                        runat="server" CssClass="sv-action-btn sv-action-btn--edit" ToolTip="Edit">
                                                        <i class="fa-solid fa-pen"></i>
                                                    </asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lbDelete" CommandName="del" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"
                                                        runat="server" CssClass="sv-action-btn sv-action-btn--delete" ToolTip="Remove">
                                                        <i class="fa-solid fa-trash"></i>
                                                    </asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>

                            <div class="row g-3 mt-2">
                                <div class="col-md-3">
                                    <div class="sv-field">
                                        <label class="sv-field__label">Total Purchase</label>
                                        <asp:TextBox ID="TxtTotalpurchase" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="sv-field">
                                        <label class="sv-field__label">Courier Charge</label>
                                        <asp:TextBox ID="TxtShipping" CssClass="form-control" runat="server" Enabled="false" Text="150.00"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="sv-field">
                                        <label class="sv-field__label">Total Amount</label>
                                        <asp:TextBox ID="TXTTTAmount" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="sv-field">
                                        <label class="sv-field__label">Wallet Type</label>
                                        <asp:DropDownList ID="DDLSTWallet" runat="server" CssClass="form-control">
                                            <asp:ListItem Value="1">Main Wallet</asp:ListItem>
                                            <asp:ListItem Value="2">Shopping Wallet</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>

                            <div class="sv-form-actions sv-form-actions--end mt-3">
                                <asp:HiddenField ID="HDTotal" runat="server" />
                                <asp:Button ID="btnCancel" CssClass="sv-btn-danger" runat="server" Text="Remove All" OnClick="btnCancel_Click" />
                                <asp:Button ID="btnSubmit" CssClass="sv-btn-primary" runat="server" Text="Checkout" OnClick="btnSubmit_Click" />
                            </div>
                        </div>
                    </div>
                </asp:Panel>

                <div class="sv-form-card">
                    <div class="sv-form-card__head">
                        <span class="sv-form-card__head-icon"><i class="fa-solid fa-store"></i></span>
                        <div class="sv-form-card__head-text">
                            <h3>Product Catalog</h3>
                            <p>Select products to add to cart</p>
                        </div>
                    </div>
                    <div class="sv-form-card__body">
                        <div class="sv-product-grid">
                            <asp:Repeater ID="dlCustomers" runat="server" OnItemCommand="Repeater1_ItemCommand">
                                <ItemTemplate>
                                    <div class="sv-product-card">
                                        <div class="sv-product-card__shine" aria-hidden="true"></div>
                                        <div class="sv-product-card__media">
                                            <div class="sv-product-card__img-wrap">
                                                <img src='<%# Eval("Image") %>' alt="Product" loading="lazy" />
                                            </div>
                                            <span class="sv-product-card__id">
                                                #<asp:Label ID="lblid" runat="server" Text='<%# Eval("ProductId") %>'></asp:Label>
                                            </span>
                                            <span class="sv-product-card__bv">
                                                <i class="fa-solid fa-chart-line"></i>
                                                BV <%# Eval("BV") %>
                                            </span>
                                            <asp:Label ID="lblim" runat="server" Text='<%# Eval("Image") %>' Visible="false"></asp:Label>
                                            <asp:HiddenField ID="HDBV" runat="server" Value='<%# Eval("BV") %>' />
                                            <asp:HiddenField ID="HDCategory" runat="server" Value='<%# Eval("CategoryID") %>' />
                                        </div>
                                        <div class="sv-product-card__body">
                                            <h5 class="sv-product-card__title">
                                                <asp:Label ID="lblstatename" runat="server" Text='<%# Eval("ProductName") %>'></asp:Label>
                                            </h5>
                                            <div class="sv-product-card__price-row">
                                                <span class="sv-product-card__price-label">Price</span>
                                                <div class="sv-product-card__price">
                                                    <i class="fa-solid fa-indian-rupee-sign"></i>
                                                    <asp:Label ID="lblstatename1" runat="server" Text='<%# Eval("Amount") %>'></asp:Label>
                                                </div>
                                            </div>
                                            <div class="sv-product-card__actions">
                                                <asp:LinkButton ID="lnkph" runat="server" CssClass="sv-product-card__btn sv-product-card__btn--view"
                                                    CommandName="photolarge" CommandArgument='<%# Eval("ProductId") %>'>
                                                    <i class="fa-solid fa-eye"></i>
                                                    <span>View</span>
                                                </asp:LinkButton>
                                                <asp:LinkButton ID="LinkButton1" runat="server" CssClass="sv-product-card__btn sv-product-card__btn--cart"
                                                    CommandName="BuyProduct" CommandArgument='<%# Eval("ProductId") %>'>
                                                    <i class="fa-solid fa-cart-plus"></i>
                                                    <span>Add to Cart</span>
                                                </asp:LinkButton>
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>

                        <div class="sv-purchase-pager">
                            <div class="sv-purchase-pager__info">
                                <asp:Label ID="LblRecordCount" runat="server" Text=""></asp:Label>
                            </div>
                            <ul class="pagination">
                                <asp:Repeater ID="rptPager" runat="server">
                                    <ItemTemplate>
                                        <li class="paginate_button">
                                            <asp:LinkButton ID="lnkPage" runat="server" Text='<%# Eval("Text") %>' CommandArgument='<%# Eval("Value") %>'
                                                CssClass='<%# Convert.ToBoolean(Eval("Enabled")) ? "page_enabled" : "page_disabled" %>'
                                                OnClick="Page_Changed" OnClientClick='<%# !Convert.ToBoolean(Eval("Enabled")) ? "return false;" : "" %>'></asp:LinkButton>
                                        </li>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </ul>
                        </div>
                    </div>
                </div>

                <div id="myModal" class="modal fade sv-purchase-modal" tabindex="-1" aria-hidden="true">
                    <div class="modal-dialog modal-lg modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">Product Details</h4>
                                <span class="text-muted small">ID: <asp:Label ID="LblProductCode" runat="server" Text=""></asp:Label></span>
                                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <asp:HiddenField ID="HdCatId" runat="server" />
                                <asp:HiddenField ID="HdBuisnessVolume" runat="server" />
                                <div class="sv-purchase-detail">
                                    <div class="sv-purchase-detail__gallery">
                                        <div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
                                            <div class="carousel-inner">
                                                <div class="carousel-item active">
                                                    <asp:Image ID="Image2" runat="server" CssClass="d-block w-100" />
                                                </div>
                                                <div class="carousel-item">
                                                    <asp:Image ID="Image3" runat="server" CssClass="d-block w-100" />
                                                </div>
                                                <div class="carousel-item">
                                                    <asp:Image ID="Image4" runat="server" CssClass="d-block w-100" />
                                                </div>
                                            </div>
                                            <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
                                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                            </button>
                                            <button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
                                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                            </button>
                                        </div>
                                    </div>
                                    <div class="sv-purchase-detail__info">
                                        <p class="mb-1"><asp:Label ID="LblcategoryName123" runat="server" Text="" CssClass="sv-txn-type"></asp:Label></p>
                                        <h4><asp:Label ID="LblProductName" runat="server" Text=""></asp:Label></h4>
                                        <div class="sv-purchase-detail__meta">MRP: <strong><i class="fa-solid fa-indian-rupee-sign"></i> <asp:Label ID="LblMRP" runat="server" Text=""></asp:Label></strong></div>
                                        <div class="sv-purchase-detail__meta">B.V: <strong><asp:Label ID="LblBv" runat="server" Text=""></asp:Label></strong></div>
                                        <div class="sv-purchase-detail__meta">Amount: <strong><i class="fa-solid fa-indian-rupee-sign"></i> <asp:Label ID="LblAmount" runat="server" Text=""></asp:Label></strong></div>
                                        <div class="sv-purchase-detail__desc">
                                            <asp:Label ID="LblDescription" runat="server" Text="Label"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="sv-btn-danger" data-bs-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>

                <div id="Div1" class="modal fade sv-purchase-modal" tabindex="-1" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">Add to Cart</h4>
                                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <asp:Label ID="TxtImage" CssClass="form-control" runat="server" Visible="false"></asp:Label>
                                <div class="row g-3">
                                    <div class="col-md-4">
                                        <div class="sv-field">
                                            <label class="sv-field__label">Product Code</label>
                                            <asp:TextBox ID="TxtProductCode" CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="sv-field">
                                            <label class="sv-field__label">Product Name</label>
                                            <asp:TextBox ID="TxtProductName" CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="sv-field">
                                            <label class="sv-field__label">Amount/Piece</label>
                                            <asp:TextBox ID="TxtAmount" CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="sv-field">
                                            <label class="sv-field__label">Quantity</label>
                                            <asp:TextBox ID="TxtQuantity" CssClass="form-control" runat="server" TextMode="Number" onchange="gettotal();"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="sv-field">
                                            <label class="sv-field__label">Total Amount</label>
                                            <asp:Label ID="TxtTotalAmount" CssClass="form-control d-block py-2" runat="server"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="sv-btn-danger" data-bs-dismiss="modal">Close</button>
                                <asp:Button ID="BtnAdd" runat="server" CssClass="sv-btn-primary" Text="Add to Cart" OnClick="BtnAdd_Click" OnClientClick="return validate();" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="contentScript" runat="Server">
    <script src="js/user-modal.js"></script>
</asp:Content>

<%@ Page Title="Spot Coin Price" Language="C#" MasterPageFile="adminmaster.master" AutoEventWireup="true" CodeFile="SpotCoinPrice.aspx.cs" Inherits="admin_SpotCoinPrice" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPageHeading" Runat="Server">
    <section class="content-header">
        <h1>Spot Coin Price</h1>
        <ol class="breadcrumb">
            <li><a href="Dashboard.aspx"><i class="fa fa-dashboard"></i> Home</a></li>
            <li class="active">Spot Coin Price</li>
        </ol>
    </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentpageData" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="row">
                <div class="col-lg-7">
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title">UWC+ Price Configuration</h3>
                        </div>
                        <div class="box-body">
                            <p class="text-muted" style="margin-bottom:18px;">
                                Set the starting price, target price, duration in months, and daily price increase %. The Spot Trading chart will follow this range and growth rate.
                            </p>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Starting Price (USDT)</label>
                                        <asp:TextBox ID="txtStartPrice" CssClass="form-control" runat="server" placeholder="e.g. 0.000139"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Target Price (USDT)</label>
                                        <asp:TextBox ID="txtTargetPrice" CssClass="form-control" runat="server" placeholder="e.g. 0.000400"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Duration (Months)</label>
                                        <asp:TextBox ID="txtDurationMonths" CssClass="form-control" runat="server" TextMode="Number" placeholder="e.g. 6"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Daily Price Increase (%)</label>
                                        <asp:TextBox ID="txtDailyIncreasePercent" CssClass="form-control" runat="server" placeholder="e.g. 1.5"></asp:TextBox>
                                        <small class="text-muted">Price compounds up by this % each day until target is reached.</small>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Start Date</label>
                                        <asp:TextBox ID="txtStartDate" CssClass="form-control" runat="server" TextMode="Date"></asp:TextBox>
                                        <small class="text-muted">Chart and price growth begin from this date.</small>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>End Date</label>
                                        <asp:TextBox ID="txtEndDate" CssClass="form-control" runat="server" TextMode="Date"></asp:TextBox>
                                        <small class="text-muted">Target price should be reached by this date.</small>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>&nbsp;</label>
                                        <div>
                                            <asp:Button ID="btnSave" CssClass="btn btn-success" runat="server" Text="Save Configuration" OnClick="btnSave_Click" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-5">
                    <div class="box box-info">
                        <div class="box-header with-border">
                            <h3 class="box-title">Live Preview</h3>
                        </div>
                        <div class="box-body">
                            <table class="table table-bordered table-condensed" style="margin-bottom:0;">
                                <tr>
                                    <th style="width:45%;">Current Price</th>
                                    <td><asp:Label ID="lblCurrentPrice" runat="server" CssClass="text-bold text-success"></asp:Label></td>
                                </tr>
                                <tr>
                                    <th>Price Range</th>
                                    <td><asp:Label ID="lblPriceRange" runat="server"></asp:Label></td>
                                </tr>
                                <tr>
                                    <th>Start Date</th>
                                    <td><asp:Label ID="lblStartDate" runat="server"></asp:Label></td>
                                </tr>
                                <tr>
                                    <th>End Date</th>
                                    <td><asp:Label ID="lblEndDate" runat="server"></asp:Label></td>
                                </tr>
                                <tr>
                                    <th>Daily Increase</th>
                                    <td><asp:Label ID="lblDailyIncrease" runat="server"></asp:Label></td>
                                </tr>
                                <tr>
                                    <th>Progress</th>
                                    <td><asp:Label ID="lblProgress" runat="server"></asp:Label></td>
                                </tr>
                                <tr>
                                    <th>Last Updated</th>
                                    <td><asp:Label ID="lblUpdatedOn" runat="server"></asp:Label></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <div class="box box-default">
                        <div class="box-header with-border">
                            <h3 class="box-title">Configuration History</h3>
                        </div>
                        <div class="box-body table-responsive">
                            <asp:GridView ID="gvHistory" runat="server" CssClass="table table-striped table-bordered"
                                AutoGenerateColumns="False" EmptyDataText="No configuration saved yet.">
                                <Columns>
                                    <asp:BoundField DataField="Id" HeaderText="ID" />
                                    <asp:BoundField DataField="StartPrice" HeaderText="Start Price" DataFormatString="{0:N8}" />
                                    <asp:BoundField DataField="TargetPrice" HeaderText="Target Price" DataFormatString="{0:N8}" />
                                    <asp:BoundField DataField="DurationMonths" HeaderText="Months" />
                                    <asp:BoundField DataField="DailyIncreasePercent" HeaderText="Daily %" DataFormatString="{0:N2}" />
                                    <asp:BoundField DataField="StartDate" HeaderText="Start Date" DataFormatString="{0:dd-MMM-yyyy HH:mm}" />
                                    <asp:BoundField DataField="EndDate" HeaderText="End Date" DataFormatString="{0:dd-MMM-yyyy HH:mm}" />
                                    <asp:TemplateField HeaderText="Status">
                                        <ItemTemplate>
                                            <%# Convert.ToBoolean(Eval("IsActive")) ? "<span class='label label-success'>Active</span>" : "<span class='label label-default'>Inactive</span>" %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="UpdatedBy" HeaderText="Updated By" />
                                    <asp:BoundField DataField="UpdatedOn" HeaderText="Updated On" DataFormatString="{0:dd-MMM-yyyy HH:mm}" />
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

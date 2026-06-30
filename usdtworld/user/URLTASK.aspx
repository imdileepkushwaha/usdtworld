<%@ Page Title="View Task" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="URLTASK.aspx.cs" Inherits="URLTASK" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="css/account-pages.css" rel="stylesheet" />
    <link href="css/report-pages.css" rel="stylesheet" />
    <link href="css/task-pages.css" rel="stylesheet" />
    <link href="css/messages-page.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPageHeading" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentpageData" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="sv-account-page sv-report-page sv-task-page">
                <div class="sv-page-header sv-page-header--task">
                    <div class="sv-page-header__glow sv-page-header__glow--1"></div>
                    <div class="sv-page-header__glow sv-page-header__glow--2"></div>
                    <div class="sv-page-header__main">
                        <div class="sv-page-header__icon">
                            <i class="fa-solid fa-clipboard-list"></i>
                        </div>
                        <div class="sv-page-header__text">
                            <h1>My Tasks</h1>
                            <p>View pending tasks and submit your work</p>
                        </div>
                    </div>
                    <div class="sv-page-header__actions">
                        <a href="Dashboard.aspx" class="sv-page-breadcrumb">
                            <iconify-icon icon="solar:home-smile-angle-outline" class="icon"></iconify-icon>
                            Dashboard
                        </a>
                        <span class="sv-page-header__crumb">My Task / View Task</span>
                    </div>
                </div>

                <nav class="sv-task-tabs" aria-label="Task sections">
                    <a href="URLTASK.aspx" class="sv-task-tabs__item sv-task-tabs__item--active"><i class="fa-solid fa-clipboard-list"></i> View Task</a>
                    <a href="TaskStatusReport.aspx" class="sv-task-tabs__item"><i class="fa-solid fa-chart-simple"></i> Task Status</a>
                </nav>

                <div class="sv-form-card sv-task-form-card">
                    <div class="sv-form-card__head">
                        <span class="sv-form-card__head-icon"><i class="fa-solid fa-list-check"></i></span>
                        <div class="sv-form-card__head-text">
                            <h3>Pending Tasks</h3>
                            <p>Click submit to complete your assigned task</p>
                        </div>
                    </div>
                    <div class="sv-form-card__body">
                        <div class="sv-report-toolbar">
                            <p class="sv-report-toolbar__title">
                                <i class="fa-solid fa-table"></i> Active Task List
                            </p>
                        </div>

                        <div class="sv-msg-table-wrap">
                            <div class="sv-msg-table-scroll">
                                <asp:GridView ID="GridView1" runat="server" CssClass="sv-msg-table table table-borderless" Width="100%"
                                    AutoGenerateColumns="False" GridLines="None" OnRowCommand="GridView1_RowCommand">
                                    <Columns>
                                        <asp:TemplateField HeaderText="#">
                                            <ItemTemplate>
                                                <span class="sv-msg-sr"><%# Container.DataItemIndex + 1 %></span>
                                                <asp:Label ID="lblid" runat="server" Visible="false" Text='<%# Eval("id") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Task No">
                                            <ItemTemplate>
                                                <span class="sv-task-no"><%# Eval("TasknoID") %></span>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Assign Date">
                                            <ItemTemplate>
                                                <span class="sv-msg-date"><%# Eval("Assigndate", "{0:dd/MM/yyyy}") %></span>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Day">
                                            <ItemTemplate>
                                                <span class="sv-task-day"><i class="fa-solid fa-calendar-day"></i> <%# Eval("Dayname") %></span>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Action">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbEdit" CommandName="edt" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"
                                                    runat="server" CssClass="sv-action-btn" ToolTip="Submit Task">
                                                    <i class="fa-solid fa-pen-to-square"></i>
                                                    <span>Submit</span>
                                                </asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <EmptyDataTemplate>
                                        <div class="sv-task-empty">
                                            <i class="fa-solid fa-circle-check"></i>
                                            No pending tasks right now. Check back later or view your task status report.
                                        </div>
                                    </EmptyDataTemplate>
                                </asp:GridView>
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

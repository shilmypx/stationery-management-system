<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Template.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
 <div id="tabs" >
    <ul>
						<li><a href="#tabs-1">My Request</a></li>
						<li><a href="#tabs-2">Requests Approved</a></li>
						<li><a href="#tabs-3">My Accept</a></li>
						<li><a href="#tabs-4">My Reject</a></li>
						<li><a href="#tabs-5">My Accept</a></li>
						<li><a href="#tabs-6">My Accept</a></li>
					</ul>
</div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="css" runat="server">
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Template.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="MvcStationeryManagementSystem.Models" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Emdetail
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

   
  <%Role r = (Role)ViewData["role"];
      
      %>
				<div class="portlet ui-widget ui-widget-content ui-helper-clearfix ui-corner-all form-container">
					<div class="portlet-header ui-widget-header">Eligibility Details</div>
					<div class="portlet-content">
					 <div class="response-msg inf ui-corner-all">
					<div style="font-size:medium; margin-left:20%">
					<span>Information message</span>
					<p>Permission of you is <b style="color:Red"><%=r.RoleName %></b></p>
					<%if(r.RoleId!=3)
       { %>
					<p>You can handle request with amount max is <b style="color:Red"><%=r.Amount %></b></p>
		<%}%>
					<p><b style="color:Red">A number of job you can make on webssite</b></p>
					
					
					<p> &#8226; Change Your Password</p>
					<%if (r.RoleId == 1)
       { %>
					<p> &#8226; Manage Role</p>
					<p> &#8226; Create Employee</p>
					<%} %>
					<%if (r.RoleId != 3)
       { %>
					<p> &#8226; Manage Employee</p>
					<%} %>
					<%if (r.RoleId == 2)
       {%>
					<p> &#8226; Manage Catalog Request</p>
					<%} %>
					<p> &#8226; Create New Request</p>
					<p> &#8226; View Request</p>
					<%if (r.RoleId == 2)
       { %>
					<p> &#8226; Manage Catalog Stationery</p>
					<%} %>
					<%if (r.RoleId != 1)
       { %>
					<p> &#8226; View MyStationery Items</p>
					<%} %>
					<%if (r.RoleId != 3)
       {%>
					<p> &#8226; Manage Stationery Items</p>
					<%} %>
					<%if (r.RoleId == 1)
       {%>
					
					<p> &#8226; Setting Systems</p>
				<%} %>
					
					
					
					
				</div>
				</div>
				</div>
</div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="css" runat="server">
</asp:Content>

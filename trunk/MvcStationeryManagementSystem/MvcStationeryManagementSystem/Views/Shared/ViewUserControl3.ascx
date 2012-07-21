<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<%@ Import Namespace=" MvcStationeryManagementSystem.Models" %>
<%Employee e = (Employee)Session["Employee"];
  if (e.RoleId == 1)
  {%> 
    <div class="portlet ui-widget ui-widget-content ui-helper-clearfix ui-corner-all">
					<div class="portlet-header ui-widget-header">MessagesReceived</div>
					<div class="portlet-content">
						<ul class="side-menu">
							
							<li id="fii" onclick="xl9()" >
								<a href="javascript:void(0);" title="Fixed Layout"><%=Html.ActionLink("New  Requests", "myrequest10/#tabs-10", "default1")%></a>
								
							</li>
							<li id="Li1" onclick="xl10()">
								<a href="javascript:void(0);" title="Fixed Layout"><%=Html.ActionLink("Withdraw  Requests", "myrequest10/#tabs-11", "default1")%></a>
							</li>
							<li id="Li3" onclick="xl11()">
								<a href="javascript:void(0);" title="Fixed Layout"><%=Html.ActionLink("Cancel  Requests", "myrequest10/#tabs-12", "default1")%></a>
							</li>
							<li id="Li4" onclick="xl12()">
								<a href="javascript:void(0);" title="Fixed Layout"><%=Html.ActionLink("Accept  Requests", "myrequest10/#tabs-13", "default1")%> </a>
							</li>
						</ul>
					</div>
				</div>
  <%}%>
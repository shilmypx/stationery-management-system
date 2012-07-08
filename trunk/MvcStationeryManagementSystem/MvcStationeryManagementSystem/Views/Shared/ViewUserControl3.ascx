<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<%@ Import Namespace=" MvcStationeryManagementSystem.Models" %>
<%Employee e = (Employee)Session["Employee"];
  if (e.RoleId == 1)
  {%> 
    <div class="portlet ui-widget ui-widget-content ui-helper-clearfix ui-corner-all">
					<div class="portlet-header ui-widget-header">MessagesReceived</div>
					<div class="portlet-content">
						<ul class="side-menu">
							
							<li id="fi" onclick="xl9()">
								<a href="javascript:void(0);" title="Fixed Layout">New  Requests </a>
							</li>
							<li id="Li1" onclick="xl10()">
								<a href="javascript:void(0);" title="Fixed Layout">Withdraw   Requests </a>
							</li>
							<li id="Li3" onclick="xl11()">
								<a href="javascript:void(0);" title="Fixed Layout">Cancel  Requests </a>
							</li>
							<li id="Li4" onclick="xl2()">
								<a href="javascript:void(0);" title="Fixed Layout">Accepted  Requests </a>
							</li>
						</ul>
					</div>
				</div>
  <%}%>
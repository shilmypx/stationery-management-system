<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<%@ Import Namespace=" MvcStationeryManagementSystem.Models" %>
<%Employee e = (Employee)Session["Employee"];
  if (e.RoleId == 2)
  {%> 
    <div class="portlet ui-widget ui-widget-content ui-helper-clearfix ui-corner-all">
					<div class="portlet-header ui-widget-header">Messages Received</div>
					<div class="portlet-content">
						<ul class="side-menu">
							
							<li id="ll" onclick="xl5()">
								<a href="javascript:void(0);" title="Fixed Layout">New  Requests </a>
							</li>
							<li id="Li1" onclick="xl6()">
								<a href="javascript:void(0);" title="Fixed Layout">Withdraw   Requests </a>
							</li>
							<li id="Li3" onclick="xl7()">
								<a href="javascript:void(0);" title="Fixed Layout">Cancel  Requests </a>
							</li>
							<li id="Li4" onclick="xl8()">
								<a href="javascript:void(0);" title="Fixed Layout">Accepted  Requests </a>
							</li>
						</ul>
					</div>
				</div>
  <%}%>
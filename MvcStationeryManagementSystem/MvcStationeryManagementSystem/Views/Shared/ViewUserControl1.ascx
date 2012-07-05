﻿<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<%@ Import Namespace=" MvcStationeryManagementSystem.Models" %>
<%Employee e = (Employee)Session["Employee"];
  if (e.RoleId == 3 || e.RoleId==2)
  {%> 
    <div class="portlet ui-widget ui-widget-content ui-helper-clearfix ui-corner-all">
					<div class="portlet-header ui-widget-header">Request Sent</div>
					<div class="portlet-content">
						<div id="accordion">
							<div>
								<h3><a href="#">Requirements Have Been Approved</a></h3>
								<div>
									<ul class="side-menu">
										<li><a href="index.html" title="Administration">View Requests</a></li>
										<li><a href="forms.html" title="Forms">My Accept</a></li>
										<li><a href="tables.html" title="Tables">My Reject</a></li>
									</ul>
								</div>
							</div>
							<div>
								<h3><a href="#">Requirements Have Not Been Approved</a></h3>
								<div>
									<ul class="side-menu">
										<li><a href="index.html" title="Administration">View Requests</a></li>
										
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
  <%}      
 %>
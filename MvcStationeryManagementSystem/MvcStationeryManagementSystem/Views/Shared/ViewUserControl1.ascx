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
										<li  onclick="xl1()"><a href="#" title="View Requests"><%=Html.ActionLink("View Requests","Myrequest10/#tabs-2","default1")%></a></li>
										<li  onclick="xl2()"><a href="#" title="My Accept"><%=Html.ActionLink("My Accept","Myrequest10/#tabs-3","default1")%></a></li>
										<li  onclick="xl3()"><a href="#" title="My Reject"><%=Html.ActionLink("My Reject","Myrequest10/#tabs-4","default1")%></a></li>
									</ul>
								</div>
							</div>
							<div>
								<h3><a href="#">Requirements Have Not Been Approved</a></h3>
								<div>
									<ul class="side-menu">
										<li onclick="xl4()"><a href="#" title="View Requests"><%=Html.ActionLink("View Requests","Myrequest10/#tabs-5","default1")%></a></li>
										
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
  <%}      
 %>
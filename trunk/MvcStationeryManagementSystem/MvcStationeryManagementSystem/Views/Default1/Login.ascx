<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<MvcStationeryManagementSystem.Models.Employee>" %>

<script src="../../Scripts/MicrosoftAjax.js" type="text/javascript"></script>

<link href="../../Content/css/styles/Site.css" rel="stylesheet" type="text/css" />
<script src="../../Scripts/MicrosoftMvcValidation.js" type="text/javascript"></script>

<link href="../../Content/css/style.css" rel="stylesheet" type="text/css" /> 
<link href="../../Content/css/styles/FormatFormlogin.css" rel="stylesheet" type="text/css" />
<div class="ui-widget-overlay" style="z-index: 1001; width: 1349px; height: 1008px; "></div>
<% Html.EnableClientValidation(); %>
<div style="overflow: hidden; outline: 0px; height: auto; width: 300px; position: absolute; top: 215.5px; left: 521.5px; display: block; z-index: 1002; " class="ui-dialog ui-widget ui-widget-content ui-corner-all  ui-draggable" tabindex="-1" role="dialog" aria-labelledby="ui-dialog-title-login"><div class="ui-dialog-titlebar ui-widget-header ui-corner-all ui-helper-clearfix" unselectable="on"><span class="ui-dialog-title" id="ui-dialog-title-login" unselectable="on">Members Login</span><a href="#" class="ui-dialog-titlebar-close ui-corner-all" role="button" unselectable="on"><span class="ui-icon ui-icon-closethick" unselectable="on">close</span></a></div><div id="login" style="width: auto; min-height: 52px; height: 132px; " class="ui-dialog-content ui-widget-content">
			<%--	<form action="#" method="post" enctype="multipart/form-data" class="forms" name="form">--%>
				<% using (Html.BeginForm("Login", "Default1", FormMethod.Post, new { @class = "forms", @name = "form" })){%>
				          <%= Html.ValidationSummary(true) %>
				         <% if (ViewData["kq"] != null)
                {%>
                        <%= ViewData["kq"]%>
				         <%} %>    
					<ul>
						<li>
							<label for="email" class="desc">
								Username:
							</label>
							<div>
						        <%= Html.TextBoxFor(model => model.EmployeeNumber, new { @class = "field text full", @id = "email", @maxlength = 59 })%>
						        
						        <%= Html.ValidationMessageFor(Model=>Model.EmployeeNumber  ) %>
								<%--<input type="text" tabindex="1" maxlength="255" value="" class="field text full" name="email" id="email">--%>
							</div>
						</li>
						<li>
							<label for="password" class="desc">
								Password:
							</label>
							<div>
							    <%= Html.PasswordFor(Model=>Model.Password ,new { @class = "field text full", @id = "password", @maxlength=50 })%>
							    <%= Html.ValidationMessageFor(Model=>Model.Password) %>
								<%--<input type="text" tabindex="1" maxlength="255" value="" class="field text full" name="password" id="password">--%>
							</div>
						</li>
					</ul>
				
			</div><div class="ui-dialog-buttonpane ui-widget-content ui-helper-clearfix">
			
			<input type="submit" class="ui-state-default ui-corner-all" value="Login" />
			<input type="submit" class="ui-state-default ui-corner-all" value="Reset" />
			<% } %>
			</div></div>
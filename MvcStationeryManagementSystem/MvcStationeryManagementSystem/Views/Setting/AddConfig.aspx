<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Template.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="MvcStationeryManagementSystem.Models" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	AddConfig
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="portlet ui-widget ui-widget-content ui-helper-clearfix ui-corner-all form-container">
					<div class="portlet-header ui-widget-header">Form elements in box</div>
					<div class="portlet-content">
    <% using (Html.BeginForm("InsertConfig", "Setting",FormMethod.Post, new { @name = "form", enctype = "multipart/form-data" }))
         {%>
							<ul class="configs">
								<li>
									<label  class="desc">
										MailName
									</label>
									<div>
										<input type="text" tabindex="1" maxlength="255" value="" class="field text large" name="MailName" />
									</div>
								</li>
								<li>
									<label  class="desc">
										MailNetwork
									</label>
									<div>
										<input type="text" tabindex="2" maxlength="255" value="" class="field text large" name="MailNetwork" />
									</div>
								</li>
								<li>
									<label  class="desc">
										Password
									</label>
									<div>
										<input type="text" tabindex="3" maxlength="255" value="" class="field text large" name="Password" />
									</div>
								</li>
								<li>
									<label  class="desc">
										Ports
									</label>
									<div>
										<input type="text" tabindex="4" maxlength="255" value="" class="field text small" name="Ports" />
									</div>
								</li>
								<li>
									<label  class="desc">
										Type
									</label>
									<div>
										<input type="text" tabindex="5" maxlength="255" value="" class="field text large" name="Type" />
									</div>
								</li>
								<li>
									<label  class="desc">
										Build date
									</label>
									<div>
										<input type="text" tabindex="6" maxlength="255" value="" id="BuildDate" readonly="readonly" class="field text large" name="BuildDate" />
									</div>
								</li>
								<li>
									<label  class="desc">
										Description
									</label>
									<div>
										<textarea tabindex="7" cols="50" rows="5" class="field textarea small" name="Description" ></textarea>
									</div>
								</li>
								<li class="buttons">
									<input type="submit" tabindex="8" value="Submit" class="submit" />
								</li>
							</ul>
						
						<%} %>
			</div>
			</div>			

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="css" runat="server">
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Template.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="MvcStationeryManagementSystem.Models" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	EditEmployee
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <% using (Html.BeginForm("ProcessingEmployee", "Employee")){%>
    <%  Employee em = (Employee)ViewData["info"]; %>
    <div class="portlet ui-widget ui-widget-content ui-helper-clearfix ui-corner-all form-container">
					<div class="portlet-header ui-widget-header"><span class="ui-icon ui-icon-circle-arrow-s"></span>Form registering employee</div>
					
					    <div class="portlet-content-new" style="display: block;">
							<ul>
							    <li>
							        <label class="desc">
							            Username
							        </label>
							        <div>
							            <%= Html.TextBox("EmployeeNumber", em.EmployeeNumber, new { @class = "field text medium" })%>
							        </div>
							    </li>
								<li>
									<label class="desc">
										FullName
									</label>
									<div>
    									<%= Html.TextBox("FullName", em.FullName, new { @class = "field text medium" })%>
									</div>
								</li>
								<li class="date">
									<label class="desc" id="title2" for="Field2">
										DateBirth
									</label>
										<%= Html.TextBox("DateBirth", em.DateBirth, new { @class = "field text medium" })%>
								</li>
								<li>
									<label class="desc">
										Email
									</label>
									<div>
										<%= Html.TextBox("Email", em.Email, new { @class = "field text medium" })%>
									</div>
								</li>
								<li>
									<label class="desc">
										Address
									</label>
									<div>
										<%=Html.TextBox("Address", em.Address, new { @class = "field text medium" })%>
									</div>
								</li>
								<li>
									<label class="desc">
										Phone
									</label>
									<div>
									    <%=Html.TextBox("Phone", em.Phone, new { @class = "field text medium" })%>
									</div>
								</li>
								
								<li>
								    <label class="desc">
								        Images
								    </label>
								    <div>
								        Select a file: <input type="file" name="fileUpload" tabindex="7" />
								    </div>
								</li>
								
								<li>
									<label class="desc" id="title4" for="Field4">
										RegistrationNumber
									</label>
									<div class="col">
										
									    <%=Html.TextBox("RegistrationNumber", em.RegistrationNumber, new { @class = "field text medium" })%>
									</div>
								</li>
								<li class="buttons">
									<input type="submit" class="submit" value="Save" />
								</li>
							</ul>
					
					</div>
				</div>
            <%} %>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="css" runat="server">
<script language="javascript" type="text/javascript">
        $(document).ready(function() {
            //su dung datepicker
        $('#DateBirth').datepicker({
                changeMonth: true,
                changeYear: true,
                dateFormat: 'dd/MM/yy',
                showWeek: true,
                stepMonths: 1,
                yearRange: '1900:2012'
            });
        });
</script>
</asp:Content>

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
					<div class="mydiv1">
					    <div class="portlet-content-new" style="display: block;">
							<ul>
							    <li>
							        <label class="desc">
							            EmployeeNumber
							        </label>
							        <div>
							        <input type="text" name="DateBirth" id="EmployeeNumber" class="field text medium" value="<%= em.EmployeeNumber %>" size="2" maxlength="50" tabindex="1" />
							        </div>
							    </li>
								<li>
									<label class="desc">
										FullName
									</label>
									<div>
									<input type="text" name="DateBirth" id="FullName" class="field text medium" value="<%= em.FullName %>" size="2" maxlength="50" tabindex="2" />
									</div>
								</li>
								<li class="date">
									<label class="desc" id="title2" for="Field2">
										DateBirth
									</label>
										<input type="text" name="DateBirth" id="datebirth" class="field text medium" value="<%= em.DateBirth %>" size="2" maxlength="50" tabindex="3" />
										
								</li>
								<li>
									<label class="desc">
										Email
									</label>
									<div>
										<input type="text" name="Email" id="Email" class="field text medium" value="<%= em.Email %>" maxlength="255" tabindex="4" />
										
									</div>
								</li>
								<li>
									<label class="desc">
										Address
									</label>
									<div>
										<input type="text" name="Address" id="Address" class="field text medium" value="<%= em.Address %>" maxlength="255" tabindex="5" />
										
									</div>
								</li>
								<li>
									<label class="desc">
										Phone
									</label>
									<div>
										<input type="text" name="Phone" id="Phone" class="field text medium" value="<%=em.Phone %>" rows="5" cols="50" tabindex="6" />
									</div>
								</li>
								<li>
									<label class="desc">
										Role Id
									</label>
									<%Role r=(Role)ViewData["new"];%>
									
									<div class="float-left">
										<select tabindex="3" class="field select large" name="RoleId" >
										 <% foreach(Role ro in (List<Role>)ViewData["dsrole"]){%>
										    <option value="<%=ro.RoleId%>">
												<%=ro.RoleName%>
												
											</option>
										 <%}%>
											
										</select>
									
									</div>
									
								</li>
								<li>
									<label class="desc">
										Password
									</label>
									<div>
										<input type="password" name="Password" id="Password" class="field text medium" value="" tabindex="8" />
									</div>
								</li>
								
								<li>
									<label class="desc" id="title4" for="Field4">
										RegistrationNumber
									</label>
									<div class="col">
										<input type="text" name="RegistrationNumber" id="RegistrationNumber" value="<%= em.RegistrationNumber %>" class="field text medium" tabindex="9" />
									</div>
								</li>
								<li class="buttons">
									<input type="submit" class="submit" value="Save">
								</li>
							</ul>
					
					</div>
					</div>
				</div>
            <%} %>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="css" runat="server">
<script language="javascript" type="text/javascript">
        $(document).ready(function() {
            //su dung datepicker
            $('#datebirth').datepicker({
                changeMonth: true,
                changeYear: true,
                dateFormat: 'dd/MM/yy',
                showWeek: true,
                stepMonths: 1,
                yearRange: '1900:2050'
            });
        });
</script>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Template.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="MvcStationeryManagementSystem.Models" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	AddEmployee
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <% using(Html.BeginForm("AddEmployee", "Employee")){%>
    <div id="addemployee">
        <div class="portlet ui-widget ui-widget-content ui-helper-clearfix ui-corner-all form-container">
					<div class="portlet-header ui-widget-header">Form elements in box</div>
					<div class="portlet-content-new">
						<form action="#" method="post" enctype="multipart/form-data" class="forms" name="form" >
							
							
							<ul>
							    <li>
							        <label class="desc">
							            EmployeeNumber
							        </label>
							        <div>
							            <input type="text" name="EmployeeNumber" id="EmployeeNumber" class="field text medium" value="" tabindex="1" />
							        </div>
							    </li>
								<li>
									<label class="desc">
										FullName
									</label>
									<div>
										<input type="text" name="FullName" id="FullName" class="field text medium" value="" maxlength="255" tabindex="2" />
									</div>
								</li>
								
								<li class="date">
									<label class="desc" id="Label1" for="Field2">
										Date Build
									</label>
										<input type="text" name="DateBuild" id="DateBuild" class="field text medium" value="" size="2" maxlength="50" tabindex="3" />
										
								</li>
								
								<li class="date">
									<label class="desc" id="title2" for="Field2">
										DateBirth
									</label>
										<input type="text" name="DateBirth" id="DateBirth" class="field text medium" value="" size="2" maxlength="50" tabindex="4" />
										
								</li>
								<li>
									<label class="desc">
										Email
									</label>
									<div>
										<input type="text" name="Email" id="Email" class="field text medium" value="" maxlength="255" tabindex="5" />
									</div>
								</li>
								<li>
									<label class="desc">
										Address
									</label>
									<div>
										<input type="text" name="Address" id="Address" class="field text medium" value="" maxlength="255" tabindex="6" />
									</div>
								</li>
								<li>
									<label class="desc">
										Phone
									</label>
									<div>
										<input type="text" name="Phone" id="Phone" class="field text medium" rows="5" cols="50" tabindex="7" />
									</div>
								</li>
								<li>
									<label class="desc">
										Role Id
									</label>
									<div class="float-left">
										<select tabindex="8" class="field select large" name="RoleId" tabindex="8" >
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
										<input type="password" name="Password" id="Password" class="field text medium" value="" tabindex="9" />
									</div>
								</li>
								
								<li>
									<label class="desc" id="title4" for="Field4">
										RegistrationNumber
									</label>
									<div class="col">
										<input type="text" name="RegistrationNumber" id="RegistrationNumber" class="field text medium" tabindex="10" />
									</div>
								</li>
								<li class="buttons">
									<input type="submit" class="submit" value="Save" tabindex="11">
								</li>
							</ul>
						</form>
					</div>
				</div>
    </div>
    <%}%>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="css" runat="server">
<script language="javascript" type="text/javascript">
   $(document).ready(function() {
//    $('#addemployee').validate({
//                rules: {
//                    EmployeeNumber: {
//                        required: true,
//                        minlength: 6,
//                        maxlength: 12
//                    },
//       messages: {
//                    EmployeeNumber: {
//                        required: 'Username ko duoc rong!',
//                        minlength: 'User khong duoc nho hon 6 ky tu',
//                        maxlength: 'User khong duoc qua 12kt'
//                    }
//        }
//        });
        //su dung datepicker
        $('#DateBirth').datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'dd/MM/yy',
            showWeek: true,
            stepMonths: 1,
            yearRange: '1900:2050'
        });

        $('#DateBuild').datepicker({
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

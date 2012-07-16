<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Template.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="MvcStationeryManagementSystem.Models" %>
<%--<%@ Register Assembly="MSCaptcha" Namespace="MSCaptcha" TagPrefix="cc1" %>
--%><asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	AddEmployee
</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="css" runat="server">


    <script src="../../Content/js/jquery.validate.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">
        $(document).ready(function() {

            $('#MyClass').validate({
                rules: {
                    EmployeeNumber: {
                    required: true,
                        minlength: 6,
                        maxlength: 30
                    },
                    FullName: {
                        required: true,
                        minlength: 6,
                        maxlength: 50
                    },
                    DateBirth: {
                        required: true
                    },
                    Email: {
                        required: true,
                        email: true
                    },
                    Address: {
                        required: true,
                        minlength: 6,
                        maxlength: 200
                    },
                    images: {
                        required: true
                    },
                    Password: {
                        required: true,
                        minlength: 6,
                        maxlength: 30
                    }
                },
                messages: {
                    EmployeeNumber: {
                }



            }
        });


        //su dung datepicker
        $('input[name = DateBirth]').datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'dd/MM/yy',
            showWeek: true,
            stepMonths: 1,
            yearRange: '1900:2012'
        });
        //Ket thuc datepicker


    });
</script>

    
    
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% using (Html.BeginForm("AddEmployee", "Employee", FormMethod.Post, new {@id="MyClass", enctype = "multipart/form-data" }))
       {%>
       
    <div id="addemployee">
        <div class="portlet ui-widget ui-widget-content ui-helper-clearfix ui-corner-all form-container">
					<div class="portlet-header ui-widget-header">Form elements in box</div>
					<div class="portlet-content-new">
							<ul>
							    <li>
							    
							        <label class="desc">
							            Username
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
								
								<%=Html.Hidden("datebuild", DateTime.Now)%>
								
								<li class="date">
									<label class="desc" id="title2" for="Field2">
										DateBirth
									</label>
										<input type="text" name="DateBirth" id="DateBirth" class="field text medium" value="" size="2" maxlength="50" tabindex="3" />
										
								</li>
								<li>
									<label class="desc">
										Email
									</label>
									<div>
										<input type="text" name="Email" id="Email" class="field text medium" value="" maxlength="255" tabindex="4" />
									</div>
								</li>
								<li>
									<label class="desc">
										Address
									</label>
									<div>
										<input type="text" name="Address" id="Address" class="field text medium" value="" maxlength="255" tabindex="5" />
									</div>
								</li>
								<li>
									<label class="desc">
										Phone
									</label>
									<div>
										<input type="text" name="Phone" id="Phone" class="field text medium" rows="5" cols="50" tabindex="6" />
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
									<label class="desc">
										Role Id
									</label>
									<div class="float-left">
										<select tabindex="8" id="role" class="field select large" name="RoleId" tabindex="8" >
										 <% foreach (Role ro in (List<Role>)ViewData["dsrole"])
              {%>
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
										<%--<input type="text" name="RegistrationNumber" id="RegistrationNumber" class="field text medium" tabindex="10" />--%>
									    <div class="float-left">
										<select tabindex="8" class="field select large" name="RoleId" tabindex="10">
										    <option value="re">
												RegistrationNumber
											</option>
										 
											
										</select>
									
									</div>
									</div>
								</li>
								
								<li>
								   <%-- <label class="desc">
								        Capcha
								    </label>
								    <div>
                                        <cc1:CaptchaControl ID="Captcha1" runat="server" 
                                        CaptchaBackgroundNoise="Low" CaptchaLength="5" 
                                        CaptchaHeight="60" CaptchaWidth="200" 
                                        CaptchaLineNoise="None" CaptchaMinTimeout="5" 
                                        CaptchaMaxTimeout="240" FontColor = "#529E00" />
                                          
                                    </div>
                                    <div>
                                        <input type="text" id="txtCaptcha" />
                                    </div>--%>
								</li>
								
								<li class="buttons">
									<input type="submit" class="submit" value="Save" tabindex="11" />
								</li>
							</ul>
					</div>
				</div>
    </div>
    <%}%>

</asp:Content>



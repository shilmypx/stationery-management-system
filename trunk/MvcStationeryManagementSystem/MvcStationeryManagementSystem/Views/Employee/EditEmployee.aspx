<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Template.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="MvcStationeryManagementSystem.Models" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	EditEmployee
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="css" runat="server">
<script src="../../Content/js/jquery.validate.js" type="text/javascript"></script>
<script language="javascript" type="text/javascript">
    $(document).ready(function() {

    var id = $('.RoleIdd').val();
        //alert(id);
//        $.ajax({
//        type: 'POST',
//            url: '/employee/HienThiDanhSach/' + id,
//            success: function(data) {
//            $("#RegistrationNumber").html(data);
//            }
        });
        
        //form
        $('#MyClassb').validate({
            rules: {
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
                fileUpload: {
                    accept: "jpg|png|gif"
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


    //and ktt
    $('#Email').keyup(function() {
        var id = $('#Email').val();
        $.ajax({
            url: '/employee/IdenEmail/' + id,
            success: function(data) {
                $('#textb').html(data);
            }
        });
    });
});
</script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <% using (Html.BeginForm("ProcessingEmployee", "Employee", FormMethod.Post, new { @id = "MyClassb", enctype = "multipart/form-data" }))
       {%>
    <%  Employee em = (Employee)ViewData["info"]; %>
    <div class="portlet ui-widget ui-widget-content ui-helper-clearfix ui-corner-all form-container">
					<div class="portlet-header ui-widget-header">Form Edit Account</div>
					<div class="portlet-content">
					    <div class="portlet-content-new" style="display: block;">
					    <div class="myimg">
					        <p align="center"><b>Images</b></p>
								        <img src="../../Content/Upload/<%= em.Images %>" alt="" class="myimages" />
								    </div>
							<ul class="editem">
							    <li>
							        <label class="desc">
							            Username
							        </label>
							        <div>
							            <%= Html.TextBox("EmployeeNumber", em.EmployeeNumber, new { @class = "field text medium", @readonly = "readonly" })%>
							        </div>
							    </li>
								<li>
									<label class="desc">
										FullName
									</label>
									<div>
    									<%= Html.TextBox("FullName", em.FullName, new { @class = "field text medium", @id = "FullName", @tabindex = "1" })%>
									</div>
								</li>
								<li class="desc">
									<label class="desc" id="title2" for="Field2">
										DateBirth
									</label>
										<%= Html.TextBox("DateBirth", em.DateBirth, new { @class = "field text medium", @id = "DateBirth", @readonly = "readonly", @tabindex = "2" })%>
								</li>
								<li>
									<label class="desc">
										Email
									</label>
									<div>
										<%= Html.TextBox("Email", em.Email, new { @class = "field text medium", @id = "Email", @tabindex = "3" })%>
									</div>
									<label id="textb" class="mytext"></label>
								</li>
								<li>
									<label class="desc">
										Address
									</label>
									<div>
										<%=Html.TextBox("Address", em.Address, new { @class = "field text medium", id = "Address", @tabindex = "4" })%>
									</div>
								</li>
								<li>
									<label class="desc">
										Phone
									</label>
									<div>
									    <%=Html.TextBox("Phone", em.Phone, new { @class = "field text medium", @tabindex = "5" })%>
									</div>
								</li>
								
								<li>
								    <label class="desc">
								        Images
								    </label>
								    <div>
								        <%= Html.Hidden("Images", em.Images)%>
								        Select a file: <input type="file" name="fileUpload" id="fileUpload" tabindex="6"/>
								    </div>
								</li>
								
								<li>
									<label class="desc" id="title4" for="Field4">
										Manager
									</label>
									<% Employee e = (Employee)Session["Employee"]; %>
									<% if (e.RoleId == 1)
                                        { %>
									        <div class="float-left">
										<select tabindex="8" id="RegistrationNumber" class="field select large" name="RegistrationNumber" tabindex="7" >
										
                                        <%Employee elo = (Employee)Session["em"];
                                          if (elo.RoleId == 3)
                                          {  
                                        
                %>
                  
										<option selected="selected" value="<%=elo.RegistrationNumber%>"><%= elo.RegistrationNumber%></option>
										 <% foreach (Employee reg in (List<Employee>)ViewData["dsreg1"])
              {%>
                                                
											<option value="<% = reg.EmployeeNumber%>"> <%= reg.EmployeeNumber%>
											</option>
                                                 
										 <%}%>
                                         <%}
                                          else
                                          {%> 
                                             <% foreach (Employee reg in (List<Employee>)ViewData["dsreg"])
              {%>
                                                
											<option value="<% = reg.RegistrationNumber%>"> <%= reg.RegistrationNumber%>
											</option>
                                                 
										 <%}
                                          }
                                            %>
											
											
										</select>
									
									</div>
									<%} %>
									
									<%= Html.Hidden("RoleId", em.RoleId, new {@class="RoleIdd" })%>
									<%= Html.Hidden("RegistrationNumber", em.RegistrationNumber, new {@id="regist" })%>
								</li>
								<li class="buttons">
									<input type="submit" class="submit2" id="submit" value="Update" />
								</li>
							</ul>
					
					</div>
				</div>
            <%} %>

</asp:Content>



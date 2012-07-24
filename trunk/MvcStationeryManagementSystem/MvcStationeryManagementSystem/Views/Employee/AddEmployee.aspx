<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Template.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="MvcStationeryManagementSystem.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">

	AddEmployee
</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="css" runat="server">


    <script src="../../Content/js/jquery.validate.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">
        $(document).ready(function() {

            //validate combobox
        $.validator.addMethod('selectNone',
          function(value, element) {
              return this.optional(element) ||
                (value.indexOf("--Select--") == -1);
          }, "Please select an option");
            

            //ket thuc combo
            $('#idd').click(function() {
                var username = $('#EmployeeNumber').val();
                if (username.indexOf(' ') != -1)
                //alert('Username can not contain spaces!');
                    $('#text').html('Username can not contain spaces!');
                else
                    return true;
            });


            //form
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
                    },
                    fileUpload: {
                        required: true,
                        accept: "jpg|png|gif"
                    },
                    RoleId: {
                        selectNone: true
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

        //json lay ket qua
        $('#role').change(function() {

            var ma = $('#role option:checked').val();
            // alert (ma);

            $.ajax({
                type: 'POST',
                url: '/employee/HienThiDanhSach/' + ma,
                success: function(data) {
                    $("#RegistrationNumber").html(data);
                }
            });
            //end json
        });
        //Kiem tra trung username
        $('#EmployeeNumber').keyup(function() {

            var id = $("#EmployeeNumber").val();
            //$(".bb").html(rse);
            $.ajax({
                //   type: 'GET',
                url: '/employee/Identical/' + id,
                success: function(data) {

                    $('#text').html(data);
                    //$('#idd').hide();
                }
            });
        });
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
   <div class="portlet ui-widget ui-widget-content ui-helper-clearfix ui-corner-all form-container">
					<div class="portlet-header ui-widget-header">Form elements in box</div>
					<div class="portlet-content">
					<% using (Html.BeginForm("AddEmployee", "Employee", FormMethod.Post, new { @id = "MyClass", @name = "MyClass", @class = "MyClass", enctype = "multipart/form-data" }))
        {%>
					    <ul class="addform">
							    <li>
							        <label class="desc">
							            Username
							        </label>
							        <div>
							            <input type="text" name="EmployeeNumber" id="EmployeeNumber" class="field text medium" value="" tabindex="1" />
							            <label id="text" class="mytexts"></label>
							            <% string emm = (string)Session["Username"]; %>
							            <%=Html.Hidden("b", emm, new { @id = "bbb" })%>
							            
							        </div>
							    </li>
							    
							    <li>
									<label class="desc">
										Password
									</label>
									<div>
										<input type="password" name="Password" id="Password" class="field text medium" value="" tabindex="2" />
									</div>
								</li>
							    
								<li>
									<label class="desc">
										FullName
									</label>
									<div>
										<input type="text" name="FullName" id="FullName" class="field text medium" value="" maxlength="255" tabindex="3" />
									</div>
								</li>
								
								
								<li>
									<label class="desc">
										DateBirth
									</label>
									<div>
										<input type="text" name="DateBirth" id="DateBirth" class="field text medium" value="" maxlength="255" readonly="readonly" tabindex="4" />
									</div>
								</li>
								
								<li>
									<label class="desc">
										Email
									</label>
									<div>
										<input type="text" name="Email" id="Email" class="field text medium" value="" maxlength="255" tabindex="5" />
									</div>
									<label id="textb" class="mytext"></label>
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
								    Images
								</label>
								    <div>
								        Select a file: <input type="file" name="fileUpload" id="file_upload" tabindex="8" />
								    </div>
								    <label id="file_erro"></label>
								</li>
								
								<li>
									<label class="desc">
										Role
									</label>
									<div class="float-left">
										<select tabindex="8" id="role" class="field select large" name="RoleId" tabindex="9" >
										<option>--Select--</option>
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
									<label class="desc" id="title4" for="Field4">
										Manager
									</label>
									<div class="col">
									    <div class="float-left">
										    <select  class="field select large" id="RegistrationNumber" name="RegistrationNumber" tabindex="10">
										    
										</select>
									
									</div>
									</div>
								</li>
								
								<li class="buttons">
								    <div>
								        <input type="submit" class="submit" id="idd" name="idd" value="Insert" tabindex="11" />
								        <input type="reset" class="submit" id="Reset" name="idd" value="Reset" tabindex="12" />
								    </div>
								</li>
							</ul>
					<%} %>
					</div>
	</div>				

</asp:Content>



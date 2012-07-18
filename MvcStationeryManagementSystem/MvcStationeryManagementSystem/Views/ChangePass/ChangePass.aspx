<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Template.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="MvcStationeryManagementSystem.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	ChangePasswords
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">


        <div class="portlet ui-widget ui-widget-content ui-helper-clearfix ui-corner-all form-container">
					<div class="portlet-header ui-widget-header">Form Change PassWords</div>
					<div class="portlet-content-new">
											        <% using (Html.BeginForm("ChangePass", "ChangePass", FormMethod.Post, new { @id = "f1" }))
     {%>
									<ul>
							    <li>
		
   
							        <label class="desc">
							            Username:
							        </label>
							        <div>
							        <% Employee el = (Employee)Session["Employee"];%>
							            <input type="text" name="EmployeeNumber"  id="EmployeeNumber" class="field text medium" value='<%=  el.EmployeeNumber %>' readonly="readonly" tabindex="1" maxlength="50" />
							           
							        </div>
							       
							        
							    </li>
								<li>
									<label class="desc">
										Current Password:
									</label>
									<div>
										<input type="password" name="Pass" id="Pass" class="field text medium" value=""  tabindex="2" />
									</div>
									 <p class="aaaa" id="bb"></p>
							         <p id="a"></p>
								</li>
								<li>
									<label class="desc">
										New Password:
									</label>
									
									<div>
										<input type="password" id="password" name="password" class="field text medium" value=""  tabindex="3"/>
									</div>
									<p class="aaaa" id="P1"></p>
								</li>
								<li>
									<label class="desc">
										Confirm password:
									</label>
									<div>
										<input type="password"  id="Pw" name="Pw" class="field text medium" value=""  tabindex="3"/>
									</div>
							         <p id="d"></p>
								</li>
							
								<li class="buttons">
									<input type="submit" class="submit" id="ck" value="Confirm" tabindex="11"/>
							 
								</li>
							</ul>
						<%}%>
					</div>
				</div>

   

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="css" runat="server">
 <link href="../../Content/css/tables.css" type="text/css" />
    <link href="../../Content/css/neewnew.css" type="text/css" />
  <script type="text/javascript">

      $(document).ready(function() {
          $("#ck").hide();
          $("#Pass").keyup(function() {
              var status = $("#bb");
              status.html("");
              $('#a').attr("value", 0);
          });
          $("#Pass").blur(function() {

              var name = $(this).val();

              $("#bb").html("<img src='../../Content/images/icons/load.gif' />").removeClass();

              $.post("/ChangePass/Check2", { Pass: name },

                    function(data) {
                        var msg = data;
                        //  alert(msg);
                        if (data == 1) {
                            //alert("ok");
                            $("#bb").html("is available!").addClass("green");
                            $('#a').attr("value", 1);
                            $("#ck").show("slow");
                        }
                        else {
                            $("#bb").html("is not available!").addClass("red");
                            $('#a').attr("value", 0);
                            $("#ck").hide("slow");
                        }


                    });

          });
          $('#ck').click(function() {
              a = $('#a').attr("value");
              if (a == 1)
                  return true;
              return false;
          });

      });
    </script>
    
      <script type="text/javascript">

          $(document).ready(function() {
              $('#password').keyup(function() {
                  $('#P1').html("");

              });
              $('#Pw').keyup(function() {
                  $('#d').html("");

              });

              $('#ck').click(function() {
                  var pw = $("#password").val();
                  var pw1 = $("#Pw").val();
                  // alert(pw + "   " + pw1);

                  if (pw.length == null || pw1.length == null) {
                      $('#P1').html("Not null").addClass("red");
                      $('#d').html("Not null").addClass("red");
                  }
                  else if (pw.length < 6) {
                      $('#P1').html("Must be greater than 6 characters").addClass("red");

                      //alert("lon hon 6 ki tu");
                  }
                  else if (pw1.length < 6) {
                      $('#d').html("Must be greater than 6 characters").addClass("red");
                  }
                  else {

                      if (pw != pw1) {
                          $('#d').html("Not coincide with the new password").addClass("red");
                          //alert("ko giong nhau");
                          return false;
                      }
                      $.ajax({
                          type: "GET",
                          url: "/ChangePass/Doipw/" + pw,
                          success: function(msg) {
                              $("#f1").html("<div class='response-msg success ui-corner-all'><span>Success message</span>Lorem ipsum dolor sit amet, consectetuer adipiscing elit</div>");
                          }
                      });
                      //alert("pok");
                  }
                  return false;
              });

          });
    </script>
</asp:Content>

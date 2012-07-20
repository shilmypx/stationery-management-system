<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Template.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="MvcStationeryManagementSystem.Models" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	AddConfig
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="portlet ui-widget ui-widget-content ui-helper-clearfix ui-corner-all form-container">
					<div class="portlet-header ui-widget-header">Form elements in box</div>
					<div class="portlet-content">
    <% using (Html.BeginForm("InsertSet", "Setting", FormMethod.Post, new { @name = "form",@id="FormConfig", enctype = "multipart/form-data" }))
         {%>
							<ul class="configs">
								<li>
									<label  class="desc">
										MailName
									</label>
									<div>
										<input type="text" tabindex="1" maxlength="255" value="" class="field text large" name="MailName" id="MailName" />
									    <label id="ii"></label>
									</div>
								</li>
								<li>
									<label  class="desc">
										MailNetwork
									</label>
									<div>
										<input type="text" tabindex="2" maxlength="255" value="" class="field text large" name="MailNetwork" id="MailNetwork" />
									    <label id="mailnet"></label>
									</div>
								</li>
								<li>
									<label  class="desc">
										Password
									</label>
									<div>
										<input type="password" tabindex="3" maxlength="255" value="" class="field text large" name="Password" />
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
<script language="javascript" type="text/javascript">
    $(document).ready(function() {
        $('#FormConfig').validate({
            rules: {
                MailName: {
                    required: true,
                    maxlength: 50,
                    email: true
                },
                MailNetwork: {
                    required: true,
                    maxlength: 50,
                    email: true
                },
                Password: {
                    required: true,
                    minlength: 6,
                    maxlength: 20
                },
                Ports: {
                    required: true,
                    number: true,
                    minlength: 4,
                    maxlength: 5
                },
                Type: {
                    required: true
                }
            },
            messages: {
                EmployeeNumber: {
            }
        }
    });

    $('#MailName').keyup(function() {
        var id = $("#MailName").val();
        $.ajax({
            type: 'GET',
            url: '/Setting/IdenEmail/' + id,
            success: function(data) {
            $('#ii').html(data);
            }
        });
    });

    $('#MailNetwork').keyup(function() {
    var idd = $("#MailNetwork").val();
    //$('#mailnet').html(idd);
        $.ajax({
                type: 'GET',
                url: '/Setting/IdenEmail/' + idd,
                success: function(data) {
                    $('#mailnet').html(data);
            }
        });
    });
    

});
</script>
</asp:Content>

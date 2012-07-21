<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Template.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="MvcStationeryManagementSystem.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Edit Seting
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="portlet ui-widget ui-widget-content ui-helper-clearfix ui-corner-all form-container">
					<div class="portlet-header ui-widget-header">Form elements in box</div>
					<div class="portlet-content">
    <% using (Html.BeginForm("EditSetting", "Setting", FormMethod.Post, new { @name = "form", @id = "FormConfigs", enctype = "multipart/form-data" }))
         {%>
         <% Config s = (Config)ViewData["infomation"]; %>
							<ul class="configs">
								<li>
									<label  class="desc">
										MailName
									</label>
									<%= Html.Hidden("Id", s.Id) %>
									<div>
									    <%= Html.TextBox("MailName", s.MailName, new {@class= "field text large"})%>
										<%--<input type="text" tabindex="1" maxlength="255" value="" class="field text large" name="MailName" />--%>
									</div>
								</li>
								<li>
									<label  class="desc">
										MailNetwork
									</label>
									<div>
										<%= Html.TextBox("MailNetwork", s.MailNetwork, new { @class = "field text large" })%>
									</div>
								</li>
								
								<li>
									<label  class="desc">
										Ports
									</label>
									<div>
										<%= Html.TextBox("Ports", s.Ports, new {@class= "field text small"})%>
									</div>
								</li>
								<li>
									<label  class="desc">
										Type
									</label>
									<div>
										<%= Html.TextBox("Type", s.Type, new {@class= "field text large"})%>
									</div>
								</li>
								
								<li>
									<label  class="desc">
										Description
									</label>
									<div>
									    <%= Html.TextArea("Description", s.Description, new { @class = "field textarea small" })%>
										<%--<textarea tabindex="7" cols="50" rows="5" class="field textarea small" name="Description" ></textarea>--%>
									</div>
								</li>
								<li class="buttons">
									<input type="submit" tabindex="8" value="Update" class="submit" />
								</li>
							</ul>
						
						<%} %>
			</div>
	</div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="css" runat="server">
<script language="javascript" type="text/javascript">
    $(document).ready(function() {
        $('#FormConfigs').validate({
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
    });
</script>
</asp:Content>

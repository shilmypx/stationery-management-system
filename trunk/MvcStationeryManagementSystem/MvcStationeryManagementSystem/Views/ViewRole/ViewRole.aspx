<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Template.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="MvcStationeryManagementSystem.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	ViewRole
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">   
    <% using (Html.BeginForm("Eligibility", "ViewRole"))
       {%>  
    <div id="addemployee">
        <div class="portlet ui-widget-content ui-helper-clearfix ui-corner-all form-container">
					<div class="portlet-header ui-widget-header">Form elements in box</div>
					<div class="portlet-content-new">
							<ul>
							    <li>
							        <label class="desc">
							            Role Name
							        </label>
							        <div>							        
							            <% string sr = (string)ViewData["roleid"]; %>
							            <% Role el = (Role)ViewData["data"] ; %>
							            
							            <input type="text" name="RoleName" id="myuser" class="field text medium" value="<%= el.RoleName %>" readonly="readonly" tabindex="1" />
							            <label id="text" class="mytext"></label>							           
							        </div>
							    </li>	
							    <li>
							        <label class="desc">
							            Amount can accept
							        </label>
							        <div>
							            <input type="text" name="Amount" id="myuser" class="field text medium" value="<%= el.Amount %>" readonly="readonly" tabindex="1" />
							            <label id="Label1" class="mytext"></label>							           
							        </div>
							    </li>								    							    
							</ul>
					</div>
				</div>
    </div>
    <%}%>

</asp:Content>
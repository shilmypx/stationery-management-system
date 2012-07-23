<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Template.Master" Inherits="System.Web.Mvc.ViewPage"%>
<%@ Import Namespace="MvcStationeryManagementSystem.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% using (Html.BeginForm("ProcesUpdate", "Role",  FormMethod.Post, new {@id="f1"}))
       {%>
      <%  Role hdt = (Role)ViewData["ctrole"]; %>  
   <div class="portlet ui-widget ui-widget-content ui-helper-clearfix ui-corner-all form-container">
					<div class="portlet-header ui-widget-header">Form Update Stationey</div>
					<div class="portlet-content">
							  
						<ul id="f1">
							    <li>
							       
							        <div >
							        <%=Html.Hidden("role", hdt.RoleId, new { @class = "aa", @readonly = "readonly", @name = "RoleId", @ID = "RoleId" })%>
							        </div>
							    </li>
								<li>
									<label class="desc">
										Role Name:
									</label>
									<div>
									<%=Html.TextBox("rname", hdt.RoleName, new { @class = "aa", @readonly = "readonly", @name = "RoleName", @ID = "RoleName" })%>
									</div>
								</li>
								<li class="date">
									<label class="desc" id="title2" for="Field2">
										Amount
									</label>
									<div >
										<%=Html.TextBox("Amount", hdt.Amount, new { @class = "aa", @name = "Amount", @ID = "Amount" })%>
									</div>	
								</li>
								<li class="buttons">
									<input type="submit" class="submit" value="Update"/>
								</li>
							</ul>
							
					</div>
				</div>
		
      
         <%} %> 
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="css" runat="server">
 <link href="../../Content/css/neewnew.css" rel="stylesheet" type="text/css" />
  <script src="../../Content/js/jquery.validate.js" type="text/javascript"></script>
   <script language="javascript" type="text/javascript">
       $(document).ready(function() {
       $('#f1').validate({
               rules: {
                   Amount: {

                       required: true,
                       number: true
                   }

               }
           });




       });
    </script>
</asp:Content>

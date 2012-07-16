<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Template.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="MvcStationeryManagementSystem.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Rolement
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="portlet ui-widget ui-widget-content ui-helper-clearfix ui-corner-all form-container">
<div class="portlet-header ui-widget-header">Form Role</div>
				
        <div class="hastable">
						<table id="sort-table" class="lll"> 
						<thead> 
						<tr>
							<th class="header">RoleID </th>
						    <th class="style1">RoleName</th>
						    <th class="style1">Amount</th> 
							<th style="width:132px" class="">Options</th> 
						</tr> 
						</thead> 
						<tbody id = "hh"> 
						<% foreach (Role r in (List<Role>)ViewData["Rolemi"]){%>
						<tr>
							<td><%=r.RoleId %></td> 
						    <td><%=r.RoleName %></td> 
						    <td><%=r.Amount %></td>
						    
						     
						    <td>
								
                                  <%= Html.ActionLink("Edit Amount", "UpdateRole/" + r.RoleId, "Role")%>
		
							</td>
						</tr> 
						<%}%>
						
						</tbody>
						</table>
						<div id="pager">
					
								<a class="btn_no_text btn ui-state-default ui-corner-all first" title="First Page" href="#">
									<span class="ui-icon ui-icon-arrowthickstop-1-w"></span>
								</a>
								<a class="btn_no_text btn ui-state-default ui-corner-all prev" title="Previous Page" href="#">
									<span class="ui-icon ui-icon-circle-arrow-w"></span>
								</a>
							
								<input type="text" class="pagedisplay"/>
								<a class="btn_no_text btn ui-state-default ui-corner-all next" title="Next Page" href="#">
									<span class="ui-icon ui-icon-circle-arrow-e"></span>
								</a>
								<a class="btn_no_text btn ui-state-default ui-corner-all last" title="Last Page" href="#">
									<span class="ui-icon ui-icon-arrowthickstop-1-e"></span>
								</a>
								<select class="pagesize">
									<option value="10" selected="selected">10 results</option>
									<option value="20">20 results</option>
									<option value="30">30 results</option>
									<option value="40">40 results</option>
								</select>	
						</div>
				</div>
               
    </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="css" runat="server">

</asp:Content>

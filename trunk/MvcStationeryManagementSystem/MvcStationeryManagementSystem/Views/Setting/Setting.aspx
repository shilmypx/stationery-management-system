<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Template.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Setting
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<%@ Import Namespace="MvcStationeryManagementSystem.Models" %>

   <div class="hastable">
						<table id="sort-table"> 
						<thead> 
						<tr>
							<th class="header">Employee Number</th>
						    <th class="header">Full Name</th>
						    <th class="header">Address</th> 
						    <th class="header">Phone</th>
							<th style="width:132px" class="">Options</th> 
						</tr> 
						</thead> 
						<tbody id="mytbody"> 
						<% foreach (Config am in (List<Config>)ViewData["st"])
         {%>
						<tr>
							<td><%=am.MailName%></td> 
						    <td><%=am.MailNetwork%></td> 
						    <td><%=am.Password%></td> 
						    <td><%=am.Ports%></td>
						    <td>
								<a >
                                    <%= Html.ActionLink("Edit", "EditEmployee/", "Employee")%>
								</a>&nbsp|&nbsp
								<a >
								    <%= Html.ActionLink("Delete", "Delete/", "Employee", null ,new { @class = "mydel" })%>
								</a>&nbsp|&nbsp
								<a>
								    <%= Html.ActionLink("Detail", "Detail/", "Employee")%>
								</a>
								
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

					Sort multiple columns simultaneously by holding down the shift key and clicking a second, third or even fourth column header! 
					
				</div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="css" runat="server">
</asp:Content>

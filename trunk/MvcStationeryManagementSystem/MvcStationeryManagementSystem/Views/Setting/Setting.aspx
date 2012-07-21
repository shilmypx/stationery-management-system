<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Template.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="MvcStationeryManagementSystem.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Setting
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<div class="portlet ui-widget ui-widget-content ui-helper-clearfix ui-corner-all form-container">
					<div class="portlet-header ui-widget-header">Form elements in box</div>
					<div class="portlet-content">
   <div class="hastable">
						<table id="sort-table"> 
						<thead> 
						<tr>
							<th class="header">MailName</th>
						    <th class="header">MailNetwork</th>
						    <th class="header">Ports</th> 
						    <th class="header">Type</th>
							<td style="width:132px" class="">Options</td> 
						</tr> 
						</thead> 
						<tbody id="mytbody"> 
						<% foreach (Config am in (List<Config>)ViewData["st"])
         {%>
						<tr>
							<td><%=am.MailName%></td> 
						    <td><%=am.MailNetwork%></td> 
						    <td><%=am.Ports%></td> 
						    <td><%=am.Type%></td>
						    <td>
								<a >
                                    <%= Html.ActionLink("Edit", "EditSet/" + am.Id, "Setting")%>
								</a>&nbsp|&nbsp
								<a >
								    <%= Html.ActionLink("Delete", "DeleteId/" + am.Id, "Setting", null, new { @class = "mydel" })%>
								</a>&nbsp|&nbsp
								<a>
								    <%= Html.ActionLink("Detail", "Details/" + am.Id, "Setting")%>
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
	</div>
	</div>			

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="css" runat="server">
<script language="javascript" type="text/javascript">
    $(document).ready(function() {
        $('.mydel').click(function() {
            return confirm('Are you sure Delete?');

    });
    });
</script>
</asp:Content>

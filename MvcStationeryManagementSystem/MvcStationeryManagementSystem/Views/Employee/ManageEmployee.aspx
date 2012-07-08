<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Template.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="MvcStationeryManagementSystem.Models" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Manage Employee
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="css" runat="server">

    <script src="../../Content/js/jquery.validate.js" type="text/javascript"></script>
<script language="javascript" type="text/javascript">
    $(document).ready(function() {
        $('#MyClass').validate({
                rules: {
                employee: {
                    required: true,
                        maxlength: 20
                    }
                },
                messages: {
                employee: {
                }
            }
        });    
        
        $('.mydel').click(function() {
            return confirm('Are you sure Delete?');
        });
        
        
        
        $(function() {
            $("#rss").autocomplete({
                source: function(request, response) {
                    $.ajax({
                    url: "/Employee/findnames", type: "POST", dataType: "json",
                        data: {searchtext: request.term, maxResults: 10},
                            success: function(data){
                                response($.map(data, function(item){
                                return { label: item.EmployeeNumber, value: item.EmployeeNumber, id: item.EmployeeNumber }
                                }))
                            }
                        
                    })
                }
            });
        });

    });
</script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% using (Html.BeginForm("Search", "Employee",FormMethod.Post ,new {@id="MyClass"}))
       {%>
   
    <div class="portlet ui-widget ui-widget-content ui-helper-clearfix ui-corner-all form-container">
					<div class="portlet-header ui-widget-header">Form elements in box</div>
					<div class="portlet-content">
						<form action="#" method="post" enctype="multipart/form-data" class="forms" name="form" >
							<ul>
								
								<li>
									<label  class="desc">
										Search With Employee Name:
									</label>
									<div>
										<%--<%=Html.TextBox("employee", null, new { @id="rss" })%>--%>
										<input type="text" name="employee" id="employee" class="field text medium" value="" tabindex="1" />
									</div>
									<div>
									    <input type="submit" value="Submit" class="submit" />
									</div>
								</li>
							</ul>
						</form>
					</div>
				</div>
    <!--bat dau hastable-->
    <div class="hastable">
						<table id="sort-table"> 
						<thead> 
						<tr>
							<th class="header">Employee Number</th>
						    <th class="style1">Full Name</th>
						    <th class="header">Address</th> 
						    <th class="header">Phone</th>
							<th style="width:132px" class="">Options</th> 
						</tr> 
						</thead> 
						<tbody> 
						<% foreach (Employee am in (List<Employee>)ViewData["ListAccount"])
         {%>
						<tr>
							<td><%=am.EmployeeNumber%></td> 
						    <td><%=am.FullName%></td> 
						    <td><%=am.Address%></td> 
						    <td><%=am.Phone%></td>
						    <td>
								<a >
                                    <%= Html.ActionLink("Edit", "EditEmployee/" + am.EmployeeNumber, "Employee")%>
								</a>&nbsp|&nbsp
								<a >
								    <% EmployeeModel c = new EmployeeModel(); %>
								    <%= Html.ActionLink("Delete", "Delete/" + am.EmployeeNumber, "Employee", new { @class = "mydel" })%>

								    
								</a>&nbsp|&nbsp
								<a>
								    <%= Html.ActionLink("Detail", "Detail/" + am.EmployeeNumber, "Employee")%>
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
            <%} %>
</asp:Content>



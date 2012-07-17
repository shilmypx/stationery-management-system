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
                    //required: true,
                    maxlength: 50
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

    /*
    $('.ssubmit').click(function() {
    var id = $('#employee').val();
    if(id.indexOf(' ') != -1)
    //$('#texte').html("ko dc chua khoang trang");
    alert('Tu can tim ko dc chua khoang trang');
    else
    return true;
    });
    });
    */
    $('#employee').keyup(function() {
        $('#texte').html("");
    });

    //search auto complete
    /*
    $('#employee').keyup(function() {

            var keysearch = $(this).val();

            $.ajax({
    //   type: 'GET',
    url: '/Employee/Search2/' + keysearch,
    success: function(data) {
    //    alert(data);
    $('tbody#mytbody').html("");
    $('tbody#mytbody').html(data);
    }
    });

        });
    */


});
</script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% using (Html.BeginForm("Search", "Employee",FormMethod.Post ,new {@id="MyClass"}))
       {%>
   
    <div class="portlet ui-widget-content ui-helper-clearfix ui-corner-all form-container">
					<div class="portlet-header ui-widget-header">Form search and management employee</div>
					<div class="portlet-content">
						<form action="#" method="post" enctype="multipart/form-data" class="forms" name="form" >
							<ul>
								<li>
								    <div class="divs">
									    <label class="dec">
										    Search with username:
									    </label>
									    <% string rs2 = (string)ViewData["countrs"]; %>
									    <label class="dec">
									            Total Account: <%= rs2 %>      
									    </label>
									    <div class="find_rs">
										    <input type="text" name="employee" id="employee" class="field text medium" value="" tabindex="1" />
										    <input type="submit" value="Search" class="ssubmit" id="submit" />
										    
										</div>
    									<div class="count">
									        <% string rs = (string)ViewData["total"]; %>
									        <label id="texte"><%= rs %></label>
									    </div>
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
						    <th class="header">Full Name</th>
						    <th class="header">Address</th> 
						    <th class="header">Phone</th>
							<th style="width:132px" class="">Options</th> 
						</tr> 
						</thead> 
						<tbody id="mytbody"> 
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
								    <%= Html.ActionLink("Delete", "Delete/" + am.EmployeeNumber, "Employee", null ,new { @class = "mydel" })%>
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



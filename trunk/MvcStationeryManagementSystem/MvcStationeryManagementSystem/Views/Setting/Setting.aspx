<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Template.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="MvcStationeryManagementSystem.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Setting
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<!--begin tab-->
    <div id="tabs">
					<ul>
						<li><a href="#tabs-1">Manager Config</a></li>
						<li><a href="#tabs-2">Create Config</a></li>
					</ul>
					<div id="tabs-1">
					<div class="portlet ui-widget ui-widget-content ui-helper-clearfix ui-corner-all form-container">
					<div class="portlet-header ui-widget-header">Form List Config</div>
					<div class="portlet-content">
   <div class="hastable">
						<table id="Table1"> 
						<thead> 
						<tr>
							<th class="header">MailName</th>
						    <th class="header">MailNetwork</th>
						    <th class="header">Ports</th> 
						    <th class="header">Type</th>
							<td style="width:132px" class="">Options</td> 
						</tr> 
						</thead> 
						<tbody id="Tbody1"> 
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
						<div id="Div1">
					
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
					    
					</div>
					<div id="tabs-2">
					<div class="portlet ui-widget ui-widget-content ui-helper-clearfix ui-corner-all form-container">
					<div class="portlet-header ui-widget-header">Form Create Config</div>
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
									<input type="submit" tabindex="8" value="Save" class="submit" />
									<input type="reset" tabindex="9" value="Reset" class="submit" />
								</li>
							</ul>
						
						<%} %>
			</div>
			</div>    
					</div>
					
				</div>
<!--end tab-->

			

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="css" runat="server">
<script language="javascript" type="text/javascript">
    $(document).ready(function() {
        $('.mydel').click(function() {
        return confirm('Are you sure Delete?');
    });

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

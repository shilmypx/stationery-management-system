<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Template.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="MvcStationeryManagementSystem.Models" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	MyStationery
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="portlet ui-widget-content ui-helper-clearfix ui-corner-all form-container">
					<div class="portlet-header ui-widget-header">My Stationery</div>
					<div class="portlet-content">
   <div>
					<label class="desc" >Search Product Name:</label>
						<input type="text" name="CatalogeName" class="keysearch" value=""  tabindex="2" />							
					</div>
     <div class="hastable">
						<table id="sort-table"> 
						<thead> 
						<tr>
							<th class="header">Product Name</th>
						    <th class="header">Rate</th>
						    <th class="header">Quantity</th> 
						    <th class="header">Arise</th>
						    <th class="header">Description</th>
						
						</tr> 
						</thead> 
						<tbody id="mytbody"> 
						<%
                            int total = 0;			    
                            //List<Mystationerymodel> ls = (List < Mystationerymodel >) ViewData["stn"];
                            if (Session["stn"] != null)
                            {			    
						    			     %>
						
						<% foreach (Mystationerymodel am in (List<Mystationerymodel>)Session["stn"])
         {%>
						<tr>
							<td><%=am.Productname%></td> 
						    <td><%=am.Rate%></td> 
						    <td><%=am.Quantity%></td> 
						    <td><%=am.Arise%></td> 
						    <td><%=am.Description%></td> 
						    <%total = total + am.Quantity;%>
						   
						</tr> 
						<%}
						 }%>
						 
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
								<a>
								    <span style="float:right">Total Quantity : <%=total%></span>
								</a>
						</div>

					Sort multiple columns simultaneously by holding down the shift key and clicking a second, third or even fourth column header! 
					
				</div>
				</div>
				</div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="css" runat="server">
 <script language="javascript" type="text/javascript">
  $(document).ready(function() {
  $('.keysearch').keyup(function() {
        var keysearch = $(this).val();
        $.ajax({
            type: 'GET',
            url: '/mystationery/Search2/' + keysearch,
            success: function(data) {
            $("tbody#mytbody").html("");
            $("tbody#mytbody").html(data);

            }


        });

    });
    });
     </script>
</asp:Content>

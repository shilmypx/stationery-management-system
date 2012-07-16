<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Template.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="MvcStationeryManagementSystem.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Statioery
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<script language="javascript" type="text/javascript">
    $(document).ready(function() {

        $('.keysearch').keyup(function() {
            var keysearch = $(this).val();
            $.ajax({
                type: 'GET',
                url: '/Stationery/Check/' + keysearch,
                success: function(data) {
                    $("tbody#hh").html("");
                    $("tbody#hh").html(data);

                }


            });

        });




    });
</script>
 <div class="portlet-content-new">    <label class="kk">    <%=Session["kt"]%></label>	</div>					
   <div class="portlet ui-widget ui-widget-content ui-helper-clearfix ui-corner-all form-container">
					<div class="portlet-header ui-widget-header">Form  Stationey</div>
					<div class="portlet-content-new">
					<div>
					<label class="d5" >Search ProductName:</label>
						<input type="text" name="CatalogeName" id="CatalogeName" class="keysearch" value=""  tabindex="2" />							
					</div>	   	
					</div>
        <div class="hastable">
						<table id="sort-table"> 
						<thead> 
						<tr>
							
						    <th class="style1">ProductName</th>
						    <th class="style1">Rate</th> 
						    <th class="style1">Quantity</th>
						    <th class="style1">Arise</th>
						    <th class="style1">CatalogeId</th>
						    <th class="style1">Description</th> 
							<th style="width:132px" class="">Options</th> 
						</tr> 
						</thead> 
						<tbody id = "hh"> 
						<% foreach (Stationery s in (List<Stationery>)ViewData["HHCC"])
                        {%>
                       
						<tr>
						
						    <td><%=s.ProductName %></td> 
						    <td><%=s.Rate %></td>
						     <td><%=s.Quantity %></td>
						     <td><%{%>
						     <% decimal a = Convert.ToDecimal((s.Arise * 100) / s.Rate);%>
						     <%=a.ToString("F4")+"%" %>
						     <%}%></td>
						     <td><%=s.CatalogeId %></td>
						     <td><%=s.Description %></td>
						     
						     
						    <td>
								
                                   <%= Html.ActionLink("Edit", "ProcessUpdate/" + s.ProductId, "Stationery")%>
								
								
							    
                                   <%= Html.ActionLink("Delete", "DeleteStationery/" + s.ProductId, "Stationery", null, new { @class = "xoa" })%>
								
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
								</select>	<%= Html.ActionLink("Insert Stationery", "InsertSta", "Stationery", null, new { @class = "D1" })%>|<span class="lk">ToTal Stationery: <%= ViewData["count"]%>...</span><span class="lk">Total Money Rate:<%=ViewData["sum"]%> VND</span>						
						</div>
                        
					
					
					
				</div>
               
    </div>
  
     



</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="css" runat="server">
    <link href="../../Content/css/tables.css" type="text/css" />
    <link href="../../Content/css/neewnew.css" type="text/css" />
   <script language="javascript" type="text/javascript">
       $(document).ready(function() {

           $('.xoa').click(function() {
               return confirm("are you Sure Delete");
               //              var id = $(this).siblings('.emno').text();
               //               $.ajax({
               //              type: "GET",
               //              url: "/Stationery/DeleteStationery/" + id,
               //               success: function(msg) {
               //               alert(msg);
               //                               }
               //                         });
               //                  return false;


           });

           $('.D1').css({
               'color': 'Blue',
               'font-family': 'Verdana',
               'font-style': 'italic',
               'font-size': '18px',
               'text-decoration': 'underline'
           });
           $('.kk').css({
               'margin': '0 1000px 0 0',
               'color': 'red',
               'font-size': '20px'

           });
           $('.d5').css({
               'color': 'Blue',
               'font-size': '18px'

           });

       });

  
    
    </script>
    
    
</asp:Content>


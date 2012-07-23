<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Template.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	MyStationery
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
	
<%=Session["kt"]%>				
   <div class="portlet ui-widget ui-widget-content ui-helper-clearfix ui-corner-all form-container">
					<div class="portlet-header ui-widget-header">Form  Stationey</div>
					<div class="portlet-content">
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
							
						</tr> 
						</thead> 
						<tbody id = "hh"> 
						
                       
						<tr>
						
						    <td></td> 
						    <td></td>
						     <td></td>
						     <td></td>
						     <td></td>
						     <td></td>
						     
						     
						   
						</tr> 
						
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
								</select>	<span class="lk">ToTal Stationery: ||</span><span class="lk">Total Money Rate: VND</span>
													
						</div>
                        
					
			
					
				</div>
               <div class="portlet-content"></div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="css" runat="server">
</asp:Content>

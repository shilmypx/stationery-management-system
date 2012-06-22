<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/TemplatenewRequest.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="MvcStationeryManagementSystem.Models"%>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	MyRequest2
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

      <div id="tabs-1">
        <div class="hastable">
					<form name="myform" class="pager-form" method="post" action="#">
						<table id="sort-table"> 
						<thead> 
						<tr>
							<%--<th><input type="checkbox" value="check_none" onclick="this.value=check(this.form.list)" class="submit"/></th>--%>
						    <th class="header">RequestName</th> 
						    <%--<th>CatalogRequestName</th> --%>
						    <th>CatalogRequestName</th> 
						    <th>DateDispatch</th> 
						    <th>DateApprove</th>
						    <th>RequestContent</th>
						    <%--<th>Description</th>--%>
						    
						    <td style="width:30px">Options</td> 
						</tr> 
						</thead> 
						<tbody> 
	
          <%foreach (RequestModel rq in (List<RequestModel>)ViewData["lst"])
            {%>
						<tr>
							<%--<td class="center"><input type="checkbox" value="1" name="list" class="checkbox"/></td> --%>
						    <td><%=rq.RName1%></td> 
						    <td><%=rq.CRQName1%></td> 
						    <td><%=rq.DDispatch1.ToString("dd-MM-yyyy")%></td> 
						   
						    <%if (!rq.DApprove1.ToString("dd-MM-yyyy").Equals("01-01-0001"))
                             {%>
                                 <td>
                                <%=rq.DApprove1.ToString("dd-MM-yyyy")%>
                                 </td>
                           <% }
                                else
                                { %>
                                    <td>
                                        <span>null</span>
                                 </td>
                                   <% }
                            %>
                           
                           <%-- <%=rq.DApprove1.ToString("dd-MM-yyyy")%></td> --%>
						    <td><%=rq.RContent1%></td> 
						    <%--<td><%=rq.Dtion1%></td> --%>
						    <td>
								<%--<a class="btn_no_text btn ui-state-default ui-corner-all tooltip" title="Edit this example" href="#">
									<span class="ui-icon ui-icon-wrench"></span>
								</a>
								<a class="btn_no_text btn ui-state-default ui-corner-all tooltip" title="Favourite this example" href="#">
									<span class="ui-icon ui-icon-heart"></span>
								</a>
								<a class="btn_no_text btn ui-state-default ui-corner-all tooltip" title="Add to shopping card example" href="#">
									<span class="ui-icon ui-icon-cart"></span>
								</a>
								<a class="btn_no_text btn ui-state-default ui-corner-all tooltip" title="Delete this example" href="#">
									<span class="ui-icon ui-icon-circle-close"></span>
								</a>--%>
							</td>
							
							<%--<td><%=Session["Employee"].ToString()%></td>--%>
						</tr> 
						<% }%>
						
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
					</form>

					Sort multiple columns simultaneously by holding down the shift key and clicking a second, third or even fourth column header! 
					
				</div>
               
    </div>
    
             <div id="tabs-2">
        <div class="hastable">
					<form name="myform" class="pager-form" method="post" action="#">
						<table id="sort-table1"> 
						<thead> 
						<tr>
							<%--<th><input type="checkbox" value="check_none" onclick="this.value=check(this.form.list)" class="submit"/></th>--%>
						    <%--<th class="header">RequestName</th> --%>
						   
						    <th>RequestName</th> 
						    <th>CatalogRequestName</th> 
						    <th>DateDispatch</th>
						    <th>DateApprove</th>
						    <th>RequestContent</th>
						    
						    <td style="width:30px">Options</td> 
						</tr> 
						</thead> 
						<tbody> 
	
          <%foreach (RequestModel rq in (List<RequestModel>)ViewData["lst1"])
            {%>
						<tr>
							<%--<td class="center"><input type="checkbox" value="1" name="list" class="checkbox"/></td> --%>
						    
						    <td><%=rq.RName1%></td> 
						    <td><%=rq.CRQName1%></td> 
						    <td><%=rq.DDispatch1.ToString("dd-MM-yyyy")%></td> 
						   
						    <%if (!rq.DApprove1.ToString("dd-MM-yyyy").Equals("01-01-0001"))
                             {%>
                                 <td>
                                <%=rq.DApprove1.ToString("dd-MM-yyyy")%>
                                 </td>
                           <% }
                                else
                                { %>
                                    <td>
                                        <span>null</span>
                                 </td>
                                   <% }
                            %>
                           
                           <%-- <%=rq.DApprove1.ToString("dd-MM-yyyy")%></td> --%>
						    <td><%=rq.RContent1%></td> 
						    <%--<td><%=rq.Dtion1%></td> --%>
						    <td>
								
							</td>
							
							<%--<td><%=Session["Employee"].ToString()%></td>--%>
						</tr> 
						<% }%>
						
						</tbody>
						</table>
						<div id="pager1">
					
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
					</form>

					Sort multiple columns simultaneously by holding down the shift key and clicking a second, third or even fourth column header! 
					
				</div>
               
    </div>
         
          <div id="tabs-3">
                <div class="hastable">
					<form name="myform" class="pager-form" method="post" action="#">
						<table id="sort-table2"> 
						<thead> 
						<tr>
							<%--<th><input type="checkbox" value="check_none" onclick="this.value=check(this.form.list)" class="submit"/></th>--%>
						    <%--<th class="header">RequestName</th> --%>
						   
						    <th>RequestName</th> 
						    <th>CatalogRequestName</th> 
						    <th>DateDispatch</th>
						    <th>DateApprove</th>
						    <th>RequestContent</th>
						    
						    <td style="width:30px">Options</td> 
						</tr> 
						</thead> 
						<tbody> 
	
          <%foreach (RequestModel rq in (List<RequestModel>)ViewData["lst2"])
            {%>
						<tr>
							<%--<td class="center"><input type="checkbox" value="1" name="list" class="checkbox"/></td> --%>
						    
						    <td><%=rq.RName1%></td> 
						    <td><%=rq.CRQName1%></td> 
						    <td><%=rq.DDispatch1.ToString("dd-MM-yyyy")%></td> 
						   
						    <%if (!rq.DApprove1.ToString("dd-MM-yyyy").Equals("01-01-0001"))
                             {%>
                                 <td>
                                <%=rq.DApprove1.ToString("dd-MM-yyyy")%>
                                 </td>
                           <% }
                                else
                                { %>
                                    <td>
                                        <span>null</span>
                                 </td>
                                   <% }
                            %>
                           
                           <%-- <%=rq.DApprove1.ToString("dd-MM-yyyy")%></td> --%>
						    <td><%=rq.RContent1%></td> 
						    <%--<td><%=rq.Dtion1%></td> --%>
						    <td>
								<%--<a class="btn_no_text btn ui-state-default ui-corner-all tooltip" title="Edit this example" href="#">
									<span class="ui-icon ui-icon-wrench"></span>
								</a>
								<a class="btn_no_text btn ui-state-default ui-corner-all tooltip" title="Favourite this example" href="#">
									<span class="ui-icon ui-icon-heart"></span>
								</a>
								<a class="btn_no_text btn ui-state-default ui-corner-all tooltip" title="Add to shopping card example" href="#">
									<span class="ui-icon ui-icon-cart"></span>
								</a>
								<a class="btn_no_text btn ui-state-default ui-corner-all tooltip" title="Delete this example" href="#">
									<span class="ui-icon ui-icon-circle-close"></span>
								</a>--%>
							</td>
							
							<%--<td><%=Session["Employee"].ToString()%></td>--%>
						</tr> 
						<% }%>
						
						</tbody>
						</table>
						<div id="pager2">
					
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
					</form>

					Sort multiple columns simultaneously by holding down the shift key and clicking a second, third or even fourth column header! 
					
				</div>
               
    </div>
	
    <div id="tabs-4">
    </div>
	<div id="tabs-5">
	</div>
    <div id="tabs-6">
    </div >

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="css" runat="server">
</asp:Content>

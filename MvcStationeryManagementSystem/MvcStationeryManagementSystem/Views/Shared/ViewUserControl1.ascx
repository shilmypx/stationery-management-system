<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<%@ Import Namespace=" MvcStationeryManagementSystem.Models" %>
<%
    int a=1;
    if(a==1){%>
    
    
<div id="tabs-1">
        <div class="hastable">
					<form name="myform" class="pager-form" method="post" action="#">
						<table id="sort-table"> 
						<thead> 
						<tr>
							<%--<th><input type="checkbox" value="check_none" onclick="this.value=check(this.form.list)" class="submit"/></th>--%>
						    <th>RequestName</th> 
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
	
          <%foreach (RequestModel22 rq in (List<RequestModel22>)ViewData["lst"])
            {%>
						<tr>
							<%--<td class="center"><input type="checkbox" value="1" name="list" class="checkbox"/></td> --%>
						    <td><%=rq.Rname1%></td> 
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
						        <%=Html.ActionLink("Select","DetailRQ/"+rq.RId1,"Default1")%>
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
     <%}%>
<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Template.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="MvcStationeryManagementSystem.Models"%>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	MyRequest10
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

     <div id="tabs" >
       <ul>
						<li><a href="#tabs-1">My NewRequest</a></li>
						<li><a href="#tabs-2">Requests Approved</a></li>
						<li><a href="#tabs-3">My Accept</a></li>
						<li><a href="#tabs-4">My Reject</a></li>
						<li><a href="#tabs-5">Requests No Approved</a></li>
						<li><a href="#tabs-6">New Requests</a></li>
						<li><a href="#tabs-7">Withdraw Requests</a></li>
						<li><a href="#tabs-8">Cancel Requests</a></li>
						<li><a href="#tabs-9">Accept Requests</a></li>
	</ul>
	  <%Html.RenderPartial("ViewUserControl1");%>
       <div id="tabs-2">
        <div class="hastable">
					<form name="myform" class="pager-form" method="post" action="#">
						<table id="sort-table1"> 
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
	
          <%foreach (RequestModel22 rq in (List<RequestModel22>)ViewData["lst1"])
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
                           
                    
						    <td><%=rq.RContent1%></td> 
						   
						    <td>
							
						        <%=Html.ActionLink("Select","DetailRQ2/"+rq.RId1,"Default1")%>
							
							</td>
							
							
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
        <div class="hastable">
					<form name="myform" class="pager-form" method="post" action="#">
						<table id="sort-table3"> 
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
	
          <%foreach (RequestModel rq in (List<RequestModel>)ViewData["lst3"])
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
						<div id="pager3">
					
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
    <div id="tabs-5">
        <div class="hastable">
					<form name="myform" class="pager-form" method="post" action="#">
						<table id="sort-table4"> 
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
	
          <%foreach (RequestModel22 rq in (List<RequestModel22>)ViewData["lst4"])
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
						<div id="pager4">
					
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
    
    <div id="tabs-6">
        <div class="hastable">
					<form name="myform" class="pager-form" method="post" action="#">
						<table id="sort-table5"> 
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
	
          <%foreach (RequestModel22 rq in (List<RequestModel22>)ViewData["lst5"])
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
						<div id="pager5">
					
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
    <div id="tabs-7">
        <div class="hastable">
					<form name="myform" class="pager-form" method="post" action="#">
						<table id="sort-table6"> 
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
	
          <%foreach (RequestModel22 rq in (List<RequestModel22>)ViewData["lst6"])
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
						<div id="pager6">
					
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
    
    <div id="tabs-8">
        <div class="hastable">
					<form name="myform" class="pager-form" method="post" action="#">
						<table id="sort-table7"> 
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
	
          <%foreach (RequestModel22 rq in (List<RequestModel22>)ViewData["lst7"])
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
						<div id="pager7">
					
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
   
    <div id="tabs-9">
        <div class="hastable">
					<form name="myform" class="pager-form" method="post" action="#">
						<table id="sort-table8"> 
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
	
          <%foreach (RequestModel22 rq in (List<RequestModel22>)ViewData["lst8"])
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
						<div id="pager8">
					
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
</div>
     
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="css" runat="server">
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Template.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="MvcStationeryManagementSystem.Models"%>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	MyRequest10
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div id="tabs" >
    <%string ss = Session["ac"]==null ? "0" : (string)(Session["ac"]);%>
      <%=Html.Hidden("ac", ss, new {@id="idtabs"})%>
       
    
       <ul>
						<%Employee e = (Employee)Session["Employee"];
        if (e.RoleId == 2) { %>
      
                         <li id="t1"><a href="#tabs-1">My NewRequest</a></li>
						<li id="t2"><a href="#tabs-2">Requests Approved</a></li>
						<li id="t3"><a href="#tabs-3">My Accept</a></li>
						<li id="t4"><a href="#tabs-4">My Reject</a></li>
						<li id="t5"><a href="#tabs-5">Requests No Approved</a></li>
						
						<li id="t6"><a href="#tabs-6">New Requests</a></li>
						<li id="t7"><a href="#tabs-7">Withdraw Requests</a></li>
						<li id="t8"><a href="#tabs-8">Cancel Requests</a></li>
						<li id="t9"><a href="#tabs-9">Accept Requests</a></li>
        <%}
            else if(e.RoleId == 3)
        {%>
            
                        <li id="t1"><a href="#tabs-1">My NewRequest</a></li>
						<li id="t2"><a href="#tabs-2">Requests Approved</a></li>
						<li id="t3"><a href="#tabs-3">My Accept</a></li>
						<li id="t4"><a href="#tabs-4">My Reject</a></li>
						<li id="t5"><a href="#tabs-5">Requests No Approved</a></li>
         
          <%  }
        else if (e.RoleId == 1)
        { %>
                        <li id="t10"><a href="#tabs-10">New Requests</a></li>
                        <li id="t11"><a href="#tabs-11">Withdraw Requests</a></li>
						<li id="t12"><a href="#tabs-12">Cancel Requests</a></li>
						<li id="t13"><a href="#tabs-13">Accept Requests</a></li>
        <%}%>

						
                        
                      
	</ul>
	<%
        if (e.RoleId == 2) { %>
       
         
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
						<%List<RequestModel22> a2 = (List<RequestModel22>)ViewData["lst"];
                        if(a2.Count()==0)
                        {%>
                             <tr>
	        <td></td>
	        <td></td>
	        <td></td>
	        <td></td>
	        <td></td>
	        <td></td>
	        </tr>
                        <%}
            %>
	       
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
	        <%List<RequestModel22> b2 = (List<RequestModel22>)ViewData["lst1"];
                        if(b2.Count()==0)
                        {%>
                             <tr>
	        <td></td>
	        <td></td>
	        <td></td>
	        <td></td>
	        <td></td>
	        <td></td>
	        </tr>
                        <%}
            %>
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
	        <%List<RequestModel> c2 = (List<RequestModel>)ViewData["lst2"];
                        if(c2.Count()==0)
                        {%>
                             <tr>
	        <td></td>
	        <td></td>
	        <td></td>
	        <td></td>
	        <td></td>
	        <td></td>
	        </tr>
                        <%}
            %>
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
								 <%=Html.ActionLink("Select","DetailRQ3/"+rq.RId1,"Default1")%>
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
   <%List<RequestModel> e22 = (List<RequestModel>)ViewData["lst3"];
                        if(e22.Count()==0)
                        {%>
                             <tr>
	        <td></td>
	        <td></td>
	        <td></td>
	        <td></td>
	        <td></td>
	        <td></td>
	        </tr>
                        <%}
            %>
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
								 <%=Html.ActionLink("Select","DetailRQ3/"+rq.RId1,"Default1")%>
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
	         <%List<RequestModel22> ff = (List<RequestModel22>)ViewData["lst4"];
                        if(ff.Count()==0)
                        {%>
                             <tr>
	        <td></td>
	        <td></td>
	        <td></td>
	        <td></td>
	        <td></td>
	        <td></td>
	        </tr>
                        <%}
            %>
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
								 <%=Html.ActionLink("Select","DetailRQ3/"+rq.RId1,"Default1")%>
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
	         <%List<RequestModel22> g = (List<RequestModel22>)ViewData["lst5"];
                        if(g.Count()==0)
                        {%>
                             <tr>
	        <td></td>
	        <td></td>
	        <td></td>
	        <td></td>
	        <td></td>
	        <td></td>
	        </tr>
                        <%}
            %>
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
								 <%=Html.ActionLink("Select","DetailRQ4/"+rq.RId1,"Default1")%>
							</td>
							
						
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
	         <%List<RequestModel22> h = (List<RequestModel22>)ViewData["lst6"];
                        if(h.Count()==0)
                        {%>
                             <tr>
	        <td></td>
	        <td></td>
	        <td></td>
	        <td></td>
	        <td></td>
	        <td></td>
	        </tr>
                        <%}
            %>
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
								<%=Html.ActionLink("Select", "DetailRQ3/" + rq.RId1, "Default1")%>
							</td>
							
							
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
	 <%List<RequestModel22> i = (List<RequestModel22>)ViewData["lst7"];
                        if(i.Count()==0)
                        {%>
                             <tr>
	        <td></td>
	        <td></td>
	        <td></td>
	        <td></td>
	        <td></td>
	        <td></td>
	        </tr>
                        <%}
            %>
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
								<%=Html.ActionLink("Select", "DetailRQ5/" + rq.RId1, "Default1")%>
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
	         <%List<RequestModel22> k = (List<RequestModel22>)ViewData["lst8"];
                        if(k.Count()==0)
                        {%>
                             <tr>
	        <td></td>
	        <td></td>
	        <td></td>
	        <td></td>
	        <td></td>
	        <td></td>
	        </tr>
                        <%}
            %>
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
								<%=Html.ActionLink("Select", "DetailRQ3/" + rq.RId1, "Default1")%>
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
      <%}
        else  if (e.RoleId == 3)
          { %>
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
						<%List<RequestModel22> a = (List<RequestModel22>)ViewData["lst"];
                        if(a.Count()==0)
                        {%>
                             <tr>
	        <td></td>
	        <td></td>
	        <td></td>
	        <td></td>
	        <td></td>
	        <td></td>
	        </tr>
                        <%}
            %>
	       
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
	        <%List<RequestModel22> b = (List<RequestModel22>)ViewData["lst1"];
                        if(b.Count()==0)
                        {%>
                             <tr>
	        <td></td>
	        <td></td>
	        <td></td>
	        <td></td>
	        <td></td>
	        <td></td>
	        </tr>
                        <%}
            %>
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
	        <%List<RequestModel> c = (List<RequestModel>)ViewData["lst2"];
                        if(c.Count()==0)
                        {%>
                             <tr>
	        <td></td>
	        <td></td>
	        <td></td>
	        <td></td>
	        <td></td>
	        <td></td>
	        </tr>
                        <%}
            %>
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
								 <%=Html.ActionLink("Select","DetailRQ3/"+rq.RId1,"Default1")%>
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
   <%List<RequestModel> e2 = (List<RequestModel>)ViewData["lst3"];
                        if(e2.Count()==0)
                        {%>
                             <tr>
	        <td></td>
	        <td></td>
	        <td></td>
	        <td></td>
	        <td></td>
	        <td></td>
	        </tr>
                        <%}
            %>
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
								 <%=Html.ActionLink("Select","DetailRQ3/"+rq.RId1,"Default1")%>
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
	         <%List<RequestModel22> f = (List<RequestModel22>)ViewData["lst4"];
                        if(f.Count()==0)
                        {%>
                             <tr>
	        <td></td>
	        <td></td>
	        <td></td>
	        <td></td>
	        <td></td>
	        <td></td>
	        </tr>
                        <%}
            %>
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
								 <%=Html.ActionLink("Select","DetailRQ3/"+rq.RId1,"Default1")%>
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
    <%}
        else if (e.RoleId == 1)
        { %>
    <div id="tabs-10">
        <div class="hastable">
					<form name="myform" class="pager-form" method="post" action="#">
						<table id="sort-table9"> 
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
	         <%List<RequestModel22> gg = (List<RequestModel22>)ViewData["lst55"];
                        if(gg.Count()==0)
                        {%>
                             <tr>
	        <td></td>
	        <td></td>
	        <td></td>
	        <td></td>
	        <td></td>
	        <td></td>
	        </tr>
                        <%}
            %>
          <%foreach (RequestModel22 rq in (List<RequestModel22>)ViewData["lst55"])
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
								 <%=Html.ActionLink("Select","DetailRQ4/"+rq.RId1,"Default1")%>
							</td>
							
						
						</tr> 
						<% }%>
						
						</tbody>
						</table>
						<div id="pager9">
					
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
    <div id="tabs-11">
        <div class="hastable">
					<form name="myform" class="pager-form" method="post" action="#">
						<table id="sort-table10"> 
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
	         <%List<RequestModel22> hh = (List<RequestModel22>)ViewData["lst66"];
                        if(hh.Count()==0)
                        {%>
                             <tr>
	        <td></td>
	        <td></td>
	        <td></td>
	        <td></td>
	        <td></td>
	        <td></td>
	        </tr>
                        <%}
            %>
          <%foreach (RequestModel22 rq in (List<RequestModel22>)ViewData["lst66"])
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
								<%=Html.ActionLink("Select", "DetailRQ3/" + rq.RId1, "Default1")%>
							</td>
							
							
						</tr> 
						<% }%>
						
						</tbody>
						</table>
						<div id="pager10">
					
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
    <div id="tabs-12">
        <div class="hastable">
					<form name="myform" class="pager-form" method="post" action="#">
						<table id="sort-table11"> 
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
	 <%List<RequestModel22> ii = (List<RequestModel22>)ViewData["lst77"];
                        if(ii.Count()==0)
                        {%>
                             <tr>
	        <td></td>
	        <td></td>
	        <td></td>
	        <td></td>
	        <td></td>
	        <td></td>
	        </tr>
                        <%}
            %>
          <%foreach (RequestModel22 rq in (List<RequestModel22>)ViewData["lst77"])
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
								<%=Html.ActionLink("Select", "DetailRQ5/" + rq.RId1, "Default1")%>
							</td>
							
							<%--<td><%=Session["Employee"].ToString()%></td>--%>
						</tr> 
						<% }%>
						
						</tbody>
						</table>
						<div id="pager11">
					
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
    <div id="tabs-13">
        <div class="hastable">
					<form name="myform" class="pager-form" method="post" action="#">
						<table id="sort-table12"> 
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
	         <%List<RequestModel22> kk = (List<RequestModel22>)ViewData["lst88"];
                        if(kk.Count()==0)
                        {%>
                             <tr>
	        <td></td>
	        <td></td>
	        <td></td>
	        <td></td>
	        <td></td>
	        <td></td>
	        </tr>
                        <%}
            %>
          <%foreach (RequestModel22 rq in (List<RequestModel22>)ViewData["lst88"])
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
								<%=Html.ActionLink("Select", "DetailRQ3/" + rq.RId1, "Default1")%>
							</td>
							
							<%--<td><%=Session["Employee"].ToString()%></td>--%>
						</tr> 
						<% }%>
						
						</tbody>
						</table>
						<div id="pager12">
					
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
</div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="css" runat="server">
<script language="javascript" type="text/javascript">
   
    $(document).ready(function() {
        
     
    });
    
        function xl1() {
           
            $('#t2').show();
            $('#tabs-2').show();
            $('#tabs').tabs('option', 'selected', 1);
        }
        function xl2() {

            $('#t3').show();
            $('#tabs-3').show();
            $('#tabs').tabs('option', 'selected', 2);
        }
        function xl3() {

            $('#t4').show();
            $('#tabs-4').show();
            $('#tabs').tabs('option', 'selected', 3);
        }
        function xl4() {

            $('#t5').show();
            $('#tabs-5').show();
            $('#tabs').tabs('option', 'selected', 4);
        }
        function xl5() {

            $('#t6').show();
            $('#tabs-6').show();
            $('#tabs').tabs('option', 'selected', 5);
        }
        function xl6() {

            $('#t7').show();
            $('#tabs-7').show();
            $('#tabs').tabs('option', 'selected', 6);
        }
        function xl7() {

            $('#t8').show();
            $('#tabs-8').show();
            $('#tabs').tabs('option', 'selected', 7);
        }
        function xl8() {

            $('#t9').show();
            $('#tabs-9').show();
            $('#tabs').tabs('option', 'selected', 8);
        }
        function xl9() {
            //var v = $('#idtabs').val();
           // alert(v);
//            $('#t10').show();
//            $('#tabs-10').show();
            $('#tabs').tabs('option', 'selected', 0);
        }
        function xl10() {
            //var v = $('#idtabs').val();
            //alert(v);
            //$('#t11').show();
            //$('#tabs-11').show();
            $('#tabs').tabs('option', 'selected', 1);
        }
        function xl11() {
            //var v = $('#idtabs').val();
            //alert(v);
            //$('#t12').show();
            //$('#tabs-12').show();
            $('#tabs').tabs('option', 'selected',2);
        }
        function xl12() {
           // var v = $('#idtabs').val();
            //alert(v);
            //$('#t13').show();
            //$('#tabs-13').show();
            $('#tabs').tabs('option', 'selected', 3);
        }
        
        
    </script>
</asp:Content>

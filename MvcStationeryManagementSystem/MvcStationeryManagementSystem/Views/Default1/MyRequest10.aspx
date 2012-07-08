<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Template.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="MvcStationeryManagementSystem.Models"%>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	MyRequest10
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div id="tabs" >
       <ul>
						<%--<li id="t1" ><a  href="#tabs-1" onclick="xl()">My NewRequest</a></li>
						<li id="t2"><a href="#tabs-2">Requests Approved</a></li>
						<li><a href="#tabs-3">My Accept</a></li>
						<li><a href="#tabs-4">My Reject</a></li>
						<li><a href="#tabs-5">Requests No Approved</a></li>
						<li><a href="#tabs-6">New Requests</a></li>
						<li><a href="#tabs-7">Withdraw Requests</a></li>
						<li><a href="#tabs-8">Cancel Requests</a></li>
						<li><a href="#tabs-9">Accept Requests</a></li>--%>

						<li id="t1"><a href="#tabs-1">My NewRequest</a></li>
						<li id="t2"><a href="#tabs-2">Requests Approved</a></li>
						<li id="t3"><a href="#tabs-3">My Accept</a></li>
						<li id="t4"><a href="#tabs-4">My Reject</a></li>
						<li id="t5"><a href="#tabs-5">Requests No Approved</a></li>
						<li id="t6"><a href="#tabs-6">New Requests</a></li>
						
						<li id="t7"><a href="#tabs-7">Withdraw Requests</a></li>
						<li id="t8"><a href="#tabs-8">Cancel Requests</a></li>
						<li id="t9"><a href="#tabs-9">Accept Requests</a></li>

	</ul>
	
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
   <%List<RequestModel> e = (List<RequestModel>)ViewData["lst3"];
                        if(e.Count()==0)
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
      
      
</div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="css" runat="server">
<script language="javascript" type="text/javascript">
    $(document).ready(function() {
        $('#t2').hide();
        $('#tabs-2').hide();
        $('#t3').hide();
        $('#tabs-3').hide();
        $('#t4').hide();
        $('#tabs-4').hide();
        $('#t5').hide();
        $('#tabs-5').hide();
        $('#t6').hide();
        $('#tabs-6').hide();
        $('#t7').hide();
        $('#tabs-7').hide();
        $('#t8').hide();
        $('#tabs-8').hide();
        $('#t9').hide();
        $('#tabs-9').hide();
        $('#t10').hide();
        $('#tabs-10').hide();
        $('#t11').hide();
        $('#tabs-11').hide();
        $('#t12').hide();
        $('#tabs-12').hide();
        $('#t13').hide();
        $('#tabs-13').hide();
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
          
            $('#t10').show();
            $('#tabs-10').show();
            $('#tabs').tabs('option', 'selected', 9);
        }
        function xl10() {

            $('#t11').show();
            $('#tabs-11').show();
            $('#tabs').tabs('option', 'selected', 10);
        }
        function xl11() {

            $('#t12').show();
            $('#tabs-12').show();
            $('#tabs').tabs('option', 'selected',11);
        }
        function xl12() {

            $('#t13').show();
            $('#tabs-13').show();
            $('#tabs').tabs('option', 'selected', 12);
        }
        
        
    </script>
</asp:Content>

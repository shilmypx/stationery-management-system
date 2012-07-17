<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Template.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="MvcStationeryManagementSystem.Models" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	DetailRQ22
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="portlet ui-widget ui-widget-content ui-helper-clearfix ui-corner-all form-container">
					<div class="portlet-header ui-widget-header">Form elements in box</div>
					<div class="portlet-content">
					 <% RequestModel r = (RequestModel)ViewData["if"];
                            string a = r.Stte1; bool b = r.Acc1;
                          
					    %>
					      <% using (Html.BeginForm("update2", "default1"))
              {%>
                            <% RequestModel rm = (RequestModel)ViewData["if"];
                               List<Request_StationeryModel> rm1 = (List<Request_StationeryModel>)ViewData["if1"];%>
                                <ul>
                                
                                <%= Html.Hidden("requestid", rm.RId1)%> 
                                <%if (a.Equals("2") ||(a.Equals("9") && b==false))
                                  {%>
                                
                                 <%= Html.Hidden("st", 4)%>  
                                  <%= Html.Hidden("acc", true)%>
                                 
                                <%}
                                  else if ((a.Equals("66") && b == true) || (a.Equals("6") && b == true) || (a.Equals("7") && b == false))
                                  {%> 
                                     <%= Html.Hidden("st", 7)%>  
                                     <%= Html.Hidden("acc", true)%>
                                  
                                      <%} %>
                                <%= Html.Hidden("da", rm.DApprove1)%>
                               
                             
                                 
                                <%= Html.Hidden("en", rm.ENumber1)%>
                                   <%= Html.Hidden("ctid", rm.CRQId1)%>
                                <li>
                                CatalogRequestName:<%= Html.TextBox("a", rm.CRQName1, new { @class = "aa", @readonly = "readonly" })%>
                                </li>
                               
                                <li>
                                RequestName:<%= Html.TextBox("rname", rm.RName1, new { @class = "aa", @readonly = "readonly" })%>
                                </li>
                                 <li>Employee Name:<%= Html.TextBox("b", rm.FName1, new { @class = "aa", @readonly = "readonly" })%>
                                 </li>
                                <li>
                                DateDispatch: <%= Html.TextBox("dd", rm.DDispatch1.ToString("dd-MM-yyyy"), new { @class = "aa", @readonly = "readonly" })%>
                                </li>
                                
                                <li>
                                DateApproved: 
                                 <%if (!rm.DApprove1.ToString("dd-MM-yyyy").Equals("01-01-0001"))
                                   {%>
                                 <%= Html.TextBox("da", rm.DApprove1, new { @class = "aa", @readonly = "readonly" })%>
                           <% }
                                   else
                                   { %>
                                     <%= Html.TextBox("da", " ", new { @class = "aa", @readonly = "readonly" })%>
                                        
                                
                                   <% }
                            %>
                               
                                </li>
                                <li>
                                Reques Content: <%= Html.TextArea("rc", rm.RContent1, new { @class = "aa", @readonly = "readonly" })%><br /> 
                                </li>
                              
                                
                                <li>
                                Descripton:<%= Html.TextArea("dt", rm.Dtion1, new { @class = "aa", @readonly = "readonly" })%><br /> 
                                </li>
                                 <li>Stationery Items</li>
                                <li>
                    <div class="hastable" style="width:278%">
					<form name="myform" class="pager-form" method="post" action="#">
						<table id="sort-table"> 
						<thead> 
						<tr>
							<%--<th><input type="checkbox" value="check_none" onclick="this.value=check(this.form.list)" class="submit"/></th>--%>
						    <th>Cataloge Name</th> 
						    <%--<th>CatalogRequestName</th> --%>
						    <th>Stationery Name</th> 
						    <th>Quantity</th> 
						    <th>Rate</th>
						    <th>Arise</th>
						    <%--<th>Description</th>--%>
						    
						   
						</tr> 
						</thead> 
						<tbody> 
	
          <%foreach (Request_StationeryModel rq in (List<Request_StationeryModel>)ViewData["if1"])
            {%>
						<tr>
							<%--<td class="center"><input type="checkbox" value="1" name="list" class="checkbox"/></td> --%>
						    <td><%=rq.CtalogeName1%></td> 
						    <td><%=rq.PName1%></td> 
						    <td><%=rq.Qty1%></td> 
						    <td><%=rq.Rte1%></td> 
                           
						    <td><%=rq.Ar1%></td> 
						   
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

					
					
				</div>
                                </li>
                                 <%
                  Employee em=(Employee)Session["Employee"];
                  if (!a.Equals("6")&& em.RoleId!=2)
                                   {  %> 
                                <li style="float:left;margin-left:102px">
                                <input type="submit" name="submitButton" value="     Accept     "/>
                             
                                
                                </li>
                              <%}
                  else if (a.Equals("6") && em.RoleId != 2) { %>
                   
                    <li style="float:left;margin-left:102px">
                                <input type="submit" name="submitButton" value="     Accept     "/>
                                </li>
                  <%}
                  else if (em.RoleId == 2 && a.Equals("2") && b == true)
                  {%>
                      <li style="float:left;margin-left:102px">
                                <input type="submit" name="submitButton" value="     Accept     "/>
                                </li>
                   <%}
                  else if ((em.RoleId == 2 && a.Equals("2") && b == false) || (em.RoleId == 2 && a.Equals("9") && b == false))
                  { %>
                  
                      <li style="float:left;margin-left:102px">
                                <input type="submit" name="submitButton" value="     Accept     "/>
                                </li>
                  <%} %>
                               
                                </ul>
                            <%}%>
                            <%Html.EndForm();%>
                            <%--sumit2--%>
					    
					     <% using (Html.BeginForm("update2", "default1"))
             {%>
                            <% RequestModel rm = (RequestModel)ViewData["if"];
                               List<Request_StationeryModel> rm1 = (List<Request_StationeryModel>)ViewData["if1"];%>
                                <ul>
                                
                                <%= Html.Hidden("requestid", rm.RId1)%> 
                                  <%if (a.Equals("2"))
                                    {%>
                                
                                 <%= Html.Hidden("st", 2)%>  
                                  <%= Html.Hidden("acc", false)%>
                                
                                <%}
                                    else if (a.Equals("6") && b == true)
                                    {%> 
                                     <%= Html.Hidden("st", 7)%>  
                                     <%= Html.Hidden("acc", false)%>
                                  
                                      <%} %>
                                
                                <%= Html.Hidden("da", rm.DApprove1)%>
                            
                                 
                                <%= Html.Hidden("en", rm.ENumber1)%>
                                   <%= Html.Hidden("ctid", rm.CRQId1)%>
                              
                               
                                
                                <%= Html.Hidden("rname", rm.RName1)%>
                               
                               <%= Html.Hidden("dd", rm.DDispatch1.ToString("dd-MM-yyyy"))%>
                               
                               
                                 <%if (!rm.DApprove1.ToString("dd-MM-yyyy").Equals("01-01-0001"))
                                   {%>
                                 <%= Html.Hidden("da", rm.DApprove1)%>
                           <% }
                                   else
                                   { %>
                                     <%= Html.Hidden("da", "null")%>
                                        
                                
                                   <% }
                            %>
                               
                               
                               <%= Html.Hidden("rc", rm.RContent1)%>
                              
                              
                                
                               <%= Html.Hidden("dt", rm.Dtion1)%>
                               <%Employee em1 = (Employee)Session["Employee"];
                 //!(em1.RoleId == 2 && a.Equals("6") && b == true) && !(em1.RoleId == 2 && a.Equals("66") && b == true) && !(a.Equals("2") && b == false) && !(a.Equals(" 9") && b == false) && !(a.Equals("7") && b == false)
                                 if ((a.Equals("9")&&b==false))
                                 {%>                
                                 
                               <%}
                                 else if (em1.RoleId == 2 && a.Equals("2") && b == true)
                                 {%> 
                                
                                      <li style="float:left;margin-left: 210px;margin-top: -40px">
                                 <input type="submit" name="submitButton" value="      Reject      "/>
                                 </li>
                                 <%}
                                 else if ((a.Equals("2") && b == false) || (em1.RoleId == 2 && a.Equals("6") && b == true) || (a.Equals("66") && b == true) || (a.Equals("7") && b == false))
                                 {%> 
                                 
                                 <%}
                                 else
                                 { %>
                                  <li style="float:left;margin-left: 210px;margin-top: -40px">
                                 <input type="submit" name="submitButton" value="      Reject      "/>
                                 </li>
                                 <%}%>
                               
                                </ul>
                            <%}%>
                            <%Html.EndForm();%>
                            <%--//back--%>
                            
                             <% using (Html.BeginForm("back", "default1"))
             {%>
                                <ul>
                                <%
                                    Employee em1 = (Employee)Session["Employee"];
                                    if ((em1.RoleId == 2 && a.Equals("66") && b == true) ||(a.Equals("2") && b == false) || (a.Equals(" 9") && b == false) || (a.Equals("7") && b == false))
                                    {%> 
                                   
                                     <li style="float:left;margin-top: -40px">
                                 <input type="submit" name="submitButton" value="      Back      "/>
                                 </li>
                                    <%}
                                    else if ((em1.RoleId == 2 && a.Equals("6") && b == true))
                                    {%>
                                    <li></li>
                                    <li></li>
                                    
                                             <li style="float:left;margin-top: -40px">
                                 <input type="submit" name="submitButton" value="      Back      "/>
                                 </li>
                                     <%}
                                    else
                                    {%> 
                                         <li style="float:left;margin-top: -40px">
                                 <input type="submit" name="submitButton" value="      Back      "/>
                                 </li>
                                    <%}
                                    %>
                                
                                
                              
                          
                                </ul>
                            <%}%>
                            <%Html.EndForm();%>
                          <%--  //back--%>
                            
					</div>
				</div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="css" runat="server">
<link href="../../Content/css/neewnew.css" rel="stylesheet" type="text/css" />
</asp:Content>

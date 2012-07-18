<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Template.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="MvcStationeryManagementSystem.Models" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	DetailRQ4
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

     <div class="portlet ui-widget ui-widget-content ui-helper-clearfix ui-corner-all form-container">
					<div class="portlet-header ui-widget-header">Form elements in box</div>
					<div class="portlet-content">
					 <% 
                        // Employee ep = (Employee)Session["eplo"];
					     
					     RequestModel r = (RequestModel)ViewData["if"];
                            string a = r.Stte1; bool b = r.Acc1;
                            Role rr = (Role)ViewData["role"];
                            double amount = Convert.ToDouble(rr.Amount);
                            double total = 0;
                            foreach (Request_StationeryModel rq in (List<Request_StationeryModel>)ViewData["if1"])
                            {
                                total = total + Convert.ToDouble(rq.Qty1 * rq.Rte1);
                            }
					    %>
					      
					      <% using (Html.BeginForm("update4", "default1",FormMethod.Post))
              {%>
                            <% RequestModel rm = (RequestModel)ViewData["if"];
                               List<Request_StationeryModel> rm1 = (List<Request_StationeryModel>)ViewData["if1"];%>
                                <ul>
                                <%=Html.Hidden("st3",rm.Stte1)%>
                                <%= Html.Hidden("requestid", rm.RId1)%> 
                                
                                
                                <%= Html.Hidden("da", rm.DApprove1)%>
                              <%if (a.Equals("1") && (b == true))
                                 {%>
                                    <%var a1="2"; var b1=true;%>
                                     
                                      <%=Html.Hidden("st", a1)%>
                                       <%=Html.Hidden("acc", b1)%>
                                 <%}
                                 else if(rm.Stte1.Equals("5") && (rm.Acc1 == true))
                                 {%>
                                     
                                    <%var a1 = "6"; var b1 = true;%>
                                     
                                      <%=Html.Hidden("st", a1)%>
                                       <%=Html.Hidden("acc", b1)%>
                                
                                <%}%>
                               
                                 
                                <%= Html.Hidden("en", rm.ENumber1)%>
                                   <%= Html.Hidden("ctid", rm.CRQId1)%>
                                <li>
                                CatalogRequestName:<%= Html.TextBox("aa", rm.CRQName1, new { @class = "aa", @readonly = "readonly" })%>
                                </li>
                               
                                <li>
                                RequestName:<%= Html.TextBox("rname", rm.RName1, new { @class = "aa", @readonly = "readonly" })%>
                                </li>
                                 <li>Employee Name:<%= Html.TextBox("b", rm.FName1, new { @class = "aa", @readonly = "readonly" })%>
                                 </li>
                                <li>
                                DateDispatch: <%= Html.TextBox("dd", rm.DDispatch1, new { @class = "aa", @readonly = "readonly" })%>
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
                                Reques Content: <%= Html.TextArea("rc", rm.RContent1, new { @class = "aa"})%><br /> 
                                </li>
                              
                                
                                <li>
                                Descripton:<%= Html.TextArea("dt", rm.Dtion1, new { @class = "aa"})%><br /> 
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
						   
						   
						</tr> 
						</thead> 
						<tbody> 
	
          <%
              
                  foreach (Request_StationeryModel rq in (List<Request_StationeryModel>)ViewData["if1"])
            {%>
						<tr>
							<%--<td class="center"><input type="checkbox" value="1" name="list" class="checkbox"/></td> --%>
						    <td><%=rq.CtalogeName1%></td> 
						    <td><%=rq.PName1%></td> 
						    <td><%=rq.Qty1%></td> 
						    <td><%=rq.Rte1%></td> 
                           
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
								<a><span style="float:none">Toltal Money:<%=total%></span></a>							
						</div>
					</form>

					
					
				</div>
                                </li>
                                <%if (total < amount)
                                  {%> 
                                    <li style="float:left;margin-left: 120px">
                                    <input type="submit" name="submitButton" value="     Approved     "/>
                      
                                </li>
                                <%}%>
                              
                               
                                </ul>
                            <%}%>
                            <%Html.EndForm();%>
                          <%-- <% RequestModel rm = (RequestModel)ViewData["if"]; %>--%>
                           
                            <%--sumit2--%>
					   
					       <% using (Html.BeginForm("update44", "default1",FormMethod.Post))
              {%>
                            <% RequestModel rmm = (RequestModel)ViewData["if"];
                               List<Request_StationeryModel> rm1 = (List<Request_StationeryModel>)ViewData["if1"];%>
                                <ul>
                                
                                <%= Html.Hidden("st4", rmm.Stte1)%> 
                                <%= Html.Hidden("requestid", rmm.RId1)%> 
                                
                                
                               <%= Html.Hidden("da", rmm.DApprove1)%>
                              
                              <% if (a.Equals("1") && (b == true))
                                 {%>
                                     <%var a1 = "3"; var b1 = false; %>
                                     <%=Html.Hidden("st",a1)%>
                                     <%=Html.Hidden("acc",b1)%>
                                 <%}
                                 else if(a.Equals("5") && (b == true))
                                 {%>
                                     <%var a1 = "6"; var b1 = false; %>
                                     <%=Html.Hidden("st",a1)%>
                                     <%=Html.Hidden("acc",b1)%>
                                
                                <%}%>
                                
                                 
                                <%= Html.Hidden("en", rmm.ENumber1)%>
                                   <%= Html.Hidden("ctid", rmm.CRQId1)%>
                           
                               
                               <%= Html.Hidden("rname", rmm.RName1)%>
                               
                               
                                
                                <%= Html.Hidden("dd", rmm.DDispatch1)%>
                               
                                     <%= Html.Hidden("da",rmm.DApprove1)%>
                                        
                                
                               
                                
                                <%= Html.Hidden("rc", rmm.RContent1)%>

                              
                                
                               
                                <%= Html.Hidden("dt", rmm.Dtion1)%>
                               <%if (total < amount)
                                 {%> 
                                <li style="float:left;margin-left: 254px;margin-top: -40px">
                                <input type="submit" name="submitButton" value="    No Approved     "/>
                             
                                
                                </li>
                              <%} %>
                               
                                </ul>
                            <%}%>
                            <%Html.EndForm();%>
                          
                           <%-- //dua len--%>
                          
                              <%
                                  Employee em = (Employee)Session["Employee"];
                                  if (em.RoleId != 1)
                                  {
                                      using (Html.BeginForm("update23", "default1", FormMethod.Post))
                                      {%>
                            <% RequestModel rm = (RequestModel)ViewData["if"];
                               List<Request_StationeryModel> rm1 = (List<Request_StationeryModel>)ViewData["if1"];%>
                                <ul>
                                
                                <%= Html.Hidden("requestid", rm.RId1)%> 
                                 <%= Html.Hidden("st", 5)%>  
                                
                                <%= Html.Hidden("da", rm.DApprove1)%>
                              <%= Html.Hidden("acc", true)%>
                                 
                                <%= Html.Hidden("en", rm.ENumber1)%>
                                   <%= Html.Hidden("ctid", rm.CRQId1)%>
                              
                               
                                
                                <%= Html.Hidden("rname", rm.RName1)%>
                               
                               <%= Html.Hidden("dd", rm.DDispatch1)%>
                               
                               
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
                              <%
                                 
                                          if(total>amount) 
                                {%>
                                <li></li>
                                <li></li>
                                
                                 <li style="float:left;margin-left: 90px;margin-top: -40px">
                                 <input type="submit" name="submitButton" value="     Sent to Director     "/>
                                 </li>
                                 <%}%>
                              </ul>
                            <%}
                            Html.EndForm();}%>
                          
                           <%-- //--%>
                            <%--//back--%>
                            
                             <% using (Html.BeginForm("back", "default1"))
                                {%>
                                <ul>
                                 <li style="float:left;margin-top: -40px">
                                 <input type="submit" name="submitButton" value="      Back      "/>
                                 </li>
                              
                          
                                </ul>
                            <%}
                            Html.EndForm();%>
                                
                          <%--  //back--%>
                            
					</div>
				</div>


</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="css" runat="server">
    <script language="javascript" type="text/javascript">
        $(document).ready(function() {

       
        });
    </script>
    <link href="../../Content/css/neewnew.css" rel="stylesheet" type="text/css" />
    
</asp:Content>

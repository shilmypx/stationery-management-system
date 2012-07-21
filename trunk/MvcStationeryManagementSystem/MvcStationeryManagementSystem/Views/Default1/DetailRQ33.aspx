<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Template.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="MvcStationeryManagementSystem.Models" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	DetailRQ33
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

      <div class="portlet ui-widget ui-widget-content ui-helper-clearfix ui-corner-all form-container">
					<div class="portlet-header ui-widget-header">Form elements in box</div>
					<div class="portlet-content">
					      <% using (Html.BeginForm("DetailRQ33", "default1"))
              {%>
                            <% RequestModel rm = (RequestModel)ViewData["if"];
                               List<Request_StationeryModel> rm1 = (List<Request_StationeryModel>)ViewData["if1"];%>
                                <ul>
                                
                                <%= Html.Hidden("requestid", rm.RId1)%> 
                                 <%= Html.Hidden("st", 4)%>  
                                
                                <%= Html.Hidden("da", rm.DApprove1)%>
                               
                              <%= Html.Hidden("acc", true)%>
                                 
                                <%= Html.Hidden("en", rm.ENumber1)%>
                                   <%= Html.Hidden("ctid", rm.CRQId1)%>
                                <li>
                                 <label class="desc">CatalogRequestName:</label><%= Html.TextBox("aa", rm.CRQName1, new { @class = "large", @readonly = "readonly" })%>
                                </li>
                               
                                <li>
                                 <label class="desc">RequestName:</label><%= Html.TextBox("rname", rm.RName1, new { @class = "large", @readonly = "readonly" })%>
                                </li>
                                 <li>
                                  <label class="desc">Employee Name:</label><%= Html.TextBox("b", rm.FName1, new { @class = "large", @readonly = "readonly" })%>
                                 </li>
                                <li>
                                 <label class="desc">DateDispatch:</label> <%= Html.TextBox("dd", rm.DDispatch1, new { @class = "large", @readonly = "readonly" })%>
                                </li>
                                
                                <li>
                                 <label class="desc">DateApproved:</label>
                                 <%if (!rm.DApprove1.ToString("dd-MM-yyyy").Equals("01-01-0001"))
                             {%>
                                 <%= Html.TextBox("da", rm.DApprove1, new { @class = "large", @readonly = "readonly" })%>
                           <% }
                                else
                                { %>
                                     <%= Html.TextBox("da", "null", new { @class = "large", @readonly = "readonly" })%>
                                        
                                
                                   <% }
                            %>
                               
                                </li>
                                <li>
                                 <label class="desc">Reques Content:</label> <%= Html.TextArea("rc", rm.RContent1, new { @class = "small", @readonly = "readonly" })%><br /> 
                                </li>
                              
                                
                                <li>
                                 <label class="desc">Descripton:</label><%= Html.TextArea("dt", rm.Dtion1, new { @class = "small", @readonly = "readonly" })%><br /> 
                                </li>
                                 <li>
                                  <label class="desc">Stationery Items</label></li>
                                <li>
                    <div class="hastable">
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
						    
						    <%--<th>Description</th>--%>
						    
						   
						</tr> 
						</thead> 
						<tbody> 
	
          <%
              double total = 0;
                  foreach (Request_StationeryModel rq in (List<Request_StationeryModel>)ViewData["if1"])
            {%>
						<tr>
							<%--<td class="center"><input type="checkbox" value="1" name="list" class="checkbox"/></td> --%>
						    <td><%=rq.CtalogeName1%></td> 
						    <td><%=rq.PName1%></td> 
						    <td><%=rq.Qty1%></td> 
						    <td><%=rq.Rte1%></td> 
                           
						  <%total = total + Convert.ToDouble(rq.Qty1 * rq.Rte1);%>
						   
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
								<a><span style="float:right">Total Money: <%=total%></span></a>							
						</div>
					</form>

					
					
				</div>
                                </li>
                              
                              
                               
                                </ul>
                            <%}%>
                            <%Html.EndForm();%>
                            <%--sumit2--%>
					    <% using (Html.BeginForm("back", "default1"))
             {%>
                                <ul>
                             
                                     <li style="float:left;margin-top: -10px">
                                 <input type="submit" name="submitButton" value="      Back      "/>
                                 </li>
                                </ul>
                            <%}%>
                            <%Html.EndForm();%>
					   
                           
                            
					</div>
				</div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="css" runat="server">
<link href="../../Content/css/neewnew.css" rel="stylesheet" type="text/css" />
</asp:Content>

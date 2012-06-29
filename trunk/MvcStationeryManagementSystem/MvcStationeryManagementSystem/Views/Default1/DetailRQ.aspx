<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Template.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="MvcStationeryManagementSystem.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	DetailRQ
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
   
   <div class="portlet ui-widget ui-widget-content ui-helper-clearfix ui-corner-all form-container">
					<div class="portlet-header ui-widget-header">Form elements in box</div>
					<div class="portlet-content">
					      <% using (Html.BeginForm("update11", "default1", new { @class="forms", @name="form" }))
              {%>
                            <% RequestModel rm = (RequestModel)ViewData["if"]; %>
                                <ul>
                                
                                <%= Html.Hidden("requestid", rm.RId1)%> 
                                 <%= Html.Hidden("st", rm.Stte1)%>  
                                
                                <%= Html.Hidden("da", rm.DApprove1)%>
                                
                               
                                <%= Html.Hidden("acc", false)%>
                                 
                                <%= Html.Hidden("en", rm.ENumber1)%>
                                   <%= Html.Hidden("ctid", rm.CRQId1)%>
                                <li>
                                RequestName:<%= Html.TextBox("rname", rm.RName1, new { @class = "aa" })%>
                                </li>
                                <li>
                                DateDispatch: <%= Html.TextBox("dd", rm.DDispatch1, new { @class = "aa" })%>
                                </li>
                                <li>
                                Reques Content: <%= Html.TextArea("rc", rm.RContent1, new { @class = "aa" })%><br /> 
                                </li>
                              
                                
                                <li>
                                Descripton:<%= Html.TextArea("dt", rm.Dtion1, new { @class = "aa" })%><br /> 
                                </li>
                                
                             
                                
                                <li>
                                <input type="submit" value="Cap Nhat"/><br />
                                </li>
                                <%= Html.ActionLink("backs", "myrequest10", "default1")%>
                                </ul>
                            <%}%>
					    
					</div>
				</div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="css" runat="server">
    <link href="../../Content/css/neewnew.css" rel="stylesheet" type="text/css" />
</asp:Content>

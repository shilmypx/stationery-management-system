<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Template.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="MvcStationeryManagementSystem.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	RemoveEmployee
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <%using(Html.BeginForm("DeleteEmployee", "Employee")) {%>
        <% Employee em = (Employee)ViewData["re"]; %>
        employee number: <%= em.EmployeeNumber %>
        <%= Html.ActionLink("Xoa", "Delete/" + em.EmployeeNumber, "Employee")%>
    <%}%>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="css" runat="server">
</asp:Content>

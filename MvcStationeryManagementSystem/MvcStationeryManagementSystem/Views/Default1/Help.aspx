<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Template.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Help
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div style="margin-left:20%">
    <b style="color:Red">Webs Site System</b></br></br></br></br>
    <span><b style="color:Blue">Mennu Acount</b> --->select <b>Change Password: </b>Change password of the user login.<br /><br />
     <b style="margin-left:15%">Manage Role: </b>Manage permissions in system.<br /><br />
     <b style="margin-left:15%">Create Employee: </b>Create a account<br /><br />
     <b style="margin-left:15%">Manage Employee: </b>Manage account (insert, edit, delete).
    </span></br></br>
    <span><b style="color:Blue">Mennu Request</b> --->select <b>CatalogRequest: </b>Cataloge of the request.<br /><br />
     <b style="margin-left:15%">Crete Request: </b>Create new a request.<br /><br />
     <b style="margin-left:15%">View Request: </b>Manage the request(detail request, process request).
     
    </span></br></br>
     <span><b style="color:Blue">Mennu Stationery Items</b> --->select <b>Catalog: </b>Cataloge of the stationery.<br /><br />
     <b style="margin-left:15%">My Stationery: </b>The product user logged enter requested.<br /><br />
     <b style="margin-left:15%">Mange Stationery: </b>Manage the stationery(detail ,insert, delete).
     
    </span></br></br>
     <span><b style="color:Blue">Menu Setting</b> --->select <b>Create Config: </b>Create new a mail system.<br /><br />
     <b style="margin-left:15%">List Config: </b>Manage mail system(detail, insert, edit, delete).
    
    </span></br></br>
     <span><b style="color:Blue">Views Request page </b> --->select <b>tabs My NewRequest: </b>The request user login new send.<br /><br />
     <b style="margin-left:15%">tabs Request Approved: </b>The request of the user login approved.</br></br>
    <b style="margin-left:15%">tabs My Accept: </b>The request approved user login accept.<br /><br />
    <b style="margin-left:15%">tabs My Reject: </b>The request approved user login reject.<br /><br />
     <b style="margin-left:15%">tabs Request No Approved: </b>The request of the user login no approved.<br /><br />
       <b style="margin-left:15%">tabs New Request: </b>The new request of the under passed to user login system.<br /><br />
       <b style="margin-left:15%">tabs Withdraw Request: </b>The withdraw request of the under passed to user login system.<br /><br />
        <b style="margin-left:15%">tabs Cancel Request: </b>the request has been approved but not be under apply.
.<br /><br />
 <b style="margin-left:15%">tabs Accept Request: </b>the request has been approved and under accept.
.<br /><br />
    </span></br></br>
   
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="css" runat="server">
</asp:Content>

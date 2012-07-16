<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Template.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="MvcStationeryManagementSystem.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	updateCataloge
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <% using (Html.BeginForm("ProcessUpdateCataloge", "Cataloge", FormMethod.Post, new { @id = "f1" }))
     {%>
     <% Cataloge ca = (Cataloge)ViewData["update1"]; %>
   <div class="portlet ui-widget ui-widget-content ui-helper-clearfix ui-corner-all form-container">
					<div class="portlet-header ui-widget-header">Form Update Cataloge</div>
					<div class="portlet-content">
                        	<ul >
							<li>
							    <%= Html.Hidden("CatalogeId", ca.CatalogeId)%>
							</li>
								<li>
									<label class="desc">
										CatalogeName
									</label>
									<div>
										<%=Html.TextBox("CatalogeName", ca.CatalogeName, new { @class = "aa", @name = "CatalogeName", @ID = "CatalogeName" })%>
									</div>
									 <p class="aaaa" id="bb"></p>
							        <p id="a"></p>
								</li>
							
								
							
								<li class="buttons">
									<input type="submit" class="submit" value="Update" tabindex="11"/>
								</li>
							</ul>
						
					</div>
				</div>
    
    <%}%>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="css" runat="server">
<script src="../../Content/js/jquery.validate.js" type="text/javascript"></script>
<link href="../../Content/css/neewnew.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript">
    $(document).ready(function() {
        $('#f1').validate({
            rules: {
            CatalogeName: {

                    required: true,
                    maxlength: 50

                }
            }

        });


    });

    
    </script>
   <script type="text/javascript">

       $(document).ready(function() {

       $("#CatalogeName").keyup(function() {
               var status = $("#bb");
               status.html("");
               $('#a').attr("value", 0);
           });
           $("#CatalogeName").blur(function() {

           var name = $("#CatalogeName").val();

               var status = $("#bb");

               status.html("<img src='../../Content/images/icons/load.gif' />").removeClass();

               $.post("/Cataloge/Check2", { CatalogRQName: name },

                    function(data) {

                        if (data == "ok") {

                            status.html(name + " is available!").addClass("green");
                            $('#a').attr("value", 1);

                        }
                        else {
                            status.html(name + " is not available!").addClass("red");
                            $('#a').attr("value", 0);

                        }

                    });

           });
           $('#ck').submit(function() {
               a = $('#a').attr("value");
               if (a == 1)
                   return true;
               return false;
           });

       });
    </script>  


</asp:Content>

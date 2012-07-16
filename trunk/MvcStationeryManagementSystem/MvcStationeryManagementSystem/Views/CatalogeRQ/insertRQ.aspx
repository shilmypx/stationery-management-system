<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Template.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	insertRQ
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
     <% using (Html.BeginForm("ProcessInsert", "CatalogeRQ", FormMethod.Post, new { @id = "f1" }))
     {%>
      <div id="addemployee">
         <div class="portlet ui-widget ui-widget-content ui-helper-clearfix ui-corner-all form-container">
					<div class="portlet-header ui-widget-header">Form Insert CatalogeRQ</div>
					<div class="portlet-content-new">
						<form action="#" method="post" enctype="multipart/form-data" class="forms" name="form" >
							
							<ul>
								<li>
									<label class="desc">
										CatalogRQName
									</label>
									<div>
										<input type="text" name="CatalogRQName" id="CatalogRQName" class="field text medium" value="" tabindex="1" maxlength="50"/>
										 <p class="aaaa" id="bb"></p>
							             <p id="a"></p>
									</div>
									
								</li>
								<li class="buttons">
									<input type="submit" class="submit" value="Insert" tabindex="11"/>
								</li>
							</ul>
						</form>
					</div>
				</div>
   </div>
    <%}%>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="css" runat="server">
<script src="../../Content/js/jquery.validate.js" type="text/javascript"></script>
<script language="javascript" type="text/javascript">
       $(document).ready(function() {
           $('#f1').validate({
               rules: {
               CatalogRQName: {

                       required: true,
                       maxlength: 50

                   }
               }

           });


       });

    
    </script>
     <script type="text/javascript">

         $(document).ready(function() {

         $("#CatalogRQName").keyup(function() {
                 var status = $("#bb");
                 status.html("");
                 $('#a').attr("value", 0);
             });
             $("#CatalogRQName").blur(function() {

             var name = $("#CatalogRQName").val();

                 var status = $("#bb");

                 status.html("<img src='../../Content/images/icons/load.gif' />").removeClass();

                 $.post("/CatalogeRQ/Check2", { CatalogRQName: name },

                    function(data) {

                        if (data == "ok") {

                            status.html(name + "is available!").addClass("green");
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

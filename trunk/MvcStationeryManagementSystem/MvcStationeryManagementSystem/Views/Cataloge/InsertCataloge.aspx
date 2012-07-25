<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Template.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	InsertCataloge
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

     <% using (Html.BeginForm("InsertCataloge", "Cataloge", FormMethod.Post, new { @id = "f1" }))
     {%>
     <div id="Insert">
        <div class="portlet ui-widget ui-widget-content ui-helper-clearfix ui-corner-all form-container">
					<div class="portlet-header ui-widget-header">Form Insert Cataloge</div>
					<div class="portlet-content">
						<form action="#" method="post" enctype="multipart/form-data" class="forms" name="form" >
								
							<ul>
								<li>
									<label class="desc">
										CatalogeName
									</label>
									<div>
										<input type="text" name="CatalogeName" id="CatalogeName" class="large" value="" tabindex="1" maxlength="50"/>
										
									</div>
									 <p class="aaaa" id="bb"></p>
							        <p id="a"></p>
								</li>
							
								
							
								<li class="buttons">
									<input type="submit" id="ck" class="submit" value="Insert" tabindex="11"/>
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

                            status.html(name + "is available!").addClass("green");
                            $('#a').attr("value", 1);


                        }

                        else {
                            status.html(name + " is not available!").addClass("red");
                            $('#a').attr("value", 0);

                        }

                    });
               

           });
         
       });
    </script>  

 <script language="javascript" type="text/javascript">
     $(document).ready(function() {
         $('#ck').click(function() {
             a = $('#a').attr("value");
                      if (a == 1)
                          return true;
                      return false;
         });


     });

    
    </script>
</asp:Content>

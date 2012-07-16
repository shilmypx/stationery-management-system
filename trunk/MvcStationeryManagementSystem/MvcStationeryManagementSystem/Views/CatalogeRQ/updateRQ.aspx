<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Template.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="MvcStationeryManagementSystem.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	updateRQ
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

  <% using (Html.BeginForm("ProcessUpdateCataloge", "CatalogeRQ", FormMethod.Post, new { @id = "f1" }))
     {%>
     <% CatalogeRQ rq = (CatalogeRQ)ViewData["info"]; %>
    <div class="portlet ui-widget ui-widget-content ui-helper-clearfix ui-corner-all form-container">
					<div class="portlet-header ui-widget-header">Form Update CatalogeRQ</div>
					<div class="portlet-content">
							<ul>
							<li>
							    <%= Html.Hidden("CatalogRQId", rq.CatalogRQId)%>
							</li>
								<li>
								
									<label class="desc">
										CatalogRQName
									</label>
									<div>
									<%=Html.TextBox("CatalogRQName", rq.CatalogRQName, new { @class = "aa", @name = "CatalogRQName", @ID = "CatalogRQName" })%>
									</div>
									<p id="bb"><%= Session["KT1"] %></p>
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
<link href="../../Content/css/neewnew.css" rel="stylesheet" type="text/css" />
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

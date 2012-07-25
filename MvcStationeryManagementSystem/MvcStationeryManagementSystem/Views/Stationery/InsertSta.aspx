<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Template.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="MvcStationeryManagementSystem.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	InsertSta
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
  <% using (Html.BeginForm("InsertStationery", "Stationery", FormMethod.Post, new { @id = "f1" }))
     {%>
   
        <div class="portlet ui-widget ui-widget-content ui-helper-clearfix ui-corner-all form-container">
					<div class="portlet-header ui-widget-header">Form Insert Stationey</div>
					<div class="portlet-content">
						<div style="margin-left:30%">
									<ul>
							    <li>
							        <label class="desc">
							            ProductName:
							        </label>
							        <div>
							            <input type="text" name="ProductName"  id="ProductName" class="field text medium" value="" tabindex="1" maxlength="50"/>
							           
							        </div>
							        <p class="aaaa" id="bb"></p>
							        <p id="a"></p>
							        
							    </li>
								<li>
									<label class="desc">
										Rate
									</label>
									<div>
										<input type="text" name="Rate" id="Rate" class="field text medium" value=""  tabindex="2" />
									</div>
								</li>
								
								<li class="date">
									<label class="desc" id="Label1" for="Field2">
										Quantity
									</label>
									    <input type="text" name="Quantity" id="Quantity" class="field text medium" value="" size="2" tabindex="3" />
										
							
							
								
							    </li>
							<li>
									<label class="desc">
										Arise:
									</label>
									<div>
										<input type="text" name="Arise" id="Arise" class="field text medium" value=""  tabindex="2" />
									</div>
								</li>
								<li>
									<label class="desc">
										CatalogeId:
									</label>
									<div class="float-left">
										<select tabindex="8" class="field select large" name="CatalogeId" tabindex="8" >
										 <% foreach (Cataloge ca in (List<Cataloge>)ViewData["dsCataloge"])
              {%>
										    <option value="<%=ca.CatalogeId%>">
												<%=ca.CatalogeName%>
											</option>
										 <%}%>
											
										</select>
									
									</div>
									
									
								</li>
								<li>
									<label class="desc">
										Description
									</label>
									<div>
										<textarea  id="Description" name="Description" rows="10" cols="51"></textarea>
									</div>
								</li>
								
							
								<li class="buttons">
									<input type="submit" class="submit" id="ck" value="Insert" tabindex="11"/>
								</li>
							</ul>
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
                   ProductName: {

                       required: true,
                       maxlength: 50

                   },
                   Rate: {
                       required: true,
                       number: true


                   },
                   Quantity: {
                       required: true,
                       number: true


                   },
                   Arise: {
                       required: true,
                       number: true
                   
                   },
                   Description: {
                       required: true



                   }
               }

           });
            


       });

    
    </script>
    <script type="text/javascript">

        $(document).ready(function() {

            $("#ProductName").keyup(function() {
                var status = $("#bb");
                status.html("");
                $('#a').attr("value", 0);
            });
            $("#ProductName").blur(function() {

                var name = $("#ProductName").val();

                var status = $("#bb");

                status.html("<img src='../../Content/images/icons/load.gif' />").removeClass() ;

                $.post("/Stationery/Check2", { ProductName: name },

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
            $('#ck').click(function() {
                a = $('#a').attr("value");
                if (a == 1)
                    return true;
                return false;
            });

        });
    </script>
</asp:Content>

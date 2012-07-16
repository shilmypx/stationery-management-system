<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Template.Master" Inherits="System.Web.Mvc.ViewPage"  validateRequest=false %>
<%@ Import Namespace="MvcStationeryManagementSystem.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Request 
</asp:Content>



<asp:Content ID="Content3" ContentPlaceHolderID="css" runat="server">
    <link href="../../Content/Site.css" rel="stylesheet" type="text/css" />

    <link href="../../Content/smartpaginator.css" rel="stylesheet" type="text/css" />

   

    <script src="../../Scripts/smartpaginator.js" type="text/javascript"></script>
     <link href="../../Content/css/request.css" rel="stylesheet" type="text/css" />

    
    <script src="../../Scripts/jquery.rte.js" type="text/javascript"></script>


    <script src="../../Scripts/jStepper.js" type="text/javascript"></script>
    
    <script type="text/javascript" language="javascript">
        $(document).ready(function() {


            $(".rte-zone").rte({
                content_css_url: "../../Content/css/rte.css",
                media_url: "../../Content/img/"
            });




            $.ajax({
                type: "GET",
                url: "/Request/laygiatri/",
                beforeSend: function() {
                    $(".icon").html("<img src='../../Content/images/icons/loading_icon.gif' />");
                },
                success: function(msg) {
                    $("#mtb").append(msg);
                    $(".icon").html("");

                },
                complete: function() {
                    $('#echolink').smartpaginator({ totalrecords: 11, recordsperpage: 5, initval: 0, next: 'Next', prev: 'Prev', first: 'First', last: 'Last', theme: 'green', datacontainer: 'mtb', dataelement: 'tr', display: 'double' });
                    $(".luachon").click(function() {
                        // alert("ok");
                        var id = $(this).parent().find(".giatri").attr("value");
                        //alert(masp);
                        $.ajax({
                            type: "GET",
                            url: "/Request/giohang/" + id,
                            //  data : "id="+masp,
                            success: function(msg) {
                                $(".remove").remove();
                                $(".bd").append(msg);
                                $('#echolink1').smartpaginator({ totalrecords: 11, recordsperpage: 5, initval: 0, next: 'Next', prev: 'Prev', first: 'First', last: 'Last', theme: 'green', datacontainer: 'Table1', dataelement: 'tr', display: 'double' });

                            },
                            complete: function() {
                                $(".sl").jStepper({ minValue: 1, maxValue: 1000, minLength: 4, disableNonNumeric: true, allowDecimals: false });

                                $(".sl").blur(function() {
                                    var a = $(this).val();
                                    var a1 = $(this).parents('tr.remove').find('td.id').html();
                                    //alert(a + "|" + a1);
                                    $.ajax({
                                        // type: "GET",
                                        data: a + "|" + a1,
                                        url: '/Request/Capnhapsoluong/' + a + '/' + a1,
                                        success: function(msg) {
                                            //  alert(msg);   
                                        }
                                    });
                                });


                                $(".remove1").click(function() {
                                    //alert("ok");
                                    $(this).parent().parent().remove();
                                    var id = $(this).parent().find(".giatri1").val();
                                    $.ajax({
                                        type: "GET",
                                        url: "/Request/removegiohang/" + id,
                                        success: function(data) {
                                            // alert(data);
                                            $(".aa").html("");

                                        }



                                    });



                                });


                            }
                        });
                    });
                },
                error: function(request, status, error) {
                    alert("not :" + request.responseText);

                }


            });


            //xu ly khi them
            $(".send").click(function() {
                var value = $("iframe#id_description1").contents().find("body").html();
                var value1 = $("iframe#id_description").contents().find("body").html();
                var value2 = $("#vaname").attr("value");
                if (value === '<br>' || value1 === '<br>' || value2 === '') {
                    $(".loi").html("<b>Vui long kiem tra lai thong tin<b>");
                    return false;
                }
                else {
                    data1 = value2 + '|' + value1 + '|' + value;
                   // alert(value2 + " | " + value + " | " + value1);
                    $(".loi").html("");
                    $.ajax({
                    type: "GET",
                    dataType: 'html',
                        url: "/Request/Addrq/?a=" + data1, //+value2+'/'+value1+'/'+value,
                        contentType: 'application/json; charset=utf-8',
                        //data : data1,
                        success: function(msg) {
                           alert(msg);
                        }
                    });
                }
                return false;
            });




        });
    </script>






</asp:Content>




<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

  



<%--<asp:Content ID="Content5" ContentPlaceHolderID="MainContent" runat="server">--%>

   

    <div  class="aa" ></div>
  
    <div class="portlet ui-widget ui-widget-content ui-helper-clearfix ui-corner-all form-container">
					<div class="portlet-header ui-widget-header"><span class="ui-icon ui-icon-circle-arrow-s ui-icon-circle-arrow-n"></span>Create New Request</div>
					<div class="portlet-content" style="display: none; ">
						<div class="ct"><!-- Div chua noi dung cua toan  bo cac noi dung trong request -->
						    <div class=" tableform" >
						      <%--<p class>Request Name:</p>  <input type="text" class="testinput dd1" />--%>
						     <%-- <form  action="#" class="form1" >--%>
						      <% Html.BeginForm("AddRequest", "Request", FormMethod.Post, new { @class = "sent" , @id = "formq1" });
               { %>
						        <table id="mytable" width="288" height="129" border="1" >
                                  <tr>
                                    <td class="td1 td2" colspan="2"><div align="center">Create New Request</div></td>
                                    
                                  </tr>
                                  <tr align="center">
                                    <td class="td1" ><p class="tp2"> Name: </p></td>
                                    <td > <input name="textfield" id="vaname"   />
                                  
                                    
                                     </td>
                                  </tr>
                                  <tr>
                                    <td> <p class="tp" >Content:</p> </td>
                                    <td><textarea class="rte-zone" name="description" class="description" id="id_description" rows="7" cols="38"></textarea>
                                      <%--<input type="text" name="textfield2" id="textfield2" class="testinput" />--%></td>
                                  </tr>
                                  <tr>
                                    <td><p class="tp">Descript:</p> </td>
                                    <td> <textarea class="rte-zone" name="description1" class="description1" id="id_description1" rows="7" cols="38"></textarea></td>
                                  </tr>
                                </table>
                                <input type="submit" id="send" class="send" value="Send Request" /><div class="loi" ></div>
						      
						    </div>
						    <div class=" gh">
						       
						         <table id="mtb">
						           <div class="bb"></div>
						            <tr>
						                <td>ProductName</td>
						                <td>Rate</td>
						                <td>Quantity</td>
						                <td>Description</td>
						                <td>Lua Chon</td>
						            </tr>
						         
						         </table>
						         <div id="echolink"></div>
						         <table id="Table1" >
						           <div class="bb"></div>
						            <thead>
						                <tr>
						                <td>ProductId</td>
						                <td>ProductName</td>
						                <td>Quality</td>
						                <td>Description</td>
						                <td>So Luong</td>
						                <td>Remove</td>
						            </tr>
						            </thead>
						            <tbody class="bd">
						            
						            
						            </tbody>
						         </table>
						         <div id="echolink1"></div>
						         <%} %>
						         
						      
						    </div>
						</div>          <!-- end div class="ct" -->
					</div>
					
				</div>

 
</asp:Content>
<%--</asp:Content>--%>
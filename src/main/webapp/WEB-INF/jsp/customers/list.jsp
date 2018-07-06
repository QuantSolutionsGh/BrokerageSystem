<%@ page session="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<jsp:include page="../header.jsp" />

<body >



<div class="container-fluid" style="margin-top: 70px">
    <c:if test="${not empty msg}">
        <div class="alert alert-${css} alert-dismissible" role="alert">
            <button type="button" class="close" data-dismiss="alert"
                    aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
            <strong>${msg}</strong>
        </div>
    </c:if>

    <spring:url value="/" var="urlHome" />



<!--https://www.jqueryscript.net/table/jQuery-Table-Pagination-For-Materialize.html -->
    <!--https://codepen.io/azamatms/pen/ZGwOMM    -->
    <div class="row">

            <h4>&nbsp &nbsp</h4>
            <i class="fa fa-users fa-2x" style="color:goldenrod"></i>
            <h4>&nbsp Customers</h4>



    </div>
    <hr/>
    <div class="row">
        <p>&nbsp &nbsp &nbsp &nbsp</p>
        <a href="${urlHome}customers/add" class="float-md-left" >Add New Client </a>

    </div>



    <div  id="all-events">
        <table id="jtable" class="table table-bordered table-hover footable "
               >
            <thead style="background-color: #fde89f;">
            <tr>

                <th data-class="expand"  data-hide="default" >Fullname</th>
                <th data-hide="phone" >Last Name</th>
                <th data-hide="phone">First Name</th>
                <th data-hide="phone,tablet">Other Names</th>

                <th data-hide="phone,tablet">Email</th>
                <th data-hide="phone" >Phone #</th>
                <th data-hide="phone,tablet">Action</th>

            </tr>
            </thead>
            <tbody>




            <c:forEach var="customer" items="${customers}">
                <tr  >
                    <td>${customer.lastName} - ${customer.firstName}</td>
                    <td>${customer.lastName}</td>
                    <td>${customer.firstName}</td>
                    <td>${customer.otherNames}</td>
                    <td>${customer.email}</td>
                    <td>${customer.phone}</td>



                    <td><spring:url value="customers/${customer.id}"
                                    var="customerUrl" /> <spring:url
                            value="/customers/${customer.id}/delete" var="deleteUrl" /> <spring:url
                            value="/customers/${customer.id}/update" var="updateUrl" />

                        <div class="actions">

                            <a href="#" onclick="location.href='${updateUrl}'"> <i class="fa fa-edit fa-2x"></i></a>

                            <a href="#"><i class="fa fa-remove fa-2x" style="color:red"></i></a>
                            <!--
                            <a href="#add_users" class="modal-trigger waves-effect btn-flat nopadding"><i class="material-icons">person_add</i></a>
                            <a href="#" class="search-toggle waves-effect btn-flat nopadding"><i class="material-icons">search</i></a>
                        -->
                        </div>

                        <!--


                        <button class="btn btn-success"
                                onclick="location.href='${updateUrl}'">Edit</button>
                        <button class="btn btn-danger"
                                onclick="this.disabled=true;post('${deleteUrl}')">Delete</button></td>

                                -->
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>






</div>







<script>
    function post(path, params, method) {
        method = method || "post";
        var form = document.createElement("form");
        form.setAttribute("method", method);
        form.setAttribute("action", path);
        for ( var key in params) {
            if (params.hasOwnProperty(key)) {
                var hiddenField = document.createElement("input");
                hiddenField.setAttribute("type", "hidden");
                hiddenField.setAttribute("name", key);
                hiddenField.setAttribute("value", params[key]);
                form.appendChild(hiddenField);
            }
        }
        document.body.appendChild(form);
        form.submit();
    }

</script>





<script  >

    $(document).ready(

        function() {
        $('.footable').footable({
            calculateWidthOverride: function() {
                return { width: $(window).width() };
            }
        });
    }
    );
</script>




</body>

</html>
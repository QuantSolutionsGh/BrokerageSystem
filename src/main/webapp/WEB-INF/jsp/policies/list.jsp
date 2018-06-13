<%@ page session="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<jsp:include page="../header.jsp" />
<body>

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



<!--https://www.jqueryscript.net/table/jQuery-Table-Pagination-For-Materialize.html -->
    <!--https://codepen.io/azamatms/pen/ZGwOMM    -->
    <div class="row">

            <h4>&nbsp &nbsp</h4>
            <i class="fa fa-users fa-2x" style="color:goldenrod"></i>
            <h4>&nbsp Policies</h4>



    </div>
    <hr/>
    <spring:url value="/" var="urlHome" />
    <div class="row">
        <p>&nbsp &nbsp &nbsp &nbsp</p>
        <a href="${urlHome}policies/add" class="float-md-left" >Add New Policy </a>

    </div>



    <div class="table-responsive" id="all-events">
        <table id="jtable" class="table table-striped table-hover table-sm"
               width="100%">
            <thead class="thead-dark">
            <tr>
                <th width="10%">Policy Number</th>
                <th width="10%">Policy Type</th>
                <th width="10%">Cover Start Date</th>
                <th width="10%">Cover End Date</th>
                <th width="10%">Insurer</th>
                <th>Customer</th>
                <th width="10%">Premium</th>
                <th width="10%">Amount Paid</th>
                <th>Action</th>

            </tr>
            </thead>
            <tbody>




            <%--@elvariable id="policyList" type="java.util.List<com.insurance.brokman.model.Policy>"--%>
            <c:forEach var="policy" items="${policyList}">
                <tr>
                    <td>${policy.policyNumber}</td>
                    <td>${policy.policyType}</td>
                    <td><fmt:formatDate pattern="yyyy-MM-dd" value="${policy.coverFmDate}"/></td>
                    <td><fmt:formatDate pattern="yyyy-MM-dd" value="${policy.coverToDate}"/></td>
                    <td>${policy.insurer.companyName}</td>
                    <td>${policy.customer.firstName} ${policy.customer.lastName} ${policy.customer.otherNames}</td>
                    <td><fmt:formatNumber value="${policy.premium}" pattern="###,###,##0.00" type="number"/></td>
                    <td><fmt:formatNumber value="${policy.amtPaid}" pattern="###,###,##0.00" type="number"/></td>




                    <td><spring:url value="policies/${policy.id}"
                                    var="policyUrl" /> <spring:url
                            value="/policies/${policy.id}/delete" var="deleteUrl" /> <spring:url
                            value="/policies/${policy.id}/update" var="updateUrl" />

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
    $(document).ready(function() {
        $('#jtable').DataTable({
            responsive : true,
            searching : false,
            ordering : true,
            "bLengthChange" : false,
            "oLanguage": {
                "sStripClasses": "",
                "sSearch": "",
                "sSearchPlaceholder": "Enter Keywords Here",
                "sInfo": "_START_ -_END_ of _TOTAL_",
                "sLengthMenu": '<span>Rows per page:</span><select class="browser-default">' +
                '<option value="10">10</option>' +
                '<option value="20">20</option>' +
                '<option value="30">30</option>' +
                '<option value="40">40</option>' +
                '<option value="50">50</option>' +
                '<option value="-1">All</option>' +
                '</select></div>'
            },
            bAutoWidth: false,
            paging : true,
            bInfo : false,
            "iDisplayLength" : 5,
            "aLengthMenu" : [ [ 5, 10, 15, -1 ], [ 5, 10, 15, "All" ] ]
        });
    });
</script>


</body>

</html>
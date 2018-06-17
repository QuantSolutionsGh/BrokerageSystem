<%@ page session="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">

<jsp:include page="../header.jsp" />
<body>


    <div class="container-fluid" style="margin-top: 70px">
        <spring:url value="/customers" var="custActionUrl" ></spring:url>



                    <%--@elvariable id="custForm" type="com.insurance.brokman.model.Customer"--%>
                        <c:choose>
                            <c:when test="${custForm.id==null}">
                                <h3>New Customer</h3>
                            </c:when>
                            <c:otherwise>
                                <h3>Update Customer </h3>
                                <a  data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
                                    Show Policy Details
                                </a>




                                <br/>
                            </c:otherwise>
                        </c:choose>
                        <br />
                    <form:form method="post" accept-charset="utf-8" class="col s12" modelAttribute="custForm" action="${custActionUrl}">
                        <form:hidden path="id" />


                        <div class="form-row">
                            <div class="form-group col-md-4">

                                <spring:bind path="lastName">
                                <label for="lastName">Last Name</label>
                                <input type="text" class="form-control" name="lastName" required="required"
                                       id="lastName"
                                       value="${status.value}" />
                                </spring:bind>
                            </div>

                            <div class="form-group col-md-4">

                                <spring:bind path="firstName">
                                <label for="firstName">First Name</label>
                                <input type="text" class="form-control" name="firstName" required="required"
                                       id="firstName"
                                       value="${status.value}" />
                                </spring:bind>

                            </div>

                            <div class="form-group col-md-4">

                                <spring:bind path="otherNames">
                                    <label for="otherNames">Other Names</label>
                                    <input type="text" class="form-control" name="otherNames" required="required"
                                           id="otherNames"
                                           value="${status.value}" />
                                </spring:bind>

                            </div>


                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-12">
                                <spring:bind path="email">
                                <label for="email">Email Address</label>
                                <input type="email" class="form-control" name="email" required="required" id="email"
                                       value="${status.value}" />
                                </spring:bind>

                            </div>

                        </div>

                        <div class="form-row">
                            <div class="form-group col-md-8">
                                <spring:bind path="addressLine1">

                                <label for="address">Address</label>
                                <input type="text" class="form-control" name="addressLine1" required="required"
                                       id="address"
                                       value="${status.value}" />
                                </spring:bind>
                            </div>

                            <div class="form-group col-md-4">
                                <spring:bind path="phone">
                                <label for="phone">Phone</label>
                                <input type="tel" name="phone" class="form-control" required="required" id="phone"
                                       value="${status.value}" />
                                </spring:bind>

                            </div>
                        </div>

                        <button type="submit" class="btn btn-success">Save</button>
            <button type="submit" class="btn btn-primary">Cancel </button>






        <br/>
        <br/>
        <div class="collapse" id="collapseExample">
        <h3>Policy Details</h3>




        <!--   policy details table starts from here  --->


        <div class="table-responsive" >
            <table id="jtable" class="table table-striped table-hover table-sm"
                   width="100%">
                <thead style="background-color: #fde89f;">
                <tr>
                    <th width="20%">Policy Number</th>
                    <th width="20%">Policy Type</th>
                    <th width="20%">Insurer</th>
                    <th width="20%">Cvr Start Dt</th>
                    <th width="10%">Cvr End Dt</th>
                    <th width="10%">Premium</th>
                    <th>Amount Paid</th>


                </tr>
                </thead>
                <tbody>

                <c:forEach var="pd" items="${custForm.policyList}">
                    <tr>
                        <td>${pd.policyNumber}</td>
                        <td>${pd.policyType}</td>
                        <td>${pd.insurer.companyName}</td>
                        <td><fmt:formatDate pattern="yyyy-MM-dd" value="${pd.coverFmDate}"></fmt:formatDate></td>
                        <td><fmt:formatDate pattern="yyyy-MM-dd" value="${pd.coverToDate}"></fmt:formatDate></td>
                        <td><fmt:formatNumber value = "${pd.premium}" pattern="###,###,##0.00" type = "number"/></td>
                        <td><fmt:formatNumber value = "${pd.amtPaid}" pattern="###,###,##0.00" type = "number"/></td>



                    </tr>
                </c:forEach>


                </tbody>
            </table>
        </div>
        </div>






                </form:form>

    </div>










        <!--   policy details table ends here         --->









            <script>

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
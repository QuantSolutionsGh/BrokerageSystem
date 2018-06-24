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
        <spring:url value="/salesagents" var="salesAgentsUrl" ></spring:url>




                        <c:choose>
                            <%--@elvariable id="salesAgentForm" type="com.insurance.brokman.model.SalesAgent"--%>
                            <c:when test="${salesAgentForm.id==null}">
                                <h3>New Sales Agent</h3>
                            </c:when>
                            <c:otherwise>
                                <h3>Update Sales Agent </h3>

                            </c:otherwise>
                        </c:choose>
                        <br />
                    <%--@elvariable id="salesAgentForm" type="com.insurance.brokman.model.SalesAgent"--%>
                    <form:form method="post" accept-charset="utf-8" class="col s12" modelAttribute="salesAgentForm"
                               action="${salesAgentsUrl}">
                        <form:hidden path="id" />


                        <div class="form-row">
                            <div class="form-group col-md-4">

                                <spring:bind path="agentName">
                                <label for="agentName">Agent Name</label>
                                <input type="text" class="form-control" name="agentName" required="required"
                                       id="agentName"
                                       value="${status.value}" />
                                </spring:bind>
                            </div>

                        </div>

                        <button type="submit" class="btn btn-warning">Save</button>
            <button type="submit" class="btn btn-danger">Cancel </button>






        <br/>
        <br/>
        <div class="collapse" id="collapseExample">
        <h3>Policy Details</h3>




        <!--   policy details table starts from here  --->

        <div class="table-responsive">
            <table id="jtable" class="table table-striped table-hover table-sm"
                   width="100%">
                <thead class="thead-dark">
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
                        <td>${pd.coverFmDate}</td>
                        <td>${pd.coverToDate}</td>
                        <td><fmt:formatNumber value = "${pd.premium}" pattern="###,###,##0.00" type = "number"/></td>
                        <td><fmt:formatNumber value = "${pd.amtPaid}" pattern="###,###,##0.00" type = "number"/></td>



                    </tr>
                </c:forEach>


                </tbody>

                </form:form>




        </div>

        </div>




        <!--   policy details table ends here         --->









            <script>

                $(document).ready(function() {
                    $('#jtable').DataTable({
                        responsive : true,
                        searching : true,
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
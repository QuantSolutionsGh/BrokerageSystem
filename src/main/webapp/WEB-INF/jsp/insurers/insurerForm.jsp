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
        <spring:url value="/insurers" var="insurersUrl" ></spring:url>




                        <c:choose>

                            <%--@elvariable id="insurerForm" type="com.insurance.brokman.model.Insurer"--%>
                            <c:when test="${insurerForm.id==null}">
                                <h3>New Insurer</h3>
                            </c:when>
                            <c:otherwise>
                                <h3>Update Insurer </h3>

                                <br/>
                            </c:otherwise>
                        </c:choose>
                        <br />
                   
                    <%--@elvariable id="insurerForm" type="com.insurance.brokman.model.Insurer"--%>
                    <form:form method="post" accept-charset="utf-8" class="col s12" modelAttribute="insurerForm"
                               action="${insurersUrl}">
                        <form:hidden path="id" />


                        <div class="form-row">
                            <div class="form-group col-md-4">

                                <spring:bind path="companyName">
                                <label for="companyName">Company Name</label>
                                <input type="text" class="form-control" name="companyName" required="required"
                                       id="companyName"
                                       value="${status.value}" />
                                </spring:bind>
                            </div>

                        </div>

                        <button type="submit" class="btn btn-warning">Save</button>
            <button type="submit" class="btn btn-danger">Cancel </button>






        <br/>
        <br/>


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
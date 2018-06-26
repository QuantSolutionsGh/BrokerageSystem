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
        <spring:url value="/users" var="usersUrl" ></spring:url>
        <spring:url value="/users/userform/cancel" var="cancelUrl"></spring:url>




                        <c:choose>
                            
                        
                            <%--@elvariable id="userForm" type="com.insurance.brokman.model.Users"--%>
                            <c:when test="${userForm.id==null}">
                                <h3>New User Setup</h3>
                            </c:when>
                            <c:otherwise>
                                <h3>Update User Details </h3>

                                <br/>
                            </c:otherwise>
                        </c:choose>
                        <br />
                   
                    <%--@elvariable id="userForm" type="com.insurance.brokman.model.Users"--%>
                    <form:form method="post" accept-charset="utf-8" class="col s12" modelAttribute="userForm"
                               action="${usersUrl}">
                        <form:hidden path="id" />


                        <div class="form-row">
                            <div class="form-group col-md-4">

                                <spring:bind path="username">
                                <label for="username">Username</label>
                                <input type="text" class="form-control" name="username" required="required"
                                       id="username"
                                       value="${status.value}" />
                                </spring:bind>
                            </div>

                        </div>

            <div class="form-row">
                <div class="form-group col-md-4">

                    <spring:bind path="fullname">
                        <label for="fullname">Full Name</label>
                        <input type="text" class="form-control" name="fullname" required="required"
                               id="fullname"
                               value="${status.value}" />
                    </spring:bind>
                </div>

            </div>

        <div class="form-row">
            <div class="form-group col-md-4">

                <spring:bind path="password">
                    <label for="password">Password</label>
                    <input type="password" class="form-control" name="password" required="required"
                           id="password"
                           value="${status.value}" />
                </spring:bind>
            </div>

        </div>



                        <button type="submit" class="btn btn-warning">Save</button>
        <a class="btn btn-danger" href="${cancelUrl}">Cancel</a>






        <br/>
        <br/>
        <div class="collapse" id="collapseExample">
        <h3>Policy Details</h3>






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
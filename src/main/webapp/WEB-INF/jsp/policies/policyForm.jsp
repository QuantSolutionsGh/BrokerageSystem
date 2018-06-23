<%@ page session="false" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">

<jsp:include page="../header.jsp"/>
<body>


<div class="container-fluid" style="margin-top: 70px">
    <spring:url value="/policies" var="policyActionUrl"></spring:url>
    <spring:url value="/payments/makepayment" var="paymentsActionUrl"></spring:url>

    <c:if test="${not empty msg}">
        <div class="alert alert-${css} alert-dismissible" role="alert">
            <button type="button" class="close" data-dismiss="alert"
                    aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
            <strong>${msg}</strong>
        </div>
    </c:if>


    <%--@elvariable id="policyForm" type="com.insurance.brokman.model.Policy"--%>
    <c:choose>
        <c:when test="${policyForm.id==null}">
            <h3>New Policy</h3>
        </c:when>
        <c:otherwise>
            <h3>Update Policy </h3>
            <a data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false"
               aria-controls="collapseExample">
                Show Payment Details
            </a>


            <br/>
        </c:otherwise>
    </c:choose>
    <br/>
    <form:form method="post" accept-charset="utf-8" class="col s12" modelAttribute="policyForm"
               action="${policyActionUrl}">
        <form:hidden path="id"/>


        <div class="form-row">
            <div class="form-group col-md-4">

                <spring:bind path="policyNumber">
                    <label for="policyNumber">Policy Number</label>
                    <input type="text" class="form-control" name="policyNumber" required="required"
                           id="policyNumber"
                           value="${status.value}"/>
                </spring:bind>
            </div>

            <div class="form-group col-md-4 offset-md-1">

                <spring:bind path="policyType">
                    <label for="policyType">Policy Type</label>
                    <input type="text" class="form-control" name="policyType" required="required"
                           id="policyType"
                           value="${status.value}"/>
                </spring:bind>
            </div>
        </div>


        <div class="form-row">
            <div class="col-md-4 ">
                <label for="coverFmDate">Cover Start Date</label>
                <div class="form-group   ">
                    <div class="input-group date " id="datepicker2" data-target-input="#coverFmDate">

                        <spring:bind path="coverFmDate">


                            <input type="text" class="form-control datetimepicker-input"
                                   data-target="#datepicker2" name="coverFmDate" required="required"
                                   id="coverFmDate"
                                   value="${status.value}"/>
                            <div class="input-group-append" data-target="#datepicker2" data-toggle="datetimepicker">
                                <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                            </div>

                        </spring:bind>
                    </div>
                </div>
            </div>

            <div class="col-md-4 offset-md-1">
                <label for="coverToDate">Cover End Date</label>
            <div class="form-group   ">
                <div class="input-group date " id="datepicker1" data-target-input="#coverToDate">

                <spring:bind path="coverToDate">


                    <input type="text" class="form-control datetimepicker-input"
                           data-target="#datepicker1" name="coverToDate" required="required"
                           id="coverToDate"
                           value="${status.value}"/>
                    <div class="input-group-append" data-target="#datepicker1" data-toggle="datetimepicker">
                        <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                    </div>

                </spring:bind>
                </div>
            </div>
            </div>




        </div>



        <div class="form-row">
            <div class="form-group col-md-4">

                <label>Insurer</label>

                <form:select class="form-control" path="insurer">

                    <%--@elvariable id="insurerList" type="java.util.List<com.insurance.brokman.model.Insurer>"--%>
                    <c:forEach var="ins" items="${insurerList}">
                        <form:option value="${ins}" label="${ins.companyName}"/>
                    </c:forEach>

                </form:select>

            </div>

            <div class="form-group col-md-4 offset-md-1">

                <label>Client</label>

                <form:select class="form-control" path="customer">


                    <%--@elvariable id="customerList" type="java.util.List<com.insurance.brokman.model.Customer>"--%>
                    <c:forEach var="ins" items="${customerList}">
                        <form:option value="${ins}" label="${ins.lastName} ${ins.firstName} ${ins.otherNames}"/>
                    </c:forEach>

                </form:select>

            </div>


        </div>


        <div class="form-row">
            <div class="form-group col-md-4">

                    <label >Intermediary</label>
                    <form:select class="form-control" path="salesAgent">
                        <%--@elvariable id="salesAgentList" type="java.util.List<com.insurance.brokman.model.SalesAgent>"--%>
                        <c:forEach var="ins" items="${salesAgentList}">
                            <form:option value="${ins}" label="${ins.agentName}" />

                        </c:forEach>


                    </form:select>

            </div>

            <div class="form-group offset-md-1 col-md-2">
                <label>Currency</label>

                <form:select class="form-control" path="currency">
                    <form:option value="GHC" label="Ghana Cedis" />
                    <form:option value="USD" label="US Dollars" />
                    <form:option value="EURO" label="EUROS" />
                </form:select>

            </div>

            <div class="form-group col-md-2 ">
                <spring:bind path="premium">
                    <label for="premium">Premium</label>
                    <input type="number" class="form-control" name="premium" required="required"
                           id="premium"
                           value="${status.value}"/>
                </spring:bind>
            </div>
        </div>

        <div class="form-row">

            <div class="col-md-4 ">
                <label for="transactionDate">Transaction Date</label>
                <div class="form-group   ">
                    <div class="input-group date " id="datepicker3" data-target-input="#transactionDate">

                        <spring:bind path="transactionDate">


                            <input type="text" class="form-control datetimepicker-input"
                                   data-target="#datepicker3" name="transactionDate" required="required"
                                   id="transactionDate"
                                   value="${status.value}"/>
                            <div class="input-group-append" data-target="#datepicker3" data-toggle="datetimepicker">
                                <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                            </div>

                        </spring:bind>
                    </div>
                </div>
            </div>


        </div>
        <br/>


        <button type="submit" class="btn btn-success">Save</button>
        <button type="submit" class="btn btn-primary">Cancel</button>


        <br/>
        <br/>
        <div class="collapse" id="collapseExample">
            <h3>Payment Details</h3>

            <a  href="${paymentsActionUrl}/${policyForm.id}" role="button" >
            Make Payment
            </a>
            <br/>
            <br/>


            <!--   policy details table starts from here  --->

            <div class="table-responsive">
                <table id="jtable" class="table  table-hover table-sm"
                       width="100%">
                    <thead style="background-color: #fde89f;">
                    <tr>

                        <th width="20%">Entry Date</th>
                        <th width="20%">Transaction Date</th>
                        <th>Remarks</th>
                        <th width="20%">Amount Paid</th>



                    </tr>
                    </thead>
                    <tbody>

                    <c:forEach var="pd" items="${policyForm.paymentDetailsList}">
                        <tr>
                            <td><fmt:formatDate pattern="yyyy-MM-dd" value="${pd.entryDate}"></fmt:formatDate></td>
                            <td><fmt:formatDate pattern="yyyy-MM-dd" value="${pd.transactionDate}"></fmt:formatDate></td>
                            <td>${pd.comments}</td>
                            <td><fmt:formatNumber value="${pd.amtPaid}" pattern="###,###,##0.00" type="number"/></td>


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

    $(document).ready(function () {

       // $('#coverToDate').datetimepicker();

        $('#jtable').DataTable({
            responsive: true,
            searching: false,
            ordering: true,
            "bLengthChange": false,
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
            paging: true,
            bInfo: false,
            "iDisplayLength": 25,
            "aLengthMenu": [[5, 10, 15, -1], [5, 10, 15, "All"]]
        });
    });
</script>
<script type="text/javascript">
    $(function () {
        $('#datepicker1').datetimepicker({
            format : 'YYYY-MM-DD'
        });
    });

    $(function () {
        $('#datepicker2').datetimepicker({
            format : 'YYYY-MM-DD'
        });
    });

    $(function () {
        $('#datepicker3').datetimepicker({
            format : 'YYYY-MM-DD'
        });
    });
</script>


</body>

</html>
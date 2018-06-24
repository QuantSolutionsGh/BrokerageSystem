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
    <spring:url value="/payments" var="paymentActionUrl"></spring:url>
    <h3>Record Payment</h3>
    <br/>
    <br/>




    
    <%--@elvariable id="paymentDetailsForm" type="com.insurance.brokman.model.PaymentDetails"--%>
    <form:form method="post" accept-charset="utf-8" class="col s12" modelAttribute="paymentDetailsForm"
               action="${paymentActionUrl}">
        <form:hidden path="id"/>

        <form:hidden path="policy" />

        <div class="form-row">

            <div class="col-md-4 ">
                <label for="transactionDate">Transaction Date</label>
                <div class="form-group   ">
                    <div class="input-group date " id="datepicker2" data-target-input="#transactionDate">

                        <spring:bind path="transactionDate">


                            <input type="text" class="form-control datetimepicker-input"
                                   data-target="#datepicker2" name="transactionDate" required="required"
                                   id="transactionDate"
                                   value="${status.value}"/>
                            <div class="input-group-append" data-target="#datepicker2" data-toggle="datetimepicker">
                                <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                            </div>

                        </spring:bind>
                    </div>
                </div>
            </div>

        </div>

        <div class="form-row">
            <div class="form-group col-md-4">

                <spring:bind path="amtPaid">
                    <label for="amtPaid">Amount</label>
                    <input type="text" class="form-control" name="amtPaid" required="required"
                           id="amtPaid"
                           value="${status.value}"/>
                </spring:bind>
            </div>

        </div>

        <div class="form-row">

            <div class="form-group col-md-4">

                <spring:bind path="comments">
                    <label for="comments">Comments</label>
                    <input type="text" class="form-control" name="comments" required="required"
                           id="comments"
                           value="${status.value}"/>
                </spring:bind>
            </div>

        </div>




        <button type="submit" class="btn btn-warning">Save</button>
        <button type="submit" class="btn btn-danger">Cancel</button>



    </form:form>
</div>






<script>

    $(document).ready(function () {

       // $('#coverToDate').datetimepicker();

        $('#jtable').DataTable({
            responsive: true,
            searching: true,
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
            "iDisplayLength": 5,
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
</script>


</body>

</html>
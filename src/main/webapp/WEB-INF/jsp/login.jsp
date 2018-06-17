<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>




<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <spring:url value="/webjars/bootstrap/4.0.0/css/bootstrap.css" var="bootstrapCss" />
    <spring:url
            value="/webjars/tempusdominus-bootstrap-4/5.0.0-alpha.16/build" var="dateComponent" />

    <spring:url value="/webjars/bootstrap-dialog/1.34.6/dist/css/bootstrap-dialog.min.css" var="bootstrapDialogCss" />
    <spring:url value="/webjars/datatables/1.10.15/css/dataTables.material.min.css" var="dataTablesCss" />
    <spring:url value="/webjars/datatables-responsive/1.0.6/css/dataTables.responsive.css" var="dataTablesResponsiveCss"/>
    <spring:url value="/webjars/bootstrap/4.0.0/js/bootstrap.js" var="bootstrapJs"/>
    <spring:url value="/webjars/jquery/1.9.1/jquery.min.js" var="jqueryJs"/>
    <spring:url value="/webjars/datatables/1.10.15/js/jquery.dataTables.min.js" var="dataTablesJS" />
    <spring:url value="/webjars/datatables/1.10.15/js/dataTables.bootstrap4.min.js" var="dataTablesbootstrap4minJS" />
    <spring:url value="/webjars/datatables-responsive/1.0.6/js/dataTables.responsive.js" var="dataTablesRespJS" />
    <spring:url value="/webjars/font-awesome/4.7.0/css/font-awesome.min.css"  var="fontAwesome"/>
    <spring:url value="/webjars/momentjs/2.22.1/min/moment.min.js" var="momentjs" />


    <link href="${bootstrapCss}"  rel="stylesheet" />
    <link href="${bootstrapDialogCss}"  rel="stylesheet" />
    <link href="${dataTablesCss}" rel="stylesheet" />
    <link href="${dataTablesResponsiveCss}" rel="stylesheet" />
    <link href="${fontAwesome}" rel="stylesheet" />

    <link href="${dateComponent}/css/tempusdominus-bootstrap-4.css" rel="stylesheet" />

    <script src="${jqueryJs}"></script>
    <script src="${bootstrapJs}"></script>
    <script src="${dataTablesJS}"></script>
    <script src="${dataTablesbootstrap4minJS}"></script>
    <script src="${dataTablesRespJS}"></script>
    <script src="${momentjs}"></script>
    <script src="${dateComponent}/js/tempusdominus-bootstrap-4.js"></script>




    <spring:url value="/" var="urlHome" />
    <spring:url value="/users/add" var="urlAddUser" />
    <spring:url value="/logo.png"  var="logo"/>



    <title>Brokerage Management System</title>






</head>

<spring:url value="/login" var="loginUrl" ></spring:url>


<body >
<div class="container">

    <div class="row" style="margin-top:100px">
        <div class="col-xs-12 col-sm-8 col-md-4 offset-md-3 offset-md-2 ">
            <form  action="${loginUrl}" method="post">
                <input type="hidden"
                       name="${_csrf.parameterName}"
                       value="${_csrf.token}"/>
                <fieldset>
                    <img style="max-width:200px; margin-top: -7px;" src="${logo}">
                    <br/>

                    <br/>
                   <!--
                    <c:choose>
                        <c:when test="${param.error!=''}">
                            <div class="alert alert-danger">
                                Invalid username and password.
                            </div>
                        </c:when>

                    </c:choose>
                    <c:choose>
                        <c:when test="${param.logout!=''}">
                            <div class="alert alert-info">
                                You have been logged out.
                            </div>
                        </c:when>

                    </c:choose>  -->




                    <div class="form-group">
                        <input type="text" name="username" id="username" class="form-control input-lg"
                               placeholder="UserName" required="true" autofocus="true"/>
                    </div>
                    <div class="form-group">
                        <input type="password" name="password" id="password" class="form-control input-lg"
                               placeholder="Password" required="true"/>
                    </div>

                    <div class="row">
                        <div class="col-xs-6 col-sm-6 col-md-6">
                            <input type="submit" class="btn btn-lg btn-warning btn-block" value="Sign In"/>
                        </div>
                        <div class="col-xs-6 col-sm-6 col-md-6">
                        </div>
                    </div>
                </fieldset>
            </form>
        </div>
    </div>

</div>
</body>
</html>
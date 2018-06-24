<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>






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

        <spring:url value="/logout" var="logout" />



        <title>Brokerage Management System</title>










    </head>


<nav class="navbar navbar-expand-md  navbar navbar-light fixed-top" style="background-color: #fdb30d;">
    <a href="#" class="navbar-brand navbar-left"><img style="max-width:150px; margin-top: -7px;" src="${logo}"></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarsExampleDefault">
        <ul class="navbar-nav mr-auto">

            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="https://example.com" id="dropdown01"
                   data-toggle="dropdown"
                   aria-haspopup="true" aria-expanded="false">Customers</a>
                <div class="dropdown-menu" aria-labelledby="dropdown01">
                    <a class="dropdown-item" href="${urlHome}customers/">Customer Listing</a>
                    <a class="dropdown-item" href="${urlHome}customers/add">Setup New Customer</a>

                </div>
            </li>

            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="https://example.com" id="dropdown02"
                   data-toggle="dropdown"
                   aria-haspopup="true" aria-expanded="false">Policies</a>
                <div class="dropdown-menu" aria-labelledby="dropdown01">
                    <a class="dropdown-item" href="${urlHome}policies/">Policy Listing</a>
                    <a class="dropdown-item" href="${urlHome}policies/add">Setup New Policy</a>

                </div>
            </li>

            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="https://example.com" id="dropdown03"
                   data-toggle="dropdown"
                   aria-haspopup="true" aria-expanded="false">Agents</a>
                <div class="dropdown-menu" aria-labelledby="dropdown01">
                    <a class="dropdown-item" href="${urlHome}salesagents/">Agent Listing</a>
                    <a class="dropdown-item" href="${urlHome}salesagents/add">Setup New Agent</a>

                </div>
            </li>

            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="https://example.com" id="dropdown04"
                   data-toggle="dropdown"
                   aria-haspopup="true" aria-expanded="false">Insurance Companies</a>
                <div class="dropdown-menu" aria-labelledby="dropdown01">
                    <a class="dropdown-item" href="${urlHome}insurers/">Insurers Listing</a>
                    <a class="dropdown-item" href="${urlHome}insurers/add">Setup New Insurer</a>

                </div>
            </li>

            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="https://example.com" id="dropdown05"
                   data-toggle="dropdown"
                   aria-haspopup="true" aria-expanded="false">Reports</a>
                <div class="dropdown-menu" aria-labelledby="dropdown01">
                    <a class="dropdown-item" href="${urlHome}reports/">Report Listing</a>
                    <a class="dropdown-item" href="${urlHome}reports/add">Setup New Report</a>

                </div>
            </li>



            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="https://example.com" id="dropdown06"
                   data-toggle="dropdown"
                   aria-haspopup="true" aria-expanded="false">System Configuration</a>
                <div class="dropdown-menu" aria-labelledby="dropdown01">
                    <a class="dropdown-item" href="${urlHome}insurers/">System Configuration</a>

                    <sec:authorize access="hasAuthority('developer')">

                        <a class="dropdown-item" href="${urlHome}users/">User List</a>

                    </sec:authorize>

                </div>
            </li>

        </ul>
        <form class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </form>
        <form action="${logout}" method="post">
            <input type="hidden"
                   name="${_csrf.parameterName}"
                   value="${_csrf.token}"/>
            <input class="btn btn-danger" type="submit" value="Sign Out - <sec:authentication  property="principal.username" />" >
        </form>
    </div>
</nav>














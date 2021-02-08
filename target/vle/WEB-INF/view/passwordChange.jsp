<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://kit.fontawesome.com/efc0135243.js" crossorigin="anonymous"></script>
    <script src="<spring:url value='/resources/common.js'/>"></script>

    <style>
        .error{color:red}
    </style>


    <title>Login</title>
</head>
<body style="background-color:#d2cdff;">
<div class="container-fluid">
    <div class="row">
        <div style="height: 70px; color:aliceblue; background-color: darkcyan; width: 100%; display: flex;justify-content: center" >
            <img src="https://www.tehranserver.ir/images/icons/moodle-logo.png" alt="Logo" height="70%" style="margin-top: 5px;margin-right: 10px;margin-left: 30px" >
            <span style="font-size: 2vw;margin:auto auto auto 0px;display: inline-block;">Virtual Learning Environment</span>
<%--            <span style="font-size: 16px;color: aliceblue;display: inline-block;margin:auto 15px auto auto"><b> <a href="/" style="font-size: 20px" class="btn-sm btn-light">Home</a></b></span>--%>
            <c:if test="${sessionScope.userBean!=null}">
                <span style="font-size: 16px;color: aliceblue;display: inline-block;margin:auto 15px auto auto"><b> <a href="${pageContext.request.contextPath}/profile" style="font-size: 20px" class="btn-sm btn-light">Cancel</a></b></span>
            </c:if>
            <c:if test="${sessionScope.userBean==null}">
                <span style="font-size: 16px;color: aliceblue;display: inline-block;margin:auto 15px auto auto"><b> <a href="${pageContext.request.contextPath}/" style="font-size: 20px" class="btn-sm btn-light">Home</a></b></span>
            </c:if>
        </div>
    </div>
    <div class="row" >
        <div style="width: 40%;margin: 15px auto 30px auto">
            <div style="font-size: 2vw;background-color:white;height: 60px; margin: 7px 5px 7px 5px;border-radius: 5px;display: flex;justify-content: center;align-items: center;">
                <h4>Change Password</h4>
            </div>


            <div style="background-color:white; margin: 7px 5px 7px 5px;border-radius: 5px;">
                <div style="padding:30px 10px 30px 10px;width: 70%;margin:0 auto">
                    <h6 style="color: red"><c:out value="${msg}"/></h6>
                    <h6 style="color: red"><c:out value="${msg_match}"/></h6>
                    <form:form name="f" action="updatepassword" onsubmit=" return password_match() & password_validate()" modelAttribute="password" method="post" >
                        <div class="form-group">
                            <label for="opassword">Old Password:</label>
                            <form:input type="password" required="true" class="form-control" name='opassword' placeholder="Old password" id="opassword" path="opassword"/>
                        </div>
                        <div class="form-group">
                            <label for="password">New Password:</label>
                            <form:input type="password" onkeyup="password_validate(this.value)" required="true" id="npwd" class="form-control" name='password' placeholder="New password" path="password"/>
                            <p id="password_warn" style="display: inline;font-size: 13px; font-family: Bahnschrift" class="error"></p>
                        </div>
                        <div class="form-group">
                            <label for="cpassword">Confirm New Password:</label>
                            <form:input type="password" onkeyup="password_match()" required="true" class="form-control" name='cpassword' placeholder="Re-enter New password" id="cpassword" path="cpassword"/>
                            <p id="pwd_warn" style="display: inline;font-size: 13px; font-family: Bahnschrift" class="error"></p>
                        </div>
<%--                        <div class="form-group ">--%>
<%--                            <label class="form-check-label">--%>
<%--                                <a href="#" style="font-size: 14px">Forgotten Password?</a>--%>
<%--                            </label>--%>
<%--                        </div>--%>
                        <form:button name="submit"  type="submit" class="btn btn-primary">Submit</form:button>
                    </form:form>
                </div>
            </div>

        </div>
    </div>

    <div class="row">
        <div style="height: 60px; color:aliceblue; background-color: darkcyan; width: 100%; display: flex;text-align: center;position:fixed;bottom:0; ">
            <span style="font-size: 15px;margin:auto ;display: inline-block">Student Management System.</span>
        </div>
    </div>
</div>
</body>
</html>

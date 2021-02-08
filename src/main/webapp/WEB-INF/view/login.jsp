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


    <title>Login</title>
</head>
<body style="background-color:#d2cdff;">
<div class="container-fluid">
    <div class="row">
        <div style="height: 70px; color:aliceblue; background-color: darkcyan; width: 100%; display: flex;justify-content: center" >
            <img src="https://upload.wikimedia.org/wikipedia/commons/b/b7/Moodle-1-740x380.png" alt="Logo" height="80%" style="margin-top: 5px" >
            <span style="font-size: 2vw;margin:auto auto auto 0px;display: inline-block;">Virtual Learning Environment</span>
            <span style="font-size: 16px;color: aliceblue;display: inline-block;margin:auto 15px auto auto"><b> <a href="${pageContext.request.contextPath}/" style="font-size: 20px" class="btn-sm btn-light">Home</a></b></span>
        </div>
    </div>
    <div class="row" >
            <div style="width: 40%;margin: 15px auto 30px auto">
                <div style="font-size: 2vw;background-color:white;height: 60px; margin: 7px 5px 7px 5px;border-radius: 5px;display: flex;justify-content: center;align-items: center;">
                    <h4>Welcome to Virtual Learning Environment</h4>
                </div>


                <div style="background-color:white; margin: 7px 5px 7px 5px;border-radius: 5px;">
                    <div style="padding:30px 10px 30px 10px;width: 70%;margin:0 auto">
                        <p class="text-success">${logout}</p>
                        <p class="text-danger">${loginFailed}</p>

                        <form name="f" action="<spring:url value='login'/>" method='POST'>
                            <div class="form-group">
                                <label for="email">User name:</label>
                                <input type="text" class="form-control" name='username' placeholder="Enter email" id="email">
                            </div>
                            <div class="form-group">
                                <label for="pwd">Password:</label>
                                <input type="password" class="form-control" name='password' placeholder="Enter password" id="pwd">
                            </div>
                            <div class="form-group ">
                                <label class="form-check-label">Stay logged-in:</label>
                                <input type="checkbox" name="remember-me" />
                            </div>
<%--                            <div class="form-group ">--%>
<%--                                <label class="form-check-label">--%>
<%--                                    <a href="#" style="font-size: 14px">Forgotten Password?</a>--%>
<%--                                </label>--%>
<%--                            </div>--%>
                            <button name="submit" type="submit" class="btn btn-primary">Login</button>
                        </form>
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

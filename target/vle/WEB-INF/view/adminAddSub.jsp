<%--
  Created by IntelliJ IDEA.
  User: akila_s
  Date: 1/27/2021
  Time: 11:31 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>


<!DOCTYPE html>
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
        .dropbtn {

            border-radius: 50%;
            max-height: 50px;
            max-width: 50px;
            min-height: 50px;
            min-width: 50px;
            cursor: pointer;
        }

        .dropdown {
            position: relative;
            display: inline-block;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            right: 0;
            background-color: #f9f9f9;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            z-index: 1;
        }

        .dropdown-content a {
            color: black;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
        }

        .centered-form{

            margin: 10px 5px 10px 5px;
            border-radius: 5px;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .centered-form .panel{
            background: rgba(255, 255, 255, 0.8);
            box-shadow: rgba(0, 0, 0, 0.3) 20px 20px 20px;
        }

        .dropdown-content a:hover {background-color: #f1f1f1;}
        .dropdown:hover .dropdown-content {display: block;}
        .dropdown:hover .dropbtn {background-color: #3e8e41;}
    </style>
    <title>Admin | AddSubject</title>
</head>
<body style=";min-height: 100%;height: 100%;background-color:#d2cdff;">

<div class="container-fluid" >

    <div class="row fixed-top">
        <div style="height: 70px; color:aliceblue; background-color: darkcyan; width: 100%; display: flex;justify-content: center;align-items: center" >
            <img src="https://www.tehranserver.ir/images/icons/moodle-logo.png" alt="Logo" height="70%" style="margin-top: 5px;margin-right: 10px;margin-left: 30px" >
            <span style="font-size: 2vw;margin:auto auto auto 0px;display: inline-block">Virtual Learning Environment</span>
            <div style="margin:auto 15px auto auto;display: inline-block">
                <span style="display:inline-block;margin: 10px 20px auto auto">
                    <a href="${pageContext.request.contextPath}/profile" style="font-size: 1.2vw;color: aliceblue;font-weight: 8px" >Hi, ${sessionScope.userBean.fname} ${sessionScope.userBean.lname}.</a>
                </span>
                <span style="font-size: 16px;color: aliceblue;float:right;display: inline-block;margin: auto 40px auto auto">
                        <div class="dropdown" style="display: inline-block">
                              <a href="${pageContext.request.contextPath}/profile"><img src="data:image/jpg;base64,${sessionScope.userBean.profilePic}" class="dropbtn" alt="Profile"/></a>
                              <div class="dropdown-content">
                                    <a href="${pageContext.request.contextPath}/profile">Profile</a>
                                    <a href="#">Download</a>
                                    <a href="${pageContext.request.contextPath}/logout">Log-Out</a>
                              </div>
                        </div>
                </span>
            </div>

        </div>


    </div>
    <div style="margin-top: 70px">
        <div class="row" style="background-color:#d2cdff">
            <div class="col-md-2" style="padding-left: 5px" >
                <div style="background-color:white;padding-bottom: 30px;margin: 10px 0 auto 10px;border-radius: 5px;">
                    <div>
                        <img src="<spring:url value='/resources/images/common/sidebar.png'/>" width="60%" style="display: block;padding-top: 5px;padding-bottom: 0;margin-left: auto;margin-right: auto;">
                    </div>
                    <div class="list-group" style="padding: 5px 20px 20px 20px;">
                        <a href="${pageContext.request.contextPath}/" class="list-group-item list-group-item-action" style="text-align: center;font-size: 1.3vw;padding: 5px">Home</a>
                        <a href="${pageContext.request.contextPath}/profile" class="list-group-item list-group-item-action" style="text-align: center;font-size: 1.3vw;padding: 5px">Profile</a>
                        <a href="${pageContext.request.contextPath}/admin/adminLecView" class="list-group-item list-group-item-action" style="text-align: center;font-size: 1.3vw;padding: 5px">Lecturers</a>
                        <a href="${pageContext.request.contextPath}/admin/adminStuView" class="list-group-item list-group-item-action" style="text-align: center;font-size: 1.3vw;padding: 5px">Students</a>
                        <a href="${pageContext.request.contextPath}/admin/adminSubView" class="list-group-item-secondary list-group-item-action" style="text-align: center;font-size: 1.3vw;padding: 5px">Subjects</a>
                        <a href="${pageContext.request.contextPath}/about" class="list-group-item list-group-item-action" style="text-align: center;font-size: 1.3vw;padding: 5px">About</a>
                        <a href="${pageContext.request.contextPath}/contact" class="list-group-item list-group-item-action" style="text-align: center;font-size: 1.3vw;padding: 5px">Contact</a>
                    </div>
                    <%--               <div style=" text-align: justify-all; padding: 20px;font-size: 14px">--%>
                    <%--                   The University of Colombo School of Computing is a higher educational institute affiliated to the University of Colombo in Sri Lanka Providing Computer Science, Information Systems and Information and Communication Technology education.--%>
                    <%--               </div>--%>
                </div>
            </div>
            <div class="col-md-10" >

                <div class="row centered-form">
                    <div class="col-md-12">
                        <div class="panel panel-default" style="padding: 40px 80px 60px 80px">
                            <div class="panel-heading" style="display: flex;justify-content: center;align-items: center;">
                                <h4 class="panel-title">Add New Subject</h4>



                                <%--                                ${registrationFailed}--%>
                            </div>
                            <hr>
                            <div>
                                <c:if test="${registrationFailed!=null}">
                                    <h6 style="color: red"><c:out value="${registrationFailed}"/></h6>
                                </c:if>
                                <form:form action="saveSubject" modelAttribute="subject" method="post">
                                    <div class="row">
                                        <div class="col-xs-6 col-sm-6 col-md-6">
                                            <div class="form-group">
                                                <label>Subject_ID:</label>
                                                <form:input type="text" path="subjectID" id="subjectID" class="form-control"  placeholder="SCS1234"/>
                                                <form:errors path="subjectID" cssClass="error"/>
                                            </div>
                                        </div>
                                        <div class="col-xs-6 col-sm-6 col-md-6">
                                            <div class="form-group">
                                                <label>Subject name:</label>
                                                <form:input type="text" path="name" id="name" class="form-control" placeholder="Subject name"/>
                                                <form:errors path="name" cssClass="error"/>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-xs-6 col-sm-6 col-md-6">
                                            <div class="form-group">
                                                <label>Year:</label>
                                                <form:select path="year" class="form-control" id="year">
                                                    <form:option value="1st" label="1st Year"/>
                                                    <form:option value="2nd" label="2nd Year"/>
                                                    <form:option value="3rd" label="3rd Year"/>
                                                    <form:option value="4th" label="4th Year"/>
                                                </form:select>
                                            </div>
                                        </div>
                                        <div class="col-xs-6 col-sm-6 col-md-6">
                                            <div class="form-group">
                                                <label>Lecturer:</label>
                                                <form:select path="lecturer" class="form-control">
                                                    <form:option value="-" label="Assign Lecturer" />
                                                    <form:options items="${lecturers}" />
                                                </form:select>

                                            </div>
                                        </div>
                                    </div>
                                    <hr>

                                    <div style="display: flex;justify-content: center">
                                        <input type="submit" value="Add" class="btn btn-primary " style="display: inline-block;width: 8vw;margin-right: 5px" />
                                        <input type="reset" value="Clear" class="btn btn-secondary" style="display: inline-block;width: 8vw;margin-left: 5px" />
                                    </div>

                                </form:form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%--<div style="height: 60px; color:aliceblue; background-color: darkcyan; width: 100%; display: flex;text-align: center;position: absolute;bottom: 0">--%>
<%--    <span style="font-size: 15px;margin:auto ;display: inline-block">Student Management System.</span>--%>
<%--</div>--%>

</body>
</html>

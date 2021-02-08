<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<sec:authentication var="principal" property="principal" />
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

    <style>
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

            margin: 10px 5px 10px -5px;
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

    <title>Welcome to VLE</title>
</head>
<body style="min-height: 100%;background-color:#d2cdff;">
<div class="container-fluid">
    <div class="fixed-top">
        <div class="row ">
            <div style="height: 70px; color:aliceblue; background-color: darkcyan; width: 100%; display: flex;justify-content: center" >
                <img src="https://www.tehranserver.ir/images/icons/moodle-logo.png" alt="Logo" height="70%" style="margin-top: 5px;margin-right: 10px;margin-left: 30px" >
                <span style="font-size:2vw;margin:auto auto auto 0px;display: inline-block">Virtual Learning Environment</span>
                <c:choose>
                    <c:when test="${sessionScope.userBean!=null}">
                        <div style="margin:auto 15px auto auto;display: inline-block">
                            <span style="display:inline-block;margin: 10px 20px auto auto">
                                <a href="${pageContext.request.contextPath}/profile" style="font-size: 1.2vw;color: aliceblue;font-weight: 8px" >Hi, ${sessionScope.userBean.fname} ${sessionScope.userBean.lname}</a>
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
                    </c:when>
                    <c:otherwise>
                        <span style="font-size: 1.1vw;color: aliceblue;display: inline-block;margin:auto 30px auto auto"><b>You are not logged in. <a href="login" style="font-size: 20px" class="btn-sm btn-light">Log-In</a></b></span>
                    </c:otherwise>
                </c:choose>

            </div>
        </div>
    </div>
    <div style="margin-top: 70px">
        <div class="row" style="background-color:#d2cdff">
            <div class="col-md-2 position-fixed">
                <div  style="background-color:white;padding-bottom: 30px;margin: 10px 0 auto 5px;border-radius: 5px;">
                    <div>
                        <img src="<spring:url value='/resources/images/common/sidebar.png'/>" width="60%" style="display: block;padding-top: 40px;padding-bottom: 10px;margin-left: auto;margin-right: auto;">
                    </div>
                    <div class="list-group" style="padding: 20px;">
                            <a href="#" class="list-group-item-secondary list-group-item-action" style="text-align: center;font-size: 1.3vw;padding: 5px">Home</a>
                            <c:if test="${sessionScope.userBean.role!=null}">
                                <a href="${pageContext.request.contextPath}/profile" class="list-group-item list-group-item-action" style="text-align: center;font-size: 1.3vw;padding: 5px">Profile</a>
                            </c:if>
                            <c:if test="${sessionScope.userBean.role.equals('ADMIN')}">
                                <a href="${pageContext.request.contextPath}/admin/adminLecView" class="list-group-item list-group-item-action" style="text-align: center;font-size: 1.3vw;padding: 5px">Lecturers</a>
                                <a href="admin/adminStuView" class="list-group-item list-group-item-action" style="text-align: center;font-size: 1.3vw;padding: 5px">Students</a>
                                <a href="${pageContext.request.contextPath}/admin/adminSubView" class="list-group-item list-group-item-action" style="text-align: center;font-size: 1.3vw;padding: 5px">Subjects</a>
                            </c:if>
                            <c:if test="${!sessionScope.userBean.role.equals('ADMIN')}">

                                <c:forEach var="sub" items="${sessionScope.subjects}">
                                    <c:choose>
                                        <c:when test="${sessionScope.userBean.role.equals('STU')}">
                                            <a href="${pageContext.request.contextPath}/student/subject/${sub.subjectID}?name=${sub.name}" class="list-group-item list-group-item-action" style="text-align: center;font-size: 1.3vw;padding: 5px;font-weight: 490 ">${sub.name}</a>
                                        </c:when>
                                        <c:when test="${sessionScope.userBean.role.equals('LEC')}">
                                            <a href="${pageContext.request.contextPath}/lecturer/subject/${sub.subjectID}?name=${sub.name}" class="list-group-item list-group-item-action" style="text-align: center;font-size: 1.3vw;padding: 5px;font-weight: 490 ">${sub.name}</a>
                                        </c:when>
                                    </c:choose>
                                </c:forEach>

                            </c:if>
                        <a href="${pageContext.request.contextPath}/about" class="list-group-item list-group-item-action" style="text-align: center;font-size: 1.3vw;padding: 5px">About</a>
                        <a href="${pageContext.request.contextPath}/contact" class="list-group-item list-group-item-action" style="text-align: center;font-size: 1.3vw;padding: 5px">Contact</a>
                    </div>
                </div>
            </div>
            <div class="col-md-10" style="margin-left:15vw;" >
                <div style="background-color:white;height: 80px; margin: 10px -1.6vw 10px 5px;;border-radius: 5px;display: flex;justify-content: center;align-items: center;">
                    <h2 >Welcome to Virtual Learning Environment</h2>
                </div>

                <div style="background-color:white; margin: 10px -1.6vw 10px 5px;border-radius: 5px">
                    <div>
                        <img src="https://www.inclusiveweb.net/wp-content/uploads/moodle-logo-tagline-2017-500px-e1579776122605.png" width="25%" style="display: block;padding-top: 40px;padding-bottom: 30px;margin-left: auto;margin-right: auto;">
                    </div>

                    <h3 style="padding: 20px">Site Announcements</h3>
                    <div class="card" style="margin-bottom:40px ">
                        <div class="card-header">
                            <div style="display: inline-block">
                                <i class="fas fa-user fa-3x" ></i>
                            </div>

                            <div  style="display: inline-block">
                                <h4>Commencement of Academic Activities: Semester I (19th Jan. 2021)</h4>
                                <address>by Admin - <time>Sunday, 10 jan 2020, 2:43 PM</time></address>
                            </div>
                        </div>
                        <div class="card-body">
                        <span>
                            According to the year plan, the academic activities of Semester II will be commenced on 19th October 2020 in the online mode.
                            All teaching activities will be carried out according to the published timetable using Zoom video conferencing – online service.
                            The student guide has been prepared by the Head/IUD based on the decisions taken at the Board of Study Meeting.
                            Please go through the Online Lecture Session Guide, and you are supposed to participate in online sessions according to the timetable of your academic year. Relevant lecturers will post the links for online sessions on the respective course pages before the commencement of the lecture.You are kindly asked to change the default password to login to the UCSC VLE (ugVLE) as soon as possible. Due to some reasons, if you cannot login, please send an email to VLE Administrator.
                            Wish you a safe stay while engaging the academic activities in the semester.
                        </span>
                        </div>
                        <div style="text-align: end;padding-right: 20px"><a href="#" style="color: darkcyan">Discuss this Topic</a></div>
                    </div>
                    <div class="card" style="margin-bottom:40px ">
                        <div class="card-header">
                            <div style="display: inline-block">
                                <i class="fas fa-user fa-3x" ></i>
                            </div>

                            <div  style="display: inline-block">
                                <h4>Commencement of Academic Activities: Semester I (19th Jan. 2021)</h4>
                                <address>by Admin - <time>Sunday, 10 jan 2020, 2:43 PM</time></address>
                            </div>
                        </div>
                        <div class="card-body">
                        <span>
                            According to the year plan, the academic activities of Semester II will be commenced on 19th October 2020 in the online mode.
                            All teaching activities will be carried out according to the published timetable using Zoom video conferencing – online service.
                            The student guide has been prepared by the Head/IUD based on the decisions taken at the Board of Study Meeting.
                            Please go through the Online Lecture Session Guide, and you are supposed to participate in online sessions according to the timetable of your academic year. Relevant lecturers will post the links for online sessions on the respective course pages before the commencement of the lecture.You are kindly asked to change the default password to login to the UCSC VLE (ugVLE) as soon as possible. Due to some reasons, if you cannot login, please send an email to VLE Administrator.
                            Wish you a safe stay while engaging the academic activities in the semester.
                        </span>
                        </div>
                        <div style="text-align: end;padding-right: 20px"><a href="#" style="color: darkcyan">Discuss this Topic</a></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div style="height: 60px; color:aliceblue; background-color: darkcyan; width: 100%; display: flex;text-align: center;position: relative;bottom: 0">
    <span style="font-size: 15px;margin:auto ;display: inline-block">Student Management System.</span>
</div>


</body>
</html>
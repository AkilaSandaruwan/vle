<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            width: 50px;
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

            margin: 10px 5px 30px -5px;
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
    <title>Profile</title>
</head>
<body style="background-color:#d2cdff;min-height: 100%;height: 100%">

<div class="container-fluid" >
    <div class="row fixed-top">
        <div style="height: 70px; color:aliceblue; background-color: darkcyan; width: 100%; display: flex;justify-content: center;align-items: center" >
            <img src="https://upload.wikimedia.org/wikipedia/commons/b/b7/Moodle-1-740x380.png" alt="Logo" height="80%" style="margin-top: 5px" >
            <span style="font-size: 2vw;margin:auto auto auto 0px;display: inline-block">Virtual Learning Environment</span>
            <div style="margin:auto 15px auto auto;display: inline-block">
                <span style="display:inline-block;margin: 10px 20px auto auto">
                    <a href="${pageContext.request.contextPath}" style="font-size: 1.2vw;color: aliceblue;font-weight: 8px" >Hi, ${sessionScope.userBean.fname} ${sessionScope.userBean.lname}.</a>
                </span>
                <span style="font-size: 16px;color: aliceblue;float:right;display: inline-block;margin: auto 40px auto auto">
                        <div class="dropdown" style="display: inline-block">
                          <a href="${pageContext.request.contextPath}/admin/profile"><img src="<spring:url value='/resources/images/profilePics/${sessionScope.userBean.profilePic}'/>" class="dropbtn" alt="Profile"/></a>
                              <div class="dropdown-content">
                                    <a href="#">Download</a>
                                    <a href="#">Log-Out</a>
                              </div>
                        </div>
                </span>
            </div>

        </div>
    </div>
    <div style="margin-top: 70px">
        <div class="row" style="background-color:#d2cdff">
            <div class="col-md-2 position-fixed" style="padding-left: 5px" >
                <div style="background-color:white;padding-bottom: 30px;margin: 10px 0 auto 5px;border-radius: 5px;">
                    <div>
                        <img src="https://upload.wikimedia.org/wikipedia/commons/b/b7/Moodle-1-740x380.png" alt="Logo" width="100%" style="display: block;padding-top: 40px;padding-bottom: 30px;margin-left: auto;margin-right: auto;">
                    </div>
                    <div class="list-group" style="padding: 20px;">
                        <a href="/" class="list-group-item list-group-item-action" style="text-align: center;font-size: 1.3vw;padding: 5px">Home</a>
                        <a href="#" class="list-group-item-secondary list-group-item-action" style="text-align: center;font-size: 1.3vw;padding: 5px">Profile</a>
                        <c:if test="${sessionScope.userBean.role.equals('STU')}">
                            <a href="#" class="list-group-item list-group-item-action" style="text-align: center;font-size: 1.3vw;padding: 5px">Lecturers</a>
                            <a href="admin/adminStuView" class="list-group-item list-group-item-action" style="text-align: center;font-size: 1.3vw;padding: 5px">Students</a>
                            <a href="admin/adminStuView" class="list-group-item list-group-item-action" style="text-align: center;font-size: 1.3vw;padding: 5px">Subjects</a>
                        </c:if>
                        <c:if test="${sessionScope.userBean.role.equals('LEC')}">
                            <a href="admin/adminStuView" class="list-group-item list-group-item-action" style="text-align: center;font-size: 1.3vw;padding: 5px">Students</a>
                        </c:if>
                        <c:if test="${sessionScope.userBean.role.equals('STU')}">
                            <a href="#" class="list-group-item list-group-item-action" style="text-align: center;font-size: 1.3vw;padding: 5px">SCS3302</a>
                        </c:if>

                        <a href="#" class="list-group-item list-group-item-action" style="text-align: center;font-size: 1.3vw;padding: 5px">About</a>
                        <a href="#" class="list-group-item list-group-item-action" style="text-align: center;font-size: 1.3vw;padding: 5px">Contact</a>
                    </div>
                    <%--               <div style=" text-align: justify-all; padding: 20px;font-size: 14px">--%>
                    <%--                   The University of Colombo School of Computing is a higher educational institute affiliated to the University of Colombo in Sri Lanka Providing Computer Science, Information Systems and Information and Communication Technology education.--%>
                    <%--               </div>--%>
                </div>
            </div>
            <div class="col-md-10" style="margin-left:15vw;" >

                <div class="row centered-form">
                    <div class="col-md-12" style="margin-left: -5px">
                        <div class="panel panel-default" style="margin-right: -3vw;padding: 30px 100px 30px 60px;border-radius: 5px">
                            <div class="panel-heading" style="display: flex;justify-content: center;align-items: center;">
                                <h3 class="panel-title">Akila Sandaruwan</h3>
                            </div>
                            <hr>
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-md-3" style="border-right:darkgrey solid;padding:10px 10px 15px 10px;font-size: 1.1vw;display: flex;justify-content: flex-start;flex-direction: column;align-items: center " >
                                        <img style="border-radius: 10px; border: darkgray solid thick;width: 13vw;margin-bottom: 20px" src="<spring:url value='/resources/images/profilePics/malePic.jpg'/>" alt="ProfilePic">

                                        <div>
                                            <span style="padding-bottom: 10px;display: inline-block;"><b>Name:</b>&nbsp;Akila Sandaruwan</span>
                                            <br/>
                                            <span style="padding-bottom: 10px;display: inline-block;"><b>Email:</b>&nbsp;akila@gmail.com</span>
                                            <br/>
                                            <span style="padding-bottom: 10px;display: inline-block;"><b>Mobile:</b>&nbsp;0771234567</span>
                                            <br/>
                                            <a href="#" style="padding-bottom: 10px;color: blue;display: inline-block;">Edit Profile</a>
                                            <hr>
                                            <a href="#" style="color: blue;">Download</a>
                                        </div>

                                    </div>
                                    <div class="col-md-9" style="padding: 20px 20px;font-size: 1.1vw">
                                        <b>Course Name:</b>&nbsp;Computer Science
                                        <hr>
                                        <b>Student ID:</b>&nbsp;17091543
                                        <hr>
                                        <b>NIC:</b>&nbsp;978753426V
                                        <hr>
                                        <b>Year:</b>&nbsp;Second Year
                                        <hr>
                                        <b>Date of Birth:</b>&nbsp;19-Jan-1997
                                        <hr>
                                        <b>Gender:</b>&nbsp;Male
                                        <hr>
                                        <b>City:</b>&nbsp;Beliatta
                                        <hr>
                                        <a href="#" style="color: blue;">*Change Password</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%--<div class="row" style="float: bottom">--%>
    <%--    <div style="height: 60px; color:aliceblue; background-color: darkcyan; width: 100%; display: flex;text-align: center; ">--%>
    <%--        <span style="font-size: 15px;margin:auto ;display: inline-block">Student Management System.</span>--%>
    <%--    </div>--%>
    <%--</div>--%>
</div>
<div style="height: 60px; color:aliceblue; background-color: darkcyan; width: 100%; display: flex;text-align: center;position: absolute;bottom: 0">
    <span style="font-size: 15px;margin:auto ;display: inline-block">Student Management System.</span>
</div>

</body>
</html>
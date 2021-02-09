<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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

        i{
            cursor: pointer;
        }


        .profile-pic span {
            display: inline-block;
            padding-top: 4.5em;
            padding-bottom: 4.5em;
        }

        form input[type="file"] {
            display: none;
            cursor: pointer;
        }

        .profile-pic {
            /*border-radius: 50%;*/
            /*height: 150px;*/
            /*width: 150px;*/
            background-size: cover;
            background-position: center;
            background-blend-mode: multiply;
            vertical-align: middle;
            text-align: center;
            color: transparent;
            transition: all .3s ease;
            text-decoration: none;
            cursor: pointer;
        }

        .profile-pic:hover {
            background-color: rgba(0,0,0,.5);
            z-index: 10000;
            color: #fff;
            transition: all .3s ease;
            text-decoration: none;
        }


        .mystyle{
            font-size: 10px; color: grey;
        }

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

    <script src="<spring:url value='/resources/common.js'/>"></script>

    <title>Profile</title>
</head>
<body style="background-color:#d2cdff;min-height: 100%;height: 100%">


<!-- Modal Email -->
<div class="modal fade" id="model_email" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle">Change Email</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div>
                    <form:form action="${pageContext.request.contextPath}/updateprofile/email" modelAttribute="profile">
                        <div class="form-group">
                            <label>Email:</label>
                            <form:input type="email" path="email" name="email" id="email" class="form-control " placeholder="akila@gmail.com"/>
                        </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                <button type="submit" class="btn btn-primary">Save</button>
            </div>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
</div>
<%--End of Model Email--%>
<!-- Modal home-->
<div class="modal fade" id="model_home" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="">Change Home Number</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div id="home_m">
                    <form:form action="${pageContext.request.contextPath}/updateprofile/home" modelAttribute="profile">
                        <div class="form-group">
                            <label>Home:</label>
                            <form:input maxlength="10" type="text" path="home" name="home" id="home" class="form-control " placeholder="Land Line"/>
                        </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                <button type="submit" class="btn btn-primary">Save</button>
            </div>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
</div>
<%--End of Model Home--%>

<!-- Modal Mobile-->
<div class="modal fade" id="model_mobile" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle1">Change Mobile Number</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div id="mobile_m">
                    <form:form action="${pageContext.request.contextPath}/updateprofile/mobile" modelAttribute="profile">
                        <div class="form-group">
                            <label>Mobile:</label>
                            <form:input maxlength="10" type="text" path="mobile" name="mobile" id="mobile" class="form-control " placeholder="0771234567"/>
                        </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                <button type="submit" class="btn btn-primary">Save</button>
            </div>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
</div>
<%--End of Model Mobile--%>

<!-- Modal NIC-->
<div class="modal fade" id="model_nic" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="">Change NIC</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div id="mobile_nic">
                    <form:form action="${pageContext.request.contextPath}/updateprofile/nic" modelAttribute="profile">
                        <div class="form-group">
                            <label>NIC:</label>
                            <form:input type="text" path="nic" name="nic" id="nic" class="form-control " placeholder="123456789V"/>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                            <button type="submit" class="btn btn-primary">Save</button>
                        </div>
                    </form:form>
                </div>
            </div>

        </div>
    </div>
</div>
<%--End of NIC Mobile--%>

<!-- Modal city-->
<div class="modal fade" id="model_city" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="">Change City</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div id="city_m">
                    <form:form action="${pageContext.request.contextPath}/updateprofile/city" modelAttribute="profile">
                        <div class="form-group">
                            <label>City:</label>
                            <form:input type="text" path="city" name="city" id="city" class="form-control " placeholder="Beliatta"/>
                        </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                <button type="submit" class="btn btn-primary">Save</button>
            </div>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
</div>
<%--End of city--%>

<!-- Modal dob-->
<div class="modal fade" id="model_dob" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="">Change Date of Birth</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div id="mobile_city">
                    <form:form action="${pageContext.request.contextPath}/updateprofile/dob" modelAttribute="profile">
                        <div class="form-group">
                            <label>Date of Birth:</label>
                            <form:input type="date" path="dob" name="dob" id="dob" class="form-control " placeholder="19-Jan-1997"/>
                        </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                <button type="submit" class="btn btn-primary">Save</button>
            </div>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
</div>
<%--End of dob--%>


<!-- Modal gender-->
<div class="modal fade" id="model_gender" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="">Change Gender</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div id="gender_m">
                    <form:form action="${pageContext.request.contextPath}/updateprofile/gender" modelAttribute="profile">
                        <div class="form-group">
                            <label>Gender:</label>
                            <form:select path="gender">
                                <form:option value="M" label="Male"/>
                                <form:option value="F" label="Female"/>
                            </form:select>
                        </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                <button type="submit" class="btn btn-primary">Save</button>
            </div>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
</div>
<%--End of gender--%>

<!-- Modal username-->
<div class="modal fade" id="model_username" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="">Change Username</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div id="usernamem">
                    <form:form action="${pageContext.request.contextPath}/updateprofile/username" modelAttribute="profile">
                        <div class="form-group">
                            <label>Username:</label>
                            <form:input path="username" id="username" class="form-control " placeholder="Admin"/>
                        </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                <button type="submit" class="btn btn-primary">Save</button>
            </div>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
</div>
<%--End of username--%>

<%--End of gender--%>



<div class="container-fluid" >
    <div class="row fixed-top">
        <div style="height: 70px; color:aliceblue; background-color: darkcyan; width: 100%; display: flex;justify-content: center;align-items: center" >
            <img src="https://www.tehranserver.ir/images/icons/moodle-logo.png" alt="Logo" height="70%" style="margin-top: 5px;margin-right: 10px;margin-left: 30px" >
            <span style="font-size: 2vw;margin:auto auto auto 0px;display: inline-block">Virtual Learning Environment </span>
            <div style="margin:auto 15px auto auto;display: inline-block">
                <span style="display:inline-block;margin: 10px 20px auto auto">
                    <a href="${pageContext.request.contextPath}/profile" style="font-size: 1.2vw;color: aliceblue;font-weight: 8px" >Hi, ${sessionScope.userBean.fname} ${sessionScope.userBean.lname}</a>
                </span>
                <span style="font-size: 16px;color: aliceblue;float:right;display: inline-block;margin: auto 40px auto auto">
                        <div class="dropdown" style="display: inline-block">
                          <a href="${pageContext.request.contextPath}/profile"><img src="data:image/jpg;base64,${sessionScope.userBean.profilePic}" class="dropbtn" alt="Profile"/></a>
                              <div class="dropdown-content">
                                    <a href="#">Download</a>
                                    <a href="${pageContext.request.contextPath}/logout">Log-Out</a>
                              </div>
                        </div>
                </span>
            </div>

        </div>
    </div>
    <div style="margin-top: 70px;">
        <div class="row" style="background-color:#d2cdff">
            <div class="col-md-2 position-fixed" style="padding-left: 5px" >
                <div style="background-color:white;padding-bottom: 15px;margin: 10px 0 auto 5px;border-radius: 5px;">
                    <div>
                        <img src="<spring:url value='/resources/images/common/sidebar.png'/>" width="60%" style="display: block;padding-top: 40px;padding-bottom: 10px;margin-left: auto;margin-right: auto;">
                    </div>
                    <div class="list-group" style="padding: 20px;">
                        <a href="${pageContext.request.contextPath}/" class="list-group-item list-group-item-action" style="text-align: center;font-size: 1.3vw;padding: 5px">Home</a>
                        <c:if test="${sessionScope.userBean.role!=null}">
                            <a href="${pageContext.request.contextPath}/profile" class="list-group-item-secondary list-group-item-action" style="text-align: center;font-size: 1.3vw;padding: 5px">Profile</a>
                        </c:if>
                        <c:if test="${sessionScope.userBean.role.equals('ADMIN')}">
                            <a href="${pageContext.request.contextPath}/admin/adminLecView" class="list-group-item list-group-item-action" style="text-align: center;font-size: 1.3vw;padding: 5px">Lecturers</a>
                            <a href="admin/adminStuView" class="list-group-item list-group-item-action" style="text-align: center;font-size: 1.3vw;padding: 5px">Students</a>
                            <a href="${pageContext.request.contextPath}/admin/adminSubView" class="list-group-item list-group-item-action" style="text-align: center;font-size: 1.3vw;padding: 5px">Subjects</a>
                        </c:if>
                        <a href="${pageContext.request.contextPath}/about" class="list-group-item list-group-item-action" style="text-align: center;font-size: 1.3vw;padding: 5px">About</a>
                        <a href="${pageContext.request.contextPath}/contact" class="list-group-item list-group-item-action" style="text-align: center;font-size: 1.3vw;padding: 5px">Contact</a>
                    </div>
                </div>
                    <c:if test="${!sessionScope.userBean.role.equals('ADMIN')}">
                        <div style="background-color:white;padding-bottom: 15px;margin: 10px 0 auto 5px;border-radius: 5px;">
                            <div>
                                <h6 style="padding: 10px 5px 5px 20px">Subjects</h6>
                            </div>
                            <div class="list-group" style="padding: 5px 20px 20px 20px;">

                                <c:forEach var="sub" items="${sessionScope.subjects}">
                                    <c:if test="${sub.subjectID.equals(subjectID)}">
                                        <c:if test="${sessionScope.userBean.role.equals('LEC')}">
                                            <a href="${pageContext.request.contextPath}/lecturer/subject/${sub.subjectID}?name=${sub.name}" class="list-group-item-secondary list-group-item-action" style="text-align: center;font-size: 1.3vw;padding: 5px;font-weight: 490 ">${sub.name}</a>
                                        </c:if>
                                        <c:if test="${sessionScope.userBean.role.equals('STU')}">
                                            <a href="${pageContext.request.contextPath}/student/subject/${sub.subjectID}?name=${sub.name}" class="list-group-item-secondary list-group-item-action" style="text-align: center;font-size: 1.3vw;padding: 5px;font-weight: 490 ">${sub.name}</a>
                                        </c:if>
                                    </c:if>
                                    <c:if test="${!sub.subjectID.equals(subjectID)}">
                                        <c:if test="${sessionScope.userBean.role.equals('LEC')}">
                                            <a href="${pageContext.request.contextPath}/lecturer/subject/${sub.subjectID}?name=${sub.name}" class="list-group-item list-group-item-action" style="text-align: center;font-size: 1.3vw;padding: 5px;font-weight: 490 ">${sub.name}</a>
                                        </c:if>
                                        <c:if test="${sessionScope.userBean.role.equals('STU')}">
                                            <a href="${pageContext.request.contextPath}/student/subject/${sub.subjectID}?name=${sub.name}" class="list-group-item list-group-item-action" style="text-align: center;font-size: 1.3vw;padding: 5px;font-weight: 490 ">${sub.name}</a>
                                        </c:if>

                                    </c:if>

                                </c:forEach>

                            </div>
                        </div>
                    </c:if>
            </div>
            <div class="col-md-10" style="margin-left:15vw;" >

                <div class="row centered-form">
                    <div class="col-md-12" style="margin-left: -5px">
                        <div class="panel panel-default" style="margin-right: -3vw;padding: 30px 100px 30px 60px;border-radius: 5px">
                            <div class="panel-heading" style="display: flex;justify-content: center;align-items: center;">
                                <h3 class="panel-title">${sessionScope.userBean.fname} ${sessionScope.userBean.lname} </h3>


                            </div>
                            <hr>
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-md-3" style="border-right:darkgrey solid;padding:10px 10px 10px 10px;font-size: 1.1vw;display: flex;justify-content: flex-start;flex-direction: column;align-items: flex-start " >
<%--                                        <img style="border-radius: 10px; border: darkgray solid thick;width: 13vw;margin-bottom: 20px" src="<spring:url value='/resources/images/profilePics/${sessionScope.userBean.profilePic}'/>" alt="ProfilePic">--%>

                                        <form:form action="${pageContext.request.contextPath}/updateprofile/profilePic" modelAttribute="profile" enctype="multipart/form-data">
                                            <label for="fileToUpload">
                                                <div class="profile-pic" id="image" style="border-radius: 10px; border: darkgray solid thick;width: 13vw;margin-bottom: 20px;background-image: url('data:image/jpg;base64,${profile.profilePic}')">
                                                    <span class="glyphicon glyphicon-camera"></span>
                                                    <span>Change Image</span>
                                                </div>
                                            </label>
                                            <form:input type="File" name="fileToUpload" id="fileToUpload" onchange="setButton()" path="photo"/>
                                            <input type="submit" value="Update profile picture" onchange="setPhoto(this);" id="submitbtn" class="btn btn-outline-primary btn-sm" style="display: none;margin-top: -15px;margin-bottom: 15px" />
                                        </form:form>




                                        <div>
                                            <span style="padding-bottom: 13px;display: inline-block;"><b>Name:</b>&nbsp;${profile.fname} ${profile.lname}</span>
                                            <br/>
                                            <span style="padding-bottom: 13px;display: inline-block;">
                                                <b>Email:</b>&nbsp;${profile.email}&nbsp;&nbsp;
                                                <a data-toggle="modal" data-target="#model_email"><i  class="fa fa-pencil mystyle" aria-hidden="true"></i></a>
                                            </span>
                                            <br/>
                                            <span style="padding-bottom: 13px;display: inline-block;">
                                                <b>Mobile:</b>&nbsp;${profile.mobile}&nbsp;&nbsp;
                                                <a data-toggle="modal" data-target="#model_mobile"><i class="fa fa-pencil mystyle" aria-hidden="true"></i></a>
                                            </span>
                                            <br/>
                                            <hr>
                                            <a href="#" style="color: blue;"><i class="fas fa-file-download"></i>&nbsp; Download</a>
                                        </div>

                                    </div>
                                    <div class="col-md-9" style="padding: 20px 20px 50px 20px;font-size: 1.1vw">

                                        ${updateFlash}

                                        <div style="padding-left: 50px">

                                                <b>Username:</b>&nbsp;${profile.username}&nbsp;
                                                <c:if test="${sessionScope.userBean.role.equals('ADMIN')}">
                                                    <a data-toggle="modal" data-target="#model_username"><i  class="fa fa-pencil mystyle" aria-hidden="true"></i></a>
                                                </c:if>

                                                <hr>
                                                <c:if test="${sessionScope.userBean.role.equals('STU')}">
                                                    <b>Year:</b>&nbsp;${profile.year}&nbsp;

                                                    <hr>
                                                </c:if>
                                                <c:if test="${sessionScope.userBean.role.equals('LEC')}">
                                                    <b>Academic Rank:</b>&nbsp;${profile.rank}&nbsp;
                                                    <hr>
                                                </c:if>
                                                <b>NIC:</b>&nbsp;${profile.nic}&nbsp;
                                                <a data-toggle="modal" data-target="#model_nic"><i class="fa fa-pencil mystyle" aria-hidden="true"></i></a>
                                                <hr>
                                                <b>Home:</b>&nbsp;${profile.home}&nbsp;
                                                <a data-toggle="modal" data-target="#model_home"><i  class="fa fa-pencil mystyle" aria-hidden="true"></i></a>
                                                <hr>
                                                <b>Date of Birth:</b>&nbsp;${profile.dob}&nbsp;
                                                <a data-toggle="modal" data-target="#model_dob"><i  class="fa fa-pencil mystyle" aria-hidden="true"></i></a>
                                                <hr>
                                                <b>Gender:</b>&nbsp;
                                                    <c:if test="${profile.gender.equals('M')}">
                                                        Male
                                                    </c:if>
                                                <c:if test="${profile.gender.equals('F')}">
                                                        Female
                                                </c:if>
                                                &nbsp;
                                                <a data-toggle="modal" data-target="#model_gender"><i class="fa fa-pencil mystyle" aria-hidden="true"></i></a>
                                                <hr>
                                                <b>City:</b>&nbsp;${profile.city}&nbsp;
                                                <a data-toggle="modal" data-target="#model_city"><i class="fa fa-pencil mystyle" aria-hidden="true"></i></a>

                                            <hr>
                                            <a href="${pageContext.request.contextPath}/changepassword" style="color: blue;">
                                                <i class="fas fa-key" aria-hidden="true"></i>&nbsp;Change Password
                                            </a>
                                        </div>
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

<div style="height: 60px; color:aliceblue; background-color: darkcyan; width: 100%; display: flex;text-align: center;position: relative;bottom: 0">
    <span style="font-size: 15px;margin:auto ;display: inline-block">Student Management System.</span>
</div>
</body>
</html>
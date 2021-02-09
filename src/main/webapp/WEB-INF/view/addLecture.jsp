<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<sec:authentication var="principal" property="principal" />
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link href="http://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://kit.fontawesome.com/efc0135243.js" crossorigin="anonymous"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-image-upload/1.2.0/jQuery-image-upload.min.js" integrity="sha512-gjAPD4any3q9ITk7sa4tW8nnLnMWWoRUrghwbD92d5HfGBPEgry+n/6272BNZA/B5/kqD+3xnq7e5or2Jp5PEA==" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-image-upload/1.2.0/jQuery-image-upload.js" integrity="sha512-Km8iFrCs4rxJ/rO+YqAo/Hz+0lVs8qydavMtQg3/nzK4G70LPuGSyoIYOgpbOZLlFdmNpkxDQLMzaMeMhViFrQ==" crossorigin="anonymous"></script>


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
<body style="background-color:#d2cdff;min-height: 100%;height: 100%">
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
                <div  style="background-color:white;padding-bottom: 15px;margin: 10px 0 auto 5px;border-radius: 5px;">
                    <div>
                        <img src="<spring:url value='/resources/images/common/sidebar.png'/>" width="60%" style="display: block;padding-top: 5px;padding-bottom: 0;margin-left: auto;margin-right: auto;">
                    </div>
                    <div class="list-group" style="padding: 5px 20px 20px 20px;">
                        <a href="${pageContext.request.contextPath}/" class="list-group-item list-group-item-action" style="text-align: center;font-size: 1.3vw;padding: 5px">Home</a>
                        <c:if test="${sessionScope.userBean.role!=null}">
                            <a href="${pageContext.request.contextPath}/profile" class="list-group-item list-group-item-action" style="text-align: center;font-size: 1.3vw;padding: 5px">Profile</a>
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
                        <div class="list-group" style="overflow-x: hidden;overflow-y: auto; max-height:200px;padding: 5px 20px 20px 20px;">

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

                <div style="background-color:white;padding-bottom: 15px; margin: 10px -1.6vw 10px 5px;border-radius: 5px;">
                    <div class="panel panel-default" style="padding: 40px 80px 10px 80px">
                        <div class="panel-heading" style="display: flex;justify-content: center;align-items: center;">
                            <h4 class="panel-title">Add Study Material</h4>



                            <%--                                ${registrationFailed}--%>
                        </div>
                        <hr>
                        <div>
                            <c:if test="${error!=null}">
                                <h6 style="color: red"><c:out value="${error}"/></h6>
                            </c:if>
                            <form:form action="${pageContext.request.contextPath}/lecturer/savelecture" modelAttribute="lectureBean" method="post" enctype="multipart/form-data">
                                <div class="row">
                                    <div class="col-xs-6 col-sm-6 col-md-6">
                                        <div class="form-group">
                                            <label>Lecture Name:</label>
                                            <form:input type="text" path="lec" readonly="true" id="lecture" class="form-control" required="true" placeholder="lecture"/>
<%--                                            <form:errors path="lec" cssClass="error"/>--%>
                                        </div>
                                    </div>
                                    <div class="col-xs-6 col-sm-6 col-md-6">
                                        <div class="form-group">
                                            <label>Topic:</label>
                                            <form:input type="text" path="topic" id="topic" class="form-control" required="true" placeholder="topic"/>
<%--                                            <form:errors path="topic" cssClass="error"/>--%>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-xs-12 col-sm-12 col-md-12">
                                        <div class="form-group">
                                            <label>Description:</label>&nbsp;&nbsp;<p id="materials" style="display: inline;font-size: 13px; font-family: Bahnschrift" class="error"></p>
                                            <form:textarea rows="3" onkeyup="emailValidation(this.value)" type="textarea" path="des" name="des" id="des" class="form-control " placeholder=""/>
<%--                                            <form:errors path="des" cssClass="error"/>--%>

                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xs-12 col-sm-12 col-md-12">
                                        <div class="form-group" >
                                            <label>Materials:</label>
                                            <form:input type="file" accept=".xlsx,.xls,image/*,.doc,audio/*,.docx,video/*,.ppt,.pptx,.txt,.pdf" path="files" multiple="multiple" name="files" id="files" class="form-control"/>
<%--                                            <form:errors path="files" cssClass="error"/>--%>
                                            <form:input cssStyle="display: none" type="text" path="subjectID" id="subjectID" class="form-control" required="true" placeholder="subjectID"/>
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
<%--<div style="height: 60px; color:aliceblue; background-color: darkcyan; width: 100%; display: flex;text-align: center;position: relative;bottom: -10px">--%>
<%--    <span style="font-size: 15px;margin:auto ;display: inline-block">Student Management System.</span>--%>
<%--</div>--%>
</body>

</html>
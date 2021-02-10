<%@ page import="org.springframework.ui.Model" %>
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

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://kit.fontawesome.com/efc0135243.js" crossorigin="anonymous"></script>

    <style>


        a{
            cursor: pointer;
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

    <script src="<spring:url value='/resources/common.js'/>"></script>

    <title>${subjectID}</title>
</head>
<body style="background-color:#d2cdff;min-height: 100%;height: 100%">

<!-- Modal file add form -->
<div class="modal fade" id="model_email" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle">Add new lecture material</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div>
                    <form action="" id="add_attachment" enctype="multipart/form-data" method="post">
                        <div class="form-group">
                            <label>Lecture Material:</label>
                            <input type="file" accept=".xlsx,.xls,image/*,.doc,audio/*,.docx,video/*,.ppt,.pptx,.txt,.pdf" multiple="multiple" name="files" id="files" class="form-control"/>
                        </div>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                            <button type="submit" class="btn btn-primary">Add</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<%--End of Model Email--%>

<!-- Modal -->
<div class="modal fade" id="delete_lec" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="delete_lec_title">Confirm</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                Are you sure you want to delete this lecture?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <a id="delete_url" href="" type="button" class="btn btn-danger">Delete</a>
            </div>
        </div>
    </div>
</div>
<!-- Modal -->
<div class="modal fade" id="delete_file" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="delete_file_title">Confirm</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                Are you sure you want to delete this attachment?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <a id="delete_file_action" href="" type="button" class="btn btn-danger">Delete</a>
            </div>
        </div>
    </div>
</div>

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
                <c:if test="${!sessionScope.userBean.role.equals('ADMIN') && sessionScope.userBean.role!=null && sessionScope.userBean.subjects.size()!=0}">
                    <div style="background-color:white;padding-bottom: 15px;margin: 10px 0 auto 5px;border-radius: 5px;">
                        <div>
                            <h6 style="padding: 10px 5px 5px 20px">Subjects</h6>
                        </div>
                        <div class="list-group" style="padding: 5px 20px 20px 20px;overflow-x: hidden;overflow-y: auto; max-height:200px">

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
                <div style="background-color:white;height: 65px; margin: 10px -1.6vw 10px 5px;;border-radius: 5px;display: flex;justify-content: center;align-items: center;">
                    <h3 >${name} (${subjectID})</h3>
                </div>

                <div style="background-color:white;padding-bottom: 30px; margin: 10px -1.6vw 10px 5px;border-radius: 5px;">
                   <div>
                       <h4 style="padding:20px 20px 10px 20px;display: inline-block">Study Materials</h4>
                       <c:if test="${delete!=null}">
                           <h6 style="color: red;padding-left: 20px"><c:out value="${delete}"/></h6>
                       </c:if>

                       <c:if test="${sessionScope.userBean.role.equals('LEC')}">
                           <a href="${pageContext.request.contextPath}/lecturer/addLecture/${subjectID}/${lecN}"><button class="btn btn-dark" style="display: inline-block;float: right;border-color: #f1f1f1;margin: 15px 20px auto auto">Add New</button></a>
                       </c:if>
                   </div>
                    <hr>

                    <c:if test="${lecture.size()==0}">
                        <div style="display: flex;justify-content: center">
                            <h6>You don't have any study materials...</h6>
                        </div>
                    </c:if>

                    <c:if test="${lecture!=null}">

                        <c:forEach items="${lecture}" var="lec">
                            <div class="card" style="margin:10px 10px 40px 10px;padding: 20px ">
                                <div class="card-header" style="padding-bottom: 0">
                                    <div style="display: inline-block">
                                        <i class="fas fa-book fa-3x"></i>
                                    </div>

                                    <div  style="display: inline-block;margin-left: 20px;padding-top: 5px">
                                        <div style="display: inline">
                                            <h4>${lec.topic}</h4>
                                            <address><strong>${lec.lec}</strong><time style="font-size: small">&nbsp;&nbsp;(${lec.creationDate})</time></address>
                                        </div>
                                    </div>
                                    <c:if test="${sessionScope.userBean.role.equals('LEC')}">
                                        <div style="display: inline-block;float: right; margin-right: 5px ">
                                            <a href="#" ><i class="far fa-edit"></i>Edit</a>
                                        </div>
                                    </c:if>
                                </div>
                                <div class="card-body">
                                    <div style="background-color: gainsboro;border:silver solid medium ; border-radius: 10px;margin-bottom: 25px;padding: 10px 30px 10px 30px" >
                                <span style="font-family: 'Calibri';font-size: 20px">
                                        ${lec.des}
                                </span>
                                    </div>
                                    <div style="border:silver solid medium ; border-radius: 10px;margin-bottom: 25px;padding: 10px 30px 10px 30px">

                                        <c:forEach items="${lec.materials}" var="material">

                                            <c:if test="${(material.fileName.substring(material.fileName.lastIndexOf('.')+1).equals('pdf'))}">

                                            </c:if>


                                            <div style="padding: 7px 20px 10px 40px">
                                                <a href="${pageContext.request.contextPath}/download/${material.fID}/${subjectID}?name=${material.fileName}" style="color: black;font-size: 17px">

<%--                                                    <c:if test="${(material.fileName.substring(material.fileName.lastIndexOf('.')+1).equals('pdf'))}">--%>
<%--                                                        <i style="color: red;font-size: 1.4em" class="fas fa-file-pdf"></i>--%>
<%--                                                    </c:if>--%>
<%--                                                    <c:if test="${(material.fileName.substring(material.fileName.lastIndexOf('.')+1).equals('doc'))}">--%>
<%--                                                        <i style="color: blue;font-size: 1.4em" class="fas fa-file-word"></i>--%>
<%--                                                    </c:if>--%>
<%--                                                    <c:if test="${(material.fileName.substring(material.fileName.lastIndexOf('.')+1).equals('docx'))}">--%>
<%--                                                    <i style="color: blue;font-size: 1.4em" class="fas fa-file-word"></i>--%>
<%--                                                    </c:if>--%>
<%--                                                    <c:if test="${(material.fileName.substring(material.fileName.lastIndexOf('.')+1).equals('docx'))}">--%>
<%--                                                        <i style="color: blue;font-size: 1.4em" class="fas fa-file-word"></i>--%>
<%--                                                    </c:if>--%>

                                                    <c:choose>
                                                        <c:when test="${(material.fileName.substring(material.fileName.lastIndexOf('.')+1).equalsIgnoreCase('pdf'))}">
                                                            <i style="color: red;font-size: 1.4em" class="fas fa-file-pdf"></i>
                                                        </c:when>
                                                        <c:when test="${(material.fileName.substring(material.fileName.lastIndexOf('.')+1).equalsIgnoreCase('doc'))}">
                                                            <i style="color: blue;font-size: 1.4em" class="fas fa-file-word"></i>
                                                        </c:when>
                                                        <c:when test="${(material.fileName.substring(material.fileName.lastIndexOf('.')+1).equalsIgnoreCase('docx'))}">
                                                            <i style="color: blue;font-size: 1.4em" class="fas fa-file-word"></i>
                                                        </c:when>
                                                        <c:when test="${(material.fileName.substring(material.fileName.lastIndexOf('.')+1).equalsIgnoreCase('dotx'))}">
                                                            <i style="color: blue;font-size: 1.4em" class="fas fa-file-word"></i>
                                                        </c:when>
                                                        <c:when test="${(material.fileName.substring(material.fileName.lastIndexOf('.')+1).equalsIgnoreCase('jpg'))}">
                                                            <i style="color: darkorange;font-size: 1.4em" class="fas fa-image"></i>
                                                        </c:when>
                                                        <c:when test="${(material.fileName.substring(material.fileName.lastIndexOf('.')+1).equalsIgnoreCase('png'))}">
                                                            <i style="color: darkorange;font-size: 1.4em" class="fas fa-image"></i>
                                                        </c:when>
                                                        <c:when test="${(material.fileName.substring(material.fileName.lastIndexOf('.')+1).equalsIgnoreCase('jpeg'))}">
                                                            <i style="color: darkorange;font-size: 1.4em" class="fas fa-image"></i>
                                                        </c:when>
                                                        <c:when test="${(material.fileName.substring(material.fileName.lastIndexOf('.')+1).equalsIgnoreCase('xls'))}">
                                                            <i style="color: #3e8e41;font-size: 1.4em" class="fas fa-file-excel"></i>
                                                        </c:when>
                                                        <c:when test="${(material.fileName.substring(material.fileName.lastIndexOf('.')+1).equalsIgnoreCase('txt'))}">
                                                            <i style="color: darkturquoise;font-size: 1.4em" class="far fa-file-alt">"></i>
                                                        </c:when>
                                                        <c:when test="${(material.fileName.substring(material.fileName.lastIndexOf('.')+1).equalsIgnoreCase('ppt'))}">
                                                            <i style="color: goldenrod;font-size: 1.4em" class="fas fa-file-powerpoint"></i>
                                                        </c:when>
                                                        <c:when test="${(material.fileName.substring(material.fileName.lastIndexOf('.')+1).equalsIgnoreCase('pptx'))}">
                                                            <i style="color: goldenrod;font-size: 1.4em" class="fas fa-file-powerpoint"></i>
                                                        </c:when>
                                                        <c:when test="${(material.fileName.substring(material.fileName.lastIndexOf('.')+1).equalsIgnoreCase('xlsx'))}">
                                                            <i style="color: #3e8e41;font-size: 1.4em" class="fas fa-file-excel"></i>
                                                        </c:when>
                                                        <c:otherwise>

                                                            <i style="color: dimgrey;font-size: 1.4em" class="fas fa-file-download"></i>

                                                        </c:otherwise>
                                                    </c:choose>

                                                    &nbsp;&nbsp;${material.fileName}
                                                </a>
                                                &nbsp;&nbsp;  <c:if test="${sessionScope.userBean.role.equals('LEC')}">
                                                        <a href="" data-toggle="modal" onclick="setUrl_file('${pageContext.request.contextPath}/lecturer/deleteAttachment/${material.fID}/${subjectID}')" data-target="#delete_file" ><i class="fa fa-trash-o" aria-hidden="true"></i></a>
                                                    </c:if>
                                            </div>
                                        </c:forEach>

                                        <c:if test="${sessionScope.userBean.role.equals('LEC')}">
                                            <div style="padding: 7px 20px 10px 40px">
                                                <a data-toggle="modal" data-target="#model_email"><i class="far fa-plus-square fa-1x"></i> Add new</a>
                                            </div>
                                        </c:if>

                                    </div>
                                    <div style="border:silver solid medium ; border-radius: 10px;margin-bottom: 25px;padding: 10px 30px 10px 30px">
                                        <div style="padding: 7px 20px 10px 40px">
                                            <a href="#" style="font-size: 17px"><i class="fas fa-tasks"></i>&nbsp;&nbsp;<strong>Assignment 1</strong></a>
                                        </div>
                                        <div style="padding: 7px 20px 10px 40px">
                                            <a href="#" style="font-size: 17px"><i class="fas fa-tasks"></i>&nbsp;&nbsp;<strong>Assignment 2</strong></a>
                                        </div>

                                        <c:if test="${sessionScope.userBean.role.equals('LEC')}">
                                            <div style="padding: 7px 20px 10px 40px">
                                                <a data-toggle="modal" data-target="#model_email"><i class="far fa-plus-square fa-1x"></i> Add new</a>
                                            </div>
                                        </c:if>
                                    </div>
                                </div>

                                <c:if test="${sessionScope.userBean.role.equals('LEC')}">
                                    <div style="text-align: end;padding-right: 20px"><a href="" data-toggle="modal" onclick="setUrl('${pageContext.request.contextPath}/lecturer/deletelecture/${lec.mID}/${subjectID}');" data-target="#delete_lec"  >Delete &nbsp;<i class="fa fa-trash-o" aria-hidden="true"></i></a></div>

                                </c:if>


                            </div>
                        </c:forEach>
                    </c:if>


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
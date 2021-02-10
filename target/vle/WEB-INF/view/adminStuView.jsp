<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page session="true" %>

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
    <title>Admin | Students</title>
</head>
<body style="background-color:#d2cdff;min-height: available;height: available">

<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle">Confirm</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                Are you sure you want to delete this user?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <a id="delete_url" href="" type="button" class="btn btn-danger">Delete</a>
            </div>
        </div>
    </div>
</div>

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
            <div class="col-md-2 position-fixed" style="padding-left: 5px" >
                <div style="background-color:white;padding-bottom: 30px;margin: 10px 0 auto 10px;border-radius: 5px;">
                    <div>
                        <img src="<spring:url value='/resources/images/common/sidebar.png'/>" width="60%" style="display: block;padding-top: 5px;padding-bottom: 0;margin-left: auto;margin-right: auto;">
                    </div>
                    <div class="list-group" style="padding: 5px 20px 20px 20px;">
                        <a href="${pageContext.request.contextPath}/" class="list-group-item list-group-item-action" style="text-align: center;font-size: 1.3vw;padding: 5px">Home</a>
                        <a href="${pageContext.request.contextPath}/profile" class="list-group-item list-group-item-action" style="text-align: center;font-size: 1.3vw;padding: 5px">Profile</a>
                        <a href="${pageContext.request.contextPath}/admin/adminLecView" class="list-group-item list-group-item-action" style="text-align: center;font-size: 1.3vw;padding: 5px">Lecturers</a>
                        <a href="${pageContext.request.contextPath}/admin/adminStuView" class="list-group-item-secondary list-group-item-action" style="text-align: center;font-size: 1.3vw;padding: 5px">Students</a>
                        <a href="${pageContext.request.contextPath}/admin/adminSubView" class="list-group-item list-group-item-action" style="text-align: center;font-size: 1.3vw;padding: 5px">Subjects</a>
                        <a href="${pageContext.request.contextPath}/about" class="list-group-item list-group-item-action" style="text-align: center;font-size: 1.3vw;padding: 5px">About</a>
                        <a href="${pageContext.request.contextPath}/contact" class="list-group-item list-group-item-action" style="text-align: center;font-size: 1.3vw;padding: 5px">Contact</a>
                    </div>
                    <%--               <div style=" text-align: justify-all; padding: 20px;font-size: 14px">--%>
                    <%--                   The University of Colombo School of Computing is a higher educational institute affiliated to the University of Colombo in Sri Lanka Providing Computer Science, Information Systems and Information and Communication Technology education.--%>
                    <%--               </div>--%>
                </div>
            </div>
            <div class="col-md-10" style="margin-left:17vw">
                <div style="border-color: darkslategray;background-color:white;height: 60px; margin: 10px 15px 10px -1vw;border-radius: 5px;display: flex;justify-content: center;align-items: center;">
                    <h3 >Registered Students (Admin Dashboard)</h3>
                </div>

                <div style="position: sticky;top:5vw;background-color:darkgrey; margin: 10px 15px 10px -1vw;border-radius: 5px">
                    <!-- Search form -->
                    <div  style="margin: 0 20px;padding-top: 10px;padding-bottom: 10px;display: flex;justify-content: center">
                        <input onkeyup="searchFun()" id="myInput" style="display: inline-block;width: 40%;margin:auto auto auto 5px;border-color: darkslategray" class="form-control" type="text" placeholder="Search" aria-label="Search">
                        <a href="${pageContext.request.contextPath}/admin/pdf_stu" class="btn btn-dark" style="display: inline-block;float: right;margin-right: 7px;border-color: #f1f1f1">Download</a>
                        <a href="addStudent"><button class="btn btn-dark" style="display: inline-block;float: right;border-color: #f1f1f1">Add Student</button></a>
                    </div>

                </div>
                ${deleted}
                ${download}

                    <div class="table-responsive" style="background-color:white;margin: 10px 50px 10px -1vw;border-radius: 5px;padding:0 5px 5px 5px">
                            <table class="table table-striped" style="margin: auto auto">

                                    <thead>
                                    <tr style="">
                                        <th>Student_ID</th>
                                        <th>Firstname</th>
                                        <th>Lastname</th>
                                        <th>Email</th>
                                        <th>Mobile</th>
                                        <th>Land line</th>
                                        <th>NIC</th>
                                        <th>Birthday</th>
                                        <th>Gender</th>
                                        <th>Year</th>
                                        <th>Action</th>
                                    </tr>
                                    </thead >
                                <tbody id="myTable">
                                <c:forEach var="stu" items="${stu_list}">
                                    <tr>
                                        <td>${stu.username}</td>
                                        <td>${stu.fName}</td>
                                        <td>${stu.lName}</td>
                                        <td>${stu.email}</td>
                                        <td>${stu.mobile}</td>
                                        <td>${stu.home}</td>
                                        <td>${stu.NIC}</td>
                                        <td>${stu.dob}</td>
                                        <td style="text-align: center">${stu.gender}</td>
                                        <td>${stu.sYear}</td>

                                        <td>
                                            <a href="updatestudentform/${stu.username}" ><i class="fa fa-pencil" aria-hidden="true"></i></a>
                                            &nbsp;&nbsp;&nbsp;<a href="" data-toggle="modal" onclick="setUrl('deleteUser/${stu.username}')" data-target="#exampleModalCenter" ><i class="fa fa-trash-o" aria-hidden="true"></i></a>
                                        </td>
                                    </tr>
                                </c:forEach>

                                </tbody>
                            </table>
                    </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
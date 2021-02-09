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
    <title>Admin | AddStudent</title>
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
                        <img src="<spring:url value='/resources/images/common/sidebar.png'/>" width="60%" style="display: block;padding-top: 40px;padding-bottom: 10px;margin-left: auto;margin-right: auto;">
                    </div>
                    <div class="list-group" style="padding: 20px;">
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
            <div class="col-md-10" >

                <div class="row centered-form">
                    <div class="col-md-12">
                        <div class="panel panel-default" style="padding: 40px 80px 60px 80px">
                            <div class="panel-heading" style="display: flex;justify-content: center;align-items: center;">
                                <h4 class="panel-title">Student Registration</h4>



<%--                                ${registrationFailed}--%>
                            </div>
                            <hr>
                            <div>
                                <c:if test="${registrationFailed!=null}">
                                    <h6 style="color: red"><c:out value="${registrationFailed}"/></h6>
                                </c:if>
                                <form:form action="saveStudent" modelAttribute="student" method="post" onsubmit="return (emailValidation(this.email) && mobileValidation(this.phone) && homeValidation(this.home) && nicValidation(this.nic));">
                                    <div class="row">
                                        <div class="col-xs-6 col-sm-6 col-md-6">
                                            <div class="form-group">
                                                <label>First name:</label>
                                                <form:input type="text" path="fName" id="first_name" class="form-control" required="true" placeholder="First Name"/>
                                                <form:errors path="fName" cssClass="error"/>
                                            </div>
                                        </div>
                                        <div class="col-xs-6 col-sm-6 col-md-6">
                                            <div class="form-group">
                                                <label>Last name:</label>
                                                <form:input type="text" path="lName" id="last_name" class="form-control" required="true" placeholder="Last Name"/>
                                                <form:errors path="lName" cssClass="error"/>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-xs-6 col-sm-6 col-md-6">
                                            <div class="form-group">
                                                <label>Email:</label>&nbsp;&nbsp;<p id="email_e" style="display: inline;font-size: 13px; font-family: Bahnschrift" class="error"></p>
                                                <form:input onkeyup="emailValidation(this.value)" required="true" type="email" path="email" name="email" id="email" class="form-control " placeholder="akila@gmail.com"/>
                                                <form:errors path="email" cssClass="error"/>

                                            </div>
                                        </div>
                                        <div class="col-xs-6 col-sm-6 col-md-6">
                                            <div class="form-group">
                                                <label>Phone number:</label>&nbsp;&nbsp;<p id="mobile_e" style="display: inline;font-size: 13px; font-family: Bahnschrift" class="error"></p>
                                                <form:input type="text" onkeyup="mobileValidation(this.value)" path="mobile" maxlength="10" required="true" name="phone" id="phone" class="form-control " placeholder="0771234567"/>
                                                <form:errors path="mobile" cssClass="error"/>

                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-xs-6 col-sm-6 col-md-6">
                                            <div class="form-group">
                                                <label>Land line:</label>&nbsp;&nbsp;<p id="home_e" style="display: inline;font-size: 13px; font-family: Bahnschrift" class="error"></p>
                                                <form:input type="text" onkeyup="homeValidation(this.value)" maxlength="10" required="true" path="home" name="home" id="home" class="form-control" placeholder="0471234567"/>
                                                <form:errors path="home" cssClass="error"/>
                                            </div>
                                        </div>
                                        <div class="col-xs-6 col-sm-6 col-md-6">
                                            <div class="form-group">
                                                <label>City:</label>
                                                <form:input type="text" path="city" required="true" name="city" id="city" class="form-control" placeholder="Beliatta"/>
                                                <form:errors path="city" cssClass="error"/>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-xs-3 col-sm-3 col-md-3">
                                            <div class="form-group">
                                                <label>NIC:</label>&nbsp;&nbsp;<p id="nic_e" style="display: inline;font-size: 13px; font-family: Bahnschrift" class="error"></p>
                                                <form:input type="text" onkeyup="nicValidation(this.value)" maxlength="10" required="true" path="NIC" name="nic" id="nic" class="form-control " placeholder="976452413V"/>
                                                <form:errors path="NIC" cssClass="error"/>
                                            </div>
                                        </div>
                                        <div class="col-xs-3 col-sm-3 col-md-3">
                                            <div class="form-group">
                                                <label>Date of Birth:</label>
                                                <form:input type="Date" required="true" path="dob" name="dob" id="dob" class="form-control " placeholder="19-Jan-1997"/>
                                                <form:errors path="dob" cssClass="error"/>
                                            </div>
                                        </div>
                                        <div class="col-xs-3 col-sm-3 col-md-3">
                                            <div class="form-group">
                                                <label>Gender:</label>
                                                <form:select path="gender" class="form-control" id="gender">
                                                    <form:option value="M" label="Male"/>
                                                    <form:option value="F" label="Female"/>
                                                </form:select>
                                            </div>
                                        </div>
                                        <div class="col-xs-3 col-sm-3 col-md-3">
                                            <div class="form-group">
                                                <label>Year:</label>
                                                <form:select path="sYear" class="form-control" id="sYear">
                                                    <form:option value="1st" label="1st Year"/>
                                                    <form:option value="2nd" label="2nd Year"/>
                                                    <form:option value="3rd" label="3rd Year"/>
                                                    <form:option value="4th" label="4th Year"/>
                                                </form:select>
                                            </div>
                                        </div>
                                    </div><hr>

                                    <div style="display: flex;justify-content: center">
                                        <input type="submit" value="Register" class="btn btn-primary " style="display: inline-block;width: 8vw;margin-right: 5px" />
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
    <%--<div class="row" style="float: bottom">--%>
    <%--    <div style="height: 60px; color:aliceblue; background-color: darkcyan; width: 100%; display: flex;text-align: center; ">--%>
    <%--        <span style="font-size: 15px;margin:auto ;display: inline-block">Student Management System.</span>--%>
    <%--    </div>--%>
    <%--</div>--%>
</div>
<%--<div style="height: 60px; color:aliceblue; background-color: darkcyan; width: 100%; display: flex;text-align: center;position: relative;bottom: 0">--%>
<%--    <span style="font-size: 15px;margin:auto ;display: inline-block">Student Management System.</span>--%>
<%--</div>--%>

</body>
</html>
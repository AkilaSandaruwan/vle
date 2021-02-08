package com.akila.vle.bean;



import org.omg.CORBA.PRIVATE_MEMBER;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.lang.NonNull;
import org.springframework.stereotype.Component;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.Date;
import java.util.List;

@Component
public class StudentBean {

    @Size(min=1,message="first name is required.")
    private String fName;
    @Size(min=1,message="last name is required.")
    private String lName;
    @Size(min=1,message="email is not valid.")
    @NotNull(message = "email is required.")
    private String email;
    @NotNull(message = "mobile is required.")
    @Size(max = 10,min = 10,message="enter valid mobile number.")
    private String mobile;
    @NotNull(message = "home is required.")
    @Size(max = 10,min = 10,message="enter valid telephone number.")
    private String home;
    @NotNull(message = "city is required.")
    @Size(min=1,message="enter valid nic")
    private String NIC;
    private String sYear;
    @NotNull(message = "dob is required.")
    private String dob;
    private String username;
    @NotNull
    private String gender;
    @NotNull(message = "city is required.")
    @Size(min=4,message="enter valid city.")
    private String city;
    private int status=1;
    private List<String> subjects;

    public List<String> getSubjects() {
        return subjects;
    }

    public void setSubjects(List<String> subjects) {
        this.subjects = subjects;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getUsername() {
        return username;
    }
    public void setUsername(String username) {
        this.username = username;
    }
    public String getHome() {
        return home;
    }
    public void setHome(String home) {
        this.home = home;
    }
    public String getfName() {
        return fName;
    }
    public void setfName(String fName) {
        this.fName = fName;
    }
    public String getlName() {
        return lName;
    }
    public void setlName(String lName) {
        this.lName = lName;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public String getMobile() {
        return mobile;
    }
    public void setMobile(String mobile) {
        this.mobile = mobile;
    }
    public String getNIC() {
        return NIC;
    }
    public void setNIC(String NIC) {
        this.NIC = NIC;
    }
    public String getsYear() {
        return sYear;
    }
    public void setsYear(String sYear) {
        this.sYear = sYear;
    }
    public String getDob() {
        return dob;
    }
    public void setDob(String dob) {
        this.dob = dob;
    }
    public String getGender() {
        return gender;
    }
    public void setGender(String gender) {
        this.gender = gender;
    }
    public String getCity() {
        return city;
    }
    public void setCity(String city) {
        this.city = city;
    }


}

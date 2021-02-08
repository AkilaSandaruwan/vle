package com.akila.vle.service;

import com.akila.vle.bean.LecturerBean;
import com.akila.vle.bean.StudentBean;
import com.akila.vle.bean.SubjectBean;
import com.akila.vle.bean.UserBean;
import com.akila.vle.dao.AdminDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.ParseException;
import java.util.List;

@Service("adminStuManage")
public class AdminManageImp implements AdminManage {

    @Autowired
    AdminDao adminDao;

    //Student
    public int saveStudent(StudentBean studentBean) throws NoSuchAlgorithmException, ParseException, IOException {
        return adminDao.saveStudent(studentBean);
    }
    public int updateStudent(StudentBean studentBean){
        return adminDao.updateStudent(studentBean);
    }
    public int deleteUser(String username){
        return adminDao.deleteUser(username);
    }
    public List<StudentBean> getAllStudents(){
        return adminDao.getAllStudents();
    }
    public StudentBean getStudentById(String username){
        return adminDao.getStudentById(username);
    }

    //Lecturer
    public int saveLecturer(LecturerBean lecturerBean) throws NoSuchAlgorithmException, ParseException {
        return adminDao.saveLecturer(lecturerBean);
    }
    public List<LecturerBean> getAllLecturers(){
        return adminDao.getAllLecturers();
    }
    public LecturerBean getLecturerById(String username){
        return adminDao.getLecturerById(username);
    }
    public int updateLecturer(LecturerBean lecturerBean){
        return adminDao.updateLecturer(lecturerBean);
    }


    public UserBean getUserById(String username){
        return adminDao.getUserById(username);
    }

    //Subject
    public List<SubjectBean> getAllSubjects(){
        return adminDao.getAllSubjects();
    }
    public int saveSubject(SubjectBean subjectBean){
        return adminDao.saveSubject(subjectBean);
    }
    public  SubjectBean getSubjectById(String subjectID){
        return adminDao.getSubjectById(subjectID);
    }
    public int updateSubject(SubjectBean subjectBean,String subject_ID){
        return adminDao.updateSubject(subjectBean,subject_ID);
    }
    public int deleteSubject(String subjectId){
        return adminDao.deleteSubject(subjectId);
    }

}

package com.akila.vle.service;

import com.akila.vle.bean.LecturerBean;
import com.akila.vle.bean.StudentBean;
import com.akila.vle.bean.SubjectBean;
import com.akila.vle.bean.UserBean;
import com.akila.vle.dao.AdminDao;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.text.ParseException;
import java.util.List;

public interface AdminManage {

    //Student
    public int saveStudent(StudentBean studentBean) throws NoSuchAlgorithmException, ParseException, IOException;
    public int updateStudent(StudentBean studentBean);
    public List<StudentBean> getAllStudents();
    public StudentBean getStudentById(String username);
    public int deleteUser(String username);

    //Lecturer
    public int saveLecturer(LecturerBean lecturerBean) throws NoSuchAlgorithmException, ParseException;
    public List<LecturerBean> getAllLecturers();
    public LecturerBean getLecturerById(String username);
    public int updateLecturer(LecturerBean lecturerBean);

    public UserBean getUserById(String username);

    //Subject
    public List<SubjectBean> getAllSubjects();
    public int saveSubject(SubjectBean subjectBean);

    SubjectBean getSubjectById(String subjectID);

    int updateSubject(SubjectBean subjectBean,String subject_ID);

    int deleteSubject(String subjectID);
}



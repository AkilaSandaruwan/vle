package com.akila.vle.dao;

import com.akila.vle.bean.LecturerBean;
import com.akila.vle.bean.StudentBean;
import com.akila.vle.bean.SubjectBean;
import com.akila.vle.bean.UserBean;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.text.ParseException;
import java.util.List;

public interface AdminDao {

    //student
    public int saveStudent(StudentBean studentBean) throws NoSuchAlgorithmException, ParseException, IOException;
    public int updateStudent(StudentBean studentBean);
    public List<StudentBean> getAllStudents();
    public StudentBean getStudentById(String username);
    public int deleteUser(String username);

    //lecturer
    public int saveLecturer(LecturerBean lecturerBean) throws NoSuchAlgorithmException, ParseException;
    public List<LecturerBean> getAllLecturers();
    public LecturerBean getLecturerById(String username);
    public int updateLecturer(LecturerBean lecturerBean);

    public UserBean getUserById(String username);

    //Subjects
    public List<SubjectBean> getAllSubjects();
    public int saveSubject(SubjectBean subjectBean);

    SubjectBean getSubjectById(String subjectID);

    public int updateSubject(SubjectBean subjectBean,String subjectID);

    int deleteSubject(String subjectId);
}

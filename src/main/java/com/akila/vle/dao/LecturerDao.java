package com.akila.vle.dao;

import com.akila.vle.bean.LectureBean;

import java.util.List;

public interface LecturerDao {

    public int[][] saveLecture(LectureBean lectureBean);
    public List<LectureBean> getAllStudyMaterials(String subjectID);
}

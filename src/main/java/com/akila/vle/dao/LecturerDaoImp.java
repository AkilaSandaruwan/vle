package com.akila.vle.dao;

import com.akila.vle.bean.LectureBean;
import com.akila.vle.bean.LecturerBean;
import com.akila.vle.bean.StudyMaterial;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ParameterizedPreparedStatementSetter;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import java.io.File;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

@Repository("lecturerDao")
public class LecturerDaoImp implements LecturerDao{

    //JDBC Template
    private JdbcTemplate template;
    public void setTemplate(JdbcTemplate template) {
        this.template = template;
    }

    //Save Lecture
    public int[][] saveLecture(LectureBean lectureBean){

        try{
            String sql_studyMaterial="INSERT INTO studymaterial(lec, topic, des, subjectID) values(?,?,?,?)";
            String sql_file="INSERT INTO lecturefiles(name, file, mID) values(?,?,(SELECT mID FROM studymaterial WHERE lec='"+lectureBean.getLec().trim().substring(0,1).toUpperCase(Locale.ROOT)+lectureBean.getLec().trim().substring(1).toLowerCase(Locale.ROOT)+"' GROUP BY lec))";
            int[][] updateCounts = new int[0][];

            //File encoding and setting file name
            List<StudyMaterial> files = new ArrayList<StudyMaterial>();
            for (CommonsMultipartFile file: lectureBean.getFiles()){

                byte[] fileContent = file.getBytes();
                String encodedFile = Base64.getEncoder().encodeToString(fileContent);

                StudyMaterial studyMaterial = new StudyMaterial();
                studyMaterial.setFileName(file.getOriginalFilename());
                studyMaterial.setEncodedFile(encodedFile);
                files.add(studyMaterial);
            }

            int material = template.update(sql_studyMaterial,
                    lectureBean.getLec().trim().substring(0,1).toUpperCase(Locale.ROOT)+lectureBean.getLec().trim().substring(1).toLowerCase(Locale.ROOT),
                    lectureBean.getTopic().trim().substring(0,1).toUpperCase(Locale.ROOT)+lectureBean.getTopic().trim().substring(1).toLowerCase(Locale.ROOT),
                    lectureBean.getDes().trim(),
                    lectureBean.getSubjectID());

            if (material>=1 && lectureBean.getFiles().get(0).getSize()>0){
                updateCounts = template.batchUpdate(sql_file,files, files.size(), new ParameterizedPreparedStatementSetter<StudyMaterial>(){

                    @Override
                    public void setValues(PreparedStatement preparedStatement, StudyMaterial studyMaterial) throws SQLException {
                        preparedStatement.setString(1,studyMaterial.getFileName());
                        preparedStatement.setString(2,studyMaterial.getEncodedFile());
                    }
                });
            }
            return updateCounts;
        }catch (Exception exception){
            System.out.println(exception);
            return null;

        }
    }

    @Override
    public List<LectureBean> getAllStudyMaterials(String subjectID) {

        try{
            String get_material_sql= "SELECT lec, topic, des, CreationDate,mID  FROM studymaterial WHERE  subjectID='"+subjectID+"' ORDER BY lec";
            String get_files_sql= "SELECT name, fID FROM lecturefiles WHERE  mID=?";

            return template.query(get_material_sql,new RowMapper<LectureBean>(){
                public LectureBean mapRow(ResultSet rs, int row) throws SQLException, SQLException {
                    LectureBean e=new LectureBean();
                    e.setLec(rs.getString("lec"));
                    e.setTopic(rs.getString("topic"));
                    e.setDes(rs.getString("des"));
                    e.setCreationDate(rs.getString("CreationDate"));
                    e.setmID(rs.getInt("mID"));

                    List<StudyMaterial> files = template.query(get_files_sql,new Object[]{e.getmID()}, new RowMapper<StudyMaterial>(){
                        public StudyMaterial mapRow(ResultSet rs, int row) throws SQLException, SQLException {
                            StudyMaterial studyMaterial = new StudyMaterial();
                            studyMaterial.setfID(rs.getInt("fID"));
                            studyMaterial.setFileName(rs.getString("name"));
                            System.out.println(studyMaterial.getFileName());
                            return studyMaterial;
                        }
                    });
                    e.setMaterials(files);
                    return e;
                }
            });
        }catch (Exception exception){
            System.out.println(exception);
            return null;
        }

    }

    @Override
    public int deleteLecture(int mID) {
        String sql = "DELETE FROM studymaterial WHERE mID=?";

        try{
            return template.update(sql,mID);
        }catch (Exception exception){
            System.out.println(exception);
            return 0;
        }

    }

    @Override
    public int deleteAttachment(int fID) {
        String sql = "DELETE FROM lecturefiles WHERE fID=?";

        try{
            return template.update(sql,fID);
        }catch (Exception exception){
            System.out.println(exception);
            return 0;
        }
    }


}

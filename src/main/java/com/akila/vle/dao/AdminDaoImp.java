package com.akila.vle.dao;

import com.akila.vle.bean.LecturerBean;
import com.akila.vle.bean.StudentBean;
import com.akila.vle.bean.SubjectBean;
import com.akila.vle.bean.UserBean;
import com.akila.vle.service.AdminManage;
import com.akila.vle.service.AdminManageImp;
import com.akila.vle.service.MyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;


import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLDataException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Year;
import java.util.*;

@Repository("adminDao")
public class AdminDaoImp implements AdminDao{

    //JDBC Template
    private JdbcTemplate template;
    public void setTemplate(JdbcTemplate template) {
        this.template = template;
    }


    //*****************************FOR LECTURER START************************************

    //Insert Lecturer
    public int saveLecturer(LecturerBean lecturerBean) throws NoSuchAlgorithmException, ParseException {

        String profilePic;
        int register=0;
        if (lecturerBean.getGender().equals("M")){
            profilePic="malePic.jpg";
        }else{
            profilePic="femalePic.jpg";
        }

        try {
            String lastUserSQL="SELECT username FROM lastuser WHERE  year='lec'";

            String fName=lecturerBean.getfName().trim().substring(0,1).toUpperCase()+lecturerBean.getfName().trim().substring(1).toLowerCase(Locale.ROOT);
            String lName=lecturerBean.getlName().trim().substring(0,1).toUpperCase(Locale.ROOT)+lecturerBean.getlName().trim().substring(1).toLowerCase(Locale.ROOT);
            String email=lecturerBean.getEmail().trim().toLowerCase(Locale.ROOT);
            String mobile=lecturerBean.getMobile().trim();
            String home=lecturerBean.getHome().trim();
            String NIC=lecturerBean.getNIC().trim().toUpperCase(Locale.ROOT);
            String rank = lecturerBean.getRank();
            String dob = lecturerBean.getDob();
            String gender=lecturerBean.getGender();
            String city=lecturerBean.getCity().trim().substring(0,1).toUpperCase(Locale.ROOT)+lecturerBean.getCity().trim().substring(1).toLowerCase(Locale.ROOT);
            int status=lecturerBean.getStatus();
            String username;
            String role="LEC";

            String lastUserID=template.queryForObject(lastUserSQL, String.class);

            if (lastUserID!=null){
                username="LEC"+(Integer.parseInt(lastUserID.substring(3))+1);
            }else {
                username="LEC100";
            }

            System.out.println("Username: "+username);

            String hashCode= MyService.hashPassword(username);





            String sql="INSERT INTO user(fName, lName, email, mobile, home, username, NIC, rank, dob, gender, city, password, profilePic,status,role) " +
                    "VALUES('"+fName+"','"+lName+"','"+email+"','"+mobile+
                    "','"+home+"','"+username+"','"+NIC+"','"+rank+
                    "','"+dob+"','"+gender+"','"+city+"','"+hashCode+"','"+profilePic+"',"+status+",'"+role+"')";

            return template.update(sql);
        }
        catch (DataAccessException | NullPointerException | StringIndexOutOfBoundsException e){
            System.out.println("Registration Error: "+e);
            return 0;
        }

    }

    //Get ALL the Lecturers
    @Override
    public List<LecturerBean> getAllLecturers() {

        String all_lecSQL="SELECT * FROM user WHERE role='LEC' AND status=1 ORDER BY username";

        return template.query(all_lecSQL,new RowMapper<LecturerBean>(){
            public LecturerBean mapRow(ResultSet rs, int row) throws SQLException, SQLException {
                LecturerBean e=new LecturerBean();
                e.setUsername(rs.getString("username"));
                e.setfName(rs.getString("fname"));
                e.setlName(rs.getString("lname"));
                e.setEmail(rs.getString("email"));
                e.setMobile(rs.getString("mobile"));
                e.setHome(rs.getString("home"));
                e.setNIC(rs.getString("nic"));
                e.setDob(rs.getString("dob"));
                e.setCity(rs.getString("city"));
                e.setRank(rs.getString("rank"));
                e.setGender(rs.getString("gender"));

                return e;
            }
        });
    }

    //Get lecturer By Username
    public LecturerBean getLecturerById(String username) {

        String getStuSQL="SELECT * FROM user WHERE username=?";

        return template.queryForObject(getStuSQL,new Object[]{username},new BeanPropertyRowMapper<LecturerBean>(LecturerBean.class));
    }

    //Update Student
    @Override
    public int updateLecturer(LecturerBean lecturerBean) {

        String update_stuSQL = "UPDATE user SET fname=?, lname=?, email=?, mobile=?, home=?,city=?,nic=?," +
                "dob=?,gender=?, rank=? WHERE username=?";

        System.out.println(lecturerBean.getUsername());


        return template.update(update_stuSQL,lecturerBean.getfName(),
                lecturerBean.getlName(),
                lecturerBean.getEmail(),
                lecturerBean.getMobile(),
                lecturerBean.getHome(),
                lecturerBean.getCity(),
                lecturerBean.getNIC(),
                lecturerBean.getDob(),
                lecturerBean.getGender(),
                lecturerBean.getRank(),
                lecturerBean.getUsername()
                );


    }


    //*****************************FOR LECTURER END************************************



    //*****************************FOR STUDENT START************************************

    //Get student By Username
    @Override
    public StudentBean getStudentById(String username) {

        String getStuSQL="SELECT * FROM user WHERE username=?";

        return template.queryForObject(getStuSQL,new Object[]{username},new BeanPropertyRowMapper<StudentBean>(StudentBean.class));
    }

    //Delete Student
    public int deleteUser(String username){

        String delete_userSQL="UPDATE user SET status=0 WHERE username=?";

        return template.update(delete_userSQL,username);
    }



    //Update Student
    @Override
    public int updateStudent(StudentBean studentBean) {

        String update_stuSQL = "UPDATE user SET fname=?, lname=?, email=?, mobile=?, home=?,city=?,nic=?," +
                "dob=?,gender=? WHERE username=?";

        System.out.println(studentBean.getUsername());


        return template.update(update_stuSQL,studentBean.getfName(),
                studentBean.getlName(),
                studentBean.getEmail(),
                studentBean.getMobile(),
                studentBean.getHome(),
                studentBean.getCity(),
                studentBean.getNIC(),
                studentBean.getDob(),
                studentBean.getGender(),
                studentBean.getUsername());


    }

    //Get ALL the Students
    @Override
    public List<StudentBean> getAllStudents() {

        String all_stuSQL="SELECT * FROM user WHERE role='STU' AND status=1 ORDER BY username";

        return template.query(all_stuSQL,new RowMapper<StudentBean>(){
            public StudentBean mapRow(ResultSet rs, int row) throws SQLException, SQLException {
                StudentBean e=new StudentBean();
                e.setUsername(rs.getString("username"));
                e.setfName(rs.getString("fname"));
                e.setlName(rs.getString("lname"));
                e.setEmail(rs.getString("email"));
                e.setMobile(rs.getString("mobile"));
                e.setHome(rs.getString("home"));
                e.setNIC(rs.getString("nic"));
                e.setDob(rs.getString("dob"));
                e.setCity(rs.getString("city"));
                e.setsYear(rs.getString("year"));
                e.setGender(rs.getString("gender"));



                return e;
            }
        });
    }

    //Insert Student
    public int saveStudent(StudentBean studentBean) throws NoSuchAlgorithmException, ParseException, IOException {

        String profilePic;
        int register=0;
        if (studentBean.getGender().equals("M")){
//            profilePic="malePic.jpg";
            File male=new File("C:\\Users\\akila\\OneDrive\\Desktop\\Epic\\vle\\src\\main\\webapp\\WEB-INF\\resources\\images\\profilePics\\malePic.jpg");
            BufferedImage buffered_image= ImageIO.read(male);
            ByteArrayOutputStream output_stream= new ByteArrayOutputStream();
            ImageIO.write(buffered_image, "jpg", output_stream);
            byte [] fileContent = output_stream.toByteArray();
            profilePic = Base64.getEncoder().encodeToString(fileContent);
        }else{
            File male=new File("C:\\Users\\akila\\OneDrive\\Desktop\\Epic\\vle\\src\\main\\webapp\\WEB-INF\\resources\\images\\profilePics\\femalePic.jpg");
            BufferedImage buffered_image= ImageIO.read(male);
            ByteArrayOutputStream output_stream= new ByteArrayOutputStream();
            ImageIO.write(buffered_image, "jpg", output_stream);
            byte [] fileContent = output_stream.toByteArray();
            profilePic = Base64.getEncoder().encodeToString(fileContent);
        }



//        if (year.equals("1")){
//            role="ADMIN";
//        }else if (year.equals("0")){
//            role="LEC";
//        }else{
//            role="STU";
//        }

        try {
            String lastUserSQL="SELECT username FROM lastuser WHERE  year=?";

            String fName=studentBean.getfName().trim().substring(0,1).toUpperCase()+studentBean.getfName().trim().substring(1).toLowerCase(Locale.ROOT);
            String lName=studentBean.getlName().trim().substring(0,1).toUpperCase(Locale.ROOT)+studentBean.getlName().trim().substring(1).toLowerCase(Locale.ROOT);
            String email=studentBean.getEmail().trim().toLowerCase(Locale.ROOT);
            String mobile=studentBean.getMobile().trim();
            String home=studentBean.getHome().trim();
            String NIC=studentBean.getNIC().trim().toUpperCase(Locale.ROOT);
            String year = studentBean.getsYear();
            String dob = studentBean.getDob();
            String gender=studentBean.getGender();
            String city=studentBean.getCity().trim().substring(0,1).toUpperCase(Locale.ROOT)+studentBean.getCity().trim().substring(1).toLowerCase(Locale.ROOT);
            int status=studentBean.getStatus();
            String username;
            String role="STU";

            String lastUserID=template.queryForObject(lastUserSQL,new Object[]{year}, String.class);
            int yearPart= Year.now().getValue()+1-Integer.valueOf(year.substring(0,1));

            if (lastUserID!=null){
                username=yearPart+"CS"+(Integer.parseInt(lastUserID.substring(6))+1);
            }else {
                username=yearPart+"CS100";
            }

            System.out.println("Username: "+username);

            String hashCode= MyService.hashPassword(username);





            String sql="INSERT INTO user(fName, lName, email, mobile, home, username, NIC, year, dob, gender, city, password, profilePic,status,role) " +
                    "VALUES('"+fName+"','"+lName+"','"+email+"','"+mobile+
                    "','"+home+"','"+username+"','"+NIC+"','"+year+
                    "','"+dob+"','"+gender+"','"+city+"','"+hashCode+"','"+profilePic+"',"+status+",'"+role+"')";

            return template.update(sql);
        }
        catch (DataAccessException | NullPointerException | StringIndexOutOfBoundsException e){
            System.out.println("Registration Error: "+e);
            return 0;
        }

    }

    //*****************************FOR STUDENT END************************************


    //Get user By Username
    @Override
    public UserBean getUserById(String username) {

        String getUserSQL="SELECT * FROM user WHERE username=?";

        UserBean userBean = template.queryForObject(getUserSQL,new Object[]{username},new BeanPropertyRowMapper<UserBean>(UserBean.class));


        String all_subSQL="SELECT subject.subjectID FROM subject INNER JOIN user ON subject.lecturer=user.username OR subject.year=user.year WHERE username='"+userBean.getUsername()+"'";

        List<String> subjects = template.query(all_subSQL, new RowMapper<String>() {
            @Override
            public String mapRow(ResultSet resultSet, int i) throws SQLException {
                return resultSet.getString("subjectID");



            }
        });

        return userBean;

    }

    //*****************************FOR SUBJECT START************************************


    //Get ALL the Subjects
    @Override
    public List<SubjectBean> getAllSubjects() {

        String all_subSQL="SELECT  subject.subjectID, subject.name, subject.year, subject.lecturer, user.rank," +
                "user.fName, user.lName FROM subject LEFT JOIN user ON subject.lecturer=user.username  ORDER BY year";

        return template.query(all_subSQL,new RowMapper<SubjectBean>(){
            public SubjectBean mapRow(ResultSet rs, int row) throws SQLException, SQLException {
                SubjectBean e=new SubjectBean();
                e.setSubjectID(rs.getString("subjectID"));
                e.setName(rs.getString("name"));
                e.setYear(rs.getString("year"));
                e.setLecturer(rs.getString("lecturer"));
                e.setFname(rs.getString("fName"));
                e.setLname(rs.getString("lName"));
                e.setRank(rs.getString("rank"));

                return e;
            }
        });
    }

    //Delete Subject
    public int deleteSubject(String subjectID){

        String delete_subjectSQL="DELETE FROM subject WHERE subjectID=?";

        return template.update(delete_subjectSQL,subjectID);
    }

    //Update Subject
    @Override
    public int updateSubject(SubjectBean subjectBean,String subject_ID) {

        String update_stuSQL = "UPDATE subject SET subjectID=?, name=?, year=?, lecturer=? WHERE subjectID=?";

        System.out.println(subjectBean.getSubjectID());
        System.out.println(subject_ID);


        try {
            return template.update(update_stuSQL,
                    subjectBean.getSubjectID(),
                    subjectBean.getName(),
                    subjectBean.getYear(),
                    subjectBean.getLecturer(),
                    subject_ID
            );
        }catch (DuplicateKeyException e){
            return -1;
        }


    }

    public int saveSubject(SubjectBean subjectBean){
        String sql = "INSERT INTO subject(subjectID, name, year, lecturer) VALUES(?,?,?,?)";
        int inserted=0;
        try {
            String subjectID = subjectBean.getSubjectID().trim().toUpperCase(Locale.ROOT);
            String name = subjectBean.getName().trim().substring(0,1).toUpperCase(Locale.ROOT)+subjectBean.getName().trim().substring(1).toLowerCase(Locale.ROOT);

            inserted = template.update(sql,new Object[]{subjectID, name,subjectBean.getYear(),subjectBean.getLecturer()});
        }catch (NullPointerException | ArrayIndexOutOfBoundsException | StringIndexOutOfBoundsException e){
            System.out.println(e);
            inserted=0;
        }catch (DuplicateKeyException e){
            inserted=-1;
        }
        return inserted;
    }


    //Update subject
    public SubjectBean getSubjectById(String subjectID){
        String getStuSQL="SELECT * FROM subject WHERE subjectID=?";

        return template.queryForObject(getStuSQL,new Object[]{subjectID},new BeanPropertyRowMapper<SubjectBean>(SubjectBean.class));
    }



    //*****************************FOR SUBJECT END**************************************


}

package com.akila.vle.dao;

import com.akila.vle.bean.PasswordBean;
import com.akila.vle.bean.SubjectBean;
import com.akila.vle.bean.UserBean;
import com.akila.vle.service.MyService;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Repository;

import java.security.NoSuchAlgorithmException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Locale;

@Repository("loginDao")
public class LoginDaoImp implements LoginDao{

    JdbcTemplate template;
    public void setTemplate(JdbcTemplate template) {
        this.template = template;
    }

    public UserBean getLoggedUser(String username){
        String sql = "SELECT * FROM user WHERE username=?";

        try{
            UserBean userBean = template.queryForObject(sql, new Object[]{username.toUpperCase(Locale.ROOT)},new BeanPropertyRowMapper<>(UserBean.class));
            assert userBean != null;
            if (!userBean.getRole().equals("ADMIN")){
                String all_subSQL="SELECT subject.subjectID, subject.name FROM subject INNER JOIN user ON subject.lecturer=user.username OR subject.year=user.year WHERE username='"+userBean.getUsername()+"'";

                List<SubjectBean> subjects = template.query(all_subSQL, new RowMapper<SubjectBean>() {
                    @Override
                    public SubjectBean mapRow(ResultSet resultSet, int i) throws SQLException {

                        SubjectBean subjectBean = new SubjectBean();
                        subjectBean.setSubjectID(resultSet.getString("subjectID"));
                        subjectBean.setName(resultSet.getString("name"));

                        return subjectBean;
                    }
                });
                userBean.setSubjects(subjects);
            }
            return userBean;
        }catch (Exception exception){
            System.out.println(exception);
            return null;
        }
    }

    @Override
    public int updatePassword(String username, PasswordBean passwordBean) throws NoSuchAlgorithmException {

        String verifyUserSQL = "SELECT password FROM user WHERE username=?";
        String updatePasswordSQL="UPDATE user SET password=? WHERE username=?";
        int updated = 0;
        boolean isAuthenticated=false;

        try {
            String oldPassword= passwordBean.getOpassword();
            String newHashcode= MyService.hashPassword(passwordBean.getPassword());
            System.out.println("My status: "+username);

            String oldHashCOde=template.queryForObject(verifyUserSQL, new Object[]{username},String.class);

            if (oldHashCOde!=null){
                isAuthenticated= BCrypt.checkpw(oldPassword, oldHashCOde);
            }
            if (isAuthenticated){
                updated=template.update(updatePasswordSQL, newHashcode,username);
            }
            return updated;
        }catch (Exception exception){
            System.out.println(exception);
            return 0;
        }
    }

    public int updateProfile(String col, String val,String username){

        try {
            String Sql="UPDATE user SET "+col+"='"+val+"' WHERE username='"+username+"'";
            return template.update(Sql);
        }catch (Exception exception){
            System.out.println(exception);
            return 0;
        }
    }

    public String getLecture(int fID){

        try {
            String sql="SELECT file FROM lecturefiles WHERE fID="+fID;
            return template.queryForObject(sql,String.class);
        }catch (Exception exception){
            System.out.println(exception);
            return null;
        }

    }
}

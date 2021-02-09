package com.akila.vle;

import com.akila.vle.bean.LectureBean;
import com.akila.vle.bean.SubjectBean;
import com.akila.vle.bean.UserBean;
import com.akila.vle.dao.LecturerDao;
import com.akila.vle.dao.LoginDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.method.HandlerTypePredicate;

import javax.servlet.http.HttpSession;
import java.security.Principal;
import java.util.List;

@Controller
@RequestMapping("/student")
public class StudentController {

    @Autowired
    LecturerDao lecturerDao;

    @Autowired
    LoginDao loginDao;

    //Get subject page

    @RequestMapping("/subject/{subjectID}")
    public String getSubjectPage(@PathVariable("subjectID") String subjectID, @RequestParam(value = "name", required = false) String name, HttpSession httpSession, Principal principal, Model model){

        if (httpSession.getAttribute("userBean")==null){
            String username= principal.getName();
            UserBean userBean = loginDao.getLoggedUser(username);
            httpSession.setAttribute("userBean",userBean);if (!userBean.getRole().equals("ADMIN")){
                httpSession.setAttribute("subjects",userBean.getSubjects());
            }
        }

//        System.out.println("The Study: "+lecturerDao.getAllStudyMaterials(subjectID).get(0).getMaterials().get(0));

        List <SubjectBean> subjectBeanList = (List<SubjectBean>) httpSession.getAttribute("subjects");

        for (SubjectBean subjectBean : subjectBeanList) {
            if (subjectBean.getSubjectID().equals(subjectID)) {
                model.addAttribute("name", subjectBean.getName());
            }
        }


        model.addAttribute("name",name);
        model.addAttribute("subjectID",subjectID);
        List<LectureBean> lecture=null;
        lecture = lecturerDao.getAllStudyMaterials(subjectID);

        model.addAttribute("lecture",lecture);
        return "subject";
    }
}

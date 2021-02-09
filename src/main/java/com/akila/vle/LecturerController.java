package com.akila.vle;

import com.akila.vle.bean.LectureBean;
import com.akila.vle.bean.SubjectBean;
import com.akila.vle.bean.UserBean;
import com.akila.vle.dao.LecturerDao;
import com.akila.vle.dao.LoginDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.security.Principal;
import java.util.List;

@Controller
@RequestMapping("/lecturer")
public class LecturerController {

    @Autowired
    LoginDao loginDao;

    @Autowired
    LecturerDao lecturerDao;

    //Get subject page
    @RequestMapping("/subject/{subjectID}")
    public String getSubjectPage(@PathVariable("subjectID") String subjectID, HttpSession httpSession, Principal principal, @RequestParam(value = "name", required = false) String name, Model model){

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
        List <LectureBean> lecture=null;
        lecture = lecturerDao.getAllStudyMaterials(subjectID);

        model.addAttribute("lecture",lecture);
        model.addAttribute("subjectIDa",subjectID);
        return "subject";
    }

    //Add Lecture
    @RequestMapping("/addLecture/{subjectID}")
    public String addLecPage(@PathVariable("subjectID") String subjectID,@ModelAttribute("lectureBean") LectureBean lectureBean, HttpSession httpSession, Principal principal, Model model){

        if (httpSession.getAttribute("userBean")==null){
            String username= principal.getName();
            UserBean userBean = loginDao.getLoggedUser(username);
            httpSession.setAttribute("userBean",userBean);if (!userBean.getRole().equals("ADMIN")){
                httpSession.setAttribute("subjects",userBean.getSubjects());
            }
        }

        lectureBean.setSubjectID(subjectID);
        model.addAttribute("lectureBean",lectureBean);
        return "addLecture";
    }

    //Save Lecture
    @RequestMapping("/savelecture")
    public String saveLecture(@ModelAttribute("lectureBean") LectureBean lectureBean, RedirectAttributes redirectAttributes,Model model, HttpSession httpSession, Principal principal){

        if (httpSession.getAttribute("userBean")==null){
            String username= principal.getName();
            UserBean userBean = loginDao.getLoggedUser(username);
            httpSession.setAttribute("userBean",userBean);
        }

        if (lecturerDao.saveLecture(lectureBean)==null){
            redirectAttributes.addFlashAttribute("error","Please try Again...");
            return "redirect:/lecturer/addLecture/"+lectureBean.getSubjectID();
        }else {
            return "redirect:/lecturer/subject/"+lectureBean.getSubjectID();
        }

    }



    @RequestMapping("/test")
    public String test(HttpSession httpSession, Principal principal, Model model){

        if (httpSession.getAttribute("userBean")==null){
            String username= principal.getName();
            UserBean userBean = loginDao.getLoggedUser(username);
            httpSession.setAttribute("userBean",userBean);if (!userBean.getRole().equals("ADMIN")){
                httpSession.setAttribute("subjects",userBean.getSubjects());
            }
        }



        return "test";
    }
}

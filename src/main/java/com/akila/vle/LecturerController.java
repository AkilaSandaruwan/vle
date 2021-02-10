package com.akila.vle;

import com.akila.vle.bean.LectureBean;
import com.akila.vle.bean.SubjectBean;
import com.akila.vle.bean.UserBean;
import com.akila.vle.dao.LecturerDao;
import com.akila.vle.dao.LoginDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
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
        String lecN=null;

        if (lecture.size()!=0){
            int lecNum = Integer.parseInt(lecture.get(lecture.size()-1).getLec().substring(8));
            lecN = lecture.get(lecture.size()-1).getLec().substring(0,8)+(++lecNum);
        }
        else {
            lecN = "Lecture_1";
        }

        model.addAttribute("lecN",lecN);
        model.addAttribute("lecture",lecture);
        model.addAttribute("subjectIDa",subjectID);
        return "subject";
    }

    //Add Lecture
    @RequestMapping("/addLecture/{subjectID}/{lec}")
    public String addLecPage(@PathVariable("subjectID") String subjectID,@PathVariable("lec") String lec,@ModelAttribute("lectureBean") LectureBean lectureBean, HttpSession httpSession, Principal principal, Model model){

        if (httpSession.getAttribute("userBean")==null){
            String username= principal.getName();
            UserBean userBean = loginDao.getLoggedUser(username);
            httpSession.setAttribute("userBean",userBean);if (!userBean.getRole().equals("ADMIN")){
                httpSession.setAttribute("subjects",userBean.getSubjects());
            }
        }

        lectureBean.setSubjectID(subjectID);
        lectureBean.setLec(lec);
        model.addAttribute("lectureBean",lectureBean);
        return "addLecture";
    }

    //Save Lecture
    @PostMapping("/savelecture")
    public String saveLecture(@ModelAttribute("lectureBean") LectureBean lectureBean, RedirectAttributes redirectAttributes,Model model, HttpSession httpSession, Principal principal){

        if (httpSession.getAttribute("userBean")==null){
            String username= principal.getName();
            UserBean userBean = loginDao.getLoggedUser(username);
            httpSession.setAttribute("userBean",userBean);
        }
        System.out.println(lectureBean.getLec());
        System.out.println(lectureBean.getTopic());
        System.out.println(lectureBean.getSubjectID());
        System.out.println(lectureBean.getDes());

        if (lecturerDao.saveLecture(lectureBean)==null){
            redirectAttributes.addFlashAttribute("error","Please try Again...");
            return "redirect:/lecturer/addLecture/"+lectureBean.getSubjectID()+"/"+lectureBean.getLec();
        }else {
            return "redirect:/lecturer/subject/"+lectureBean.getSubjectID();
        }

    }

//    //Save Lecture
//    @PostMapping("/saveAttachment")
//    public String saveAttachment(RequestParam("files") List<CommonsMultipartFile> , RedirectAttributes redirectAttributes,Model model, HttpSession httpSession, Principal principal){
//
//        if (httpSession.getAttribute("userBean")==null){
//            String username= principal.getName();
//            UserBean userBean = loginDao.getLoggedUser(username);
//            httpSession.setAttribute("userBean",userBean);
//        }
//        System.out.println(lectureBean.getLec());
//        System.out.println(lectureBean.getTopic());
//        System.out.println(lectureBean.getSubjectID());
//        System.out.println(lectureBean.getDes());
//
//        if (lecturerDao.saveLecture(lectureBean)==null){
//            redirectAttributes.addFlashAttribute("error","Please try Again...");
//            return "redirect:/lecturer/addLecture/"+lectureBean.getSubjectID()+"/"+lectureBean.getLec();
//        }else {
//            return "redirect:/lecturer/subject/"+lectureBean.getSubjectID();
//        }
//
//    }

    //Delete Lecture
    @RequestMapping("/deletelecture/{mID}/{subjectID}")
    public String deleteLecture(@PathVariable("mID") int mID,@PathVariable("subjectID") String subjectID , RedirectAttributes redirectAttributes,Model model, HttpSession httpSession, Principal principal){

        if (httpSession.getAttribute("userBean")==null){
            String username= principal.getName();
            UserBean userBean = loginDao.getLoggedUser(username);
            httpSession.setAttribute("userBean",userBean);
        }

        int delete = lecturerDao.deleteLecture(mID);

        if (delete==0){
            redirectAttributes.addFlashAttribute("delete", "Delete operation failed...");
            return "redirect:/lecturer/subject/"+subjectID;
        }else{
            return "redirect:/lecturer/subject/"+subjectID;
        }

    }

    //Delete Lecture
    @RequestMapping("/deleteAttachment/{fID}/{subjectID}")
    public String deleteAttachment(@PathVariable("fID") int fID,@PathVariable("subjectID") String subjectID , RedirectAttributes redirectAttributes,Model model, HttpSession httpSession, Principal principal){

        if (httpSession.getAttribute("userBean")==null){
            String username= principal.getName();
            UserBean userBean = loginDao.getLoggedUser(username);
            httpSession.setAttribute("userBean",userBean);
        }

        int delete = lecturerDao.deleteAttachment(fID);

        if (delete==0){
            redirectAttributes.addFlashAttribute("delete", "Delete operation failed...");
            return "redirect:/lecturer/subject/"+subjectID;
        }else{
            return "redirect:/lecturer/subject/"+subjectID;
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

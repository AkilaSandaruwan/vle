package com.akila.vle;

import com.akila.vle.bean.LecturerBean;
import com.akila.vle.bean.StudentBean;

import com.akila.vle.bean.SubjectBean;
import com.akila.vle.bean.UserBean;
import com.akila.vle.dao.LoginDao;
import com.akila.vle.service.AdminManage;
import com.akila.vle.service.MyService;

import com.akila.vle.service.ReportService;
import net.sf.jasperreports.engine.JRException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.NoSuchAlgorithmException;
import java.security.Principal;
import java.text.ParseException;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    AdminManage adminManage; // will Inject adminDao from xml

    @Autowired
    LoginDao loginDao;

    //************************LECTURER MANAGE START******************************

    //Lecturer Registration
    @PostMapping("/saveLecturer")
    public String saveLecturer(@Valid @ModelAttribute("lecturer") LecturerBean lecturerBean,BindingResult bindingResult, Model model,Principal principal,HttpSession httpSession) throws ParseException, NoSuchAlgorithmException {
        if (httpSession.getAttribute("userBean")==null){
            String username= principal.getName();
            UserBean userBean = loginDao.getLoggedUser(username);
            httpSession.setAttribute("userBean",userBean);
        }

        if(bindingResult.hasErrors())
        {
            System.out.println("Got errors");
            return "adminAddLec";
        }else {
            int register = adminManage.saveLecturer(lecturerBean);

            if (register>0){
                return "redirect:/admin/adminLecView";
            }else{

                model.addAttribute("lecturer",lecturerBean);
                String msg = "Lecturer Registration Failed... please try again.";
                model.addAttribute("registrationFailed",msg);
                System.out.println("Lecturer Registration Failed... please try again.");
                return "adminAddLec";
            }
        }

    }

    //lecturer View
    @RequestMapping("/adminLecView")
    public String getLecturerView(Model model,Principal principal,HttpSession httpSession) {

        if (httpSession.getAttribute("userBean")==null){
            String username= principal.getName();
            UserBean userBean = loginDao.getLoggedUser(username);
            httpSession.setAttribute("userBean",userBean);
        }

        List <LecturerBean> list = adminManage.getAllLecturers();
        model.addAttribute("lec_list",list);
        return "adminLecView";
    }

    //Add lecturer form
    @RequestMapping("/addLecturer")
    public String addLecturerForm( Model model,Principal principal,HttpSession httpSession) {

        if (httpSession.getAttribute("userBean")==null){
            String username= principal.getName();
            UserBean userBean = loginDao.getLoggedUser(username);
            httpSession.setAttribute("userBean",userBean);
        }

        model.addAttribute("lecturer", new LecturerBean());
        return "adminAddLec";
    }

    //Update lecturer from
    @RequestMapping("/updatelectureform/{username}")
    public String updateLectureForm(@PathVariable("username") String username,HttpServletRequest request, @ModelAttribute("LecturerBean") LecturerBean lecturerBean, Model model, Principal principal,HttpSession httpSession) {

        if (httpSession.getAttribute("userBean")==null){
            String uname= principal.getName();
            UserBean userBean = loginDao.getLoggedUser(uname);
            httpSession.setAttribute("userBean",userBean);
        }

        lecturerBean = adminManage.getLecturerById(username);
        model.addAttribute("lecturerBean",lecturerBean);
        String UpdateFailed = request.getParameter("UpdateFailed");
        if (UpdateFailed!=null) {
            model.addAttribute("UpdateFailed", UpdateFailed);
        }
        return "adminUpdateLec";
    }

    //Update lecturer action
    @RequestMapping("/updatelecturer/{username}")
    public String updateLecturer(@PathVariable("username") String username, @ModelAttribute("lecturerBean") LecturerBean lecturerBean, Model model,Principal principal) {

        lecturerBean.setUsername(username);
        int status=adminManage.updateLecturer(lecturerBean);


        if (status>0){
            return "redirect:/admin/adminLecView";
        }else{

            String msg = "Update Request Failed... please try again.";
            model.addAttribute("UpdateFailed",msg);
            System.out.println(msg);
            return "redirect:updatelectureform/"+lecturerBean.getUsername();
        }

    }

    //************************LECTURER MANAGE END******************************


    //************************STUDENT MANAGE START******************************

    //Student Registration
    @PostMapping("/saveStudent")
    public String saveStudent(@Valid @ModelAttribute("student") StudentBean studentBean, BindingResult bindingResult,  Principal principal,Model model, HttpSession httpSession) throws NoSuchAlgorithmException, ParseException, IOException {

        if (httpSession.getAttribute("userBean")==null){
            String username= principal.getName();
            UserBean userBean = loginDao.getLoggedUser(username);
            httpSession.setAttribute("userBean",userBean);
        }

        if(bindingResult.hasErrors())
        {
            System.out.println("Got errors");
            return "adminAddStu";
        }else {
            int register = adminManage.saveStudent(studentBean);

            if (register>0){
                return "redirect:/admin/adminStuView";
            }else{

                model.addAttribute("student",studentBean);
                String msg = "Student Registration Failed... please try again.";
                model.addAttribute("registrationFailed",msg);
                System.out.println("Student Registration Failed... please try again.");
                return "adminAddStu";
            }
        }


    }


    //Student View
    @RequestMapping("/adminStuView")
    public String getStudentView(@ModelAttribute("deleted") String deleted, Model model,Principal principal,HttpSession httpSession) {

        if (httpSession.getAttribute("userBean")==null){
            String username= principal.getName();
            UserBean userBean = loginDao.getLoggedUser(username);
            httpSession.setAttribute("userBean",userBean);
        }

        List <StudentBean> list = adminManage.getAllStudents();
        model.addAttribute("deleted",deleted);
        model.addAttribute("stu_list",list);
        return "adminStuView";
    }

    //Add student form
    @RequestMapping("/addStudent")
    public String addStudentForm( Model model,Principal principal,HttpSession httpSession) {

        if (httpSession.getAttribute("userBean")==null){
            String username= principal.getName();
            UserBean userBean = loginDao.getLoggedUser(username);
            httpSession.setAttribute("userBean",userBean);
        }

        model.addAttribute("student", new StudentBean());
        return "adminAddStu";
    }

    //Update student from
    @RequestMapping("/updatestudentform/{username}")
    public String updateStudentForm(@ModelAttribute("Student") StudentBean student, BindingResult bindingResult, @PathVariable("username") String username,HttpServletRequest request,  Model model, Principal principal,HttpSession httpSession) {

        if (httpSession.getAttribute("userBean")==null){
            String uname= principal.getName();
            UserBean userBean = loginDao.getLoggedUser(uname);
            httpSession.setAttribute("userBean",userBean);
        }

        student = adminManage.getStudentById(username);
            model.addAttribute("student",student);
            String UpdateFailed = request.getParameter("UpdateFailed");
            if (UpdateFailed!=null) {
                model.addAttribute("UpdateFailed", UpdateFailed);
            }
            return "adminUpdateStu";

    }

    //Update student action
    @RequestMapping("/updatestudent/{username}")
    public String updateStudent(@Valid @ModelAttribute("Student") StudentBean student, BindingResult bindingResult,@PathVariable("username") String username,Model model,Principal principal) {

        student.setUsername(username);

        if (bindingResult.hasErrors()){
            model.addAttribute("student",student);
            return "adminUpdateStu";
        }else {
            int status=adminManage.updateStudent(student);

            if (status>0){
                return "redirect:/admin/adminStuView";
            }else{

                String msg = "Update Request Failed... please try again.";
                model.addAttribute("UpdateFailed",msg);
                System.out.println(msg);
                return "redirect:updatestudentform/"+student.getUsername();
            }
        }

    }
    //************************STUDENT MANAGE END******************************


    //************************SUBJECT MANAGE START******************************


    //Subject View
    @RequestMapping("/adminSubView")
    public String getSubjectView(@ModelAttribute("deleted") String deleted, Model model,Principal principal,HttpSession httpSession) {

        if (httpSession.getAttribute("userBean")==null){
            String username= principal.getName();
            UserBean userBean = loginDao.getLoggedUser(username);
            httpSession.setAttribute("userBean",userBean);
        }

        List <SubjectBean> list = adminManage.getAllSubjects();
        model.addAttribute("deleted",deleted);
        model.addAttribute("sub_list",list);
//        System.out.println("SUbjects "+list.get(1).getName());
        return "adminSubView";
    }

    //Update subject action
    @RequestMapping("/updatesubject/{subject_ID}")
    public String updateSubject(@Valid @ModelAttribute("subjectBean") SubjectBean subjectBean, BindingResult bindingResult,RedirectAttributes redirectAttributes,@PathVariable("subject_ID") String subject_ID,Model model,Principal principal) {

        List <LecturerBean> lecturerBean = adminManage.getAllLecturers();
        Map referenceData = new HashMap();
        Map<String,String> lecturer = new LinkedHashMap<String,String>();

        for (LecturerBean lecturerBean1 : lecturerBean){
            lecturer.put(lecturerBean1.getUsername(), lecturerBean1.getUsername()+"  -"+lecturerBean1.getfName()+" "+lecturerBean1.getlName()+" -"+lecturerBean1.getRank());
        }
        referenceData.put("lecturers", lecturer);

        model.addAttribute("lecturers",lecturer);

        if (bindingResult.hasErrors()){
            model.addAttribute("subjectBean",subjectBean);
            return "adminUpdateSub";
        }else {
            int status=adminManage.updateSubject(subjectBean,subject_ID);

            if (status>0){
                return "redirect:/admin/adminSubView";
            }else if(status==-1){
               redirectAttributes.addFlashAttribute("UpdateFailed","Subject_ID is already exist.");
                return "redirect:/admin/updatesubjectform/"+subject_ID;
            }else{

                String msg = "Update Request Failed... please try again.";
                model.addAttribute("UpdateFailed",msg);
                return "redirect:/admin/updatesubjectform/"+subjectBean.getSubjectID();
            }
        }

    }


    //Update subject from
    @RequestMapping("/updatesubjectform/{subjectID}")
    public String updateSubjectForm(@PathVariable("subjectID") String subjectID,HttpServletRequest request, Model model, Principal principal,HttpSession httpSession) {

        if (httpSession.getAttribute("userBean")==null){
            String uname= principal.getName();
            UserBean userBean = loginDao.getLoggedUser(uname);
            httpSession.setAttribute("userBean",userBean);
        }

        List <LecturerBean> lecturerBean = adminManage.getAllLecturers();
        Map referenceData = new HashMap();
        Map<String,String> lecturer = new LinkedHashMap<String,String>();

        for (LecturerBean lecturerBean1 : lecturerBean){
            lecturer.put(lecturerBean1.getUsername(), lecturerBean1.getUsername()+"  -"+lecturerBean1.getfName()+" "+lecturerBean1.getlName()+" -"+lecturerBean1.getRank());
        }
        referenceData.put("lecturers", lecturer);
        model.addAttribute("lecturers",lecturer);

        SubjectBean subjectBean = adminManage.getSubjectById(subjectID);
        model.addAttribute("subjectBean",subjectBean);
        String UpdateFailed = request.getParameter("UpdateFailed");
        if (UpdateFailed!=null) {
            model.addAttribute("UpdateFailed", UpdateFailed);
        }
        return "adminUpdateSub";
    }


    //Add subject form
    @RequestMapping("/addSubject")
    public String addSubjectForm( Model model,Principal principal,HttpSession httpSession) {

        if (httpSession.getAttribute("userBean")==null){
            String username= principal.getName();
            UserBean userBean = loginDao.getLoggedUser(username);
            httpSession.setAttribute("userBean",userBean);
        }
        List <LecturerBean> lecturerBean = adminManage.getAllLecturers();
        Map referenceData = new HashMap();
        Map<String,String> lecturer = new LinkedHashMap<String,String>();

        for (LecturerBean lecturerBean1 : lecturerBean){
            lecturer.put(lecturerBean1.getUsername(), lecturerBean1.getUsername()+"  -"+lecturerBean1.getfName()+" "+lecturerBean1.getlName()+" -"+lecturerBean1.getRank());
        }
        referenceData.put("lecturers", lecturer);

        model.addAttribute("lecturers",lecturer);
        model.addAttribute("subject", new SubjectBean());
        return "adminAddSub";
    }

    //Subject Registration
    @PostMapping("/saveSubject")
    public String saveSubject(@Valid @ModelAttribute("subject") SubjectBean subjectBean, BindingResult bindingResult, Model model,Principal principal,HttpSession httpSession) throws ParseException, NoSuchAlgorithmException {
        if (httpSession.getAttribute("userBean")==null){
            String username= principal.getName();
            UserBean userBean = loginDao.getLoggedUser(username);
            httpSession.setAttribute("userBean",userBean);
        }
        List <LecturerBean> lecturerBean = adminManage.getAllLecturers();
        Map referenceData = new HashMap();
        Map<String,String> lecturer = new LinkedHashMap<String,String>();

        for (LecturerBean lecturerBean1 : lecturerBean){
            lecturer.put(lecturerBean1.getUsername(), lecturerBean1.getUsername()+"  -"+lecturerBean1.getfName()+" "+lecturerBean1.getlName()+" -"+lecturerBean1.getRank());
        }
        referenceData.put("lecturers", lecturer);
        model.addAttribute("lecturers",lecturer);

        if(bindingResult.hasErrors())
        {
            System.out.println("Got errors");

            return "adminAddSub";
        }else {
            int register = adminManage.saveSubject(subjectBean);

            if (register>0){
                return "redirect:/admin/adminSubView";
            }else if(register==-1){
                model.addAttribute("registrationFailed","Subject_ID is already exist.");
                return "adminAddSub";
            }
            else{

                model.addAttribute("subject",subjectBean);
                String msg = "Subject Registration Failed... please try again.";
                model.addAttribute("registrationFailed",msg);
                System.out.println("Subject Registration Failed... please try again.");
                return "adminAddSub";
            }
        }
    }

    //Delete Subject
    @RequestMapping("/deleteSubject/{subjectID}")
    public String deleteSubject(RedirectAttributes redirectAttributes, @PathVariable("subjectID") String subjectID, Model model, Principal principal, HttpSession httpSession){
        if (httpSession.getAttribute("userBean")==null){
            String uname= principal.getName();
            UserBean userBean = loginDao.getLoggedUser(uname);
            httpSession.setAttribute("userBean",userBean);
        }
        int deleted=0;
        deleted= adminManage.deleteSubject(subjectID);

        if (deleted!=0){
            redirectAttributes.addFlashAttribute("deleted","<p class=\"text-danger\"><strong>"+subjectID+"</strong> has been removed.</p>  ");
        }
            return "redirect:/admin/adminSubView";
    }

    //************************SUBJECT MANAGE END******************************

    //PDF generate student
    @RequestMapping("/pdf_stu")
    public void getStuPDF(HttpServletRequest request, HttpServletResponse response,Model model,Principal principal,HttpSession httpSession, RedirectAttributes redirectAttributes) throws FileNotFoundException, JRException {

        if (httpSession.getAttribute("userBean")==null){
            String username= principal.getName();
            UserBean userBean = loginDao.getLoggedUser(username);
            httpSession.setAttribute("userBean",userBean);
        }
        List <StudentBean> list = adminManage.getAllStudents();

        ReportService reportService = new ReportService();
        Boolean download= reportService.exportStudentList(list);

        Path file = Paths.get("C:\\Users\\akila_s\\Downloads\\", "students.pdf");
        if (Files.exists(file))
        {
            response.setContentType("application/pdf");
            response.addHeader("Content-Disposition", "attachment; filename="+"students.pdf");
            try
            {
                Files.copy(file, response.getOutputStream());
                response.getOutputStream().flush();
            }
            catch (IOException ex) {
                ex.printStackTrace();
            }
        }

    }

    //PDF generate lecturer
    @RequestMapping("/pdf_lec")
    public void getLecPDF(HttpServletRequest request, HttpServletResponse response, Model model, Principal principal, HttpSession httpSession, RedirectAttributes redirectAttributes) throws FileNotFoundException, JRException {

        if (httpSession.getAttribute("userBean")==null){
            String username= principal.getName();
            UserBean userBean = loginDao.getLoggedUser(username);
            httpSession.setAttribute("userBean",userBean);
        }

        List <LecturerBean> list = adminManage.getAllLecturers();

        ReportService reportService = new ReportService();
        Boolean download= reportService.exportLecturerList(list);

        Path file = Paths.get("C:\\Users\\akila_s\\Downloads\\", "lecturers.pdf");
        if (Files.exists(file))
        {
            response.setContentType("application/pdf");
            response.addHeader("Content-Disposition", "attachment; filename="+"lecturers.pdf");
            try
            {
                Files.copy(file, response.getOutputStream());
                response.getOutputStream().flush();
            }
            catch (IOException ex) {
                ex.printStackTrace();
            }
        }

    }

    //Delete User
    @RequestMapping("/deleteUser/{username}")
    public String deleteUser(RedirectAttributes redirectAttributes, @PathVariable("username") String username, Model model, Principal principal, HttpSession httpSession){
        if (httpSession.getAttribute("userBean")==null){
            String uname= principal.getName();
            UserBean userBean = loginDao.getLoggedUser(uname);
            httpSession.setAttribute("userBean",userBean);
        }
        int deleted=0;
        deleted= adminManage.deleteUser(username);

        if (deleted!=0){
            redirectAttributes.addFlashAttribute("deleted","<p class=\"text-danger\"><strong>"+username+"</strong> has been removed.</p>  ");
        }



        if (username.substring(0,3).equals("LEC")){
            return "redirect:/admin/adminLecView";
        }else {
            return "redirect:/admin/adminStuView";
        }

    }

}


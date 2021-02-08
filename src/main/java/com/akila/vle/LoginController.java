package com.akila.vle;


import com.akila.vle.bean.LoginBean;
import com.akila.vle.bean.PasswordBean;
import com.akila.vle.bean.StudentBean;
import com.akila.vle.bean.UserBean;
import com.akila.vle.dao.LoginDao;
import com.akila.vle.dao.LoginDaoImp;
import com.akila.vle.dao.LoginDaoImp;
import com.akila.vle.service.AdminManage;
import com.akila.vle.service.MyService;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.security.Principal;
import java.util.Base64;
import java.util.Locale;
import java.util.Map;

@Controller
public class LoginController {

    @Autowired
    LoginDao loginDao;

    @RequestMapping("/login")
    public String getLoginPage(@RequestParam(value = "error",required = false) String error, Model model,@ModelAttribute("logout") String logout) {

        if (error!=null && error.equals("1")){
            model.addAttribute("loginFailed","username or password is wrong." );
        }
        model.addAttribute("logout",logout);
        return "login";
    }

    @RequestMapping("/loginsuccess")
    public String loginSuccess(@ModelAttribute("password")PasswordBean passwordBean, Model model, HttpServletRequest request, Principal principal) throws NoSuchAlgorithmException {
        String username= principal.getName();
        UserBean userBean = loginDao.getLoggedUser(username);
        HttpSession session= request.getSession();
        boolean isNewUser = BCrypt.checkpw(userBean.getUsername(), userBean.getPassword());
        if (!userBean.getRole().equals("ADMIN")){
            session.setAttribute("subjects",userBean.getSubjects());
        }
            session.setAttribute("userBean",userBean);

        if (!isNewUser){
            return "redirect:/";
        }else{
            model.addAttribute("password",passwordBean);
            return "passwordChange";
        }


    }

    @RequestMapping("/updatepassword")
    public String updatePassword(RedirectAttributes redirectAttributes,@ModelAttribute("password")PasswordBean passwordBean, Model model, Principal principal) throws NoSuchAlgorithmException {
        String username= principal.getName();
        int status = loginDao.updatePassword(username.toUpperCase(Locale.ROOT),passwordBean);
        if (status==0){
            redirectAttributes.addFlashAttribute("msg","Please enter your Current Password Correctly!");
//            model.addAttribute("password",passwordBean);
            return "redirect:/changepassword";
        }else{
            if (!passwordBean.getPassword().equals(passwordBean.getCpassword())){
                redirectAttributes.addFlashAttribute("msg_match","Password does not match.");
                return "redirect:/changepassword";
            }else{
                model.addAttribute("password",passwordBean);
                redirectAttributes.addFlashAttribute("logout", "Please login...");
                return "redirect:/login";
            }

        }


    }



//    @RequestMapping("/updateprofile/{col}/{username}")
//    public String updateProfile(@PathVariable Map<String, String> PathVarsMap,@ModelAttribute Map<String, String> modelVar){
//        String col = PathVarsMap.get("col");
//        String username = PathVarsMap.get("username");
//        return "profile";
//    }



    @RequestMapping("/logoutSuccessful")
    public String getLogoutSuccess(HttpSession httpSession,Model model,RedirectAttributes redirectAttributes) {

        httpSession.invalidate();
        redirectAttributes.addFlashAttribute("logout","Successfully Logged-out...");
        return "redirect:/login";
    }

    @RequestMapping("/sessiontimeout")
    public String getSessionTimeout(Model model) {
        model.addAttribute("msg", "Session is Expired");
        return "login";
    }

    @RequestMapping("/changepassword")
    public String changePassword(@ModelAttribute PasswordBean passwordBean,Model model) {
        model.addAttribute("password",passwordBean);
        return "passwordChange";
    }

    //user profile
    @RequestMapping("/profile")
    public String getProfile(@ModelAttribute("update") String flash,@ModelAttribute("profile") UserBean user, Model model, Principal principal,HttpServletRequest request, HttpSession httpSession) {

        String username= principal.getName();
        UserBean userBean = loginDao.getLoggedUser(username);
        httpSession.setAttribute("userBean",userBean);
        if (!userBean.getRole().equals("ADMIN")){
            httpSession.setAttribute("subjects",userBean.getSubjects());
        }

        user=loginDao.getLoggedUser(principal.getName());
        model.addAttribute("updateFlash",flash);
//        System.out.println("This is proPic Nme "+user.getProfilePic());
        model.addAttribute("profile",user);
        return "profile";

    }

    //update profile
    @RequestMapping("/updateprofile/{col}")
    public String updateProfile(RedirectAttributes redirectAttributes, @PathVariable("col") String col, @ModelAttribute("profile") UserBean user, Model model, Principal principal, HttpSession httpSession,HttpServletRequest request) throws IOException {

        if (httpSession.getAttribute("userBean")==null){
            String username= principal.getName();
            UserBean userBean = loginDao.getLoggedUser(username);
            httpSession.setAttribute("userBean",userBean);if (!userBean.getRole().equals("ADMIN")){
                httpSession.setAttribute("subjects",userBean.getSubjects());
            }
        }

        user.setUsername(principal.getName());
        String val = null;

        switch (col){
            case "email":
                val= user.getEmail();
                break;

            case "mobile":
                val= user.getMobile();
                break;

            case "username":
                val= user.getUsername();
                break;

            case "home":
                val= user.getHome();
                break;

            case "nic":
                val = user.getNic().toUpperCase(Locale.ROOT);
                break;

            case "city":
                val = user.getCity().substring(0,1).toUpperCase(Locale.ROOT)+user.getCity().substring(1).toLowerCase(Locale.ROOT);
                break;

            case "dob":
                val = user.getDob();
                break;

            case "gender":
                val=user.getGender();
            case "profilePic":
//                String upload=MyService.profilePicUpload(user.getPhoto(),request,user.getUsername(),httpSession);

                byte[] fileContent = user.getPhoto().getBytes();
                String encodedString = Base64.getEncoder().encodeToString(fileContent);

//                System.out.println("base64 "+encodedString);
//
//
//                System.out.println("profile Pic "+encodedString);
                val= encodedString;

            default:
        }

        int updated=0;

        if (val != null) {
            updated = loginDao.updateProfile(col,val,user.getUsername());
        }

        System.out.println("profile updated: "+updated);
        if (updated==1){
            redirectAttributes.addFlashAttribute("update","<div class=\"alert alert-success\"><strong>Success!</strong> "+col.substring(0,1).toUpperCase(Locale.ROOT)+col.substring(1)+" has successfully been updated...</div>");
        }else{
            redirectAttributes.addFlashAttribute("update","<div class=\"alert alert-warning\"><strong>Failed!</strong> please try again...</div>");
        }
        return "redirect:/profile";

    }

    @RequestMapping("/about")
    public String getAbout(){
        return "about";
    }

    @RequestMapping("/contact")
    public String getContact(){
        return "contact";
    }

}

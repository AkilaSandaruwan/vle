package com.akila.vle;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/student")
public class StudentController {

    //Get subject page

    @RequestMapping("/subject/{subjectID}")
    public String getSubjectPage(@PathVariable("subjectID") String subjectID, @RequestParam(value = "name", required = false) String name, Model model){
        model.addAttribute("name",name);
        model.addAttribute("subjectID",subjectID);
        return "subjectStu";
    }
}

package com.akila.vle.service;

import com.akila.vle.bean.LecturerBean;
import com.akila.vle.bean.StudentBean;
import net.sf.jasperreports.engine.*;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import net.sf.jasperreports.engine.util.FileBufferedOutputStream;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.ResourceUtils;

import java.io.*;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ReportService {

    public Boolean exportStudentList(List<StudentBean> student) {
//        List<StudentBean> student = adminManage.getAllStudents();

        try{
            File file = ResourceUtils.getFile("classpath:student.jrxml");
            JasperReport jasperReport = JasperCompileManager.compileReport(file.getAbsolutePath());
            JRBeanCollectionDataSource jrBeanCollectionDataSource = new JRBeanCollectionDataSource(student);

            Map<String, Object> parameters = new HashMap<>();
            parameters.put("Created By", "Admin");

            JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, parameters, jrBeanCollectionDataSource);

            JasperExportManager.exportReportToPdfFile(jasperPrint, "C:\\Users\\akila_s\\Downloads\\students.pdf");
            return true;
        }catch (FileNotFoundException | JRException exception){
            System.out.println(exception);
            return false;
        }

    }

    public Boolean exportLecturerList(List<LecturerBean> lecturer) {
//        List<StudentBean> student = adminManage.getAllStudents();

        try{
            File file = ResourceUtils.getFile("classpath:lecturer.jrxml");
            JasperReport jasperReport = JasperCompileManager.compileReport(file.getAbsolutePath());
            JRBeanCollectionDataSource jrBeanCollectionDataSource = new JRBeanCollectionDataSource(lecturer);

            Map<String, Object> parameters = new HashMap<>();
            parameters.put("Created By", "Admin");

            JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, parameters, jrBeanCollectionDataSource);



            JasperExportManager.exportReportToPdfFile(jasperPrint, "C:\\Users\\akila_s\\Downloads\\lecturers.pdf");

            return true;
        }catch (FileNotFoundException | JRException exception){
            System.out.println(exception);
            return false;
        }

    }
}

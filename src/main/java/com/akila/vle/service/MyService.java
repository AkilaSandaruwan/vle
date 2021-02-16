package com.akila.vle.service;

import org.apache.commons.io.FilenameUtils;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class MyService {
    private static final String UPLOAD_DIRECTORY ="/images/profilePics";

    public static String hashPassword(String password) throws NoSuchAlgorithmException {
        String hashedPassword = null;
        int i = 0;
        while (i < 10) {
            BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
            hashedPassword = passwordEncoder.encode(password);

            i++;
        }
        return hashedPassword;
    }

    public static String profilePicUpload(CommonsMultipartFile photo, HttpServletRequest request, String fileName, HttpSession httpSession) throws IOException {

        try
        {
            String fileExtension= FilenameUtils.getExtension(photo.getOriginalFilename());
            ServletContext context = httpSession.getServletContext();
            String path = context.getRealPath(UPLOAD_DIRECTORY);
            SimpleDateFormat formatter = new SimpleDateFormat("dd_MM_yyyy_HH_mm_ss");
            Date date = new Date();

            String imageName = fileName+"_"+formatter.format(date)+"."+fileExtension;
            byte[] bytes = photo.getBytes();
            BufferedOutputStream stream =new BufferedOutputStream(new FileOutputStream(
                    new File("C:\\Users\\akila_s\\Desktop\\Epic\\vle\\src\\main\\webapp\\WEB-INF\\resources\\images\\profilePics" + File.separator + imageName)));
            stream.write(bytes);
            stream.flush();
            stream.close();
            return imageName;
        } catch (IOException e)
        {
            e.printStackTrace();
            return null;
        }

    }

}

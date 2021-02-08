package com.akila.vle.bean;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import java.util.List;

@Component
public class LectureBean {

    private String lec;
    private String topic;
    private String des;
    private String subjectID;
    private List<CommonsMultipartFile> files;
    private List <String>  materials;

    public List<String> getMaterials() {
        return materials;
    }

    public void setMaterials(List<String> materials) {
        this.materials = materials;
    }

    public String getSubjectID() {
        return subjectID;
    }

    public void setSubjectID(String subjectID) {
        this.subjectID = subjectID;
    }

    public List<CommonsMultipartFile> getFiles() {
        return files;
    }

    public void setFiles(List<CommonsMultipartFile> files) {
        this.files = files;
    }

    public String getLec() {
        return lec;
    }

    public void setLec(String lec) {
        this.lec = lec;
    }

    public String getTopic() {
        return topic;
    }

    public void setTopic(String topic) {
        this.topic = topic;
    }

    public String getDes() {
        return des;
    }

    public void setDes(String des) {
        this.des = des;
    }
}

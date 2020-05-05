package com.demo.model;

import java.util.Date;
import java.util.List;

import org.bson.types.ObjectId;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection = "workers")
public class Worker extends User {

    private int age;
    private List<String> allergies;
    private String cardId;
    private String description;
    private String nationality;
    private String maritalStatus;
    private String cityResidence;
    private int secondaryPhone;
    private String ocupation;
    private String rh;
    private String availability;
    private List<String> physicalLimitation;
    private List<String> languages;
    private String personalReference;
    private Integer referencePhone;
    private String referenceEmail;
    private List<String> interests;
    private List<String> aptitudes;

    public Worker() {
       
    }

    public Worker(ObjectId id, String email, String password, String address, String gender, String name,
            Date birthDate, Date creationDate, Date modificationDate, Integer phone, int age, List<String> allergies,
            String cardId, String description, String nationality, String maritalStatus, String cityResidence,
            int secondaryPhone, String ocupation, String rh, String availability, List<String> physicalLimitation,
            List<String> languages, String personalReference, Integer referencePhone, String referenceEmail,
            List<String> interests, List<String> aptitudes, byte[] profilePic) {
        super(id, email, password, address, gender, name, birthDate, creationDate, modificationDate, phone,
                profilePic);
        this.age = age;
        this.allergies = allergies;
        this.cardId = cardId;
        this.description = description;
        this.nationality = nationality;
        this.maritalStatus = maritalStatus;
        this.cityResidence = cityResidence;
        this.secondaryPhone = secondaryPhone;
        this.ocupation = ocupation;
        this.rh = rh;
        this.availability = availability;
        this.physicalLimitation = physicalLimitation;
        this.languages = languages;
        this.personalReference = personalReference;
        this.referencePhone = referencePhone;
        this.referenceEmail = referenceEmail;
        this.interests = interests;
        this.aptitudes = aptitudes;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public List<String> getAllergies() {
        return allergies;
    }

    public void setAllergies(List<String> allergies) {
        this.allergies = allergies;
    }

    public String getCardId() {
        return cardId;
    }

    public void setCardId(String cardId) {
        this.cardId = cardId;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getNationality() {
        return nationality;
    }

    public void setNationality(String nationality) {
        this.nationality = nationality;
    }

    public String getMaritalStatus() {
        return maritalStatus;
    }

    public void setMaritalStatus(String maritalStatus) {
        this.maritalStatus = maritalStatus;
    }

    public String getCityResidence() {
        return cityResidence;
    }

    public void setCityResidence(String cityResidence) {
        this.cityResidence = cityResidence;
    }

    public int getSecondaryPhone() {
        return secondaryPhone;
    }

    public void setSecondaryPhone(int secondaryPhone) {
        this.secondaryPhone = secondaryPhone;
    }

    public String getOcupation() {
        return ocupation;
    }

    public void setOcupation(String ocupation) {
        this.ocupation = ocupation;
    }

    public String getRh() {
        return rh;
    }

    public void setRh(String rh) {
        this.rh = rh;
    }

    public String getAvailability() {
        return availability;
    }

    public void setAvailability(String availability) {
        this.availability = availability;
    }

    public List<String> getPhysicalLimitation() {
        return physicalLimitation;
    }

    public void setPhysicalLimitation(List<String> physicalLimitation) {
        this.physicalLimitation = physicalLimitation;
    }

    public List<String> getLanguages() {
        return languages;
    }

    public void setLanguages(List<String> languages) {
        this.languages = languages;
    }

    public String getPersonalReference() {
        return personalReference;
    }

    public void setPersonalReference(String personalReference) {
        this.personalReference = personalReference;
    }

    public Integer getReferencePhone() {
        return referencePhone;
    }

    public void setReferencePhone(Integer referencePhone) {
        this.referencePhone = referencePhone;
    }

    public String getReferenceEmail() {
        return referenceEmail;
    }

    public void setReferenceEmail(String referenceEmail) {
        this.referenceEmail = referenceEmail;
    }

    public List<String> getInterests() {
        return interests;
    }

    public void setInterests(List<String> interests) {
        this.interests = interests;
    }

    public List<String> getAptitudes() {
        return aptitudes;
    }

    public void setAptitudes(List<String> aptitudes) {
        this.aptitudes = aptitudes;
    }

}
package com.demo.model;

import org.bson.types.ObjectId;
import org.springframework.data.annotation.Id;

/**
 * Company
 */
public class Company {

    @Id
    private ObjectId _id;
    private String name;
    private String description;
    private String address;
    private Double latitude;
    private Double longitude;  
    private String city;
    private int phone;
    private int secondaryPhone;
    private String email;
    private String category;
    private byte[] profilePic;

    public Company(ObjectId _id, String name, String description, String address, Double latitude, Double longitude,
            String city, int phone, int secondaryPhone, String email, String category, byte[] profilePic) {
        this._id = _id;
        this.name = name;
        this.description = description;
        this.address = address;
        this.latitude = latitude;
        this.longitude = longitude;
        this.city = city;
        this.phone = phone;
        this.secondaryPhone = secondaryPhone;
        this.email = email;
        this.category = category;
        this.profilePic = profilePic;
    }

    public ObjectId get_id() {
        return _id;
    }

    public void set_id(ObjectId _id) {
        this._id = _id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Double getLatitude() {
        return latitude;
    }

    public void setLatitude(Double latitude) {
        this.latitude = latitude;
    }

    public Double getLongitude() {
        return longitude;
    }

    public void setLongitude(Double longitude) {
        this.longitude = longitude;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public int getPhone() {
        return phone;
    }

    public void setPhone(int phone) {
        this.phone = phone;
    }

    public int getSecondaryPhone() {
        return secondaryPhone;
    }

    public void setSecondaryPhone(int secondaryPhone) {
        this.secondaryPhone = secondaryPhone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public byte[] getProfilePic() {
        return profilePic;
    }

    public void setProfilePic(byte[] profilePic) {
        this.profilePic = profilePic;
    }

    
}
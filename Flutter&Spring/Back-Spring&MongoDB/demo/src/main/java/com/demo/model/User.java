package com.demo.model;

import java.util.Date;


import org.bson.types.ObjectId;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection = "users")
public class User {
  @Id
  private ObjectId id;
  private String email;
  private String password;
  private String address;
  private String gender;
  private String name;
  private Date birthDate;
  private Date creationDate;
  private Date modificationDate;
  private Integer phone;
  private byte[] profilePic;

  // Constructors
  public User() {
  }

  public User(ObjectId id, String email, String password, String address, String gender, String name, Date birthDate,
      Date creationDate, Date modificationDate, Integer phone,byte[] profilePic) {
    this.id = id;
    this.email = email;
    this.password = password;
    this.address = address;
    this.gender = gender;
    this.name = name;
    this.birthDate = birthDate;
    this.creationDate = creationDate;
    this.modificationDate = modificationDate;
    this.phone = phone;
    this.profilePic = profilePic;
  }

  public ObjectId get_id() {
    return id;
  }

  public void set_id(ObjectId id) {
    this.id = id;
  }

  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }

  public String getAddress() {
    return address;
  }

  public void setAddress(String address) {
    this.address = address;
  }

  public String getGender() {
    return gender;
  }

  public void setGender(String gender) {
    this.gender = gender;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public Date getBirthDate() {
    return birthDate;
  }

  public void setBirthDate(Date birthDate) {
    this.birthDate = birthDate;
  }

  public Date getCreationDate() {
    return creationDate;
  }

  public void setCreationDate(Date creationDate) {
    this.creationDate = creationDate;
  }

  public Date getModificationDate() {
    return modificationDate;
  }

  public void setModificationDate(Date modificationDate) {
    this.modificationDate = modificationDate;
  }

  public Integer getPhone() {
    return phone;
  }

  public void setPhone(Integer phone) {
    this.phone = phone;
  }

  public byte[] getProfilePic() {
    return profilePic;
  }

  public void setProfilePic(byte[] profilePic) {
    this.profilePic = profilePic;
  }


}
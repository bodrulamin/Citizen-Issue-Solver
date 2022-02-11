package com.cis.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;
import java.sql.Date;

@Entity
@JsonIgnoreProperties(ignoreUnknown = true)
public class Shout {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    long id;
    long shouterId;
    long actionTakerId;
    long categoryId;
    String shoutTitle;
    @Column(length = 1000)
    String shoutmessage;
    String address;
    ShoutStatus status = ShoutStatus.draft;
    Date date;
    private String photo;

    public Shout() {

    }

    public Shout(long id, long shouterId, long actionTakerId, long categoryId, String shoutTitle, String shoutmessage, String address, ShoutStatus status, Date date, String photo) {
        this.id = id;
        this.shouterId = shouterId;
        this.actionTakerId = actionTakerId;
        this.categoryId = categoryId;
        this.shoutTitle = shoutTitle;
        this.shoutmessage = shoutmessage;
        this.address = address;
        this.status = status;
        this.date = date;
        this.photo = photo;
    }


    public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getShouterId() {
        return shouterId;
    }

    public void setShouterId(long shouterId) {
        this.shouterId = shouterId;
    }

    public long getActionTakerId() {
        return actionTakerId;
    }

    public void setActionTakerId(long actionTakerId) {
        this.actionTakerId = actionTakerId;
    }

    public long getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(long categoryId) {
        this.categoryId = categoryId;
    }

    public ShoutStatus getStatus() {
        return status;
    }

    public void setStatus(ShoutStatus status) {
        this.status = status;
    }

    public String getShoutTitle() {
        return shoutTitle;
    }

    public void setShoutTitle(String shoutTitle) {
        this.shoutTitle = shoutTitle;
    }

    public String getShoutmessage() {
        return shoutmessage;
    }

    public void setShoutmessage(String shoutmessage) {
        this.shoutmessage = shoutmessage;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

}

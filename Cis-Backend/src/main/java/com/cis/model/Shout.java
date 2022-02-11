package com.cis.model;

import javax.persistence.*;
import java.sql.Date;

@Entity
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
	private byte[] picByte;

	public Shout() {

	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public byte[] getPicByte() {
		return picByte;
	}

	public void setPicByte(byte[] picByte) {
		this.picByte = picByte;
	}

	

	public Shout(long id, long shouterId, long actionTakerId, long categoryId, String shoutTitle, String shoutmessage,
			String address, ShoutStatus status, Date date, byte[] picByte) {
		super();
		this.id = id;
		this.shouterId = shouterId;
		this.actionTakerId = actionTakerId;
		this.categoryId = categoryId;
		this.shoutTitle = shoutTitle;
		this.shoutmessage = shoutmessage;
		this.address = address;
		this.status = status;
		this.date = date;
		this.picByte = picByte;
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

package com.cis.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Subscription {


	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	long id;
	
	long categoryId;
	long actionTakerId;
	
	
	public Subscription() {
		super();
	}


	public Subscription(long id, long categoryId, long actionTakerId) {
		super();
		this.id = id;
		this.categoryId = categoryId;
		this.actionTakerId = actionTakerId;
	}


	public long getId() {
		return id;
	}


	public void setId(long id) {
		this.id = id;
	}


	public long getCategoryId() {
		return categoryId;
	}


	public void setCategoryId(long categoryId) {
		this.categoryId = categoryId;
	}


	public long getActionTakerId() {
		return actionTakerId;
	}


	public void setActionTakerId(long actionTakerId) {
		this.actionTakerId = actionTakerId;
	}
	
	  
 	
	
}

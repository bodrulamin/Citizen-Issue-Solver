package com.cis.mail;

public interface EmailService {
	
	public void sendSimpleMessage(String to, String subject, String text);

	void sendSimpleMessage(String[] to, String subject, String text);

 
	

}

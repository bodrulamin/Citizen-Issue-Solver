package com.cis.mail;

import org.springframework.stereotype.Service;

@Service
public interface EmailService {
	
	public void sendSimpleMessage(String to, String subject, String text);

	void sendSimpleMessage(String[] to, String subject, String text);

 
	

}
